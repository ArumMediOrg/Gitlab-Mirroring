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
		String PARAM_TX2 = htMethod.get("PARAM_TX2");
		String GROUP_YN = htMethod.get("GROUP_YN");

		if(EXAM_SDT == null) { EXAM_SDT = ""; }
		if(EXAM_EDT == null) { EXAM_EDT = ""; }
		if(PARAM_TX == null) { PARAM_TX = ""; }
		if(PARAM_TX2 == null) { PARAM_TX2 = ""; }
		if(GROUP_YN == null) { GROUP_YN = ""; }

		// DB객체
		stmtList = connect.createStatement();

		sql = " SELECT MIN(EXAM_DT) EXAM_DT, SUM(CNT) EXAM_CNT, ";
		sql += " 	SUM(PSNL_PR) PSNL_PR, SUM(COMP_PR) COMP_PR, SUM(PSNL_PR + COMP_PR) TOT_PR, ";
		sql += " 	(SUM(COMP_PR + DISC_PR + CARDPR + CASHPR + BKBOOKPR + POINTPR + OTHERPR) + ";
		sql += " 	SUM(PSNL_PR - DISC_PR - CARDPR - CASHPR - BKBOOKPR - POINTPR - OTHERPR)) CALTOT_PR, ";
		sql += " 	SUM(DISC_PR) DISC_PR, ";
		sql += " 	SUM(CARDPR) CARD_PR, SUM(CASHPR) CASH_PR, SUM(BKBOOKPR) BKBOOK_PR, SUM(POINTPR) POINT_PR, SUM(OTHERPR) OTHER_PR, ";
		sql += " 	SUM(PSNL_PR - DISC_PR - CARDPR - CASHPR - BKBOOKPR - POINTPR - OTHERPR) PSNLMISU_PR ";
		sql += " FROM (SELECT EEP_ORDER_DT EXAM_DT, ";
		sql += " 			SUM(CASE WHEN EEP_ORDER_SQ = 1 " + PARAM_TX2 + " THEN 1 ELSE 0 END) CNT, ";
		sql += " 			SUM(EEP_PSNL_PR + EEP_PSNLP_PR) PSNL_PR, ";
		sql += " 			SUM(EEP_COMP_PR + EEP_COMPS_PR) COMP_PR, ";
		sql += " 			SUM(EEP_DISC_PR + EEP_DISC_CPR) DISC_PR, ";
		sql += " 			0 CARDPR, 0 CASHPR, 0 BKBOOKPR, 0 POINTPR, 0 OTHERPR ";
		sql += " 		FROM ET_EXAM_PRICE A LEFT OUTER JOIN ET_EXAM_ACPT B ON A.EEP_EXAM_DT = B.EEA_EXAM_DT AND A.EEP_EXAM_SQ = B.EEA_EXAM_SQ ";
		sql += " 		WHERE A.EEP_ORDER_DT BETWEEN '" + EXAM_SDT + "' AND '" + EXAM_EDT + "' ";
		sql += " 		AND B.EEA_ORDER_YN <> 'C' ";

		sql += PARAM_TX;

		sql += "	GROUP BY A.EEP_ORDER_DT ";
		sql += "	UNION ALL ";
		sql += "	SELECT RRM_RECE_DT EXAM_DT, ";
		sql += "		0 CNT, 0 PSNL_PR, 0 COMP_PR, 0 DISC_PR, ";
		sql += "		SUM(CASE WHEN RRM_PAY_KD IN ('01')      THEN (NVL(RRM_RECE_PR,0) - NVL(RRM_RETURN_PR,0)) ELSE 0 END) CARDPR, ";
		sql += "		SUM(CASE WHEN RRM_PAY_KD IN ('02','03') THEN (NVL(RRM_RECE_PR,0) - NVL(RRM_RETURN_PR,0)) ELSE 0 END) CASHPR, ";
		sql += "		SUM(CASE WHEN RRM_PAY_KD IN ('04')      THEN (NVL(RRM_RECE_PR,0) - NVL(RRM_RETURN_PR,0)) ELSE 0 END) BKBOOKPR, ";
		sql += "		SUM(CASE WHEN RRM_PAY_KD IN ('05')      THEN (NVL(RRM_RECE_PR,0) - NVL(RRM_RETURN_PR,0)) ELSE 0 END) POINTPR, ";
		sql += "		SUM(CASE WHEN RRM_PAY_KD NOT IN ('01','02','03','04','05') THEN (NVL(RRM_RECE_PR,0) - NVL(RRM_RETURN_PR,0)) ELSE 0 END) OTHERPR ";
		sql += "	FROM RT_RECE_MEDICHK A LEFT OUTER JOIN ET_EXAM_ACPT B ON A.RRM_RECE_NO = B.EEA_RECE_NO ";
		sql += "	WHERE A.RRM_RECE_DT BETWEEN '" + EXAM_SDT + "' AND '" + EXAM_EDT + "' ";
		sql += "	AND A.RRM_OCCU_KD IN ('20','70','71','72') ";
		sql += "	AND B.EEA_ORDER_YN <> 'C' ";

		sql += PARAM_TX;

		sql += " 	GROUP BY A.RRM_RECE_DT ";
		sql += " ) C ";

		if(GROUP_YN.equals("Y")){
			sql += " GROUP BY EXAM_DT ";
			sql += " ORDER BY EXAM_DT ";
		}


			//
		G_INFO += "<!-- \n";
		G_INFO += "서비스명 : uAcpt_Sales_UP_KUMC_Day_004 \n";
		G_INFO += "설명 : 수입현황 \n";
		G_INFO += "\n\n";

		G_INFO += "전달인자 : \n";
		G_INFO += " EXAM_SDT : " + EXAM_SDT + " \n";
		G_INFO += " EXAM_EDT : " + EXAM_EDT + " \n";
		G_INFO += " PARAM_TX : " + PARAM_TX + " \n";
		G_INFO += " PARAM_TX2 : " + PARAM_TX2 + " \n";
		G_INFO += " GROUP_YN : " + GROUP_YN + " \n";

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
