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
		String EXAM_SDT2 = htMethod.get("EXAM_SDT2");
		String EXAM_EDT2 = htMethod.get("EXAM_EDT2");
		String PARAM_TX = htMethod.get("PARAM_TX");

		if(EXAM_SDT == null) { EXAM_SDT = ""; }
		if(EXAM_EDT == null) { EXAM_EDT = ""; }
		if(EXAM_SDT2 == null) { EXAM_SDT2 = ""; }
		if(EXAM_EDT2 == null) { EXAM_EDT2 = ""; }
		if(PARAM_TX == null) { PARAM_TX = ""; }

		// DB객체
		stmtList = connect.createStatement();

		sql += " SELECT EXAM_KIND, MAX(KIND_NM) KIND_NM, ";
		sql += " 	SUM(EXAM_CNT1) EXAM_CNT1, SUM(EXAM_CNT2) EXAM_CNT2, ";
		sql += " 	SUM(EXAM_CNT1) - SUM(EXAM_CNT2) DIFF_CNT, ";
		sql += " 	CASE WHEN SUM(EXAM_CNT1+EXAM_CNT2) = 0 THEN 0 ";
		sql += " 			WHEN SUM(EXAM_CNT1) > 0 AND SUM(EXAM_CNT2) = 0 THEN 100 ";
		sql += " 			ELSE ROUND(ABS(SUM(EXAM_CNT1) - SUM(EXAM_CNT2)) / SUM(EXAM_CNT2) * 100, 1) END DIFF_RT ";
		sql += " FROM (SELECT '01' EXAM_KIND, '일반' KIND_NM, 0 EXAM_CNT1, 0 EXAM_CNT2 FROM DUAL  ";
		sql += " 		UNION ALL ";
		sql += " 		SELECT '02' EXAM_KIND, F_CODE_FIND('0989', 'A050', ' ', '1') KIND_NM, 0 EXAM_CNT1, 0 EXAM_CNT2 FROM DUAL  ";
		sql += " 		UNION ALL ";
		sql += " 		SELECT '03' EXAM_KIND, F_CODE_FIND('0989', 'A040', ' ', '1') KIND_NM, 0 EXAM_CNT1, 0 EXAM_CNT2 FROM DUAL  ";
		sql += " 		UNION ALL ";
		sql += " 		SELECT '04' EXAM_KIND, F_CODE_FIND('0989', 'A060', ' ', '1') KIND_NM, 0 EXAM_CNT1, 0 EXAM_CNT2 FROM DUAL  ";
		sql += " 		UNION ALL ";
		sql += " 		SELECT '05' EXAM_KIND, F_CODE_FIND('0989', 'A010', ' ', '1') KIND_NM, 0 EXAM_CNT1, 0 EXAM_CNT2 FROM DUAL  ";
		sql += " 		UNION ALL ";
		sql += " 		SELECT '06' EXAM_KIND, F_CODE_FIND('0989', 'A030', ' ', '1') KIND_NM, 0 EXAM_CNT1, 0 EXAM_CNT2 FROM DUAL  ";
		sql += " 		UNION ALL ";
		sql += " 		SELECT '07' EXAM_KIND, F_CODE_FIND('0989', 'A020', ' ', '1') KIND_NM, 0 EXAM_CNT1, 0 EXAM_CNT2 FROM DUAL  ";
		sql += " 		UNION ALL ";
		sql += " 		SELECT '08' EXAM_KIND, F_CODE_FIND('0989', 'A100', ' ', '1') KIND_NM, 0 EXAM_CNT1, 0 EXAM_CNT2 FROM DUAL  ";
		sql += " 		UNION ALL ";
		sql += " 		SELECT '09' EXAM_KIND, '기타'  KIND_NM, 0 EXAM_CNT1, 0 EXAM_CNT2 FROM DUAL  ";
		sql += " 		UNION ALL ";
		sql += " 		SELECT '10' EXAM_KIND, '거래처' KIND_NM, 0 EXAM_CNT1, 0 EXAM_CNT2 FROM DUAL  ";
		sql += " 		UNION ALL ";
		sql += " 		SELECT CASE WHEN EEA_ACPT_CD = '2'    THEN '10' ";
		sql += "		WHEN SUBSTR(EEA_DISC_RC, 1, 3) = 'A05' THEN '02' ";
		sql += "		WHEN SUBSTR(EEA_DISC_RC, 1, 3) = 'A04' THEN '03' ";
		sql += "		WHEN SUBSTR(EEA_DISC_RC, 1, 3) = 'A06' THEN '04' ";
		sql += "		WHEN SUBSTR(EEA_DISC_RC, 1, 3) = 'A01' THEN '05' ";
		sql += "		WHEN SUBSTR(EEA_DISC_RC, 1, 3) = 'A03' THEN '06' ";
		sql += "		WHEN SUBSTR(EEA_DISC_RC, 1, 3) = 'A02' THEN '07' ";
		sql += " 					WHEN EEA_DISC_RC = 'A100' THEN '08' ";
		sql += " 					WHEN EEA_DISC_RC = 'A090' THEN '01' ";
		sql += " 					WHEN EEA_DISC_RC IS NOT NULL THEN '09' ";
		sql += " 					ELSE '01' END EXAM_KIND, ";
		sql += " 			'' KIND_NM, 1 EXAM_CNT1, 0 EXAM_CNT2 ";
		sql += " 		FROM ET_EXAM_ACPT ";
		sql += " 		WHERE EEA_EXAM_DT BETWEEN '" + EXAM_SDT + "' AND '" + EXAM_EDT + "' ";
		sql += " 		AND EEA_ORDER_YN <> 'C' ";
		sql += PARAM_TX;
		sql += " 		UNION ALL ";
		sql += " 		SELECT CASE WHEN EEA_ACPT_CD = '2'    THEN '10' ";
		sql += "		WHEN SUBSTR(EEA_DISC_RC, 1, 3) = 'A05' THEN '02' ";
		sql += "		WHEN SUBSTR(EEA_DISC_RC, 1, 3) = 'A04' THEN '03' ";
		sql += "		WHEN SUBSTR(EEA_DISC_RC, 1, 3) = 'A06' THEN '04' ";
		sql += "		WHEN SUBSTR(EEA_DISC_RC, 1, 3) = 'A01' THEN '05' ";
		sql += "		WHEN SUBSTR(EEA_DISC_RC, 1, 3) = 'A03' THEN '06' ";
		sql += "		WHEN SUBSTR(EEA_DISC_RC, 1, 3) = 'A02' THEN '07' ";
		sql += " 					WHEN EEA_DISC_RC = 'A100' THEN '08' ";
		sql += " 					WHEN EEA_DISC_RC = 'A090' THEN '01' ";
		sql += " 					WHEN EEA_DISC_RC IS NOT NULL THEN '09' ";
		sql += " 					ELSE '01' END EXAM_KIND, ";
		sql += " 			'' KIND_NM, 0 EXAM_CNT1, 1 EXAM_CNT2 ";
		sql += " 		FROM ET_EXAM_ACPT ";
		sql += " 		WHERE EEA_EXAM_DT BETWEEN '" + EXAM_SDT2 + "' AND '" + EXAM_EDT2 + "' ";
		sql += " 		AND EEA_ORDER_YN <> 'C' ";
		sql += PARAM_TX;
		sql += " 	) A ";
		sql += " GROUP BY EXAM_KIND ";
		sql += " ORDER BY EXAM_KIND ";

			//
		G_INFO += "<!-- \n";
		G_INFO += "서비스명 : uAcpt_Sales_UP_KUMC_Day_001 \n";
		G_INFO += "설명 : 수검자 종별 현황(일, 주, 월) \n";
		G_INFO += "\n\n";

		G_INFO += "전달인자 : \n";

		G_INFO += " EXAM_SDT : " + EXAM_SDT + " \n";
		G_INFO += " EXAM_EDT : " + EXAM_EDT + " \n";
		G_INFO += " EXAM_SDT2 : " + EXAM_SDT2 + " \n";
		G_INFO += " EXAM_EDT2 : " + EXAM_EDT2 + " \n";
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
