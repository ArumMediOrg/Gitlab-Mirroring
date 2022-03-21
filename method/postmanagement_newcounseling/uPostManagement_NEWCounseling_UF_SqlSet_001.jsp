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

		String G_ENCRT_KD = htMethod.get("G_ENCRT_KD");
		String IT_CUSTOMERQRYREPLACE = htMethod.get("IT_CUSTOMERQRYREPLACE");
		String CMBSP_GUBN = htMethod.get("CMBSP_GUBN");
		String SEDT_YEAR = htMethod.get("SEDT_YEAR");
		String DTEDTEXAM_SDT = htMethod.get("DTEDTEXAM_SDT");
		String DTEDTEXAM_EDT = htMethod.get("DTEDTEXAM_EDT");
		String DTEDTADVI_DT = htMethod.get("DTEDTADVI_DT");
		String DTEDTNEXT_DT = htMethod.get("DTEDTNEXT_DT");
		String MSKEDTCOMP_CD1 = htMethod.get("MSKEDTCOMP_CD1");
		String CHKBOXMAIN = htMethod.get("CHKBOXMAIN");
		String MSKEDTCOMP_CD2 = htMethod.get("MSKEDTCOMP_CD2");
		String EDTEEA_CHART_NO = htMethod.get("EDTEEA_CHART_NO");
		String EDTPSNL_NM = htMethod.get("EDTPSNL_NM");
		String CMBBOXPLCE_CD = htMethod.get("CMBBOXPLCE_CD");
		String CMBADVICE_CD = htMethod.get("CMBADVICE_CD");
		String CMBADVICE_YN = htMethod.get("CMBADVICE_YN");
		String CMBBOXSORT = htMethod.get("CMBBOXSORT");
		String SSQLWHERE = htMethod.get("SSQLWHERE");

		//
		if(G_ENCRT_KD == null) { G_ENCRT_KD = ""; }
		if(IT_CUSTOMERQRYREPLACE == null) { IT_CUSTOMERQRYREPLACE = ""; }
		if(CMBSP_GUBN == null) { CMBSP_GUBN = ""; }
		if(SEDT_YEAR == null) { SEDT_YEAR = ""; }
		if(DTEDTEXAM_SDT == null) { DTEDTEXAM_SDT = ""; }
		if(DTEDTEXAM_EDT == null) { DTEDTEXAM_EDT = ""; }
		if(DTEDTADVI_DT == null) { DTEDTADVI_DT = ""; }
		if(DTEDTNEXT_DT == null) { DTEDTNEXT_DT = ""; }
		if(MSKEDTCOMP_CD1 == null) { MSKEDTCOMP_CD1 = ""; }
		if(CHKBOXMAIN == null) { CHKBOXMAIN = ""; }
		if(MSKEDTCOMP_CD2 == null) { MSKEDTCOMP_CD2 = ""; }
		if(EDTEEA_CHART_NO == null) { EDTEEA_CHART_NO = ""; }
		if(EDTPSNL_NM == null) { EDTPSNL_NM = ""; }
		if(CMBBOXPLCE_CD == null) { CMBBOXPLCE_CD = ""; }
		if(CMBADVICE_CD == null) { CMBADVICE_CD = ""; }
		if(CMBADVICE_YN == null) { CMBADVICE_YN = ""; }
		if(CMBBOXSORT == null) { CMBBOXSORT = ""; }
		if(SSQLWHERE == null) { SSQLWHERE = ""; }

		// DB객체
		stmtList = connect.createStatement();


		if(G_ENCRT_KD.equals("1")) {
			sql = " SELECT B.ICR_PID_EN AS EEA_PSNL_ID,";
		}
		else if(G_ENCRT_KD.equals("2")) {
			sql = " SELECT ECL_DECRYPT(B.ICR_PID_EN) EEA_PSNL_ID,";
		}
		else {
			sql = " SELECT B.ICR_PENL_ID EEA_PSNL_ID,";
		}

		sql += " A.EEA_EXAM_DT, A.EEA_EXAM_SQ, A.EEA_CHART_NO, A.EEA_PSNL_NM, B.ICR_PENL_ID, A.EEA_DEPT_NM, CASE WHEN SUBSTR(A.EEA_PLCE_CD,1,1) = '1' THEN '내원' ELSE '출장' END EEA_PLCE_NM, G.SAE_ADVI_DT, G.SAE_ADVI_SQ, G.SAE_NEXT_DT, G.SAE_ADVI_TX, GETCOMMON_LVCDTONM('0427',G.SAE_ADVI_CD,'5',1) SAE_ADVI_NM, F_USER_FIND(G.SAE_NURSE_ID) SAE_NURSE_NM, F_USER_FIND(G.SAE_DOCT_ID) SAE_DOCT_NM, CASE WHEN G.SAE_ADVI_DT IS NULL THEN 'N' ELSE 'Y' END SAE_ADVI_YN, A.EEA_EXAM_CD, A.EEA_HTSB_CD, A.EEA_SPSB_CD, A.EEA_SPCL_CD, A.EEA_MNGT_SPYM, CASE WHEN H.PFP_PANRETR2 = '1' THEN 'R2' WHEN H.PFP_PANRETRD = '1' THEN 'RD' WHEN H.PFP_PANRETR1 = '1' THEN 'R1' WHEN H.PFP_PANRETB = '1' THEN 'B' WHEN H.PFP_PANRETA = '1' THEN 'A' ELSE '' END PFP_PANRET, H.PFP_RESULTB_1, H.PFP_RESULTB_2, H.PFP_RESULTB_3, H.PFP_RESULTB_4, H.PFP_RESULTB_5, H.PFP_RESULTB_6, H.PFP_RESULTB_7, H.PFP_RESULTB_8, H.PFP_RESULTB_9, CASE WHEN H.PFP_RESULTB_10 = '1' THEN '혈색소과다' WHEN H.PFP_RESULTB_10 = '2' THEN '저체중' WHEN H.PFP_RESULTB_10 = '3' THEN '난청' WHEN H.PFP_RESULTB_10 = '4' THEN '시력저하' WHEN H.PFP_RESULTB_10 = '5' THEN '기타' ELSE '' END PFP_RESULTB_10, H.PFP_RESULTR1_1, H.PFP_RESULTR1_2, H.PFP_RESULTR1_3, H.PFP_RESULTR1_4, H.PFP_RESULTR1_5, H.PFP_RESULTR1_6, H.PFP_RESULTR1_7, H.PFP_RESULTR1_8, H.PFP_RESULT8_ETC, H.PFP_RESULTR1_9, H.PFP_RESULTR1_10, H.PFP_RESULTR2_1, H.PFP_RESULTR2_2, H.PFP_RESULTRD_1, H.PFP_RESULTRD_2, H.PFP_RESULTRD_3, H.PFP_RESULTRD_4, H.PFP_BVIEW, H.PFP_RVIEW, H.PFP_SEDPLIST, CASE WHEN K.ECS_RSLT_KD = '1' THEN '이상소견없음' WHEN K.ECS_RSLT_KD = '2' THEN '양성질환' WHEN K.ECS_RSLT_KD = '3' THEN '위암 의심' WHEN K.ECS_RSLT_KD = '4' THEN '위암' WHEN K.ECS_RSLT_KD = '5' THEN '기타' ELSE '' END ECS_RSLT_KD, ECS_RSLT_EX, CASE WHEN L.ECC_RSLT_KD = '1' THEN '이상소견없음' WHEN L.ECC_RSLT_KD = '2' THEN '양성질환' WHEN L.ECC_RSLT_KD = '3' THEN '대장암 의심' WHEN L.ECC_RSLT_KD = '4' THEN '대장암' WHEN L.ECC_RSLT_KD = '5' THEN '기타' WHEN L.ECC_RSLT_KD = '6' THEN '음성(분변잠혈)' WHEN L.ECC_RSLT_KD = '7' THEN '양성(분변잠혈)' ELSE '' END ECC_RSLT_KD, ECC_RSLT_EX, CASE WHEN M.ECL_RSLT_KD = '1' THEN '이상소견없음' WHEN M.ECL_RSLT_KD = '2' THEN '양성질환' WHEN M.ECL_RSLT_KD = '3' THEN '간암 의심' WHEN M.ECL_RSLT_KD = '4' THEN '기타' ELSE '' END ECL_RSLT_KD, ECL_RSLT_EX, CASE WHEN N.ECB_RSLT_KD = '1' THEN '이상소견없음' WHEN N.ECB_RSLT_KD = '2' THEN '양성질환' WHEN N.ECB_RSLT_KD = '3' THEN '유방암 의심' WHEN N.ECB_RSLT_KD = '4' THEN '판정유보' ELSE '' END ECB_RSLT_KD, ECB_RSLT_EX, CASE WHEN O.ECV_RSLT_KD = '1' THEN '이상소견없음' WHEN O.ECV_RSLT_KD = '2' THEN '염증성 또는 감염성 질환' WHEN O.ECV_RSLT_KD = '3' THEN '상피세포 이상' WHEN O.ECV_RSLT_KD = '4' THEN '자궁경부암 의심' WHEN O.ECV_RSLT_KD = '5' THEN '기타' ELSE '' END ECV_RSLT_KD, ECV_RSLT_EX, E.SPG_MATT_SQ, F.CSM_MATT_NM, E.SPG_SWING_CD, GETSP_COMMON_CDTONM('HM05D',E.SPG_ORGA_CD) SPG_ORGA_NM, GETSP_COMMON_CDTONM('HM05E',E.SPG_PANJ_CD) SPG_PANJ_NM, E.SPG_SOKY_NM, GETSP_COMMON_CDTONM('HM05A',E.SPG_POSM1_CD) SPG_POSM1_NM,E.SPG_POSM1_TX, E.SPG_POSM1_DT, GETSP_COMMON_CDTONM('HM05A',E.SPG_POSM2_CD) SPG_POSM2_NM,E.SPG_POSM2_TX, E.SPG_POSM2_DT, GETSP_COMMON_CDTONM('HM05A',E.SPG_POSM3_CD) SPG_POSM3_NM,E.SPG_POSM3_TX, E.SPG_POSM3_DT, GETSP_COMMON_CDTONM('HM05B',E.SPG_BUSI_CD) SPG_BUSI_NM, CASE WHEN A.EEA_SEX_CD IS NULL";
		sql += " OR A.EEA_SEX_CD = '' THEN A.EEA_SEX_CD ELSE GETCOMMON_LVCDTONM('0411',A.EEA_SEX_CD ,'5',1) END EEA_SEX_NM, CASE WHEN A.EEA_SPCL_CD IS NULL";
		sql += " OR A.EEA_SPCL_CD = '' THEN A.EEA_SPCL_CD ELSE GETCOMMON_LVCDTONM('0910',A.EEA_SPCL_CD,'5',2) END EEA_SPCL_NM, CASE WHEN A.EEA_EXAM_CD = '41001'";
		sql += " OR A.EEA_SPSB_YN = 'Y' THEN '1' ELSE '2' END EEA_TKGM_CHA, D.SBE_TPAN_NM, CASE WHEN J.PLP_JLPN_DSCD = '0SH' THEN '기타질환' WHEN J.PLP_JLPN_DSCD = '1SH' THEN '폐결핵/흉부' WHEN J.PLP_JLPN_DSCD = '2SH' THEN '고혈압' WHEN J.PLP_JLPN_DSCD = '3SH' THEN '당뇨' WHEN J.PLP_JLPN_DSCD = '4SH' THEN '이상지질혈' WHEN J.PLP_JLPN_DSCD = '5SH' THEN '빈혈' WHEN J.PLP_JLPN_DSCD = '6SH' THEN '청력' WHEN J.PLP_JLPN_DSCD = '7SH' THEN '간장질환' WHEN J.PLP_JLPN_DSCD = '8SH' THEN '신장질환' WHEN J.PLP_JLPN_DSCD = '9SH' THEN '비만' ELSE '' END PLP_JLPN_DSCD, J.PLP_JLPN_PNCD, CASE WHEN J.PLP_JLPN_SH01 = '1' THEN '건강상담' WHEN J.PLP_JLPN_SH01 = '2' THEN '보호구지급 및 착용지도' WHEN J.PLP_JLPN_SH01 = '3' THEN '추적검사검사항목에 대하여 추적검사가 필요' WHEN J.PLP_JLPN_SH01 = '4' THEN '근무중에 대하여 치료' WHEN J.PLP_JLPN_SH01 = '5' THEN '근로시간 단축' WHEN J.PLP_JLPN_SH01 = '6' THEN '작업전환' WHEN J.PLP_JLPN_SH01 = '7' THEN '근로제한 및 금지' WHEN J.PLP_JLPN_SH01 = '8' THEN '산재요양신청서 직접 작성 등 당해 근로자에 대한 직업병확진의뢰 안내' WHEN J.PLP_JLPN_SH01 = '9' THEN '기타' ELSE '' END PLP_JLPN_SH01, CASE WHEN J.PLP_JLPN_SH02 = '1' THEN '건강상담' WHEN J.PLP_JLPN_SH02 = '2' THEN '보호구지급 및 착용지도' WHEN J.PLP_JLPN_SH02 = '3' THEN '추적검사검사항목에 대하여 추적검사가 필요' WHEN J.PLP_JLPN_SH02 = '4' THEN '근무중에 대하여 치료' WHEN J.PLP_JLPN_SH02 = '5' THEN '근로시간 단축' WHEN J.PLP_JLPN_SH02 = '6' THEN '작업전환' WHEN J.PLP_JLPN_SH02 = '7' THEN '근로제한 및 금지' WHEN J.PLP_JLPN_SH02 = '8' THEN '산재요양신청서 직접 작성 등 당해 근로자에 대한 직업병확진의뢰 안내' WHEN J.PLP_JLPN_SH02 = '9' THEN '기타' ELSE '' END PLP_JLPN_SH02, CASE WHEN J.PLP_JLPN_SH03 = '1' THEN '건강상담' WHEN J.PLP_JLPN_SH03 = '2' THEN '보호구지급 및 착용지도' WHEN J.PLP_JLPN_SH03 = '3' THEN '추적검사검사항목에 대하여 추적검사가 필요' WHEN J.PLP_JLPN_SH03 = '4' THEN '근무중에 대하여 치료' WHEN J.PLP_JLPN_SH03 = '5' THEN '근로시간 단축' WHEN J.PLP_JLPN_SH03 = '6' THEN '작업전환' WHEN J.PLP_JLPN_SH03 = '7' THEN '근로제한 및 금지' WHEN J.PLP_JLPN_SH03 = '8' THEN '산재요양신청서 직접 작성 등 당해 근로자에 대한 직업병확진의뢰 안내' WHEN J.PLP_JLPN_SH03 = '9' THEN '기타' ELSE '' END PLP_JLPN_SH03, J.PLP_JLPN_SHDS, J.PLP_JLPN_DOCV, J.PLP_ETC_EX, A.EEA_COMP_CD, C.ICY_COMP_NM, A.EEA_DEPT_NM EEA_DEPT_NM_CPY, A.EEA_EXAM_CD EEA_EXAM_CD_CPY, A.EEA_TEL_NO, A.EEA_MOBL_NO, A.EEA_PLCE_CD, E.SPG_PANJ_DT, E.SPG_DOCT_CD, J.PLP_JLPN_TTPN, F_DOCTOR_FIND(1,E.SPG_DOCT_CD) SPG_DOCT_NM, A.EEA_DIVI_NO, A.EEA_STOMA_CD, A.EEA_COLON_CD, A.EEA_LIVER_CD, A.EEA_BAST_CD, A.EEA_UTER_CD, P.SSV_VIEW_EX";
		sql += " FROM ET_EXAM_ACPT A INNER JOIN " + IT_CUSTOMERQRYREPLACE + " B";
		sql += " ON A.EEA_CUST_NO = B.ICR_CUST_NO LEFT OUTER JOIN IT_COMPANY C";
		sql += " ON A.EEA_COMP_CD = C.ICY_COMP_CD LEFT OUTER JOIN ST_BASE D";
		sql += " ON A.EEA_EXAM_DT = D.SBE_EXAM_DT";
		sql += " AND A.EEA_EXAM_SQ = D.SBE_EXAM_SQ";
		sql += " AND D.SBE_PANJ_YN = 'Y' LEFT OUTER JOIN ST_PANJUNG E";
		sql += " ON A.EEA_EXAM_DT = E.SPG_EXAM_DT";
		sql += " AND A.EEA_EXAM_SQ = E.SPG_EXAM_SQ LEFT OUTER JOIN PT_FIR_PANJUNG H";
		sql += " ON A.EEA_EXAM_DT = H.PFP_EXAM_DT";
		sql += " AND A.EEA_EXAM_SQ = H.PFP_EXAM_SQ LEFT OUTER JOIN PT_SED_PANJUNG I";
		sql += " ON A.EEA_EXAM_DT = I.PSP_EXAM_DT";
		sql += " AND A.EEA_EXAM_SQ = I.PSP_EXAM_SQ LEFT OUTER JOIN CT_SP_MATTER F";
		sql += " ON E.SPG_MATT_CD = F.CSM_MATT_CD LEFT OUTER JOIN ST_ADVICE G";
		sql += " ON A.EEA_EXAM_DT = G.SAE_EXAM_DT";
		sql += " AND A.EEA_EXAM_SQ = G.SAE_EXAM_SQ LEFT OUTER JOIN PT_LABOR_PANJUNG J";
		sql += " ON A.EEA_EXAM_DT = J.PLP_EXAM_DT";
		sql += " AND A.EEA_EXAM_SQ = J.PLP_EXAM_SQ";
		sql += " AND J.PLP_JLPN_PNCD <> 'A' LEFT OUTER JOIN ET_CANCER_STMC K";
		sql += " ON A.EEA_EXAM_DT = K.ECS_EXAM_DT";
		sql += " AND A.EEA_EXAM_SQ = K.ECS_EXAM_SQ LEFT OUTER JOIN ET_CANCER_COLO L";
		sql += " ON A.EEA_EXAM_DT = L.ECC_EXAM_DT";
		sql += " AND A.EEA_EXAM_SQ = L.ECC_EXAM_SQ LEFT OUTER JOIN ET_CANCER_LIVER M";
		sql += " ON A.EEA_EXAM_DT = M.ECL_EXAM_DT";
		sql += " AND A.EEA_EXAM_SQ = M.ECL_EXAM_SQ LEFT OUTER JOIN ET_CANCER_BRST N";
		sql += " ON A.EEA_EXAM_DT = N.ECB_EXAM_DT";
		sql += " AND A.EEA_EXAM_SQ = N.ECB_EXAM_SQ LEFT OUTER JOIN ET_CANCER_CRVC O";
		sql += " ON A.EEA_EXAM_DT = O.ECV_EXAM_DT";
		sql += " AND A.EEA_EXAM_SQ = O.ECV_EXAM_SQ LEFT OUTER JOIN ST_SYTH_VIEW P";
		sql += " ON A.EEA_EXAM_DT = P.SSV_EXAM_DT";
		sql += " AND A.EEA_EXAM_SQ = P.SSV_EXAM_SQ";
		sql += " WHERE 0=0";

		if(CMBSP_GUBN.equals("3")) {
			sql += " AND SUBSTR(EEA_EXAM_CD,1,1) = '2'";
		}
		else if(CMBSP_GUBN.equals("0")) {
			sql += " AND ((SUBSTR(A.EEA_MNGT_HTYR,1,4) = '" + SEDT_YEAR + "')";
			sql += " OR (A.EEA_STOMA_CD <> '0')";
			sql += " OR (A.EEA_COLON_CD <> '0')";
			sql += " OR (A.EEA_LIVER_CD <> '0')";
			sql += " OR (A.EEA_BAST_CD <> '0')";
			sql += " OR (A.EEA_UTER_CD <> '0'))";
		}
		else if(CMBSP_GUBN.equals("1")) {
			sql += " AND ((SUBSTR(A.EEA_MNGT_SPYM,1,4) = '" + SEDT_YEAR + "')";
			sql += " OR (A.EEA_STOMA_CD <> '0')";
			sql += " OR (A.EEA_COLON_CD <> '0')";
			sql += " OR (A.EEA_LIVER_CD <> '0')";
			sql += " OR (A.EEA_BAST_CD <> '0')";
			sql += " OR (A.EEA_UTER_CD <> '0')";
			sql += " OR (SUBSTR(A.EEA_MNGT_HTYR,1,4) = '" + SEDT_YEAR + "'))";
		}
		else if(CMBSP_GUBN.equals("2")) {
			sql += " AND ((SUBSTR(A.EEA_MNGT_SPYM,1,4) = '" + SEDT_YEAR + "')";
			sql += " OR (SUBSTR(A.EEA_MNGT_HTYR,1,4) = '" + SEDT_YEAR + "'))";
		}
		else if(CMBSP_GUBN.equals("4")) {
			;
		}

		sql += " AND A.EEA_EXAM_DT >= '" + DTEDTEXAM_SDT + "'";
		sql += " AND A.EEA_EXAM_DT <= '" + DTEDTEXAM_EDT + "'";
		sql += " AND A.EEA_ORDER_YN <> 'C'";

		if(!DTEDTADVI_DT.equals("")) {
			sql += " AND G.SAE_ADVI_DT = '" + DTEDTADVI_DT + "'";
		}

		if(!DTEDTNEXT_DT.equals("")) {
			sql += " AND G.SAE_NEXT_DT = '" + DTEDTNEXT_DT + "'";
		}

		if(!MSKEDTCOMP_CD1.equals("")) {
			if(CHKBOXMAIN.equals("1")) {
				sql += " AND A.EEA_COMP_CD IN '" + MSKEDTCOMP_CD2 + "'";
			}
			else {
				sql += " AND A.EEA_COMP_CD = '" + MSKEDTCOMP_CD2 + "'";
			}
		}

		if(!EDTEEA_CHART_NO.equals("")) {
			sql += " AND A.EEA_CHART_NO = '" + EDTEEA_CHART_NO + "'";
		}

		if(!EDTPSNL_NM.equals("")) {
			sql += " AND A.EEA_PSNL_NM LIKE '%' || '" + EDTPSNL_NM + "' || '%'";
		}

		if(!CMBBOXPLCE_CD.equals("0")) {
			sql += " AND SUBSTR(A.EEA_PLCE_CD,1,1) = '" + CMBBOXPLCE_CD + "'";
		}

		if(!CMBADVICE_CD.equals("0")) {
			sql += " AND G.SAE_ADVI_CD = '" + CMBADVICE_CD + "'";
		}

		if(CMBADVICE_YN.equals("1")) {
			sql += " AND G.SAE_ADVI_CD IS NOT NULL";
		}
		else if(CMBADVICE_YN.equals("2")) {
			sql += " AND G.SAE_ADVI_CD IS NULL";
		}

		if(!SSQLWHERE.equals("")){
			sql += SSQLWHERE;
		}

		if(CMBBOXSORT.equals("0")) {
			sql += " ORDER BY A.EEA_COMP_CD, A.EEA_EXAM_DT, A.EEA_EXAM_SQ";
		}
		else if(CMBBOXSORT.equals("1")) {
			sql += " ORDER BY A.EEA_COMP_CD, A.EEA_DEPT_NM, A.EEA_PSNL_NM";
		}
		else if(CMBBOXSORT.equals("2")) {
			sql += " ORDER BY A.EEA_COMP_CD, EEA_PSNL_ID";
		}
		else if(CMBBOXSORT.equals("3")) {
			sql += " ORDER BY A.EEA_COMP_CD, A.EEA_PSNL_NM";
		}
		else if(CMBBOXSORT.equals("4")) {
			sql += " ORDER BY A.EEA_EXAM_DT, A.EEA_EXAM_SQ";
		}
		else if(CMBBOXSORT.equals("5")) {
			sql += " ORDER BY EEA_PSNL_ID";
		}
		else if(CMBBOXSORT.equals("6")) {
			sql += " ORDER BY A.EEA_PSNL_NM";
		}

			//
			G_INFO += "<!-- \n";
			G_INFO += "서비스명 : uPostManagement_NEWCounseling_UF_SqlSet_001 \n";
			G_INFO += "설명 : 검사결과정보 로딩 \n";
			G_INFO += "\n\n";

			G_INFO += "전달인자 : \n";
			G_INFO += " G_ENCRT_KD : " + G_ENCRT_KD + " \n";
			G_INFO += " IT_CUSTOMERQRYREPLACE : " + IT_CUSTOMERQRYREPLACE + " \n";
			G_INFO += " CMBSP_GUBN : " + CMBSP_GUBN + " \n";
			G_INFO += " SEDT_YEAR : " + SEDT_YEAR + " \n";
			G_INFO += " DTEDTEXAM_SDT : " + DTEDTEXAM_SDT + " \n";
			G_INFO += " DTEDTEXAM_EDT : " + DTEDTEXAM_EDT + " \n";
			G_INFO += " DTEDTADVI_DT : " + DTEDTADVI_DT + " \n";
			G_INFO += " DTEDTNEXT_DT : " + DTEDTNEXT_DT + " \n";
			G_INFO += " MSKEDTCOMP_CD1 : " + MSKEDTCOMP_CD1 + " \n";
			G_INFO += " CHKBOXMAIN : " + CHKBOXMAIN + " \n";
			G_INFO += " MSKEDTCOMP_CD2 : " + MSKEDTCOMP_CD2 + " \n";
			G_INFO += " EDTEEA_CHART_NO : " + EDTEEA_CHART_NO + " \n";
			G_INFO += " EDTPSNL_NM : " + EDTPSNL_NM + " \n";
			G_INFO += " CMBBOXPLCE_CD : " + CMBBOXPLCE_CD + " \n";
			G_INFO += " CMBADVICE_CD : " + CMBADVICE_CD + " \n";
			G_INFO += " CMBADVICE_YN : " + CMBADVICE_YN + " \n";
			G_INFO += " CMBBOXSORT : " + CMBBOXSORT + " \n";
			G_INFO += " SSQLWHERE : " + SSQLWHERE + " \n";
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
