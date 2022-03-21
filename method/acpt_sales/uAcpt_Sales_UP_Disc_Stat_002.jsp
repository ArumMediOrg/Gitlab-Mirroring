<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.HashMap"%>
<%@ include file="/inc_prg/common.jsp"%>
<%
	// 전달자료
	HashMap<String, Object> htData = null;
	HashMap<String, String> htMethod = null;

	// DB객체
	Statement stmtList = null;

	ResultSet rsList = null;

	CRs cRsList = null;

	//
	String G_INFO = "";

	ResultSetMetaData rsmd = null;
	int colCnt = 0;

	try {
%>
<%@ include file="/inc_prg/connect.jsp"%>
<%
		// 전달자료
		htData = (HashMap<String, Object>)request.getAttribute("htData");
		htMethod = (HashMap<String, String>)request.getAttribute("htMethod_1");

		String EXAM_SDT = htMethod.get("EXAM_SDT");
		String EXAM_EDT = htMethod.get("EXAM_EDT");
		String RECE_NO = htMethod.get("RECE_NO");

		//
		if(EXAM_SDT == null) { EXAM_SDT = ""; }
		if(EXAM_EDT == null) { EXAM_EDT = ""; }
		if(RECE_NO == null) { RECE_NO = ""; }

		// DB객체
		stmtList = connect.createStatement();


		sql = " SELECT EXAM_YM, ";
		sql += " 	SUM(CNT) EXAM_CNT, ";
		sql += " 	SUM(EXAM_PR)  EXAM_PR, ";
		sql += " 	SUM(DISC_PR)  DISC_PR, ";
		sql += " 	SUM(CASE WHEN DISC_RT = 0 THEN DISC_PR ELSE DISC_PR * (DISC_RT - DISC_RT2) / DISC_RT END) DISC_PR1, ";
		sql += " 	SUM(DISC_PR - CASE WHEN DISC_RT = 0 THEN DISC_PR ELSE DISC_PR * (DISC_RT - DISC_RT2) / DISC_RT END) DISC_PR2, ";
		sql += " 	SUM(EXAM_PR * (DISC_RT - DISC_RT2) / 100) DISC_PR11, ";
		sql += " 	SUM(EXAM_PR *  DISC_RT2 / 100) DISC_PR21 ";
		sql += " FROM (SELECT SUBSTR(B.EEP_ORDER_DT, 1, 7) EXAM_YM, B.CNT, ";
		sql += " 			B.ORDER_PR EXAM_PR, ";
		sql += " 			NVL(A.EEA_DISC_RT, 0) DISC_RT, ";
		sql += " 			NVL(B.DISC_TPR, 0) DISC_PR, ";
		sql += " 			CASE WHEN A.EEA_DISC_CD = ' ' OR A.EEA_DISC_CD IS NULL THEN 0 ";
		sql += " 					WHEN A.EEA_DISC_CD > '100' THEN TO_NUMBER(SUBSTR(F_LPAD(A.EEA_DISC_CD, 5, '0'), 4, 2)) ";
		sql += " 					ELSE TO_NUMBER(A.EEA_DISC_CD) END DISC_RT2 ";
		sql += " 		FROM (SELECT EEP_EXAM_DT, EEP_EXAM_SQ, EEP_ORDER_DT, ";
		sql += " 					CASE WHEN MIN(EEP_ORDER_SQ) = '1' THEN 1 ELSE 0 END CNT, ";
		sql += " 					SUM(EEP_EXAM_PR) ORDER_PR, ";
		sql += " 					SUM(NVL(EEP_DISC_PR, 0)) DISC_PR, SUM(NVL(EEP_DISC_CPR, 0)) DISC_CPR, ";
		sql += " 					SUM(NVL(EEP_DISC_PR, 0)+NVL(EEP_DISC_CPR, 0)) DISC_TPR ";
		sql += " 				FROM ET_EXAM_PRICE ";
		sql += " 				WHERE EEP_ORDER_DT BETWEEN '" + EXAM_SDT + "' AND '" + EXAM_EDT + "' ";
		sql += " 				GROUP BY EEP_EXAM_DT, EEP_EXAM_SQ, EEP_ORDER_DT ";
		sql += " 			) B, ET_EXAM_ACPT A ";
		sql += " 		WHERE A.EEA_EXAM_DT = B.EEP_EXAM_DT ";
		sql += " 		AND A.EEA_EXAM_SQ = B.EEP_EXAM_SQ ";
		sql += " 		AND A.EEA_ORDER_YN <> 'C' ";
		if(RECE_NO.equals("R")){
			sql += " AND NVL(A.EEA_RECE_NO, ' ') <> 'R' ";
		}
		sql += " 	) B ";
		sql += " GROUP BY EXAM_YM ";
		sql += " ORDER BY EXAM_YM ";

			//
			G_INFO += "<!-- \n";
			G_INFO += "서비스명 : uAcpt_Sales_UP_Disc_Stat_002 \n";
			G_INFO += "설명 : 월별 감액 현황-처리일자 기준 \n";
			G_INFO += "\n\n";

			G_INFO += "전달인자 : \n";
			G_INFO += " EXAM_SDT : " + EXAM_SDT + " \n";
			G_INFO += " EXAM_EDT : " + EXAM_EDT + " \n";
			G_INFO += " RECE_NO : " + RECE_NO + " \n";
			G_INFO += "\n\n";

			G_INFO += "질의문 : " + sql + " \n";
			G_INFO += "-->";

		rsList = stmtList.executeQuery(sql);
		cRsList = new CRs(rsList);

		rsmd = rsList.getMetaData();  //Select 결과의 Metadata 가져오기.

		out.clear();		// include된 파일안의 공백 제거
		response.addHeader("Content-type", "text/xml");
%><?xml version="1.0" encoding="UTF-8"?>

<%= G_INFO%>

<nurionXml>
	<resultCode>200</resultCode>
	<resultXml>
		<xml xmlns:s='uuid:BDC6E3F0-6DA3-11d1-A2A3-00AA00C14882'
			xmlns:dt='uuid:C2F41010-65B3-11d1-A29F-00AA00C14882'
			xmlns:rs='urn:schemas-microsoft-com:rowset'
			xmlns:z='#RowsetSchema'>

<s:Schema id='RowsetSchema'>
	<s:ElementType name='row' content='eltOnly' rs:updatable='true'>
<%
		for (colCnt = 1; colCnt <= rsmd.getColumnCount(); colCnt++){
			String dataType = "string";
			String maxLength = "4000";

			if (rsmd.getColumnTypeName(colCnt).equals("BLOB")){
				dataType = "bin.hex";
				maxLength = "2147483647";
				//<s:datatype dt:type='bin.hex' dt:maxLength='2147483647' rs:long='true'/>
			} else if (rsmd.getColumnTypeName(colCnt).equals("CLOB")){
				maxLength = "1073741823";
				//<s:datatype dt:type='string' dt:maxLength='1073741823' rs:long='true'/>
			}
%>
		<s:AttributeType name='<%= rsmd.getColumnName(colCnt)%>' rs:number='<%= Integer.toString(colCnt)%>' rs:writeunknown='true' rs:basetable='DUAL' rs:basecolumn='<%= rsmd.getColumnName(colCnt)%>'>
			<s:datatype dt:type='<%= dataType%>' dt:maxLength='<%= maxLength%>' <% if (! maxLength.equals("4000")) { %> rs:long='true' <% } %>/>
		</s:AttributeType>
<%
		}
%>
		<s:AttributeType name='ROWID' rs:number='<%= Integer.toString(colCnt)%>' rs:rowid='true' rs:writeunknown='true' rs:basetable='DUAL'
			 rs:basecolumn='ROWID' rs:keycolumn='true' rs:hidden='true' rs:autoincrement='true'>
			<s:datatype dt:type='string' rs:dbtype='str' dt:maxLength='18' rs:fixedlength='true'/>
		</s:AttributeType>
		<s:extends type='rs:rowbase'/>
	</s:ElementType>
</s:Schema>		<rs:data>
<%
		int cnt = 0;
		while(cRsList.next()) {

			cnt++;

			String ROWID_T = cRsList.getString("ROWID");
%>
			<z:row
<%
			for (colCnt = 1; colCnt <= rsmd.getColumnCount(); colCnt++){
				String tempData = cRsList.getString(rsmd.getColumnName(colCnt));
				if(! tempData.equals("")) {
%>
		 			<%= rsmd.getColumnName(colCnt)%>='<%= tempData%>'
<%
				}
			}
%>
				ROWID='<%= cnt%>'
			/>
<%
		}
%>
		</rs:data>
		</xml>
	</resultXml>
	<errorMsg></errorMsg>
</nurionXml>

<%
	} catch (Exception e) {

		out.clear();		// include된 파일안의 공백 제거
		response.addHeader("Content-type", "text/xml");
%><?xml version="1.0" encoding="UTF-8"?>

<%= G_INFO%>

<nurionXml>
	<resultCode>400</resultCode>
	<resultXml></resultXml>
	<errorMsg><![CDATA[<%= e.toString()%>]]></errorMsg>
	<sql><![CDATA[<%= sql%>]]></sql>
</nurionXml>

<%
	} finally {

		if(rsList != null) {
			rsList.close();
			rsList = null;
		}

		if(stmtList != null) {
			stmtList.close();
			stmtList = null;
		}
%>
<%@ include file="/inc_prg/disconnect.jsp"%>
<%
	}
%>
