<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%!
	public String func_uCOMP_CNRT_CUST_APPLY_BtnExcel_SaveClick_001(Statement argStmtExec, HashMap argHtMethod) throws Exception {

		String sql = "";
		String sql2 = "";
		String sql_disp = "";

		try {

			String COMP_CD = (String) argHtMethod.get("COMP_CD");
			String MNGT_YR = (String) argHtMethod.get("MNGT_YR");
			String CNRT_SQ = (String) argHtMethod.get("CNRT_SQ");
			String CUST_SQ = (String) argHtMethod.get("CUST_SQ");
			String CUST_NM = (String) argHtMethod.get("CUST_NM");
			String SEX_CD = (String) argHtMethod.get("SEX_CD");
			String BITH_DT = (String) argHtMethod.get("BITH_DT");
			String PENL_ID = (String) argHtMethod.get("PENL_ID");
			String MOBL_NO = (String) argHtMethod.get("MOBL_NO");
			String TEL_NO = (String) argHtMethod.get("TEL_NO");
			String EMAIL_AR = (String) argHtMethod.get("EMAIL_AR");
			String ZIP_CD = (String) argHtMethod.get("ZIP_CD");
			String ZIP_SQ = (String) argHtMethod.get("ZIP_SQ");
			String ZIP_AR = (String) argHtMethod.get("ZIP_AR");
			String ROAD_AR = (String) argHtMethod.get("ROAD_AR");
			String NHIS_YN = (String) argHtMethod.get("NHIS_YN");
			String NHIC_TX = (String) argHtMethod.get("NHIC_TX");
			String DEPT_NM = (String) argHtMethod.get("DEPT_NM");
			String HALF_CD = (String) argHtMethod.get("HALF_CD");
			String DEPT_CD = (String) argHtMethod.get("DEPT_CD");
			String ADD_YN = (String) argHtMethod.get("ADD_YN");
			String BLDG_NO = (String) argHtMethod.get("BLDG_NO");
			String EMPL_CD = (String) argHtMethod.get("EMPL_CD");
			String PROF_SQ = (String) argHtMethod.get("PROF_SQ");
			String COTK_YN = (String) argHtMethod.get("COTK_YN");
			String USE_YN = (String) argHtMethod.get("USE_YN");
			String ENTRY_DT = (String) argHtMethod.get("ENTRY_DT");
			String JUIP_DT = (String) argHtMethod.get("JUIP_DT");
			String NCHR_HH = (String) argHtMethod.get("NCHR_HH");
			String DIVI_CD = (String) argHtMethod.get("DIVI_CD");
			String WORK_LT = (String) argHtMethod.get("WORK_LT");
			String GOJU_CD = (String) argHtMethod.get("GOJU_CD");
			String JIJO_CD = (String) argHtMethod.get("JIJO_CD");
			String GOJU1_CD = (String) argHtMethod.get("GOJU1_CD");
			String FROM1_DT = (String) argHtMethod.get("FROM1_DT");
			String TO1_DT = (String) argHtMethod.get("TO1_DT");
			String GOJU2_CD = (String) argHtMethod.get("GOJU2_CD");
			String FROM2_DT = (String) argHtMethod.get("FROM2_DT");
			String TO2_DT = (String) argHtMethod.get("TO2_DT");
			String MEMO_TX = (String) argHtMethod.get("MEMO_TX");
			String RSVT_DT = (String) argHtMethod.get("RSVT_DT");
			String G_ENCRT_KD = (String) argHtMethod.get("G_ENCRT_KD");
			String PID_EN = (String) argHtMethod.get("PID_EN");
			String USER_ID = (String) argHtMethod.get("USER_ID");
			String HLTH_KD = (String) argHtMethod.get("HLTH_KD");
			String QSTN_NO = (String) argHtMethod.get("QSTN_NO");
			String HTSB_YN = (String) argHtMethod.get("HTSB_YN");
			String CANCER_YN = (String) argHtMethod.get("CANCER_YN");
			String ORAL_YN = (String) argHtMethod.get("ORAL_YN");
			String TOTAL_YN = (String) argHtMethod.get("TOTAL_YN");
			String SMS_YN = (String) argHtMethod.get("SMS_YN");

			//
			if(COMP_CD == null) { COMP_CD = ""; }
			if(MNGT_YR == null) { MNGT_YR = ""; }
			if(CNRT_SQ == null) { CNRT_SQ = ""; }
			if(CUST_SQ == null) { CUST_SQ = ""; }
			if(CUST_NM == null) { CUST_NM = ""; }
			if(SEX_CD == null) { SEX_CD = ""; }
			if(BITH_DT == null) { BITH_DT = ""; }
			if(PENL_ID == null) { PENL_ID = ""; }
			if(MOBL_NO == null) { MOBL_NO = ""; }
			if(TEL_NO == null) { TEL_NO = ""; }
			if(EMAIL_AR == null) { EMAIL_AR = ""; }
			if(ZIP_CD == null) { ZIP_CD = ""; }
			if(ZIP_SQ == null) { ZIP_SQ = ""; }
			if(ZIP_AR == null) { ZIP_AR = ""; }
			if(ROAD_AR == null) { ROAD_AR = ""; }
			if(NHIS_YN == null) { NHIS_YN = ""; }
			if(NHIC_TX == null) { NHIC_TX = ""; }
			if(DEPT_NM == null) { DEPT_NM = ""; }
			if(HALF_CD == null) { HALF_CD = ""; }
			if(DEPT_CD == null) { DEPT_CD = ""; }
			if(ADD_YN == null) { ADD_YN = ""; }
			if(BLDG_NO == null) { BLDG_NO = ""; }
			if(EMPL_CD == null) { EMPL_CD = ""; }
			if(PROF_SQ == null) { PROF_SQ = ""; }
			if(COTK_YN == null) { COTK_YN = ""; }
			if(USE_YN == null) { USE_YN = ""; }
			if(ENTRY_DT == null) { ENTRY_DT = ""; }
			if(JUIP_DT == null) { JUIP_DT = ""; }
			if(NCHR_HH == null) { NCHR_HH = ""; }
			if(DIVI_CD == null) { DIVI_CD = ""; }
			if(WORK_LT == null) { WORK_LT = ""; }
			if(GOJU_CD == null) { GOJU_CD = ""; }
			if(JIJO_CD == null) { JIJO_CD = ""; }
			if(GOJU1_CD == null) { GOJU1_CD = ""; }
			if(FROM1_DT == null) { FROM1_DT = ""; }
			if(TO1_DT == null) { TO1_DT = ""; }
			if(GOJU2_CD == null) { GOJU2_CD = ""; }
			if(FROM2_DT == null) { FROM2_DT = ""; }
			if(TO2_DT == null) { TO2_DT = ""; }
			if(MEMO_TX == null) { MEMO_TX = ""; }
			if(RSVT_DT == null) { RSVT_DT = ""; }
			if(G_ENCRT_KD == null) { G_ENCRT_KD = ""; }
			if(PID_EN == null) { PID_EN = ""; }
			if(USER_ID == null) { USER_ID = ""; }
			if(HLTH_KD == null) { HLTH_KD = ""; }
			if(QSTN_NO == null) { QSTN_NO = ""; }
			if(HTSB_YN == null) { HTSB_YN = ""; }
			if(CANCER_YN == null) { CANCER_YN = ""; }
			if(ORAL_YN == null) { ORAL_YN = ""; }
			if(TOTAL_YN == null) { TOTAL_YN = ""; }
			if(SMS_YN == null) { SMS_YN = ""; }

			//
			COMP_CD = CTr.Replace(COMP_CD, "'", "''");
			MNGT_YR = CTr.Replace(MNGT_YR, "'", "''");
			CNRT_SQ = CTr.Replace(CNRT_SQ, "'", "''");
			CUST_SQ = CTr.Replace(CUST_SQ, "'", "''");
			CUST_NM = CTr.Replace(CUST_NM, "'", "''");
			SEX_CD = CTr.Replace(SEX_CD, "'", "''");
			BITH_DT = CTr.Replace(BITH_DT, "'", "''");
			PENL_ID = CTr.Replace(PENL_ID, "'", "''");
			MOBL_NO = CTr.Replace(MOBL_NO, "'", "''");
			TEL_NO = CTr.Replace(TEL_NO, "'", "''");
			EMAIL_AR = CTr.Replace(EMAIL_AR, "'", "''");
			ZIP_CD = CTr.Replace(ZIP_CD, "'", "''");
			ZIP_SQ = CTr.Replace(ZIP_SQ, "'", "''");
			ZIP_AR = CTr.Replace(ZIP_AR, "'", "''");
			ROAD_AR = CTr.Replace(ROAD_AR, "'", "''");
			NHIS_YN = CTr.Replace(NHIS_YN, "'", "''");
			NHIC_TX = CTr.Replace(NHIC_TX, "'", "''");
			DEPT_NM = CTr.Replace(DEPT_NM, "'", "''");
			HALF_CD = CTr.Replace(HALF_CD, "'", "''");
			DEPT_CD = CTr.Replace(DEPT_CD, "'", "''");
			ADD_YN = CTr.Replace(ADD_YN, "'", "''");
			BLDG_NO = CTr.Replace(BLDG_NO, "'", "''");
			EMPL_CD = CTr.Replace(EMPL_CD, "'", "''");
			PROF_SQ = CTr.Replace(PROF_SQ, "'", "''");
			COTK_YN = CTr.Replace(COTK_YN, "'", "''");
			USE_YN = CTr.Replace(USE_YN, "'", "''");
			ENTRY_DT = CTr.Replace(ENTRY_DT, "'", "''");
			JUIP_DT = CTr.Replace(JUIP_DT, "'", "''");
			NCHR_HH = CTr.Replace(NCHR_HH, "'", "''");
			DIVI_CD = CTr.Replace(DIVI_CD, "'", "''");
			WORK_LT = CTr.Replace(WORK_LT, "'", "''");
			GOJU_CD = CTr.Replace(GOJU_CD, "'", "''");
			JIJO_CD = CTr.Replace(JIJO_CD, "'", "''");
			GOJU1_CD = CTr.Replace(GOJU1_CD, "'", "''");
			FROM1_DT = CTr.Replace(FROM1_DT, "'", "''");
			TO1_DT = CTr.Replace(TO1_DT, "'", "''");
			GOJU2_CD = CTr.Replace(GOJU2_CD, "'", "''");
			FROM2_DT = CTr.Replace(FROM2_DT, "'", "''");
			TO2_DT = CTr.Replace(TO2_DT, "'", "''");
			MEMO_TX = CTr.Replace(MEMO_TX, "'", "''");
			RSVT_DT = CTr.Replace(RSVT_DT, "'", "''");
			G_ENCRT_KD = CTr.Replace(G_ENCRT_KD, "'", "''");
			PID_EN = CTr.Replace(PID_EN, "'", "''");
			USER_ID = CTr.Replace(USER_ID, "'", "''");
			HLTH_KD = CTr.Replace(HLTH_KD, "'", "''");
			QSTN_NO = CTr.Replace(QSTN_NO, "'", "''");
			HTSB_YN = CTr.Replace(HTSB_YN, "'", "''");
			CANCER_YN = CTr.Replace(CANCER_YN, "'", "''");
			ORAL_YN = CTr.Replace(ORAL_YN, "'", "''");
			TOTAL_YN = CTr.Replace(TOTAL_YN, "'", "''");
			SMS_YN = CTr.Replace(SMS_YN, "'", "''");

			sql = "INSERT INTO ET_COMP_CNRT_CUST (ECT_COMP_CD, ECT_MNGT_YR, ECT_CNRT_SQ, ECT_CUST_SQ, ECT_CUST_NM, ECT_SEX_CD, ";
			sql += " ECT_BITH_DT, ECT_PENL_ID, ECT_MOBL_NO, ECT_TEL_NO, ECT_EMAIL_AR, ECT_ZIP_CD, ECT_ZIP_SQ, ECT_ZIP_AR, ECT_ROAD_AR, ";
			sql += " ECT_NHIS_YN, ECT_NHIC_TX, ECT_DEPT_NM, ECT_HALF_CD, ECT_DEPT_CD, ECT_ADD_YN, ECT_BLDG_NO, ECT_EMPL_CD, ECT_PROF_SQ, ";
			sql += " ECT_COTK_YN, ECT_USE_YN, ECT_ENTRY_DT, ECT_JUIP_DT, ECT_NCHR_HH, ECT_DIVI_CD, ECT_WORK_LT, ECT_GOJU_CD, ECT_JIJO_CD, ";
			sql += " ECT_1GOJU_CD, ECT_1FROM_DT, ECT_1TO_DT, ECT_2GOJU_CD, ECT_2FROM_DT, ECT_2TO_DT, ECT_MEMO_TX, ECT_RSVT_DT, ECT_PID_EN, ";
			sql += " ECT_INPT_ID, ECT_INPT_DTT, ECT_HLTH_KD, ECT_QSTN_NO, ECT_HTSB_YN, ECT_CANCER_YN,  ECT_ORAL_YN, ";
			sql += " ECT_TOTAL_YN,  ECT_SMS_YN ) VALUES (";
			sql += "  '" + COMP_CD + "'";
			sql += ", '" + MNGT_YR + "'";
			sql += ", '" + CNRT_SQ + "'";
			sql += ", '" + CUST_SQ + "'";
			sql += ", '" + CUST_NM + "'";
			sql += ", '" + SEX_CD + "'";
			sql += ", '" + BITH_DT + "'";
			sql += ", '" + PENL_ID + "'";
			sql += ", '" + MOBL_NO + "'";
			sql += ", '" + TEL_NO + "'";
			sql += ", '" + EMAIL_AR + "'";
			sql += ", '" + ZIP_CD + "'";
			sql += ", '" + ZIP_SQ + "'";
			sql += ", '" + ZIP_AR + "'";
			sql += ", '" + ROAD_AR + "'";
			sql += ", '" + NHIS_YN + "'";
			sql += ", '" + NHIC_TX + "'";
			sql += ", '" + DEPT_NM + "'";
			sql += ", '" + HALF_CD + "'";
			sql += ", '" + DEPT_CD + "'";
			sql += ", '" + ADD_YN + "'";
			sql += ", '" + BLDG_NO + "'";
			sql += ", '" + EMPL_CD + "'";
			sql += ", '" + PROF_SQ + "'";
			sql += ", '" + COTK_YN + "'";
			sql += ", '" + USE_YN + "'";
			sql += ", '" + ENTRY_DT + "'";
			sql += ", '" + JUIP_DT + "'";
			sql += ", '" + NCHR_HH + "'";
			sql += ", '" + DIVI_CD + "'";
			sql += ", '" + WORK_LT + "'";
			sql += ", '" + GOJU_CD + "'";
			sql += ", '" + JIJO_CD + "'";
			sql += ", '" + GOJU1_CD + "'";
			sql += ", '" + FROM1_DT + "'";
			sql += ", '" + TO1_DT + "'";
			sql += ", '" + GOJU2_CD + "'";
			sql += ", '" + FROM2_DT + "'";
			sql += ", '" + TO2_DT + "'";
			sql += ", '" + MEMO_TX + "'";
			sql += ", '" + RSVT_DT + "'";
			if(G_ENCRT_KD.equals("2")) {
				sql += ", ECHELONDB.ECL_ENCRYPT('" + PID_EN + "')";
			}
			else {
				sql += ", '" + PID_EN + "'";
			}
			sql += ", '" + USER_ID + "'";
			sql += ", SYSDATE";
			sql += ", '" + HLTH_KD + "'";
			sql += ", '" + QSTN_NO + "'";
			sql += ", '" + HTSB_YN + "'";
			sql += ", '" + CANCER_YN + "'";
			sql += ", '" + ORAL_YN + "'";
			sql += ", '" + TOTAL_YN + "'";
			sql += ", '" + SMS_YN + "'";
			sql += ")";

			argStmtExec.executeUpdate(sql);
		} catch (Exception e) {

			throw new FuncException(e.toString(), sql);
		}

		return sql;
	}
%>
