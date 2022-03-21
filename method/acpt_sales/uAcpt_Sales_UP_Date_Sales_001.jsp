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
		String PLCE_CD = htMethod.get("PLCE_CD");
		String PARAM_TX = htMethod.get("PARAM_TX");

		if(EXAM_SDT == null) { EXAM_SDT = ""; }
		if(EXAM_EDT == null) { EXAM_EDT = ""; }
		if(PLCE_CD == null) { PLCE_CD = ""; }
		if(PARAM_TX == null) { PARAM_TX = ""; }

		// DB객체
		stmtList = connect.createStatement();

		sql = " SELECT MM.OCCUR_DT, MM.EEA_EXAM_DT, MM.EEA_EXAM_SQ, EEA_PSNL_NM, ";
		sql += " 	EEA_CUST_NO, EEA_CHART_NO,   F_COMP_FIND(EEA_COMP_CD) COMP_NM, ";
		sql += " 	EEA_DEPT_NM, ";
		sql += " 	'XX' EEA_ETC, ";
		sql += " 	EEA_EXAM_CD, ";
		sql += " 	F_CODE_FIND('0401', SUBSTR(EEA_EXAM_CD, 1, 2) || '000', '', '1') EXAM_NM, ";
		sql += " 	CASE WHEN SUBSTR(EEA_EXAM_LT, 1, 3) IN ('P00', 'E00') THEN F_PACK_FIND(EEA_EXAM_LT, '') ";
		sql += " 			WHEN SUBSTR(EEA_EXAM_LT, 1, 3) = 'C03' THEN F_PACK_FIND(EEA_EXAM_LT, EEA_COMP_CD) ";
		sql += " 			ELSE CASE WHEN EEA_RECE_NO = 'R' THEN F_CODE_FIND('0401', SUBSTR(EEA_EXAM_CD, 1, 2) || '000', '', '1') ";
		sql += " 					ELSE F_CODE_FIND('0401', EEA_EXAM_CD, '', '1') END END || ";
		sql += " 	CASE WHEN EEA_EXAM_CD = '31001' THEN CASE WHEN EEA_DIVI_CD = '1' THEN '-초-' || EEA_DIVI_CS ";
		sql += " 												WHEN EEA_DIVI_CD = '2' THEN '-중' ";
		sql += " 												WHEN EEA_DIVI_CD = '3' THEN '-고' END ";
		sql += " 			WHEN SUBSTR(EEA_EXAM_CD, 1, 1) = '4'  THEN '(' || F_CODE_FIND('0910', EEA_SPCL_CD, '', '1') || ')' ";
		sql += " 													ELSE '' END AS EXAM_NM2, ";
		sql += " 	EEP_HDMD_PR+EEP_SDMD_PR+EEP_COMPS_PR+EEP_COMP_PR+EEP_PSNL_PR+EEP_PSNLP_PR TOT_PR, ";
		sql += " 	EEP_HDMD_PR, EEP_SDMD_PR, EEP_COMPS_PR, EEP_COMP_PR, EEP_CAN_PR,                  ";
		sql += " 	EEP_PSNL_PR, EEP_PSNLP_PR, EEP_DISC_PR, EEP_DISC_CPR, ";
		sql += "    RRM_SALE_TD_PR, RRM_TRUNC_TD_PR, RRM_RESEREPL_PR, ";
		sql += " 	RRM_OVERPAY_PR,   RRM_RECE_TD_PR, RRM_RETURN_PR_71, RRM_RETURN_PR_72, DIMISU_PR, ";
		sql += " 	RRM_RECE_CARD_PR ,RRM_RECE_CASH_PR ";
		sql += " FROM (SELECT OCCUR_DT, EEA_EXAM_DT, EEA_EXAM_SQ, ";
		sql += " 			SUM(NVL(EEP_HDMD_PR,0)) EEP_HDMD_PR,           SUM(NVL(EEP_SDMD_PR,0)) EEP_SDMD_PR,         SUM(NVL(EEP_COMPS_PR,0)) EEP_COMPS_PR, ";
		sql += " 			SUM(NVL(EEP_COMP_PR,0)) EEP_COMP_PR,           SUM(NVL(EEP_PSNL_PR,0)) EEP_PSNL_PR ,        SUM(NVL(EEP_PSNLP_PR,0)) EEP_PSNLP_PR, ";
		sql += "            SUM(NVL(EEP_CAN_PR,0)) EEP_CAN_PR,             SUM(NVL(EEP_DISC_PR,0)) EEP_DISC_PR,          SUM(NVL(EEP_DISC_CPR,0)) EEP_DISC_CPR,";
		sql += " 			SUM(NVL(RRM_SALE_TD_PR,0)) RRM_SALE_TD_PR,     SUM(NVL(RRM_TRUNC_TD_PR,0)) RRM_TRUNC_TD_PR, SUM(NVL(RRM_RESEREPL_PR,0)) RRM_RESEREPL_PR, ";
		sql += " 			SUM(NVL(RRM_OVERPAY_PR,0)) RRM_OVERPAY_PR,     SUM(NVL(RRM_RECE_TD_PR,0)) RRM_RECE_TD_PR, ";
		sql += " 			SUM(NVL(RRM_RECE_CARD_PR,0)) RRM_RECE_CARD_PR, SUM(NVL(RRM_RECE_CASH_PR,0)) RRM_RECE_CASH_PR, ";
		sql += " 			SUM(NVL(RRM_RETURN_PR_71,0)) RRM_RETURN_PR_71, SUM(NVL(RRM_RETURN_PR_72,0)) RRM_RETURN_PR_72, ";
		sql += " 			(SUM(NVL(EEP_PSNL_PR,0)) - (SUM(NVL(RRM_SALE_TD_PR,0)) + SUM(NVL(RRM_TRUNC_TD_PR,0)) + SUM(NVL(RRM_RECE_TD_PR,0)) ) +  SUM(NVL(RRM_RETURN_PR_71,0)) ) DIMISU_PR ";
		sql += " 		FROM (SELECT EEP_ORDER_DT OCCUR_DT, EEA_EXAM_DT, EEA_EXAM_SQ, ";
		sql += " 					EEP_HDMD_PR,  EEP_SDMD_PR, EEP_COMPS_PR ,EEP_COMP_PR, EEP_PSNL_PR ,EEP_PSNLP_PR, EEP_CAN_PR, ";
		sql += "                    EEP_DISC_PR,  EEP_DISC_CPR,                                                                  ";
		sql += " 					0 RRM_SALE_TD_PR, 0 RRM_TRUNC_TD_PR, 0 RRM_RESEREPL_PR, 0 RRM_OVERPAY_PR, 0 RRM_RECE_TD_PR, ";
		sql += " 					0 RRM_RECE_CARD_PR, 0 RRM_RECE_CASH_PR, ";
		sql += " 					0 RRM_RETURN_PR_71, 0 RRM_RETURN_PR_72 ";
		sql += " 				FROM ET_EXAM_PRICE ";
		sql += " 					LEFT OUTER JOIN  ET_EXAM_ACPT ON EEP_EXAM_DT = EEA_EXAM_DT AND EEP_EXAM_SQ = EEA_EXAM_SQ ";
		sql += " 				WHERE EEP_ORDER_DT BETWEEN '" + EXAM_SDT + "' AND '" + EXAM_EDT + "' ";
		sql += " 				AND EEA_ORDER_YN <> 'C' ";
		sql += " 				AND EEA_INPT_ID <> '자료변환' ";
		sql += " 				UNION ALL ";
		sql += " 				SELECT RRM_RECE_DT OCCUR_DT, EEA_EXAM_DT, EEA_EXAM_SQ, ";
		sql += " 					0 EEP_HDMD_PR, 0 EEP_SDMD_PR, 0 EEP_COMPS_PR , 0 EEP_COMP_PR, 0 EEP_PSNL_PR ,0 EEP_PSNLP_PR, ";
		sql += "                    0 EEP_CAN_PR, 0 EEP_DISC_PR,   0 EEP_DISC_CPR, ";
		sql += " 					CASE WHEN RRM_OCCU_KD IN ('20') THEN RRM_SALE_TD_PR  ELSE 0 END RRM_SALE_TD_PR, ";
		sql += " 					CASE WHEN RRM_OCCU_KD IN ('20') THEN RRM_TRUNC_TD_PR ELSE 0 END RRM_TRUNC_TD_PR, ";
		sql += " 					RRM_RESEREPL_PR, RRM_OVERPAY_PR, ";
		sql += " 					CASE WHEN RRM_OCCU_KD IN ('20') THEN RRM_RECE_TD_PR ELSE 0 END RRM_RECE_TD_PR, ";
		sql += " 					CASE WHEN RRM_OCCU_KD IN ('20') THEN CASE WHEN RRM_PAY_KD = '01' THEN RRM_RECE_TD_PR ELSE 0 END ELSE 0 END RRM_RECE_CARD_PR, ";
		sql += " 					CASE WHEN RRM_OCCU_KD IN ('20') THEN CASE WHEN RRM_PAY_KD = '01' THEN 0 ELSE RRM_RECE_TD_PR END ELSE 0 END RRM_RECE_CASH_PR, ";
		sql += " 					CASE WHEN RRM_OCCU_KD IN ('70','71') THEN RRM_RETURN_PR ELSE 0 END RRM_RETURN_PR_71, ";
		sql += " 					CASE WHEN RRM_OCCU_KD IN ('72') THEN RRM_RETURN_PR ELSE 0 END RRM_RETURN_PR_72 ";
		sql += " 				FROM RT_RECE_MEDICHK AA ";
		sql += " 					LEFT OUTER JOIN ET_EXAM_ACPT BB ON AA.RRM_RECE_NO = BB.EEA_RECE_NO ";
		sql += " 				WHERE RRM_RECE_DT BETWEEN '" + EXAM_SDT + "' AND '" + EXAM_EDT + "' ";
		sql += " 				AND AA.RRM_RECE_NO = BB.EEA_RECE_NO ";
		sql += " 				AND BB.EEA_ORDER_YN <> 'C' ";
		sql += " 				AND BB.EEA_INPT_ID <> '자료변환' ";
		sql += " 			) A ";
		sql += " 	GROUP BY OCCUR_DT, EEA_EXAM_DT, EEA_EXAM_SQ ";
		sql += " 	) MM ";
		sql += " 	LEFT OUTER JOIN ET_EXAM_ACPT EE ON MM.EEA_EXAM_DT = EE.EEA_EXAM_DT AND MM.EEA_EXAM_SQ = EE.EEA_EXAM_SQ ";
		sql += " WHERE 1 = 1 ";

		if (!PLCE_CD.equals("00")){
			sql += " AND EEA_PLCE_CD = '" + PLCE_CD + "' ";
		}

		sql += PARAM_TX;
		sql += " ORDER BY MM.OCCUR_DT, SUBSTR(EEA_EXAM_CD,1,2), MM.EEA_EXAM_DT, EEA_PSNL_NM ";

			//
		G_INFO += "<!-- \n";
		G_INFO += "서비스명 : uAcpt_Sales_UP_Date_Sales_001 \n";
		G_INFO += "설명 : 일자별 매출현황(과 구분이 1개일 때) \n";
		G_INFO += "\n\n";

		G_INFO += "전달인자 : \n";
		G_INFO += " EXAM_SDT : " + EXAM_SDT + " \n";
		G_INFO += " EXAM_EDT : " + EXAM_EDT + " \n";
		G_INFO += " PLCE_CD : " + PLCE_CD + " \n";
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
