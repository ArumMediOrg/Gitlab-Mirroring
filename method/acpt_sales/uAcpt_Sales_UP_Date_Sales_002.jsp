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

	ResultSetMetaData rsmd = null;

	CRs cRsList = null;

	//
	String G_INFO = "";

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
		String GUBUN = htMethod.get("GUBUN");
		String PARAM_TX = htMethod.get("PARAM_TX");

		//
		if(EXAM_SDT == null) { EXAM_SDT = ""; }
		if(EXAM_EDT == null) { EXAM_EDT = ""; }
		if(GUBUN == null) { GUBUN = ""; }
		if(PARAM_TX == null) { PARAM_TX = ""; }

		// DB객체
		stmtList = connect.createStatement();

		sql = " Select ";
		sql += " mm.OCCUR_DT, ";
		sql += " mm.EEA_EXAM_DT, ";
		sql += " mm.EEA_EXAM_SQ, ";
		sql += " EEA_PSNL_NM, ";
		sql += " EEA_CUST_NO, ";
		sql += " EEA_CHART_NO, ";
		sql += " F_COMP_FIND(EEA_COMP_CD) COMP_NM, ";
		sql += " EEA_DEPT_NM, ";

		if (GUBUN.equals("2")){
			sql += " 'HP' EEA_ETC, ";
		} else if (GUBUN.equals("3")){
			sql += " 'HC' EEA_ETC, ";
		}
		sql += " EEA_EXAM_CD, ";
		sql += " F_CODE_FIND('0401', SUBSTR(EEA_EXAM_CD, 1, 2) || '000', '', '1') EXAM_NM, ";
		sql += " CASE WHEN SUBSTR(EEA_EXAM_LT, 1, 3) IN ('P00', 'E00') THEN F_PACK_FIND(EEA_EXAM_LT, '') ";
		sql += " 		WHEN SUBSTR(EEA_EXAM_LT, 1, 3) = 'C03' THEN F_PACK_FIND(EEA_EXAM_LT, EEA_COMP_CD) ";
		sql += " 			ELSE CASE WHEN EEA_RECE_NO = 'R' THEN F_CODE_FIND('0401', SUBSTR(EEA_EXAM_CD, 1, 2) || '000', '', '1') ";
		sql += " 					ELSE F_CODE_FIND('0401', EEA_EXAM_CD, '', '1') END END || ";
		sql += " CASE WHEN EEA_EXAM_CD = '31001' THEN CASE WHEN EEA_DIVI_CD = '1' THEN '-초-' || EEA_DIVI_CS ";
		sql += " 												WHEN EEA_DIVI_CD = '2' THEN '-중' ";
		sql += " 												WHEN EEA_DIVI_CD = '3' THEN '-고' END ";
		sql += " 			WHEN SUBSTR(EEA_EXAM_CD, 1, 1) = '4'  THEN '(' || F_CODE_FIND('0910', EEA_SPCL_CD, '', '1') || ')' ";
		sql += " 													ELSE '' END AS EXAM_NM2, ";

		sql += " EEP_HDMD_PR+EEP_SDMD_PR+EEP_COMPS_PR+EEP_COMP_PR+EEP_PSNL_PR+EEP_PSNLP_PR TOT_PR, ";
		sql += " EEP_CAN_PR, ";
		sql += " EEP_HDMD_PR, ";
		sql += " EEP_SDMD_PR, ";
		sql += " EEP_COMP_PR, ";
		sql += " EEP_COMPS_PR, ";
		sql += " EEP_PSNL_PR, ";
		sql += " EEP_PSNLP_PR, ";
		sql += " EEP_DISC_PR, EEP_DISC_CPR, ";
		sql += " RRM_SALE_TD_PR,RRM_TRUNC_TD_PR,RRM_RESEREPL_PR, ";
		sql += " RRM_OVERPAY_PR,RRM_RECE_TD_PR,RRM_RETURN_PR_71,RRM_RETURN_PR_72, DIMISU_PR, ";
		sql += " RRM_RECE_CARD_PR ,RRM_RECE_CASH_PR ";
		sql += " From ";
		sql += " (Select ";
		sql += " 	OCCUR_DT, EEA_EXAM_DT, EEA_EXAM_SQ, ";
		sql += " 	sum(NVL(EEP_HDMD_PR,0)) EEP_HDMD_PR, sum(NVL(EEP_SDMD_PR,0)) EEP_SDMD_PR, ";
		sql += " 	sum(NVL(EEP_COMPS_PR,0)) EEP_COMPS_PR, ";
		sql += " 	sum(NVL(EEP_COMP_PR,0)) EEP_COMP_PR, sum(NVL(EEP_PSNL_PR,0)) EEP_PSNL_PR , ";
		sql += "    sum(NVL(EEP_CAN_PR,0)) EEP_CAN_PR, ";
		sql += " 	sum(NVL(EEP_PSNLP_PR,0)) EEP_PSNLP_PR, ";
		sql += "    SUM(NVL(EEP_DISC_PR,0)) EEP_DISC_PR,          SUM(NVL(EEP_DISC_CPR,0)) EEP_DISC_CPR, ";
		sql += " 	sum(NVL(RRM_SALE_TD_PR,0)) RRM_SALE_TD_PR, sum(NVL(RRM_TRUNC_TD_PR,0)) RRM_TRUNC_TD_PR, ";
		sql += " 	sum(NVL(RRM_RESEREPL_PR,0)) RRM_RESEREPL_PR, ";
		sql += " 	sum(NVL(RRM_OVERPAY_PR,0)) RRM_OVERPAY_PR, sum(NVL(RRM_RECE_TD_PR,0)) RRM_RECE_TD_PR, ";
		sql += " 	sum(NVL(RRM_RECE_CARD_PR,0)) RRM_RECE_CARD_PR, sum(NVL(RRM_RECE_CASH_PR,0)) RRM_RECE_CASH_PR, ";
		sql += " 	sum(NVL(RRM_RETURN_PR_71,0)) RRM_RETURN_PR_71, sum(NVL(RRM_RETURN_PR_72,0)) RRM_RETURN_PR_72, ";
		sql += " 	(sum(NVL(EEP_PSNL_PR,0)) - ( sum(NVL(RRM_SALE_TD_PR,0)) + sum(NVL(RRM_TRUNC_TD_PR,0)) + ";
		sql += " 	sum(NVL(RRM_RECE_TD_PR,0)) ) +  sum(NVL(RRM_RETURN_PR_71,0)) ) DIMISU_PR ";
		sql += " From ";
		sql += " 	(Select ";
		sql += " 		EEP_ORDER_DT OCCUR_DT, EEA_EXAM_DT, EEA_EXAM_SQ, ";
		sql += "        0 EEP_HDMD_PR,  EEP_SDMD_PR, EEP_COMPS_PR ,EEP_COMP_PR, EEP_PSNL_PR ,EEP_PSNLP_PR, ";
		sql += "        EEP_CAN_PR, EEP_DISC_PR, EEP_DISC_CPR, ";
		sql += " 		0 RRM_SALE_TD_PR, 0 RRM_TRUNC_TD_PR, 0 RRM_RESEREPL_PR, 0 RRM_OVERPAY_PR, 0 RRM_RECE_TD_PR, ";
		sql += " 		0 RRM_RECE_CARD_PR, 0 RRM_RECE_CASH_PR, ";
		sql += " 		0 RRM_RETURN_PR_71, 0 RRM_RETURN_PR_72 ";
		sql += " 	From ET_EXAM_PRICE ";
		sql += " 	Left outer join  ET_EXAM_ACPT on EEP_EXAM_DT = EEA_EXAM_DT and EEP_EXAM_SQ = EEA_EXAM_SQ ";
		sql += " 	where EEP_ORDER_DT between '" + EXAM_SDT + "' AND '" + EXAM_EDT + "' ";
		sql += " 	and EEA_ORDER_YN <> 'C' ";
		sql += " 	and EEA_INPT_ID <> '자료변환' ";
		sql += " 	and SUBSTR(EEA_EXAM_CD,1,2) In ('21') ";
		sql += " 	union all ";
		sql += " 	Select ";
		sql += " 		RRM_RECE_DT OCCUR_DT, EEA_EXAM_DT, EEA_EXAM_SQ, ";
		sql += " 		0 EEP_HDMD_PR, 0 EEP_SDMD_PR, 0 EEP_COMPS_PR , 0 EEP_COMP_PR, 0 EEP_PSNL_PR ,0 EEP_PSNLP_PR, ";
		sql += "        0 EEP_CAN_PR,  0 EEP_DISC_PR, 0 EEP_DISC_CPR, ";
		sql += " 		case when RRM_OCCU_KD in ('20') then RRM_SALE_TD_PR  else 0 end RRM_SALE_TD_PR, ";
		sql += " 		case when RRM_OCCU_KD in ('20') then RRM_TRUNC_TD_PR else 0 end RRM_TRUNC_TD_PR, ";
		sql += " 		RRM_RESEREPL_PR, RRM_OVERPAY_PR, ";
		sql += " 		case when RRM_OCCU_KD in ('20') then RRM_RECE_TD_PR else 0 end RRM_RECE_TD_PR, ";
		sql += " 		case when RRM_OCCU_KD in ('20') then case when RRM_PAY_KD = '01' then RRM_RECE_TD_PR ";
		sql += " 													else 0 end else 0 end RRM_RECE_CARD_PR, ";
		sql += " 		case when RRM_OCCU_KD in ('20') then case when RRM_PAY_KD = '01' then 0 ";
		sql += " 													else RRM_RECE_TD_PR end else 0 end RRM_RECE_CASH_PR, ";
		sql += " 		case when RRM_OCCU_KD in ('70','71') then RRM_RETURN_PR else 0 end RRM_RETURN_PR_71, ";
		sql += " 		case when RRM_OCCU_KD in ('72') then RRM_RETURN_PR else 0 end RRM_RETURN_PR_72 ";
		sql += " 	From RT_RECE_MEDICHK aa ";
		sql += " 	Left outer join ET_EXAM_ACPT bb on aa.RRM_RECE_NO = bb.EEA_RECE_NO ";
		sql += " 	and SUBSTR(bb.EEA_EXAM_CD,1,2) In ('21') ";
		sql += " 	where RRM_RECE_DT between '" + EXAM_SDT + "' AND '" + EXAM_EDT + "' ";
		sql += " 	and aa.RRM_RECE_NO = bb.EEA_RECE_NO ";
		sql += " 	and bb.EEA_ORDER_YN <> 'C' ";
		sql += " 	and bb.EEA_INPT_ID <> '자료변환' ";
		sql += " 	) a ";
		sql += " group by OCCUR_DT, EEA_EXAM_DT, EEA_EXAM_SQ ";
		sql += " ) mm ";
		sql += " Left outer join ET_EXAM_ACPT ee on mm.EEA_EXAM_DT = ee.EEA_EXAM_DT and mm.EEA_EXAM_SQ = ee.EEA_EXAM_SQ ";

		sql += " Where 1 = 1 ";
		sql += PARAM_TX;

		sql += " union ";
		sql += " Select ";
		sql += " mm.OCCUR_DT, ";
		sql += " mm.EEA_EXAM_DT, ";
		sql += " mm.EEA_EXAM_SQ, ";
		sql += " EEA_PSNL_NM, ";
		sql += " EEA_CUST_NO, ";
		sql += " EEA_CHART_NO, ";
		sql += " F_COMP_FIND(EEA_COMP_CD) COMP_NM, ";
		sql += " EEA_DEPT_NM, ";

		if(GUBUN.equals("2")){
			sql += " 'HC' EEA_ETC, ";
		} else if (GUBUN.equals("3")){
			sql += " 'OM' EEA_ETC, ";
		}

		sql += " EEA_EXAM_CD, ";
		sql += " F_CODE_FIND('0401', SUBSTR(EEA_EXAM_CD, 1, 2) || '000', '', '1') EXAM_NM, ";
		sql += " CASE WHEN SUBSTR(EEA_EXAM_LT, 1, 3) IN ('P00', 'E00') THEN F_PACK_FIND(EEA_EXAM_LT, '') ";
		sql += " 		WHEN SUBSTR(EEA_EXAM_LT, 1, 3) = 'C03' THEN F_PACK_FIND(EEA_EXAM_LT, EEA_COMP_CD) ";
		sql += " 			ELSE CASE WHEN EEA_RECE_NO = 'R' THEN F_CODE_FIND('0401', SUBSTR(EEA_EXAM_CD, 1, 2) || '000', '', '1') ";
		sql += " 					ELSE F_CODE_FIND('0401', EEA_EXAM_CD, '', '1') END END || ";
		sql += " CASE WHEN EEA_EXAM_CD = '31001' THEN CASE WHEN EEA_DIVI_CD = '1' THEN '-초-' || EEA_DIVI_CS ";
		sql += " 												WHEN EEA_DIVI_CD = '2' THEN '-중' ";
		sql += " 												WHEN EEA_DIVI_CD = '3' THEN '-고' END ";
		sql += " 			WHEN SUBSTR(EEA_EXAM_CD, 1, 1) = '4'  THEN '(' || F_CODE_FIND('0910', EEA_SPCL_CD, '', '1') || ')' ";
		sql += " 													ELSE '' END AS EXAM_NM2, ";

		sql += " CASE WHEN SUBSTR(EEA_EXAM_CD,1,2) = '21' THEN EEP_HDMD_PR+EEP_SDMD_PR+EEP_COMPS_PR+EEP_PSNLP_PR+EEP_CAN_PR ";
        sql += "   	  ELSE EEP_HDMD_PR+EEP_SDMD_PR+EEP_COMPS_PR+EEP_COMP_PR+EEP_PSNL_PR END AS TOT_PR,          ";
		sql += " EEP_CAN_PR, ";
		sql += " EEP_HDMD_PR, ";
		sql += " EEP_SDMD_PR, ";
		sql += " CASE WHEN SUBSTR(EEA_EXAM_CD,1,2) = '21' THEN 0 ELSE EEP_COMP_PR END AS EEP_COMP_PR, ";
		sql += " EEP_COMPS_PR, ";
		sql += " CASE WHEN SUBSTR(EEA_EXAM_CD,1,2) = '21' THEN 0 ELSE EEP_PSNL_PR END AS EEP_PSNL_PR, ";
		sql += " EEP_PSNLP_PR, ";
		sql += " EEP_DISC_PR,  EEP_DISC_CPR, ";
		sql += " RRM_SALE_TD_PR,RRM_TRUNC_TD_PR,RRM_RESEREPL_PR, ";
		sql += " RRM_OVERPAY_PR,RRM_RECE_TD_PR,RRM_RETURN_PR_71,RRM_RETURN_PR_72, DIMISU_PR, ";
		sql += " RRM_RECE_CARD_PR ,RRM_RECE_CASH_PR ";
		sql += " From ";
		sql += " (Select ";
		sql += " 	OCCUR_DT, EEA_EXAM_DT, EEA_EXAM_SQ, ";
		sql += " 	sum(NVL(EEP_HDMD_PR,0)) EEP_HDMD_PR, sum(NVL(EEP_SDMD_PR,0)) EEP_SDMD_PR, ";
		sql += " 	sum(NVL(EEP_COMPS_PR,0)) EEP_COMPS_PR, ";
		sql += " 	sum(NVL(EEP_COMP_PR,0)) EEP_COMP_PR, sum(NVL(EEP_PSNL_PR,0)) EEP_PSNL_PR , ";
		sql += "    sum(NVL(EEP_CAN_PR,0)) EEP_CAN_PR, ";
		sql += " 	sum(NVL(EEP_PSNLP_PR,0)) EEP_PSNLP_PR, ";
		sql += "    SUM(NVL(EEP_DISC_PR,0)) EEP_DISC_PR,          SUM(NVL(EEP_DISC_CPR,0)) EEP_DISC_CPR, ";
		sql += " 	sum(NVL(RRM_SALE_TD_PR,0)) RRM_SALE_TD_PR, sum(NVL(RRM_TRUNC_TD_PR,0)) RRM_TRUNC_TD_PR, ";
		sql += " 	sum(NVL(RRM_RESEREPL_PR,0)) RRM_RESEREPL_PR, ";
		sql += " 	sum(NVL(RRM_OVERPAY_PR,0)) RRM_OVERPAY_PR, sum(NVL(RRM_RECE_TD_PR,0)) RRM_RECE_TD_PR, ";
		sql += " 	sum(NVL(RRM_RECE_CARD_PR,0)) RRM_RECE_CARD_PR, sum(NVL(RRM_RECE_CASH_PR,0)) RRM_RECE_CASH_PR, ";
		sql += " 	sum(NVL(RRM_RETURN_PR_71,0)) RRM_RETURN_PR_71, sum(NVL(RRM_RETURN_PR_72,0)) RRM_RETURN_PR_72, ";
		sql += " 	(sum(NVL(EEP_PSNL_PR,0)) - ( sum(NVL(RRM_SALE_TD_PR,0)) + sum(NVL(RRM_TRUNC_TD_PR,0)) + ";
		sql += " 	sum(NVL(RRM_RECE_TD_PR,0)) ) +  sum(NVL(RRM_RETURN_PR_71,0)) ) DIMISU_PR ";
		sql += " From ";
		sql += " 	(Select ";
		sql += " 		EEP_ORDER_DT OCCUR_DT, EEA_EXAM_DT, EEA_EXAM_SQ, ";
		sql += " 		EEP_HDMD_PR,  EEP_SDMD_PR, EEP_COMPS_PR ,EEP_COMP_PR, EEP_PSNL_PR ,EEP_PSNLP_PR, ";
		sql += "        EEP_CAN_PR,   0 EEP_DISC_PR, 0 EEP_DISC_CPR,  ";
		sql += " 		0 RRM_SALE_TD_PR, 0 RRM_TRUNC_TD_PR, 0 RRM_RESEREPL_PR, 0 RRM_OVERPAY_PR, 0 RRM_RECE_TD_PR, ";
		sql += " 		0 RRM_RECE_CARD_PR, 0 RRM_RECE_CASH_PR, ";
		sql += " 		0 RRM_RETURN_PR_71, 0 RRM_RETURN_PR_72 ";
		sql += " 	From ET_EXAM_PRICE ";
		sql += " 	Left outer join  ET_EXAM_ACPT on EEP_EXAM_DT = EEA_EXAM_DT and EEP_EXAM_SQ = EEA_EXAM_SQ ";
		sql += " 	where EEP_ORDER_DT between '" + EXAM_SDT + "' AND '" + EXAM_EDT + "' ";
		sql += " 	and EEA_ORDER_YN <> 'C' ";
		sql += " 	and EEA_INPT_ID <> '자료변환' ";

		sql += " 	union all ";
		sql += " 	Select ";
		sql += " 		RRM_RECE_DT OCCUR_DT, EEA_EXAM_DT, EEA_EXAM_SQ, ";
		sql += " 		0 EEP_HDMD_PR, 0 EEP_SDMD_PR, 0 EEP_COMPS_PR , 0 EEP_COMP_PR, 0 EEP_PSNL_PR ,0 EEP_PSNLP_PR, ";
		sql += "        0 EEP_CAN_PR,  0 EEP_DISC_PR, 0 EEP_DISC_CPR, ";
		sql += " 		case when RRM_OCCU_KD in ('20') then RRM_SALE_TD_PR  else 0 end RRM_SALE_TD_PR, ";
		sql += " 		case when RRM_OCCU_KD in ('20') then RRM_TRUNC_TD_PR else 0 end RRM_TRUNC_TD_PR, ";
		sql += " 		RRM_RESEREPL_PR, RRM_OVERPAY_PR, ";
		sql += " 		case when RRM_OCCU_KD in ('20') then RRM_RECE_TD_PR else 0 end RRM_RECE_TD_PR, ";
		sql += " 		case when RRM_OCCU_KD in ('20') then case when RRM_PAY_KD = '01' then RRM_RECE_TD_PR ";
		sql += " 													else 0 end else 0 end RRM_RECE_CARD_PR, ";
		sql += " 		case when RRM_OCCU_KD in ('20') then case when RRM_PAY_KD = '01' then 0 ";
		sql += " 													else RRM_RECE_TD_PR end else 0 end RRM_RECE_CASH_PR, ";
		sql += " 		case when RRM_OCCU_KD in ('70','71') then RRM_RETURN_PR else 0 end RRM_RETURN_PR_71, ";
		sql += " 		case when RRM_OCCU_KD in ('72') then RRM_RETURN_PR else 0 end RRM_RETURN_PR_72 ";
		sql += " 	From RT_RECE_MEDICHK aa ";
		sql += " 	Left outer join ET_EXAM_ACPT bb on aa.RRM_RECE_NO = bb.EEA_RECE_NO ";
		sql += " 	and SUBSTR(bb.EEA_EXAM_CD,1,2) Not In ('21') ";
		sql += " 	where RRM_RECE_DT between '" + EXAM_SDT + "' AND '" + EXAM_EDT + "' ";
		sql += " 	and aa.RRM_RECE_NO = bb.EEA_RECE_NO ";
		sql += " 	and bb.EEA_ORDER_YN <> 'C' ";
		sql += " 	and bb.EEA_INPT_ID <> '자료변환' ";
		sql += " 	) a ";
		sql += " group by OCCUR_DT, EEA_EXAM_DT, EEA_EXAM_SQ ";
		sql += " ) mm ";
		sql += " Left outer join ET_EXAM_ACPT ee on mm.EEA_EXAM_DT = ee.EEA_EXAM_DT and mm.EEA_EXAM_SQ = ee.EEA_EXAM_SQ ";

		sql += " Where 1 = 1 ";
		sql += PARAM_TX;
		sql += " order by OCCUR_DT, EEA_ETC, EEA_EXAM_DT, EEA_PSNL_NM ";

			//
			G_INFO += "<!-- \n";
			G_INFO += "서비스명 : uAcpt_Sales_UP_Date_Sales_002 \n";
			G_INFO += "설명 : 일자별 매출현황(과 구분이 2개일 때) \n";
			G_INFO += "\n\n";

			G_INFO += "전달인자 : \n";
			G_INFO += " EXAM_SDT : " + EXAM_SDT + " \n";
			G_INFO += " EXAM_EDT : " + EXAM_EDT + " \n";
			G_INFO += " GUBUN : " + GUBUN + " \n";
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
		<s:AttributeType name='ROWID' rs:number='<%= Integer.toString(colCnt)%>' rs:rowid='true' rs:basetable='DUAL' rs:basecolumn='ROWID'
			 rs:keycolumn='true' rs:hidden='true' rs:autoincrement='true'>
			<s:datatype dt:type='string' rs:dbtype='str' dt:maxLength='18' rs:fixedlength='true'/>
		</s:AttributeType>
		<s:extends type='rs:rowbase'/>
	</s:ElementType>
</s:Schema>
		<rs:data>
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
