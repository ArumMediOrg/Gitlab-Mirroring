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
		String PARAM_TX = htMethod.get("PARAM_TX");

		if(EXAM_SDT == null) { EXAM_SDT = ""; }
		if(EXAM_EDT == null) { EXAM_EDT = ""; }
		if(PARAM_TX == null) { PARAM_TX = ""; }

		// DB객체
		stmtList = connect.createStatement();

		sql = " SELECT SUM(CASE DISC_TERM WHEN '1' THEN 1 ELSE 0 END) DISC_TERM1, ";
		sql += " 	SUM(CASE DISC_TERM WHEN '2' THEN 1 ELSE 0 END) DISC_TERM2, ";
		sql += " 	SUM(CASE DISC_TERM WHEN '3' THEN 1 ELSE 0 END) DISC_TERM3, ";
		sql += " 	SUM(CASE DISC_TERM WHEN '4' THEN 1 ELSE 0 END) DISC_TERM4, ";
		sql += " 	SUM(CASE DISC_TERM WHEN '5' THEN 1 ELSE 0 END) DISC_TERM5, ";
		sql += " 	SUM(CASE DISC_TERM WHEN '6' THEN 1 ELSE 0 END) DISC_TERM6, ";
		sql += " 	SUM(CASE DISC_TERM WHEN '7' THEN 1 ELSE 0 END) DISC_TERM7, ";
		sql += " 	SUM(CASE DISC_TERM WHEN '8' THEN 1 ELSE 0 END) DISC_TERM8, ";
		sql += " 	SUM(CASE DISC_TERM WHEN '9' THEN 1 ELSE 0 END) DISC_TERM9, ";
		sql += " 	COUNT(*) DISC_TERMT ";
		sql += " FROM (SELECT CASE WHEN EEA_ACPT_CD = '2' THEN '9' ";
		sql += " 					WHEN NVL(EEA_DISC_RT, 0) = 100 THEN '1' ";
		sql += " 					WHEN NVL(EEA_DISC_RT, 0) = 50  THEN '2' ";
		sql += " 					WHEN NVL(EEA_DISC_RT, 0) = 40  THEN '3' ";
		sql += " 					WHEN NVL(EEA_DISC_RT, 0) = 30  THEN '4' ";
		sql += " 					WHEN NVL(EEA_DISC_RT, 0) = 20  THEN '5' ";
		sql += " 					WHEN NVL(EEA_DISC_RT, 0) = 10  THEN '6' ";
		sql += " 					WHEN NVL(EEA_DISC_RT, 0) > 0   THEN '8' ";
		sql += " 					ELSE '7' END DISC_TERM, ";
		sql += " 			NVL(EEA_DISC_RC, '0000') DISC_RC, NVL(EEA_DISC_RT, 0) DISC_RT ";
		sql += " 		FROM ET_EXAM_ACPT ";
		sql += " 		WHERE EEA_EXAM_DT BETWEEN '" + EXAM_SDT + "' AND '" + EXAM_EDT + "' ";
		sql += " 		AND EEA_ORDER_YN <> 'C' ";

		sql += PARAM_TX;
		sql += " 	)";


			//
		G_INFO += "<!-- \n";
		G_INFO += "서비스명 : uAcpt_Sales_UP_KUMC_Stat_003 \n";
		G_INFO += "설명 : 환자유형별 현황 \n";
		G_INFO += "\n\n";

		G_INFO += "전달인자 : \n";
		G_INFO += " EXAM_SDT : " + EXAM_SDT + " \n";
		G_INFO += " EXAM_EDT : " + EXAM_EDT + " \n";
		G_INFO += " PARAM_TX : " + PARAM_TX + " \n";

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
