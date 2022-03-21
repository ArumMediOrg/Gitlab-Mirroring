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

		String SCANAD_KD = htMethod.get("SCANAD_KD");
		String G_ENCRT_KD = htMethod.get("G_ENCRT_KD");
		String DTEFROMDT = htMethod.get("DTEFROMDT");
		String DTETODT = htMethod.get("DTETODT");
		String CMBCHUNGYYYY = htMethod.get("CMBCHUNGYYYY");
		String SSQL_ADD1 = htMethod.get("SSQL_ADD1");
		String SSQL_ADD2 = htMethod.get("SSQL_ADD2");
		String SSQL_ADD3 = htMethod.get("SSQL_ADD3");

		//
		if(SCANAD_KD == null) { SCANAD_KD = ""; }
		if(G_ENCRT_KD == null) { G_ENCRT_KD = ""; }
		if(DTEFROMDT == null) { DTEFROMDT = ""; }
		if(DTETODT == null) { DTETODT = ""; }
		if(CMBCHUNGYYYY == null) { CMBCHUNGYYYY = ""; }
		if(SSQL_ADD1 == null) { SSQL_ADD1 = ""; }
		if(SSQL_ADD2 == null) { SSQL_ADD2 = ""; }
		if(SSQL_ADD3 == null) { SSQL_ADD3 = ""; }

		// DB객체
		stmtList = connect.createStatement();

		sql = " SELECT (CHSTOMA_PR + CHCOLON_PR + CHLIVER_PR + CHBAST_PR + CHUTER_PR + CHLUNG_PR) EEA_HLTHR_PR, AAA.*, EEI.*";
		sql += " FROM (";
		sql += "	SELECT EEA_MNGT_HTYR, EEA_EXAM_DT,EEA_EXAM_SQ, ICR_BIRH_DT, EEA_PSNL_NM, EEA_SEX_CD, EEA_CNCR_DT, ECS_EXAM_DT, ECS_EXAM_SQ, EEA_INSU_NO, EEA_CNTR_CD, ECC_EXAM_DT, ECL_EXAM_DT, EEA_CHART_NO, ECH_CFRM_CD, EEA_CANR_PR, ICR_PID_EN, EEA_HDMD_YN, EEA_PLCE_CD, EEA_SEND_CD, EEA_SAFE_YN, EEA_STOMA_CD, EEA_COLON_CD, EEA_LIVER_CD, EEA_BAST_CD, EEA_UTER_CD, EEA_LUNG_CD, REPLACE(EEA_CNCR_DT,'-','') TRANC_DATE, ICR_INFO_YN, REPLACE(EEA_EXAM_DT,'-','') INFODT";
		sql += "	, CASE SUBSTR(EEA_CANAD_KD,1,1) WHEN '" + SCANAD_KD + "' THEN CASE EEA_STOMA_CD WHEN '7' THEN '1' WHEN '8' THEN '1' WHEN '6' THEN '0' WHEN '9' THEN '0' ELSE EEA_STOMA_CD END ELSE '0' END CHSTOMA";
		sql += "	, CASE SUBSTR(EEA_CANAD_KD,2,1) WHEN '" + SCANAD_KD + "' THEN CASE EEA_COLON_CD WHEN '7' THEN '1' WHEN '8' THEN '1' WHEN '6' THEN '0' WHEN '9' THEN '0' ELSE EEA_COLON_CD END ELSE '0' END CHCOLON";
		sql += "	, CASE SUBSTR(EEA_CANAD_KD,3,1) WHEN '" + SCANAD_KD + "' THEN CASE EEA_LIVER_CD WHEN '7' THEN '1' WHEN '8' THEN '1' WHEN '6' THEN '0' WHEN '9' THEN '0' ELSE EEA_LIVER_CD END ELSE '0' END CHLIVER";
		sql += "	, CASE SUBSTR(EEA_CANAD_KD,4,1) WHEN '" + SCANAD_KD + "' THEN CASE EEA_BAST_CD WHEN '7' THEN '1' WHEN '8' THEN '1' WHEN '6' THEN '0' WHEN '9' THEN '0' ELSE EEA_BAST_CD END ELSE '0' END CHBAST";
		sql += "	, CASE SUBSTR(EEA_CANAD_KD,5,1) WHEN '" + SCANAD_KD + "' THEN CASE EEA_UTER_CD WHEN '7' THEN '1' WHEN '8' THEN '1' WHEN '6' THEN '0' WHEN '9' THEN '0' ELSE EEA_UTER_CD END ELSE '0' END CHUTER";
		sql += "	, CASE SUBSTR(EEA_CANAD_KD,6,1) WHEN '" + SCANAD_KD + "' THEN CASE EEA_LUNG_CD WHEN '7' THEN '1' WHEN '8' THEN '1' WHEN '6' THEN '0' WHEN '9' THEN '0' ELSE EEA_LUNG_CD END ELSE '0' END CHLUNG";

		if(G_ENCRT_KD.equals("1")) {

			sql += ", F_PERID_FIND1(EEA_EXAM_DT,EEA_EXAM_SQ,'1') ICR_PENL_ID, ROW_NUMBER() OVER(PARTITION BY (ICR_PID_EN)ORDER BY EEA_EXAM_DT) ROW1,";
		} else if(G_ENCRT_KD.equals("2")) {

			sql += ", F_RPAD(NVL(ECL_DECRYPT(F_PERID_FIND1(EEA_EXAM_DT,EEA_EXAM_SQ,'1')),' '),13,' ') ICR_PENL_ID, ROW_NUMBER() OVER(PARTITION BY (ECL_DECRYPT(ICR_PID_EN))ORDER BY EEA_EXAM_DT) ROW1,";
		} else {

			sql += ", F_RPAD(F_PERID_FIND1(EEA_EXAM_DT,EEA_EXAM_SQ,'0'),13,' ') ICR_PENL_ID, ROW_NUMBER() OVER(PARTITION BY (ICR_PENL_ID)ORDER BY EEA_EXAM_DT) ROW1,";
		}

		sql += " ECS_GIEX_KD,ECS_GIRT1_KD,ECS_GIRT1S_KD,ECS_GIRT2_KD,ECS_GIRT2S_KD,ECS_GIRT3_KD, ECS_FOCP_KD, ECS_GIRT3S_KD,ECS_GIETC_KD,ECS_GIRT_EX,ECS_GIEX_DT,ECS_ENRT1_KD,ECS_ENRT1S_KD, ECS_ENRT2_KD,ECS_ENRT2S_KD,ECS_ENRT3_KD,ECS_ENRT3S_KD,ECS_ENETC_KD,ECS_ENRT_EX, ECS_BIEX_YN,ECS_BIRT_KD";
		sql += ", CASE WHEN ECS_BICT_KD='0' THEN '' ELSE ECS_BICT_KD END ECS_BICT_KD ,ECS_BICNCR_KD,ECS_BICNCR_EX,ECS_BIETC_KD,ECS_BIETC_EX, ECS_ENEX_DT,ECS_RSLT_KD,ECS_STCN_YN,ECS_ETC_EX,ECS_RSLT_EX,ECS_CFRM_DT,ECS_LICEN_CD , ECS_DECI_LICEN_CD , ECS_CKUP_LICEN_CD , ECS_PATH_LICEN_CD , ECC_OBTP_KD,ECC_OBRT_CD,ECC_OBRT_VL,ECC_OBVL_VL,ECC_OBEX_DT,ECC_GIEX_KD,ECC_GIRT1_KD, ECC_GIRT1S_KD,ECC_GIRT2_KD,ECC_GIRT2S_KD,ECC_GIRT3_KD,ECC_GIRT3S_KD,ECC_GIPL_VL,ECC_GIETC_KD, ECC_FOCP_KD, ECC_GIRT_EX,ECC_GIEX_DT ,ECC_ENRT1_KD,ECC_ENRT1S_KD,ECC_ENRT2_KD,ECC_ENRT2S_KD,ECC_ENRT3_KD,ECC_ENRT3S_KD, ECC_ENPL_VL,ECC_ENETC_KD,ECC_ENRT_EX,ECC_BIEX_YN,ECC_BIRT_KD";
		sql += ", CASE WHEN ECC_BICT_KD='0' THEN '' ELSE ECC_BICT_KD END ECC_BICT_KD,ECC_BICNCR_KD,ECC_BICNCR_EX, ECC_BIETC_KD,ECC_BIETC_EX,ECC_ENEX_DT ,ECC_RSLT_KD,ECC_STCN_YN,ECC_ETC_EX,ECC_RSLT_EX,ECC_CFRM_DT,ECC_LICEN_CD, ECC_ENCE_KD, ECC_ENJJ_KD, ECC_DECI_LICEN_CD , ECC_CKUP_LICEN_CD , ECC_PATH_LICEN_CD , ECL_ALT_VL,ECL_HBTP_KD,ECL_HBRT_CD,ECL_HBRT_VL,ECL_HBVL_VL,ECL_HBPJ_KD,ECL_HCTP_KD,ECL_HCRT_CD,ECL_HCRT_VL, ECL_HCVL_VL,ECL_HCPJ_KD,ECL_USRL1_KD,ECL_USRL2_KD,ECL_USRL3_KD,ECL_USPO_KD,ECL_USCN1_KD,ECL_USCN2_KD,ECL_USCN3_KD, ECL_USETC_KD,ECL_USETC_EX,ECL_AFPTP_KD,ECL_AFPRT_CD,ECL_AFPRT_VL,ECL_AFPRT_UNIT,ECL_AFPVL_VL, ECL_RSLT_KD,ECL_LICN_YN,ECL_ETC_EX,ECL_RSLT_EX,ECL_CFRM_DT,ECL_LICEN_CD, ECL_USCN2_1_KD , ECL_USCN2_VL1 , ECL_USCN2_VL2 , ECL_USCN2_VL3 , ECL_USETC_EX2, ECL_USRL4_KD , ECL_USRL5_KD , ECL_USRL6_KD , ECL_USRL7_KD , ECL_CKUP_LICEN_CD , ECB_EXAM_DT,ECB_MGDS_KD,ECB_MGEX_KD,ECB_MGRT1_KD,ECB_MGRT1SR_KD,ECB_MGRT1R_EX,ECB_MGRT1SL_KD,ECB_MGRT1L_EX,ECB_MGRT2_KD, ECB_MGRT2SR_KD,ECB_MGRT2R_EX,ECB_MGRT2SL_KD,ECB_MGRT2L_EX,ECB_MGRT3_KD,ECB_MGRT3SR_KD,ECB_MGRT3R_EX,ECB_MGRT3SL_KD, ECB_MGRT3L_EX,ECB_MGRT_EX,ECB_MGEX_DT,ECB_RSLT_KD,ECB_BRCN_YN,ECB_RSLT_EX,ECB_CFRM_DT,ECB_LICEN_CD, ECV_CVEX_DT, ECB_MGPT_KD , ECB_DECI_LICEN_CD , ECV_EXAM_DT, ECL_LVEX_DT, ECV_CVSP1_KD,ECV_CELL1_KD,ECV_CVRT1_KD,ECV_SQRT1_KD,ECV_NHRT1_KD,ECV_EPRT1_KD,ECV_EPET1_EX,ECV_RTET1_EX,ECV_ETCRT1_KD, ECV_ETCEX1_EX,ECV_CVSP2_KD,ECV_CELL2_KD,ECV_CVRT2_KD,ECV_SQRT2_KD,ECV_NHRT2_KD,ECV_EPRT2_KD,ECV_EPET2_EX,ECV_RTET2_EX, ECV_ETCRT2_KD,ECV_ETCEX2_EX,ECV_RSLT_KD,ECV_CVCN_YN,ECV_ETC_EX,ECV_RSLT_EX,ECV_CFRM_DT,ECV_LICEN_CD , ECV_NHEP1_KD , ECV_NHEP2_KD , ECV_COLL_LICEN_CD , ECV_PATH_LICEN_CD ,ECG_CFRM_CD ,ECG_LUEX_DT ,ECG_LUEX_KD ,ECG_CTDI_VL ,ECG_BEFO_YN ,ECG_BEFO_YY ,ECG_BEFO_MM ,ECG_PNRT_YN ,ECG_PNRT1_YN ,ECG_PNRT1IC_KD ,ECG_PNRT1SL_KD ,ECG_PNRT1SZ1_VL ,ECG_PNRT1SZ2_VL ,ECG_PNRT1FT_KD ,ECG_PNRT1TR1_KD ,ECG_PNRT1TR2_KD ,ECG_PNRT2_YN ,ECG_PNRT2IC_KD ,ECG_PNRT2SL_KD ,ECG_PNRT2SZ1_VL ,ECG_PNRT2SZ2_VL ,ECG_PNRT2FT_KD ,ECG_PNRT2TR1_KD ,ECG_PNRT2TR2_KD ,ECG_PNRT3_YN ,ECG_PNRT3IC_KD ,ECG_PNRT3SL_KD ,ECG_PNRT3SZ1_VL ,ECG_PNRT3SZ2_VL ,ECG_PNRT3FT_KD ,ECG_PNRT3TR1_KD ,ECG_PNRT3TR2_KD ,ECG_PNRT4_YN ,ECG_PNRT4IC_KD ,ECG_PNRT4SL_KD ,ECG_PNRT4SZ1_VL ,ECG_PNRT4SZ2_VL ,ECG_PNRT4FT_KD ,ECG_PNRT4TR1_KD ,ECG_PNRT4TR2_KD ,ECG_PNRT5_YN ,ECG_PNRT5IC_KD ,ECG_PNRT5SL_KD ,ECG_PNRT5SZ1_VL ,ECG_PNRT5SZ2_VL ,ECG_PNRT5FT_KD ,ECG_PNRT5TR1_KD ,ECG_PNRT5TR2_KD ,ECG_PNRT6_YN ,ECG_PNRT6IC_KD ,ECG_PNRT6SL_KD ,ECG_PNRT6SZ1_VL ,ECG_PNRT6SZ2_VL ,ECG_PNRT6FT_KD ,ECG_PNRT6TR1_KD ,ECG_PNRT6TR2_KD ,ECG_BRLE_YN ,ECG_BRLE_EX ,ECG_LUCN_KD ,ECG_LUCN_EX ,ECG_SCRT_CD ,ECG_SCRT_EX ,ECG_INPT_YN ,ECG_RSLT_KD ,ECG_RSLT2_KD ,ECG_ETC_EX ,ECG_RSLT_EX ,ECG_RSLT_ETC_EX ,ECG_CFRM_DT ,ECG_LICEN_CD ,ECG_DECI_LICEN_CD ,ECG_LUCN_YN ,ECG_AFRL_EX ,ECG_AFSM_EX ,ECG_AFDT_DT ,ECG_AFPL_CD ,ECG_AFTE_LICEN_CD";
		sql += " FROM ET_EXAM_ACPT A LEFT OUTER JOIN IT_CUSTOMER B";
		sql += " ON A.EEA_CUST_NO = B.ICR_CUST_NO LEFT OUTER JOIN ET_CANCER_STMC D";
		sql += " ON A.EEA_EXAM_DT = D.ECS_EXAM_DT";
		sql += " AND A.EEA_EXAM_SQ=D.ECS_EXAM_SQ";
		sql += " AND EEA_STOMA_CD > '0' LEFT OUTER JOIN ET_CANCER_COLO E";
		sql += " ON A.EEA_EXAM_DT = E.ECC_EXAM_DT";
		sql += " AND A.EEA_EXAM_SQ=E.ECC_EXAM_SQ";
		sql += " AND EEA_COLON_CD > '0' LEFT OUTER JOIN ET_CANCER_LIVER F";
		sql += " ON A.EEA_EXAM_DT = F.ECL_EXAM_DT";
		sql += " AND A.EEA_EXAM_SQ=F.ECL_EXAM_SQ";
		sql += " AND EEA_LIVER_CD > '0' LEFT OUTER JOIN ET_CANCER_BRST G";
		sql += " ON A.EEA_EXAM_DT = G.ECB_EXAM_DT";
		sql += " AND A.EEA_EXAM_SQ=G.ECB_EXAM_SQ";
		sql += " AND EEA_BAST_CD > '0' LEFT OUTER JOIN ET_CANCER_CRVC H";
		sql += " ON A.EEA_EXAM_DT = H.ECV_EXAM_DT";
		sql += " AND A.EEA_EXAM_SQ=H.ECV_EXAM_SQ";
		sql += " AND EEA_UTER_CD > '0' LEFT OUTER JOIN ET_CANCER_LUNG J";
		sql += " ON A.EEA_EXAM_DT = J.ECG_EXAM_DT";
		sql += " AND A.EEA_EXAM_SQ=J.ECG_EXAM_SQ";
		sql += " AND EEA_LUNG_CD > '0' LEFT OUTER JOIN ET_CANCER_HEADER I";
		sql += " ON A.EEA_EXAM_DT = I.ECH_EXAM_DT";
		sql += " AND A.EEA_EXAM_SQ=I.ECH_EXAM_SQ";
		sql += " WHERE EEA_EXAM_DT BETWEEN '" + DTEFROMDT + "'";
		sql += " AND '" + DTETODT + "'";
		sql += " AND EEA_MNGT_HTYR = '" + CMBCHUNGYYYY + "'";
		sql += " AND EEA_ORDER_YN <> 'C'";
		sql += " AND NVL(EEA_RECE_NO, ' ') <> 'R' ";

     	sql += SSQL_ADD1;

		sql += " ) AAA LEFT OUTER JOIN (";
		sql += "	SELECT EEI_EXAM_DT,EEI_EXAM_SQ,SUM(CHALL_PR) CHALL_PR, SUM(CHSTOMA_PR) CHSTOMA_PR, SUM(CHCOLON_PR) CHCOLON_PR, SUM(CHLIVER_PR) CHLIVER_PR, SUM(CHBAST_PR) CHBAST_PR, SUM(CHUTER_PR) CHUTER_PR, SUM(CHLUNG_PR) CHLUNG_PR";
		sql += " 	FROM (";
		sql += "		SELECT EEI_EXAM_DT,EEI_EXAM_SQ,EEA_HTSB_YN, EEI_CAN_KD, EEA_CANAD_KD";
		sql += "		,CASE EEA_HTSB_YN WHEN 'Y' THEN SUM(EEI_HTSB_PR) ELSE SUM(EEI_FST_PR) END CHALL_PR";
		sql += "		,CASE WHEN SUBSTR(EEA_CANAD_KD,1,1) = '" + SCANAD_KD + "' AND EEI_CAN_KD = '1' THEN CASE EEA_HTSB_YN WHEN 'Y' THEN SUM(EEI_HTSB_PR) ELSE SUM(EEI_FST_PR) END ELSE 0 END CHSTOMA_PR";
		sql += "		,CASE WHEN SUBSTR(EEA_CANAD_KD,2,1) = '" + SCANAD_KD + "' AND EEI_CAN_KD = '2' THEN CASE EEA_HTSB_YN WHEN 'Y' THEN SUM(EEI_HTSB_PR) ELSE SUM(EEI_FST_PR) END ELSE 0 END CHCOLON_PR";
		sql += "		,CASE WHEN SUBSTR(EEA_CANAD_KD,3,1) = '" + SCANAD_KD + "' AND EEI_CAN_KD = '3' THEN CASE EEA_HTSB_YN WHEN 'Y' THEN SUM(EEI_HTSB_PR) ELSE SUM(EEI_FST_PR) END ELSE 0 END CHLIVER_PR";
		sql += "		,CASE WHEN SUBSTR(EEA_CANAD_KD,4,1) = '" + SCANAD_KD + "' AND EEI_CAN_KD = '4' THEN CASE EEA_HTSB_YN WHEN 'Y' THEN SUM(EEI_HTSB_PR) ELSE SUM(EEI_FST_PR) END ELSE 0 END CHBAST_PR";
		sql += "		,CASE WHEN SUBSTR(EEA_CANAD_KD,5,1) = '" + SCANAD_KD + "' AND EEI_CAN_KD = '5' THEN CASE EEA_HTSB_YN WHEN 'Y' THEN SUM(EEI_HTSB_PR) ELSE SUM(EEI_FST_PR) END ELSE 0 END CHUTER_PR";
		sql += "		,CASE WHEN SUBSTR(EEA_CANAD_KD,6,1) = '" + SCANAD_KD + "' AND EEI_CAN_KD = '6' THEN CASE EEA_HTSB_YN WHEN 'Y' THEN SUM(EEI_HTSB_PR) ELSE SUM(EEI_FST_PR) END ELSE 0 END CHLUNG_PR";
		sql += " 		FROM ET_EXAM_ACPT A LEFT OUTER JOIN ET_EXAM_ITEM B";
		sql += " 		ON A.EEA_EXAM_DT = B.EEI_EXAM_DT";
		sql += " 		AND A.EEA_EXAM_SQ = B.EEI_EXAM_SQ";

		sql += "		LEFT OUTER JOIN ET_CANCER_HEADER I";
		sql += " 		ON A.EEA_EXAM_DT = I.ECH_EXAM_DT";
		sql += " 		AND A.EEA_EXAM_SQ=I.ECH_EXAM_SQ";

		sql += " 		WHERE EEA_EXAM_DT BETWEEN '" + DTEFROMDT + "'";
		sql += " 		AND '" + DTETODT + "'";
		sql += " 		AND EEI_CAN_KD <> '0'";
		sql += " 		AND EEA_MNGT_HTYR = '" + CMBCHUNGYYYY + "'";
		sql += " 		AND EEA_ORDER_YN <> 'C'";
		sql += " 		AND NVL(EEA_RECE_NO, ' ') <> 'R' ";

     	sql += SSQL_ADD2;

		sql += " 		GROUP BY EEI_EXAM_DT,EEI_EXAM_SQ,EEA_HTSB_YN ,EEI_CAN_KD, EEA_CANAD_KD";
		sql += "	) A2";
		sql += " 	GROUP BY EEI_EXAM_DT,EEI_EXAM_SQ";
		sql += ") EEI";
		sql += " ON AAA.EEA_EXAM_DT = EEI.EEI_EXAM_DT";
		sql += " AND AAA.EEA_EXAM_SQ = EEI.EEI_EXAM_SQ";
		sql += " WHERE (CHSTOMA + CHCOLON + CHLIVER + CHBAST + CHUTER + CHLUNG) > 0";

		if(SSQL_ADD3.equals("")){
			sql += " order by EEA_EXAM_DT,  EEA_PSNL_NM ";
		} else {
			sql += SSQL_ADD3;
		}

			//
			G_INFO += "<!-- \n";
			G_INFO += "서비스명 : uChungVerif2020_uDP_CancerSelect_2020_001 \n";
			G_INFO += "설명 : 암검진 성적확인 내역 조회 \n";
			G_INFO += "\n\n";

			G_INFO += "전달인자 : \n";
			G_INFO += " SCANAD_KD : " + SCANAD_KD + " \n";
			G_INFO += " G_ENCRT_KD : " + G_ENCRT_KD + " \n";
			G_INFO += " DTEFROMDT : " + DTEFROMDT + " \n";
			G_INFO += " DTETODT : " + DTETODT + " \n";
			G_INFO += " CMBCHUNGYYYY : " + CMBCHUNGYYYY + " \n";
			G_INFO += " SSQL_ADD1 : " + SSQL_ADD1 + " \n";
			G_INFO += " SSQL_ADD2 : " + SSQL_ADD2 + " \n";
			G_INFO += " SSQL_ADD3 : " + SSQL_ADD3 + " \n";
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
			} else if (rsmd.getColumnTypeName(colCnt).equals("DATE")){  //why doesn't working?
				//<s:datatype dt:type='dateTime' rs:dbtype='timestamp' dt:maxLength='16' rs:scale='0' rs:precision='19' rs:fixedlength='true'/>
				dataType = "dateTime";
				maxLength = "20";
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

				if (rsmd.getColumnTypeName(colCnt).equals("BLOB")){
					byte[] buf_BLOB = rsList.getBytes(rsmd.getColumnName(colCnt));
					if(buf_BLOB != null) {
						tempData = new String(buf_BLOB);
					}
				}

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
