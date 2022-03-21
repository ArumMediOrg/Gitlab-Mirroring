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

		String RZ_CHKD = htMethod.get("RZ_CHKD");
		String DP_FROMDT = htMethod.get("DP_FROMDT");
		String DP_TODT = htMethod.get("DP_TODT");
		String COMP_CD = htMethod.get("COMP_CD");
		String CMBBOXPLCE_CD1 = htMethod.get("CMBBOXPLCE_CD1");
		String CMBHLTH_KD = htMethod.get("CMBHLTH_KD");
		String CMBBOXPLCE_CD2 = htMethod.get("CMBBOXPLCE_CD2");
		String CMBSP_GUBN1 = htMethod.get("CMBSP_GUBN1");
		String CMBSP_GUBN2 = htMethod.get("CMBSP_GUBN2");
		String CMBSP_CHA = htMethod.get("CMBSP_CHA");

		//
		if(RZ_CHKD == null) { RZ_CHKD = ""; }
		if(DP_FROMDT == null) { DP_FROMDT = ""; }
		if(DP_TODT == null) { DP_TODT = ""; }
		if(COMP_CD == null) { COMP_CD = ""; }
		if(CMBBOXPLCE_CD1 == null) { CMBBOXPLCE_CD1 = ""; }
		if(CMBHLTH_KD == null) { CMBHLTH_KD = ""; }
		if(CMBBOXPLCE_CD2 == null) { CMBBOXPLCE_CD2 = ""; }
		if(CMBSP_GUBN1 == null) { CMBSP_GUBN1 = ""; }
		if(CMBSP_GUBN2 == null) { CMBSP_GUBN2 = ""; }
		if(CMBSP_CHA == null) { CMBSP_CHA = ""; }

		// DB객체
		stmtList = connect.createStatement();



		if(RZ_CHKD.equals("0")) {
			sql = " SELECT *";
			sql += " FROM ( SELECT EEA_COMP_CD, MIN(EEA_EXAM_CD) EEA_EXAM_CD, ICY_COMP_NM,ICY_ZIP_CD,ICY_ZIP_AR, BJ_NM,CHUNGGB,COUNT (CNT) CNT,SUM(CHUNGAMT) - SUM(EEA_DISC_CPR) CHUNGAMT";
			sql += " FROM ( SELECT A.EEA_COMP_CD, EEA_CUST_NO, EEA_EXAM_CD, MAX(NVL(EEA_DISC_CPR,0)) EEA_DISC_CPR, C.ICY_COMP_NM, C.ICY_ZIP_CD, C.ICY_ZIP_AR || ' ' || ICY_ROAD_AR ICY_ZIP_AR, D.IAU_PENL_NM BJ_NM, '일반' CHUNGGB, 1 CNT, SUM(B.EEP_COMP_PR) CHUNGAMT";
			sql += " FROM ET_EXAM_ACPT A LEFT OUTER JOIN ET_EXAM_PRICE B";
			sql += " ON A.EEA_EXAM_DT = B.EEP_EXAM_DT";
			sql += " AND A.EEA_EXAM_SQ = B.EEP_EXAM_SQ LEFT OUTER JOIN IT_COMPANY C";
			sql += " ON A.EEA_COMP_CD = C.ICY_COMP_CD LEFT OUTER JOIN IT_AUTH_USER D";
			sql += " ON C.ICY_SALE_ID = D.IAU_EMP_NO";
			sql += " WHERE NVL(A.EEA_COMP_CD, ' ') <> ' '";
			sql += " AND EEA_EXAM_DT >= '" + DP_FROMDT + "'";
			sql += " AND EEA_EXAM_DT <= '" + DP_TODT + "'";
			sql += " AND EEA_ORDER_YN <> 'C'";

			if(!COMP_CD.equals("")) {
				sql += " AND EEA_COMP_CD = '" + COMP_CD + "'";
			}

			if(!CMBBOXPLCE_CD1.equals("0")) {
				sql += " AND SUBSTR(EEA_PLCE_CD,1,1) = '" + CMBBOXPLCE_CD2 + "'";
			}

			if(CMBHLTH_KD.equals("1")) {
				sql += " AND CASE WHEN EEA_HTSB_CD IN ('11001', '12001', '12003') THEN SUBSTR(NVL(EEA_HLTH_KD, '1'), 1, 1) ELSE SUBSTR(NVL(EEA_HLTH_KD, '0'), 1, 1) END = '1'";
			}
			else if(CMBHLTH_KD.equals("2")) {
				sql += " AND CASE WHEN EEA_HTSB_CD IN ('11001', '12001', '12003') THEN SUBSTR(NVL(EEA_HLTH_KD, '1'), 1, 1) ELSE SUBSTR(NVL(EEA_HLTH_KD, '0'), 1, 1) END <> '1'";
			}

			sql += " AND EEP_COMP_PR <> 0";
			sql += " AND (EEP_CDMD_DT IS NULL";
			sql += " OR EEP_CDMD_DT='' )";
			sql += " AND EEA_EXAM_CD NOT LIKE '31%'";
			sql += " AND NOT exists (select * from BT_BILL_COMP_LIST T  where A.EEA_EXAM_DT=T.BCL_EXAM_DT and A.EEA_EXAM_SQ=T.BCL_EXAM_SQ and T.BCL_BILL_KD = '31') ";
			sql += " GROUP BY A.EEA_COMP_CD, EEA_EXAM_CD, EEA_CUST_NO, C.ICY_COMP_NM, C.ICY_ZIP_CD, C.ICY_ZIP_AR, C.ICY_ROAD_AR, D.IAU_PENL_NM, B.EEP_CDMD_DT HAVING SUM(B.EEP_COMP_PR) >0 ) FF";
			sql += " GROUP BY EEA_COMP_CD, ICY_COMP_NM,ICY_ZIP_CD,ICY_ZIP_AR,BJ_NM ,CHUNGGB";
			sql += " UNION";
			sql += " ALL SELECT EEA_COMP_CD, MIN(EEA_EXAM_CD) EEA_EXAM_CD, ICY_COMP_NM,ICY_ZIP_CD,ICY_ZIP_AR, BJ_NM,CHUNGGB,SUM(CNT) CNT,SUM(CHUNGAMT) CHUNGAMT";
			sql += " FROM ( SELECT A.EEA_COMP_CD, EEA_CUST_NO, EEA_EXAM_CD, C.ICY_COMP_NM, C.ICY_ZIP_CD, C.ICY_ZIP_AR || ' ' || ICY_ROAD_AR ICY_ZIP_AR, D.IAU_PENL_NM BJ_NM, '특검' CHUNGGB, 1 CNT, SUM(B.EEP_COMPS_PR) CHUNGAMT";
			sql += " FROM ET_EXAM_ACPT A LEFT OUTER JOIN ET_EXAM_PRICE B";
			sql += " ON A.EEA_EXAM_DT = B.EEP_EXAM_DT";
			sql += " AND A.EEA_EXAM_SQ = B.EEP_EXAM_SQ LEFT OUTER JOIN IT_COMPANY C";
			sql += " ON A.EEA_COMP_CD = C.ICY_COMP_CD LEFT OUTER JOIN IT_AUTH_USER D";
			sql += " ON C.ICY_SALE_ID = D.IAU_EMP_NO";
			sql += " WHERE NVL(A.EEA_COMP_CD, ' ') <> ' '";
			sql += " AND EEA_EXAM_DT >= '" + DP_FROMDT + "'";
			sql += " AND EEA_EXAM_DT <= '" + DP_TODT + "'";
			sql += " AND EEA_ORDER_YN <> 'C'";

			if(!COMP_CD.equals("")) {
				sql += " AND EEA_COMP_CD = '" + COMP_CD + "'";
			}

			if(!CMBBOXPLCE_CD1.equals("0")) {
				sql += " AND SUBSTR(EEA_PLCE_CD,1,1) = '" + CMBBOXPLCE_CD2 + "'";
			}

			if(!CMBSP_GUBN1.equals("0")) {
				sql += " AND EEA_SPCL_CD = '" + CMBSP_GUBN2 + "'";
			}

			if(CMBSP_CHA.equals("1")) {
				sql += " AND ((EEA_EXAM_CD = '41001')";
				sql += " OR (EEA_SPSB_CD = '41001'))";
			}
			else if(CMBSP_CHA.equals("2")) {
				sql += " AND ((EEA_EXAM_CD = '42001')";
				sql += " OR (EEA_SPSB_CD = '42001'))";
			}

			if(CMBHLTH_KD.equals("1")) {
				sql += " AND CASE WHEN EEA_HTSB_CD IN ('11001', '12001', '12003') THEN SUBSTR(NVL(EEA_HLTH_KD, '1'), 1, 1) ELSE SUBSTR(NVL(EEA_HLTH_KD, '0'), 1, 1) END = '1'";
			}
			else if(CMBHLTH_KD.equals("2")) {
				sql += " AND CASE WHEN EEA_HTSB_CD IN ('11001', '12001', '12003') THEN SUBSTR(NVL(EEA_HLTH_KD, '1'), 1, 1) ELSE SUBSTR(NVL(EEA_HLTH_KD, '0'), 1, 1) END <> '1'";
			}

			sql += " AND EEP_COMPS_PR <> 0";
			sql += " AND (EEP_CDMDS_DT IS NULL";
			sql += " OR EEP_CDMDS_DT='' )";
			sql += " AND EEA_EXAM_CD NOT LIKE'31%'";
			sql += " AND NOT exists (select * from BT_BILL_COMP_LIST T  where A.EEA_EXAM_DT=T.BCL_EXAM_DT and A.EEA_EXAM_SQ=T.BCL_EXAM_SQ and T.BCL_BILL_KD = '32') ";
			sql += " GROUP BY A.EEA_COMP_CD, EEA_EXAM_CD, A.EEA_EXAM_DT, EEA_CUST_NO, C.ICY_COMP_NM, C.ICY_ZIP_CD, C.ICY_ZIP_AR, C.ICY_ROAD_AR, D.IAU_PENL_NM, B.EEP_CDMDS_DT HAVING SUM(B.EEP_COMPS_PR) >0 ) FF";
			sql += " GROUP BY EEA_COMP_CD, ICY_COMP_NM,ICY_ZIP_CD,ICY_ZIP_AR,BJ_NM,CHUNGGB";
			sql += " UNION";
			sql += " ALL SELECT EEA_COMP_CD, MIN(EEA_EXAM_CD) EEA_EXAM_CD, ICY_COMP_NM,ICY_ZIP_CD,ICY_ZIP_AR, BJ_NM,CHUNGGB, COUNT (CNT) CNT,SUM(CHUNGAMT) CHUNGAMT";
			sql += " FROM ( SELECT A.EEA_COMP_CD, EEA_CUST_NO, EEA_EXAM_CD, C.ICY_COMP_NM, C.ICY_ZIP_CD, C.ICY_ZIP_AR || ' ' || ICY_ROAD_AR ICY_ZIP_AR, D.IAU_PENL_NM BJ_NM, '급여' CHUNGGB, 1 CNT, SUM(B.EEP_PSNLP_PR) CHUNGAMT";
			sql += " FROM ET_EXAM_ACPT A LEFT OUTER JOIN ET_EXAM_PRICE B";
			sql += " ON A.EEA_EXAM_DT = B.EEP_EXAM_DT";
			sql += " AND A.EEA_EXAM_SQ = B.EEP_EXAM_SQ LEFT OUTER JOIN IT_COMPANY C";
			sql += " ON A.EEA_COMP_CD = C.ICY_COMP_CD LEFT OUTER JOIN IT_AUTH_USER D";
			sql += " ON C.ICY_SALE_ID = D.IAU_EMP_NO";
			sql += " WHERE NVL(A.EEA_COMP_CD, ' ') <> ' '";
			sql += " AND EEA_EXAM_DT >= '" + DP_FROMDT + "'";
			sql += " AND EEA_EXAM_DT <= '" + DP_TODT + "'";
			sql += " AND EEA_ORDER_YN <> 'C'";

			if(!COMP_CD.equals("")) {
				sql += " AND EEA_COMP_CD = '" + COMP_CD + "'";
			}

			if(!CMBBOXPLCE_CD1.equals("0")) {
				sql += " AND SUBSTR(EEA_PLCE_CD,1,1) = '" + CMBBOXPLCE_CD2 + "'";
			}

			if(CMBHLTH_KD.equals("1")) {
				sql += " AND CASE WHEN EEA_HTSB_CD IN ('11001', '12001', '12003') THEN SUBSTR(NVL(EEA_HLTH_KD, '1'), 1, 1) ELSE SUBSTR(NVL(EEA_HLTH_KD, '0'), 1, 1) END = '1'";
			}
			else if(CMBHLTH_KD.equals("2")) {
				sql += " AND CASE WHEN EEA_HTSB_CD IN ('11001', '12001', '12003') THEN SUBSTR(NVL(EEA_HLTH_KD, '1'), 1, 1) ELSE SUBSTR(NVL(EEA_HLTH_KD, '0'), 1, 1) END <> '1'";
			}

			sql += " AND EEP_PSNLP_PR <>0";
			sql += " AND (EEP_PSNLP_DT IS NULL";
			sql += " OR EEP_PSNLP_DT='' )";
			sql += " AND EEA_EXAM_CD NOT LIKE'31%'";
			sql += " AND NOT exists (select * from BT_BILL_COMP_LIST T  where A.EEA_EXAM_DT=T.BCL_EXAM_DT and A.EEA_EXAM_SQ=T.BCL_EXAM_SQ and T.BCL_BILL_KD = '40') ";
			sql += " GROUP BY A.EEA_COMP_CD, EEA_CUST_NO , EEA_EXAM_CD, A.EEA_EXAM_DT, C.ICY_COMP_NM, C.ICY_ZIP_CD, C.ICY_ZIP_AR, C.ICY_ROAD_AR, D.IAU_PENL_NM, B.EEP_PSNLP_DT HAVING SUM(B.EEP_PSNLP_PR) >0 ) FF";
			sql += " GROUP BY EEA_COMP_CD,ICY_COMP_NM,ICY_ZIP_CD,ICY_ZIP_AR,BJ_NM ,CHUNGGB HAVING SUM(CHUNGAMT) >0";
			sql += " UNION";
			sql += " ALL SELECT EEA_COMP_CD, MIN(EEA_EXAM_CD) EEA_EXAM_CD, ICY_COMP_NM,ICY_ZIP_CD,ICY_ZIP_AR,BJ_NM,CHUNGGB,COUNT (CNT) CNT,SUM(CHUNGAMT) CHUNGAMT";
			sql += " FROM ( SELECT A.EEA_COMP_CD, EEA_CUST_NO, EEA_EXAM_CD, C.ICY_COMP_NM, C.ICY_ZIP_CD, C.ICY_ZIP_AR || ' ' || ICY_ROAD_AR ICY_ZIP_AR, D.IAU_PENL_NM BJ_NM, '학생' CHUNGGB, 1 CNT, SUM(B.EEP_COMP_PR+B.EEP_COMPS_PR) CHUNGAMT";
			sql += " FROM ET_EXAM_ACPT A LEFT OUTER JOIN ET_EXAM_PRICE B";
			sql += " ON A.EEA_EXAM_DT = B.EEP_EXAM_DT";
			sql += " AND A.EEA_EXAM_SQ = B.EEP_EXAM_SQ LEFT OUTER JOIN IT_COMPANY C";
			sql += " ON A.EEA_COMP_CD = C.ICY_COMP_CD LEFT OUTER JOIN IT_AUTH_USER D";
			sql += " ON C.ICY_SALE_ID = D.IAU_EMP_NO";
			sql += " WHERE NVL(A.EEA_COMP_CD, ' ') <> ' '";
			sql += " AND EEA_EXAM_DT >= '" + DP_FROMDT + "'";
			sql += " AND EEA_EXAM_DT <= '" + DP_TODT + "'";
			sql += " AND EEA_ORDER_YN <> 'C'";

			if(!COMP_CD.equals("")) {
				sql += " AND EEA_COMP_CD = '" + COMP_CD + "'";
			}

			if(!CMBBOXPLCE_CD1.equals("0")) {
				sql += " AND SUBSTR(EEA_PLCE_CD,1,1) = '" + CMBBOXPLCE_CD2 + "'";
			}

			sql += " AND (EEP_COMP_PR <>0";
			sql += " OR EEP_COMPS_PR<>0)";
			sql += " AND (EEP_CDMD_DT IS NULL";
			sql += " OR EEP_CDMD_DT='' )";
			sql += " AND EEA_EXAM_CD LIKE'31%'";
			sql += " AND NOT exists (select * from BT_BILL_COMP_LIST T  where A.EEA_EXAM_DT=T.BCL_EXAM_DT and A.EEA_EXAM_SQ=T.BCL_EXAM_SQ and T.BCL_BILL_KD = '90') ";
			sql += " GROUP BY A.EEA_COMP_CD, EEA_EXAM_CD, A.EEA_EXAM_DT, EEA_CUST_NO, C.ICY_COMP_NM, C.ICY_ZIP_CD, C.ICY_ZIP_AR, C.ICY_ROAD_AR, D.IAU_PENL_NM, B.EEP_CDMD_DT HAVING SUM(B.EEP_COMP_PR+B.EEP_COMPS_PR) >0 ) FF";
			sql += " GROUP BY EEA_COMP_CD,EEA_EXAM_CD, ICY_COMP_NM,ICY_ZIP_CD,ICY_ZIP_AR,BJ_NM ,CHUNGGB HAVING SUM(CHUNGAMT) >0 ) AA";
			sql += " ORDER BY ICY_COMP_NM";
		}
		else if(RZ_CHKD.equals("1")) {
			sql = " SELECT *";
			sql += " FROM ( SELECT EEA_COMP_CD, MIN(EEA_EXAM_CD) EEA_EXAM_CD, ICY_COMP_NM,ICY_ZIP_CD,ICY_ZIP_AR, BJ_NM,CHUNGGB,COUNT (CNT) CNT,SUM(CHUNGAMT) - SUM(EEA_DISC_CPR) CHUNGAMT";
			sql += " FROM ( SELECT A.EEA_COMP_CD, EEA_CUST_NO, EEA_EXAM_CD, MAX(NVL(EEA_DISC_CPR,0)) EEA_DISC_CPR, C.ICY_COMP_NM, C.ICY_ZIP_CD, C.ICY_ZIP_AR || ' ' || ICY_ROAD_AR ICY_ZIP_AR, D.IAU_PENL_NM BJ_NM, '일반' CHUNGGB, 1 CNT, SUM(B.EEP_COMP_PR) CHUNGAMT";
			sql += " FROM ET_EXAM_ACPT A LEFT OUTER JOIN ET_EXAM_PRICE B";
			sql += " ON A.EEA_EXAM_DT = B.EEP_EXAM_DT";
			sql += " AND A.EEA_EXAM_SQ = B.EEP_EXAM_SQ LEFT OUTER JOIN IT_COMPANY C";
			sql += " ON A.EEA_COMP_CD = C.ICY_COMP_CD LEFT OUTER JOIN IT_AUTH_USER D";
			sql += " ON C.ICY_SALE_ID = D.IAU_EMP_NO";
			sql += " WHERE NVL(A.EEA_COMP_CD, ' ') <> ' '";
			sql += " AND EEA_EXAM_DT >= '" + DP_FROMDT + "'";
			sql += " AND EEA_EXAM_DT <= '" + DP_TODT + "'";
			sql += " AND EEA_ORDER_YN <> 'C'";

			if(!COMP_CD.equals("")) {
				sql += " AND EEA_COMP_CD = '" + COMP_CD + "'";
			}

			if(!CMBBOXPLCE_CD1.equals("0")) {
				sql += " AND SUBSTR(EEA_PLCE_CD,1,1) = '" + CMBBOXPLCE_CD2 + "'";
			}

			if(CMBHLTH_KD.equals("1")) {
				sql += " AND CASE WHEN EEA_HTSB_CD IN ('11001', '12001', '12003') THEN SUBSTR(NVL(EEA_HLTH_KD, '1'), 1, 1) ELSE SUBSTR(NVL(EEA_HLTH_KD, '0'), 1, 1) END = '1'";
			}
			else if(CMBHLTH_KD.equals("2")) {
				sql += " AND CASE WHEN EEA_HTSB_CD IN ('11001', '12001', '12003') THEN SUBSTR(NVL(EEA_HLTH_KD, '1'), 1, 1) ELSE SUBSTR(NVL(EEA_HLTH_KD, '0'), 1, 1) END <> '1'";
			}

			sql += " AND EEP_COMP_PR <> 0";
			sql += " AND (EEP_CDMD_DT IS NULL";
			sql += " OR EEP_CDMD_DT='' )";
			sql += " AND EEA_EXAM_CD NOT LIKE'31%'";

                  if (! CMBSP_GUBN1.equals("0")){
                        sql += " AND EEA_EXAM_CD Like '" + CMBSP_GUBN2 + "%' ";
                  }

			sql += " AND NOT exists (select * from BT_BILL_COMP_LIST T  where A.EEA_EXAM_DT=T.BCL_EXAM_DT and A.EEA_EXAM_SQ=T.BCL_EXAM_SQ and T.BCL_BILL_KD = '31') ";
                  //sql += " And T.BBC_EXAM_CD Like '" + CMBSP_GUBN2 + "%' ) ";
			sql += " GROUP BY A.EEA_COMP_CD, EEA_EXAM_CD, EEA_CUST_NO, C.ICY_COMP_NM, C.ICY_ZIP_CD, C.ICY_ZIP_AR, C.ICY_ROAD_AR, D.IAU_PENL_NM, B.EEP_CDMD_DT HAVING SUM(B.EEP_COMP_PR) >0 ) FF";
			sql += " GROUP BY EEA_COMP_CD, ICY_COMP_NM,ICY_ZIP_CD,ICY_ZIP_AR,BJ_NM ,CHUNGGB ) AA";
			sql += " ORDER BY ICY_COMP_NM";
		}
		else if(RZ_CHKD.equals("2")) {
			sql = " SELECT *";
			sql += " FROM ( SELECT EEA_COMP_CD, MIN(EEA_EXAM_CD) EEA_EXAM_CD, ICY_COMP_NM,ICY_ZIP_CD,ICY_ZIP_AR, BJ_NM,CHUNGGB,SUM(CNT) CNT,SUM(CHUNGAMT) CHUNGAMT";
			sql += " FROM ( SELECT A.EEA_COMP_CD, EEA_CUST_NO, EEA_EXAM_CD, C.ICY_COMP_NM, C.ICY_ZIP_CD, C.ICY_ZIP_AR || ' ' || ICY_ROAD_AR ICY_ZIP_AR, D.IAU_PENL_NM BJ_NM, '특검' CHUNGGB, 1 CNT, SUM(B.EEP_COMPS_PR) CHUNGAMT";
			sql += " FROM ET_EXAM_ACPT A LEFT OUTER JOIN ET_EXAM_PRICE B";
			sql += " ON A.EEA_EXAM_DT = B.EEP_EXAM_DT";
			sql += " AND A.EEA_EXAM_SQ = B.EEP_EXAM_SQ LEFT OUTER JOIN IT_COMPANY C";
			sql += " ON A.EEA_COMP_CD = C.ICY_COMP_CD LEFT OUTER JOIN IT_AUTH_USER D";
			sql += " ON C.ICY_SALE_ID = D.IAU_EMP_NO";
			sql += " WHERE NVL(A.EEA_COMP_CD, ' ') <> ' '";
			sql += " AND EEA_EXAM_DT >= '" + DP_FROMDT + "'";
			sql += " AND EEA_EXAM_DT <= '" + DP_TODT + "'";
			sql += " AND EEA_ORDER_YN <> 'C'";

			if(!COMP_CD.equals("")) {
				sql += " AND EEA_COMP_CD = '" + COMP_CD + "'";
			}

			if(!CMBBOXPLCE_CD1.equals("0")) {
				sql += " AND SUBSTR(EEA_PLCE_CD,1,1) = '" + CMBBOXPLCE_CD2 + "'";
			}

			if(!CMBSP_GUBN1.equals("0")) {
				sql += " AND EEA_SPCL_CD = '" + CMBSP_GUBN2 + "'";
			}

			if(CMBSP_CHA.equals("1")) {
				sql += " AND ((EEA_EXAM_CD = '41001')";
				sql += " OR (EEA_SPSB_CD = '41001'))";
			}
			else if(CMBSP_CHA.equals("2")) {
				sql += " AND ((EEA_EXAM_CD = '42001')";
				sql += " OR (EEA_SPSB_CD = '42001'))";
			}

			if(CMBHLTH_KD.equals("1")) {
				sql += " AND CASE WHEN EEA_HTSB_CD IN ('11001', '12001', '12003') THEN SUBSTR(NVL(EEA_HLTH_KD, '1'), 1, 1) ELSE SUBSTR(NVL(EEA_HLTH_KD, '0'), 1, 1) END = '1'";
			}
			else if(CMBHLTH_KD.equals("2")) {
				sql += " AND CASE WHEN EEA_HTSB_CD IN ('11001', '12001', '12003') THEN SUBSTR(NVL(EEA_HLTH_KD, '1'), 1, 1) ELSE SUBSTR(NVL(EEA_HLTH_KD, '0'), 1, 1) END <> '1'";
			}

			sql += " AND EEP_COMPS_PR <> 0";
			sql += " AND (EEP_CDMDS_DT IS NULL";
			sql += " OR EEP_CDMDS_DT='' )";
			sql += " AND EEA_EXAM_CD NOT LIKE'31%'";
			sql += " AND NOT exists (select * from BT_BILL_COMP_LIST T  where A.EEA_EXAM_DT=T.BCL_EXAM_DT and A.EEA_EXAM_SQ=T.BCL_EXAM_SQ and T.BCL_BILL_KD = '32') ";
			sql += " GROUP BY A.EEA_COMP_CD, EEA_EXAM_CD, A.EEA_EXAM_DT, EEA_CUST_NO, C.ICY_COMP_NM, C.ICY_ZIP_CD, C.ICY_ZIP_AR, C.ICY_ROAD_AR, D.IAU_PENL_NM, B.EEP_CDMDS_DT HAVING SUM(B.EEP_COMPS_PR) >0 ) FF";
			sql += " GROUP BY EEA_COMP_CD, ICY_COMP_NM,ICY_ZIP_CD,ICY_ZIP_AR,BJ_NM,CHUNGGB ) AA";
			sql += " ORDER BY ICY_COMP_NM";
		}
		else if(RZ_CHKD.equals("3")) {
			sql = " SELECT *";
			sql += " FROM ( SELECT EEA_COMP_CD, MIN(EEA_EXAM_CD) EEA_EXAM_CD, ICY_COMP_NM,ICY_ZIP_CD,ICY_ZIP_AR, BJ_NM,CHUNGGB, COUNT (CNT) CNT,SUM(CHUNGAMT) CHUNGAMT";
			sql += " FROM ( SELECT A.EEA_COMP_CD, EEA_CUST_NO, EEA_EXAM_CD, C.ICY_COMP_NM, C.ICY_ZIP_CD, C.ICY_ZIP_AR || ' ' || ICY_ROAD_AR ICY_ZIP_AR, D.IAU_PENL_NM BJ_NM, '급여' CHUNGGB, 1 CNT, SUM(B.EEP_PSNLP_PR) CHUNGAMT";
			sql += " FROM ET_EXAM_ACPT A LEFT OUTER JOIN ET_EXAM_PRICE B";
			sql += " ON A.EEA_EXAM_DT = B.EEP_EXAM_DT";
			sql += " AND A.EEA_EXAM_SQ = B.EEP_EXAM_SQ LEFT OUTER JOIN IT_COMPANY C";
			sql += " ON A.EEA_COMP_CD = C.ICY_COMP_CD LEFT OUTER JOIN IT_AUTH_USER D";
			sql += " ON C.ICY_SALE_ID = D.IAU_EMP_NO";
			sql += " WHERE NVL(A.EEA_COMP_CD, ' ') <> ' '";
			sql += " AND EEA_EXAM_DT >= '" + DP_FROMDT + "'";
			sql += " AND EEA_EXAM_DT <= '" + DP_TODT + "'";
			sql += " AND EEA_ORDER_YN <> 'C'";

			if(!COMP_CD.equals("")) {
				sql += " AND EEA_COMP_CD = '" + COMP_CD + "'";
			}

			if(!CMBBOXPLCE_CD1.equals("0")) {
				sql += " AND SUBSTR(EEA_PLCE_CD,1,1) = '" + CMBBOXPLCE_CD2 + "'";
			}

			if(CMBHLTH_KD.equals("1")) {
				sql += " AND CASE WHEN EEA_HTSB_CD IN ('11001', '12001', '12003') THEN SUBSTR(NVL(EEA_HLTH_KD, '1'), 1, 1) ELSE SUBSTR(NVL(EEA_HLTH_KD, '0'), 1, 1) END = '1'";
			}
			else if(CMBHLTH_KD.equals("2")) {
				sql += " AND CASE WHEN EEA_HTSB_CD IN ('11001', '12001', '12003') THEN SUBSTR(NVL(EEA_HLTH_KD, '1'), 1, 1) ELSE SUBSTR(NVL(EEA_HLTH_KD, '0'), 1, 1) END <> '1'";
			}

			sql += " AND EEP_PSNLP_PR <>0";
			sql += " AND (EEP_PSNLP_DT IS NULL";
			sql += " OR EEP_PSNLP_DT='' )";
			sql += " AND EEA_EXAM_CD NOT LIKE'31%'";
			sql += " AND NOT exists (select * from BT_BILL_COMP_LIST T  where A.EEA_EXAM_DT=T.BCL_EXAM_DT and A.EEA_EXAM_SQ=T.BCL_EXAM_SQ and T.BCL_BILL_KD = '40') ";
			sql += " GROUP BY A.EEA_COMP_CD, EEA_CUST_NO , EEA_EXAM_CD, A.EEA_EXAM_DT, C.ICY_COMP_NM, C.ICY_ZIP_CD, C.ICY_ZIP_AR, C.ICY_ROAD_AR, D.IAU_PENL_NM, B.EEP_PSNLP_DT HAVING SUM(B.EEP_PSNLP_PR) >0 ) FF";
			sql += " GROUP BY EEA_COMP_CD,ICY_COMP_NM,ICY_ZIP_CD,ICY_ZIP_AR,BJ_NM ,CHUNGGB HAVING SUM(CHUNGAMT) >0 ) AA";
			sql += " ORDER BY ICY_COMP_NM";
		}
		else if(RZ_CHKD.equals("4")) {
			sql = " SELECT *";
			sql += " FROM ( SELECT EEA_COMP_CD, MIN(EEA_EXAM_CD) EEA_EXAM_CD, ICY_COMP_NM,ICY_ZIP_CD,ICY_ZIP_AR,BJ_NM,CHUNGGB,COUNT (CNT) CNT,SUM(CHUNGAMT) CHUNGAMT";
			sql += " FROM ( SELECT A.EEA_COMP_CD, EEA_CUST_NO, EEA_EXAM_CD, C.ICY_COMP_NM, C.ICY_ZIP_CD, C.ICY_ZIP_AR || ' ' || ICY_ROAD_AR ICY_ZIP_AR, D.IAU_PENL_NM BJ_NM, '학생' CHUNGGB, 1 CNT, SUM(B.EEP_COMP_PR+B.EEP_COMPS_PR) CHUNGAMT";
			sql += " FROM ET_EXAM_ACPT A LEFT OUTER JOIN ET_EXAM_PRICE B";
			sql += " ON A.EEA_EXAM_DT = B.EEP_EXAM_DT";
			sql += " AND A.EEA_EXAM_SQ = B.EEP_EXAM_SQ LEFT OUTER JOIN IT_COMPANY C";
			sql += " ON A.EEA_COMP_CD = C.ICY_COMP_CD LEFT OUTER JOIN IT_AUTH_USER D";
			sql += " ON C.ICY_SALE_ID = D.IAU_EMP_NO";
			sql += " WHERE NVL(A.EEA_COMP_CD, ' ') <> ' '";
			sql += " AND EEA_EXAM_DT >= '" + DP_FROMDT + "'";
			sql += " AND EEA_EXAM_DT <= '" + DP_TODT + "'";
			sql += " AND EEA_ORDER_YN <> 'C'";

			if(!COMP_CD.equals("")) {
				sql += " AND EEA_COMP_CD = '" + COMP_CD + "'";
			}

			if(!CMBBOXPLCE_CD1.equals("0")) {
				sql += " AND SUBSTR(EEA_PLCE_CD,1,1) = '" + CMBBOXPLCE_CD2 + "'";
			}

			sql += " AND (EEP_COMP_PR <>0";
			sql += " OR EEP_COMPS_PR<>0)";
			sql += " AND (EEP_CDMD_DT IS NULL";
			sql += " OR EEP_CDMD_DT='' )";
			sql += " AND EEA_EXAM_CD LIKE'31%'";
			sql += " AND NOT exists (select * from BT_BILL_COMP_LIST T  where A.EEA_EXAM_DT=T.BCL_EXAM_DT and A.EEA_EXAM_SQ=T.BCL_EXAM_SQ and T.BCL_BILL_KD = '90') ";
			sql += " GROUP BY A.EEA_COMP_CD, EEA_EXAM_CD, A.EEA_EXAM_DT, EEA_CUST_NO, C.ICY_COMP_NM, C.ICY_ZIP_CD, C.ICY_ZIP_AR, C.ICY_ROAD_AR, D.IAU_PENL_NM, B.EEP_CDMD_DT HAVING SUM(B.EEP_COMP_PR+B.EEP_COMPS_PR) >0 ) FF";
			sql += " GROUP BY EEA_COMP_CD,EEA_EXAM_CD, ICY_COMP_NM,ICY_ZIP_CD,ICY_ZIP_AR,BJ_NM ,CHUNGGB HAVING SUM(CHUNGAMT) >0 ) AA";
			sql += " ORDER BY ICY_COMP_NM";
		}
		else if(RZ_CHKD.equals("5")) {
			sql = " SELECT *";
			sql += " FROM ( SELECT EEA_COMP_CD, MIN(EEA_EXAM_CD) EEA_EXAM_CD, ICY_COMP_NM,ICY_ZIP_CD,ICY_ZIP_AR, BJ_NM,CHUNGGB,COUNT (CNT) CNT,SUM(CHUNGAMT) - SUM(EEA_DISC_CPR) CHUNGAMT";
			sql += " FROM ( SELECT A.EEA_COMP_CD, EEA_CUST_NO, EEA_EXAM_CD, MAX(NVL(EEA_DISC_CPR,0)) EEA_DISC_CPR, C.ICY_COMP_NM, C.ICY_ZIP_CD, C.ICY_ZIP_AR || ' ' || ICY_ROAD_AR ICY_ZIP_AR, D.IAU_PENL_NM BJ_NM, '전체' CHUNGGB, 1 CNT, SUM(B.EEP_COMP_PR+EEP_COMPS_PR+EEP_PSNLP_PR) CHUNGAMT";
			sql += " FROM ET_EXAM_ACPT A LEFT OUTER JOIN ET_EXAM_PRICE B";
			sql += " ON A.EEA_EXAM_DT = B.EEP_EXAM_DT";
			sql += " AND A.EEA_EXAM_SQ = B.EEP_EXAM_SQ LEFT OUTER JOIN IT_COMPANY C";
			sql += " ON A.EEA_COMP_CD = C.ICY_COMP_CD LEFT OUTER JOIN IT_AUTH_USER D";
			sql += " ON C.ICY_SALE_ID = D.IAU_EMP_NO";
			sql += " WHERE NVL(A.EEA_COMP_CD, ' ') <> ' '";
			sql += " AND EEA_EXAM_DT >= '" + DP_FROMDT + "'";
			sql += " AND EEA_EXAM_DT <= '" + DP_TODT + "'";
			sql += " AND EEA_ORDER_YN <> 'C'";

			if(!COMP_CD.equals("")) {
				sql += " AND EEA_COMP_CD = '" + COMP_CD + "'";
			}

			if(!CMBBOXPLCE_CD1.equals("0")) {
				sql += " AND SUBSTR(EEA_PLCE_CD,1,1) = '" + CMBBOXPLCE_CD2 + "'";
			}

			if(CMBHLTH_KD.equals("1")) {
				sql += " AND CASE WHEN EEA_HTSB_CD IN ('11001', '12001', '12003') THEN SUBSTR(NVL(EEA_HLTH_KD, '1'), 1, 1) ELSE SUBSTR(NVL(EEA_HLTH_KD, '0'), 1, 1) END = '1'";
			}
			else if(CMBHLTH_KD.equals("2")) {
				sql += " AND CASE WHEN EEA_HTSB_CD IN ('11001', '12001', '12003') THEN SUBSTR(NVL(EEA_HLTH_KD, '1'), 1, 1) ELSE SUBSTR(NVL(EEA_HLTH_KD, '0'), 1, 1) END <> '1'";
			}

			sql += " AND ( (EEP_COMP_PR <>0)";
			sql += " OR ( EEP_COMPS_PR <>0 )";
			sql += " OR ( EEP_PSNLP_PR <>0 ) )";
			sql += " AND ((EEP_CDMD_DT IS NULL";
			sql += " OR EEP_CDMD_DT='')";
			sql += " OR (EEP_CDMDS_DT IS NULL";
			sql += " OR EEP_CDMDS_DT='')";
			sql += " OR (EEP_PSNLP_DT IS NULL";
			sql += " OR EEP_PSNLP_DT='' ))";
			sql += " AND EEA_EXAM_CD NOT LIKE'31%'";
			sql += " AND NOT exists (select * from BT_BILL_COMP_LIST T  where A.EEA_EXAM_DT=T.BCL_EXAM_DT and A.EEA_EXAM_SQ=T.BCL_EXAM_SQ) ";
			sql += " GROUP BY A.EEA_COMP_CD, EEA_EXAM_CD, A.EEA_EXAM_DT, EEA_CUST_NO, C.ICY_COMP_NM, C.ICY_ZIP_CD, C.ICY_ZIP_AR, C.ICY_ROAD_AR, D.IAU_PENL_NM, B.EEP_CDMD_DT ) FF";
			sql += " GROUP BY EEA_COMP_CD, ICY_COMP_NM,ICY_ZIP_CD,ICY_ZIP_AR,BJ_NM ,CHUNGGB ) AA";
			sql += " ORDER BY ICY_COMP_NM";
		}
			//
			G_INFO += "<!-- \n";
			G_INFO += "서비스명 : uIT_ChungGU_Move_Up_afLoadComp_001 \n";
			G_INFO += "설명 : 사업장명 자료정보 로딩 \n";
			G_INFO += "\n\n";

			G_INFO += "전달인자 : \n";
			G_INFO += " RZ_CHKD : " + RZ_CHKD + " \n";
			G_INFO += " DP_FROMDT : " + DP_FROMDT + " \n";
			G_INFO += " DP_TODT : " + DP_TODT + " \n";
			G_INFO += " COMP_CD : " + COMP_CD + " \n";
			G_INFO += " CMBBOXPLCE_CD1 : " + CMBBOXPLCE_CD1 + " \n";
			G_INFO += " CMBHLTH_KD : " + CMBHLTH_KD + " \n";
			G_INFO += " CMBBOXPLCE_CD2 : " + CMBBOXPLCE_CD2 + " \n";
			G_INFO += " CMBSP_GUBN1 : " + CMBSP_GUBN1 + " \n";
			G_INFO += " CMBSP_GUBN2 : " + CMBSP_GUBN2 + " \n";
			G_INFO += " CMBSP_CHA : " + CMBSP_CHA + " \n";
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
