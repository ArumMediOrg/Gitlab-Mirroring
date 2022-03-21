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

		String AREXAMNM1 = htMethod.get("AREXAMNM1");
		String AREXAMNM2 = htMethod.get("AREXAMNM2");
		String AREXAMNM3 = htMethod.get("AREXAMNM3");
		String AREXAMNM4 = htMethod.get("AREXAMNM4");
		String AREXAMNM5 = htMethod.get("AREXAMNM5");
		String AREXAMNM6 = htMethod.get("AREXAMNM6");
		String AREXAMNM7 = htMethod.get("AREXAMNM7");
		String AREXAMNM8 = htMethod.get("AREXAMNM8");
		String AREXAMNM9 = htMethod.get("AREXAMNM9");
		String AREXAMNM10 = htMethod.get("AREXAMNM10");
		String AREXAMNM11 = htMethod.get("AREXAMNM11");
		String AREXAMNM12 = htMethod.get("AREXAMNM12");
		String AREXAMNM13 = htMethod.get("AREXAMNM13");
		String AREXAMNM14 = htMethod.get("AREXAMNM14");
		String AREXAMNM15 = htMethod.get("AREXAMNM15");
		String AREXAMNM16 = htMethod.get("AREXAMNM16");
		String AREXAMNM17 = htMethod.get("AREXAMNM17");
		String AREXAMNM18 = htMethod.get("AREXAMNM18");
		String AREXAMNM19 = htMethod.get("AREXAMNM19");
		String AREXAMNM20 = htMethod.get("AREXAMNM20");
		String AREXAMNM21 = htMethod.get("AREXAMNM21");
		String DP_FROMDT = htMethod.get("DP_FROMDT");
		String DP_TODT = htMethod.get("DP_TODT");
		String RZ_CMBPLE1 = htMethod.get("RZ_CMBPLE1");
		String RZ_CMBPLE2 = htMethod.get("RZ_CMBPLE2");
		String DISC_KD = htMethod.get("DISC_KD");

		//
		if(AREXAMNM1 == null) { AREXAMNM1 = ""; }
		if(AREXAMNM2 == null) { AREXAMNM2 = ""; }
		if(AREXAMNM3 == null) { AREXAMNM3 = ""; }
		if(AREXAMNM4 == null) { AREXAMNM4 = ""; }
		if(AREXAMNM5 == null) { AREXAMNM5 = ""; }
		if(AREXAMNM6 == null) { AREXAMNM6 = ""; }
		if(AREXAMNM7 == null) { AREXAMNM7 = ""; }
		if(AREXAMNM8 == null) { AREXAMNM8 = ""; }
		if(AREXAMNM9 == null) { AREXAMNM9 = ""; }
		if(AREXAMNM10 == null) { AREXAMNM10 = ""; }
		if(AREXAMNM11 == null) { AREXAMNM11 = ""; }
		if(AREXAMNM12 == null) { AREXAMNM12 = ""; }
		if(AREXAMNM13 == null) { AREXAMNM13 = ""; }
		if(AREXAMNM14 == null) { AREXAMNM14 = ""; }
		if(AREXAMNM15 == null) { AREXAMNM15 = ""; }
		if(AREXAMNM16 == null) { AREXAMNM16 = ""; }
		if(AREXAMNM17 == null) { AREXAMNM17 = ""; }
		if(AREXAMNM18 == null) { AREXAMNM18 = ""; }
		if(AREXAMNM19 == null) { AREXAMNM19 = ""; }
		if(AREXAMNM20 == null) { AREXAMNM20 = ""; }
		if(AREXAMNM21 == null) { AREXAMNM21 = ""; }
		if(DP_FROMDT == null) { DP_FROMDT = ""; }
		if(DP_TODT == null) { DP_TODT = ""; }
		if(RZ_CMBPLE1 == null) { RZ_CMBPLE1 = ""; }
		if(RZ_CMBPLE2 == null) { RZ_CMBPLE2 = ""; }
		if(DISC_KD == null) { DISC_KD = ""; }

		// DB객체
		stmtList = connect.createStatement();


		sql = " SELECT t0.NM2 ,NVL(T1.NEW_INSU,0) NEW_INSU ,NVL(T1.NEW_CNT,0) NEW_CNT ,NVL(T1.NEW_SUM,0) NEW_SUM ,NVL(T1.NEW_HDMD,0) NEW_HDMD ,NVL(T1.NEW_SDMD,0) NEW_SDMD ,NVL(T1.NEW_COMP,0) NEW_COMP ,NVL(T1.NEW_PSNL,0) NEW_PSNL ,NVL(T1.NEW_PSNLP,0) NEW_PSNLP ,NVL(t2.RRM_SALE_TD_PR,0) RRM_SALE_TD_PR ,NVL(t2.RRM_TRUNC_TD_PR,0) RRM_TRUNC_TD_PR ,(NVL(T1.NEW_PSNL,0)- (NVL(t2.RRM_SALE_TD_PR,0)+NVL(t2.RRM_TRUNC_TD_PR,0) + NVL(t2.RRM_RECE_TD_PR,0)) + NVL(t2.RRM_RETURN_PR_71,0) ) DIMISUPR ,NVL(t2.RRM_RESEREPL_PR,0) RRM_RESEREPL_PR ,NVL(t2.RRM_OVERPAY_PR,0) RRM_OVERPAY_PR ,NVL(t2.RRM_RECE_TD_PR ,0) RRM_RECE_TD_PR ,NVL(t2.RRM_RECE_PR_CA,0) RRM_RECE_PR_CA ,NVL(t2.RRM_RECE_PR_ETC,0) RRM_RECE_PR_ETC ,NVL(t2.RRM_RETURN_PR_71,0) RRM_RETURN_PR_71 ,NVL(t2.RRM_RETURN_PR_72,0) RRM_RETURN_PR_72";
		sql += " FROM (";

		sql += "	SELECT '" + AREXAMNM1 + "' NM2, 1 SORT FROM DUAL";
		sql += " 	UNION ALL SELECT '" + AREXAMNM2 + "' NM2, 2 SORT FROM DUAL";
		sql += " 	UNION ALL SELECT '" + AREXAMNM3 + "' NM2, 3 SORT FROM DUAL";
		sql += " 	UNION ALL SELECT '" + AREXAMNM4 + "' NM2, 4 SORT FROM DUAL";
		sql += " 	UNION ALL SELECT '" + AREXAMNM5 + "' NM2, 5 SORT FROM DUAL";
		sql += " 	UNION ALL SELECT '" + AREXAMNM6 + "' NM2, 6 SORT FROM DUAL";
		sql += " 	UNION ALL SELECT '" + AREXAMNM7 + "' NM2, 7 SORT FROM DUAL";
		sql += " 	UNION ALL SELECT '" + AREXAMNM8 + "' NM2, 8 SORT FROM DUAL";
		sql += " 	UNION ALL SELECT '" + AREXAMNM9 + "' NM2, 9 SORT FROM DUAL";
		sql += " 	UNION ALL SELECT '" + AREXAMNM10 + "' NM2, 10 SORT FROM DUAL";
		sql += " 	UNION ALL SELECT '" + AREXAMNM11 + "' NM2, 11 SORT FROM DUAL";
		sql += " 	UNION ALL SELECT '" + AREXAMNM12 + "' NM2, 12 SORT FROM DUAL";
		sql += " 	UNION ALL SELECT '" + AREXAMNM13 + "' NM2, 13 SORT FROM DUAL";
		sql += " 	UNION ALL SELECT '" + AREXAMNM14 + "' NM2, 14 SORT FROM DUAL";
		sql += " 	UNION ALL SELECT '" + AREXAMNM15 + "' NM2, 15 SORT FROM DUAL";
		sql += " 	UNION ALL SELECT '" + AREXAMNM16 + "' NM2, 16 SORT FROM DUAL";
		sql += " 	UNION ALL SELECT '" + AREXAMNM17 + "' NM2, 17 SORT FROM DUAL";
		sql += " 	UNION ALL SELECT '" + AREXAMNM18 + "' NM2, 18 SORT FROM DUAL";
		sql += " 	UNION ALL SELECT '" + AREXAMNM19 + "' NM2, 19 SORT FROM DUAL";
		sql += " 	UNION ALL SELECT '" + AREXAMNM20 + "' NM2, 20 SORT FROM DUAL";
		sql += " 	UNION ALL SELECT '" + AREXAMNM21 + "' NM2, 21 SORT FROM DUAL";
		sql += " ) t0 LEFT OUTER JOIN (";
		sql += "	SELECT NM2, SUM(NEW_INSU) NEW_INSU, SUM(NEW_CNT) NEW_CNT, SUM(NEW_SUM) NEW_SUM, SUM(NEW_HDMD) NEW_HDMD, SUM(NEW_SDMD) NEW_SDMD, SUM(NEW_COMP) NEW_COMP, SUM(NEW_PSNL) NEW_PSNL, SUM(NEW_PSNLP) NEW_PSNLP";
		sql += " 	FROM (";
		sql += "		SELECT CASE WHEN EXAM_CD IN ('11001','12001','12003') THEN '" + AREXAMNM1 + "' WHEN EXAM_CD IN ('11002','12002','12004') THEN '" + AREXAMNM2 + "' WHEN EXAM_CD IN ('13001') THEN '" + AREXAMNM3 + "' WHEN EXAM_CD IN ('15001') THEN '" + AREXAMNM4 + "' WHEN EXAM_CD IN ('14001','14002') THEN '" + AREXAMNM5 + "' WHEN EXAM_CD IN ('21001') THEN '" + AREXAMNM6 + "' WHEN EXAM_CD IN ('51001') THEN '" + AREXAMNM7 + "' WHEN EXAM_CD IN ('61001') THEN '" + AREXAMNM8 + "' WHEN EXAM_CD IN ('32001') THEN '" + AREXAMNM9 + "' WHEN EXAM_CD IN ('31001') THEN '" + AREXAMNM10 + "' WHEN EXAM_CD IN ('31006') THEN '" + AREXAMNM11 + "' WHEN EXAM_CD IN ('91002') THEN '" + AREXAMNM12 + "' WHEN EXAM_CD IN ('91005') THEN '" + AREXAMNM13 + "' WHEN EXAM_CD IN ('91003') THEN '" + AREXAMNM14 + "' WHEN EXAM_CD IN ('91004') THEN '" + AREXAMNM15 + "' WHEN EXAM_CD IN ('91099' ,'91006','91001','81001') THEN '" + AREXAMNM16 + "' WHEN EXAM_CD IN ('41001') THEN '" + AREXAMNM17 + "' WHEN EXAM_CD IN ('42001') THEN '" + AREXAMNM18 + "' WHEN EXAM_CD IN ('71001') THEN '" + AREXAMNM19 + "' WHEN EXAM_CD IN ('91007') THEN '" + AREXAMNM20 + "' ELSE '" + AREXAMNM21 + "' END NM2";
		sql += "		, NEW_INSU, NEW_CNT, NEW_SUM, NEW_HDMD, NEW_SDMD, NEW_COMP, NEW_PSNL, NEW_PSNLP";
		sql += " 		FROM DATA_EXAM_ACPT";
		sql += "	) A";
		sql += " 	GROUP BY NM2";
		sql += ") T1";
		sql += " ON t0.NM2 =T1.NM2";

		sql += " LEFT OUTER JOIN (";
		sql += "	SELECT NM2, SUM(RRM_SALE_TD_PR) RRM_SALE_TD_PR, SUM(RRM_TRUNC_TD_PR) RRM_TRUNC_TD_PR, SUM(RRM_RESEREPL_PR) RRM_RESEREPL_PR, SUM(RRM_OVERPAY_PR) RRM_OVERPAY_PR, SUM(RRM_RECE_TD_PR) RRM_RECE_TD_PR, SUM(RRM_RECE_TD_PR_CA) RRM_RECE_PR_CA, SUM(RRM_RECE_TD_PR_ETC) RRM_RECE_PR_ETC, SUM(RRM_RETURN_PR_71) RRM_RETURN_PR_71, SUM(RRM_RETURN_PR_72) RRM_RETURN_PR_72";
		sql += " 	FROM (";
		sql += "		SELECT CASE WHEN RRM_EXAM_CD IN ('11001','12001','12003') THEN '" + AREXAMNM1 + "' WHEN RRM_EXAM_CD IN ('11002','12002','12004') THEN '" + AREXAMNM2 + "' WHEN RRM_EXAM_CD IN ('13001') THEN '" + AREXAMNM3 + "' WHEN RRM_EXAM_CD IN ('15001') THEN '" + AREXAMNM4 + "' WHEN RRM_EXAM_CD IN ('14001','14002') THEN '" + AREXAMNM5 + "' WHEN RRM_EXAM_CD IN ('21001') THEN '" + AREXAMNM6 + "' WHEN RRM_EXAM_CD IN ('51001') THEN '" + AREXAMNM7 + "' WHEN RRM_EXAM_CD IN ('61001') THEN '" + AREXAMNM8 + "' WHEN RRM_EXAM_CD IN ('32001') THEN '" + AREXAMNM9 + "' WHEN RRM_EXAM_CD IN ('31001') THEN '" + AREXAMNM10 + "' WHEN RRM_EXAM_CD IN ('31006') THEN '" + AREXAMNM11 + "' WHEN RRM_EXAM_CD IN ('91002') THEN '" + AREXAMNM12 + "' WHEN RRM_EXAM_CD IN ('91005') THEN '" + AREXAMNM13 + "' WHEN RRM_EXAM_CD IN ('91003') THEN '" + AREXAMNM14 + "' WHEN RRM_EXAM_CD IN ('91004') THEN '" + AREXAMNM15 + "' WHEN RRM_EXAM_CD IN ('91099' ,'91006','91001','81001') THEN '" + AREXAMNM16 + "' WHEN RRM_EXAM_CD IN ('41001') THEN '" + AREXAMNM17 + "' WHEN RRM_EXAM_CD IN ('42001') THEN '" + AREXAMNM18 + "' WHEN RRM_EXAM_CD IN ('71001') THEN '" + AREXAMNM19 + "' WHEN RRM_EXAM_CD IN ('91007') THEN '" + AREXAMNM20 + "' ELSE '" + AREXAMNM21 + "' END NM2";
		sql += "		, SUM(RRM_SALE_TD_PR) RRM_SALE_TD_PR, SUM(RRM_TRUNC_TD_PR) RRM_TRUNC_TD_PR, SUM(RRM_RESEREPL_PR) RRM_RESEREPL_PR, SUM(RRM_OVERPAY_PR) RRM_OVERPAY_PR,SUM(RRM_RECE_TD_PR) RRM_RECE_TD_PR, SUM(RRM_RECE_TD_PR_CA) RRM_RECE_TD_PR_CA, SUM(RRM_RECE_TD_PR_ETC) RRM_RECE_TD_PR_ETC, SUM(RRM_RETURN_PR_71) RRM_RETURN_PR_71, SUM(RRM_RETURN_PR_72) RRM_RETURN_PR_72";
		sql += " 		FROM (";
		sql += "			SELECT RRM_EXAM_CD";
		sql += "			, CASE WHEN RRM_OCCU_KD IN ('20') THEN RRM_SALE_TD_PR ELSE 0 END RRM_SALE_TD_PR";
		sql += "			, CASE WHEN RRM_OCCU_KD IN ('20') THEN RRM_TRUNC_TD_PR ELSE 0 END RRM_TRUNC_TD_PR";
		sql += "			, RRM_RESEREPL_PR ,RRM_OVERPAY_PR ,CASE WHEN RRM_OCCU_KD IN ('20') THEN RRM_RECE_TD_PR ELSE 0 END RRM_RECE_TD_PR";
		sql += "			, CASE WHEN RRM_PAY_KD = '01' THEN RRM_RECE_TD_PR ELSE 0 END RRM_RECE_TD_PR_CA";
		sql += "			, CASE WHEN RRM_PAY_KD = '01' THEN 0 ELSE RRM_RECE_TD_PR END RRM_RECE_TD_PR_ETC";
		sql += "			, CASE WHEN RRM_OCCU_KD IN ('70','71') THEN RRM_RETURN_PR ELSE 0 END RRM_RETURN_PR_71";
		sql += "			, CASE WHEN RRM_OCCU_KD IN ('72') THEN RRM_RETURN_PR ELSE 0 END RRM_RETURN_PR_72";
		sql += " 			FROM RT_RECE_MEDICHK A LEFT OUTER JOIN ET_EXAM_ACPT B";
		sql += " 			ON A.RRM_RECE_NO = B.EEA_RECE_NO";
		sql += " 			WHERE RRM_RECE_DT BETWEEN '" + DP_FROMDT + "' AND '" + DP_TODT + "'";
		sql += " 			AND A.RRM_RECE_NO = B.EEA_RECE_NO";
		sql += " 			AND B.EEA_ORDER_YN <> 'C'";

		if(!RZ_CMBPLE1.equals("0")) {
			if(RZ_CMBPLE2.equals("00")) {
				sql += " AND SUBSTR(EEA_PLCE_CD,1,1) = '" + RZ_CMBPLE1 + "'";
			}
			else {
				sql += " AND EEA_PLCE_CD = '" + RZ_CMBPLE2 + "'";
			}
		}

		sql += " 		) TT";
		sql += " 		GROUP BY RRM_EXAM_CD";

		sql += " UNION ALL";
		sql += " SELECT CASE WHEN EEA_EXAM_CD IN ('11001','12001','12003') THEN '" + AREXAMNM1 + "' ";
		sql += "             WHEN EEA_EXAM_CD IN ('11002','12002','12004') THEN '" + AREXAMNM2 + "' ";
		sql += "             WHEN EEA_EXAM_CD IN ('13001') THEN '" + AREXAMNM3 + "' ";
		sql += "             WHEN EEA_EXAM_CD IN ('15001') THEN '" + AREXAMNM4 + "' ";
		sql += "             WHEN EEA_EXAM_CD IN ('14001','14002') THEN '" + AREXAMNM5 + "' ";
		sql += "             WHEN EEA_EXAM_CD IN ('21001') THEN '" + AREXAMNM6 + "' ";
		sql += "             WHEN EEA_EXAM_CD IN ('51001') THEN '" + AREXAMNM7 + "' ";
		sql += "             WHEN EEA_EXAM_CD IN ('61001') THEN '" + AREXAMNM8 + "' ";
		sql += "             WHEN EEA_EXAM_CD IN ('32001') THEN '" + AREXAMNM9 + "' ";
		sql += "             WHEN EEA_EXAM_CD IN ('31001') THEN '" + AREXAMNM10 + "' ";
		sql += "             WHEN EEA_EXAM_CD IN ('31006') THEN '" + AREXAMNM11 + "' ";
		sql += "             WHEN EEA_EXAM_CD IN ('91002') THEN '" + AREXAMNM12 + "' ";
		sql += "             WHEN EEA_EXAM_CD IN ('91005') THEN '" + AREXAMNM13 + "' ";
		sql += "             WHEN EEA_EXAM_CD IN ('91003') THEN '" + AREXAMNM14 + "' ";
		sql += "             WHEN EEA_EXAM_CD IN ('91004') THEN '" + AREXAMNM15 + "' ";
		sql += "             WHEN EEA_EXAM_CD IN ('91099' ,'91006','91001','81001') THEN '" + AREXAMNM16 + "' ";
		sql += "             WHEN EEA_EXAM_CD IN ('41001') THEN '" + AREXAMNM17 + "' ";
		sql += "             WHEN EEA_EXAM_CD IN ('42001') THEN '" + AREXAMNM18 + "' ";
		sql += "             WHEN EEA_EXAM_CD IN ('71001') THEN '" + AREXAMNM19 + "' ";
		sql += "             WHEN EEA_EXAM_CD IN ('91007') THEN '" + AREXAMNM20 + "' ELSE '" + AREXAMNM21 + "' END NM2, ";

		if(DISC_KD.equals("1")){
			sql += " SUM(NVL(EEP_DISC_PR,0))  RRM_SALE_TD_PR, ";
		} else {
			sql += " SUM(NVL(EEP_DISC_PR,0) + NVL(EEP_DISC_CPR ,0))  RRM_SALE_TD_PR, ";
		}

		sql += "			0 RRM_TRUNC_TD_PR, 0 RRM_RESEREPL_PR, 0 RRM_OVERPAY_PR, 0 RRM_RECE_TD_PR,  0 RRM_RECE_TD_PR_CA, ";
		sql += "			0 RRM_RECE_TD_PR_ETC, 0 RRM_RETURN_PR_71, 0 RRM_RETURN_PR_72 ";
		sql += "			FROM ( ";
		sql += "				SELECT (SELECT EEA_EXAM_CD FROM ET_EXAM_ACPT WHERE EEA_EXAM_DT = EEP_EXAM_DT AND EEA_EXAM_SQ = EEP_EXAM_SQ) EEA_EXAM_CD , ";
		sql += "								(SELECT EEA_PLCE_CD FROM ET_EXAM_ACPT WHERE EEA_EXAM_DT = EEP_EXAM_DT AND EEA_EXAM_SQ = EEP_EXAM_SQ) EEA_PLCE_CD , ";
		sql += "						EEP_DISC_PR,  EEP_DISC_CPR ";
		sql += "						from  ET_EXAM_PRICE ";
		sql += "				where EEP_ORDER_DT between '" + DP_FROMDT + "' AND '" + DP_TODT + "' ";
		sql += "				AND EXISTS (SELECT *  FROM ET_EXAM_ACPT WHERE EEA_EXAM_DT = EEP_EXAM_DT ";
		sql += "															AND EEA_EXAM_SQ = EEP_EXAM_SQ ";
		sql += "															AND  EEA_ORDER_YN <> 'C' ) ";
		sql += "			) tt ";
		sql += "			where  1 = 1 ";
		if(!RZ_CMBPLE1.equals("0")){
			if(!RZ_CMBPLE2.equals("00")){
				sql += " and SUBSTR(EEA_PLCE_CD,1,1) = '" + RZ_CMBPLE1 + "' ";
			} else {
				sql += " and EEA_PLCE_CD = '" + RZ_CMBPLE2 + "' ";
			}
		}

		sql += " 				group by EEA_EXAM_CD ";
		sql += " 		) b  group by NM2 ";
		sql += " 	) t2 on t0.NM2 =t2.NM2 ";
		sql += " order by t0.sort ";

			//
			G_INFO += "<!-- \n";
			G_INFO += "서비스명 : uRT_SellReceDayReport_Up_afLoadSel_001 \n";
			G_INFO += "설명 : 서식정보 로딩 \n";
			G_INFO += "\n\n";

			G_INFO += "전달인자 : \n";
			G_INFO += " AREXAMNM1 : " + AREXAMNM1 + " \n";
			G_INFO += " AREXAMNM2 : " + AREXAMNM2 + " \n";
			G_INFO += " AREXAMNM3 : " + AREXAMNM3 + " \n";
			G_INFO += " AREXAMNM4 : " + AREXAMNM4 + " \n";
			G_INFO += " AREXAMNM5 : " + AREXAMNM5 + " \n";
			G_INFO += " AREXAMNM6 : " + AREXAMNM6 + " \n";
			G_INFO += " AREXAMNM7 : " + AREXAMNM7 + " \n";
			G_INFO += " AREXAMNM8 : " + AREXAMNM8 + " \n";
			G_INFO += " AREXAMNM9 : " + AREXAMNM9 + " \n";
			G_INFO += " AREXAMNM10 : " + AREXAMNM10 + " \n";
			G_INFO += " AREXAMNM11 : " + AREXAMNM11 + " \n";
			G_INFO += " AREXAMNM12 : " + AREXAMNM12 + " \n";
			G_INFO += " AREXAMNM13 : " + AREXAMNM13 + " \n";
			G_INFO += " AREXAMNM14 : " + AREXAMNM14 + " \n";
			G_INFO += " AREXAMNM15 : " + AREXAMNM15 + " \n";
			G_INFO += " AREXAMNM16 : " + AREXAMNM16 + " \n";
			G_INFO += " AREXAMNM17 : " + AREXAMNM17 + " \n";
			G_INFO += " AREXAMNM18 : " + AREXAMNM18 + " \n";
			G_INFO += " AREXAMNM19 : " + AREXAMNM19 + " \n";
			G_INFO += " AREXAMNM20 : " + AREXAMNM20 + " \n";
			G_INFO += " AREXAMNM21 : " + AREXAMNM21 + " \n";
			G_INFO += " DP_FROMDT : " + DP_FROMDT + " \n";
			G_INFO += " DP_TODT : " + DP_TODT + " \n";
			G_INFO += " RZ_CMBPLE1 : " + RZ_CMBPLE1 + " \n";
			G_INFO += " RZ_CMBPLE2 : " + RZ_CMBPLE2 + " \n";
			G_INFO += " DISC_KD : " + DISC_KD + " \n";
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
