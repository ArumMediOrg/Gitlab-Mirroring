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

		/*

SELECT EXAM_YM,
       COUNT(*) EXAM_CNT,
       SUM(EXAM_PR)  EXAM_PR,
       SUM(DISC_PR)  DISC_PR,
       SUM(CASE WHEN DISC_RT = 0 THEN DISC_PR ELSE DISC_PR * (DISC_RT - DISC_RT2) / DISC_RT END) DISC_PR1,
       SUM(DISC_PR - CASE WHEN DISC_RT = 0 THEN DISC_PR ELSE DISC_PR * (DISC_RT - DISC_RT2) / DISC_RT END) DISC_PR2,
       SUM(EXAM_PR * (DISC_RT - DISC_RT2) / 100) DISC_PR11,
       SUM(EXAM_PR *  DISC_RT2 / 100) DISC_PR21
  FROM (SELECT SUBSTR(EEA_EXAM_DT, 1, 7) EXAM_YM,
               EEA_PSNLR_PR+EEA_COMPR_PR+EEA_HLTHR_PR+EEA_SPCLR_PR EXAM_PR,
               NVL(EEA_DISC_RT, 0) DISC_RT, NVL(EEA_DISC_PR, 0)+NVL(EEA_DISC_CPR, 0) DISC_PR,
               CASE WHEN EEA_DISC_CD = ' ' OR EEA_DISC_CD IS NULL THEN 0 ELSE TO_NUMBER(EEA_DISC_CD) END DISC_RT2
          FROM ET_EXAM_ACPT
         WHERE EEA_EXAM_DT BETWEEN :EXAM_SDT AND :EXAM_EDT
           AND EEA_ORDER_YN <> 'C'
IF (:RECE_NO = 'R') THEN
           AND NVL(EEA_RECE_NO, ' ') <> 'R'
       ) B
 GROUP BY EXAM_YM
 ORDER BY EXAM_YM
		*/


		sql += " SELECT EXAM_YM, ";
		sql += " 	COUNT(*) EXAM_CNT, ";
		sql += " 	SUM(EXAM_PR)  EXAM_PR, ";
		sql += " 	SUM(DISC_PR)  DISC_PR, ";
		sql += " 	SUM(CASE WHEN DISC_RT = 0 THEN DISC_PR ELSE DISC_PR * (DISC_RT - DISC_RT2) / DISC_RT END) DISC_PR1, ";
		sql += " 	SUM(DISC_PR - CASE WHEN DISC_RT = 0 THEN DISC_PR ELSE DISC_PR * (DISC_RT - DISC_RT2) / DISC_RT END) DISC_PR2, ";
		sql += " 	SUM(EXAM_PR * (DISC_RT - DISC_RT2) / 100) DISC_PR11, ";
		sql += " 	SUM(EXAM_PR *  DISC_RT2 / 100) DISC_PR21 ";
		sql += " FROM (SELECT SUBSTR(EEA_EXAM_DT, 1, 7) EXAM_YM, ";
		sql += " 			EEA_PSNLR_PR+EEA_COMPR_PR+EEA_HLTHR_PR+EEA_SPCLR_PR EXAM_PR, ";
		sql += " 			NVL(EEA_DISC_RT, 0) DISC_RT, NVL(EEA_DISC_PR, 0)+NVL(EEA_DISC_CPR, 0) DISC_PR, ";
		sql += " 			CASE WHEN EEA_DISC_CD = ' ' OR EEA_DISC_CD IS NULL THEN 0 ";
		sql += " 					WHEN EEA_DISC_CD > '100' THEN TO_NUMBER(SUBSTR(F_LPAD(EEA_DISC_CD, 5, '0'), 4, 2)) ";
		sql += " 					ELSE TO_NUMBER(EEA_DISC_CD) END DISC_RT2 ";
		sql += " 		FROM ET_EXAM_ACPT ";
		sql += " 		WHERE EEA_EXAM_DT BETWEEN '" + EXAM_SDT + "' AND '" + EXAM_EDT + "' ";
		sql += " 		AND EEA_ORDER_YN <> 'C' ";

		if(RECE_NO.equals("R")) {
			sql += " AND NVL(EEA_RECE_NO, ' ') <> 'R'";
		}

		sql += " ) B";
		sql += " GROUP BY EXAM_YM";
		sql += " ORDER BY EXAM_YM";

			//
			G_INFO += "<!-- \n";
			G_INFO += "서비스명 : uAcpt_Sales_UP_Disc_Stat_001 \n";
			G_INFO += "설명 : 월별 감액 현황 \n";
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
