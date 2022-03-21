<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%!
	public String func_uExam_Acpt_btnInjkSaveClick_001(Statement argStmtExec, HashMap argHtMethod) throws Exception {

		String sql = "";
		String sql2 = "";
		String sql_disp = "";

		try {

			String PSNL_NM = (String) argHtMethod.get("PSNL_NM");
			String CHART_NO = (String) argHtMethod.get("CHART_NO");
			String SEX_CD = (String) argHtMethod.get("SEX_CD");
			String PSNL_AGE = (String) argHtMethod.get("PSNL_AGE");
			String ZIP_CD = (String) argHtMethod.get("ZIP_CD");
			String ZIP_SQ = (String) argHtMethod.get("ZIP_SQ");
			String ZIP_AR = (String) argHtMethod.get("ZIP_AR");
			String ROAD_AR = (String) argHtMethod.get("ROAD_AR");
			String BLDG_NO = (String) argHtMethod.get("BLDG_NO");
			String TEL_NO = (String) argHtMethod.get("TEL_NO");
			String MOBL_NO = (String) argHtMethod.get("MOBL_NO");
			String EMAIL_AR = (String) argHtMethod.get("EMAIL_AR");
			String SEND_CD = (String) argHtMethod.get("SEND_CD");
			String SMS_YN = (String) argHtMethod.get("SMS_YN");
			String COMP_CD = (String) argHtMethod.get("COMP_CD");
			String DEPT_CD = (String) argHtMethod.get("DEPT_CD");
			String DEPT_NM = (String) argHtMethod.get("DEPT_NM");
			String DIVI_CD = (String) argHtMethod.get("DIVI_CD");
			String ENTRY_DT = (String) argHtMethod.get("ENTRY_DT");
			String DIVI_NO = (String) argHtMethod.get("DIVI_NO");
			String DIVI_CS = (String) argHtMethod.get("DIVI_CS");
			String FAMY_CD = (String) argHtMethod.get("FAMY_CD");
			String FAMY_NM = (String) argHtMethod.get("FAMY_NM");
			String FOOD_YN = (String) argHtMethod.get("FOOD_YN");
			String SALES_ID = (String) argHtMethod.get("SALES_ID");
			String EXEC_ID = (String) argHtMethod.get("EXEC_ID");
			String INSU_NO = (String) argHtMethod.get("INSU_NO");
			String INSU_CD = (String) argHtMethod.get("INSU_CD");
			String ENTY_CD = (String) argHtMethod.get("ENTY_CD");
			String ASSO_CD = (String) argHtMethod.get("ASSO_CD");
			String CNTR_CD = (String) argHtMethod.get("CNTR_CD");
			String ARMY_CD = (String) argHtMethod.get("ARMY_CD");
			String CANAD_YN = (String) argHtMethod.get("CANAD_YN");
			String CANAD_KD = (String) argHtMethod.get("CANAD_KD");
			String TOTAL_YN = (String) argHtMethod.get("TOTAL_YN");
			String ACPT_TX = (String) argHtMethod.get("ACPT_TX");
			String COMP_CD2 = (String) argHtMethod.get("COMP_CD2");
			String MODI_ID = (String) argHtMethod.get("MODI_ID");
			String EXAM_DT = (String) argHtMethod.get("EXAM_DT");
			String EXAM_SQ = (String) argHtMethod.get("EXAM_SQ");

			//
			if(PSNL_NM == null) { PSNL_NM = ""; }
			if(CHART_NO == null) { CHART_NO = ""; }
			if(SEX_CD == null) { SEX_CD = ""; }
			if(PSNL_AGE == null) { PSNL_AGE = ""; }
			if(ZIP_CD == null) { ZIP_CD = ""; }
			if(ZIP_SQ == null) { ZIP_SQ = ""; }
			if(ZIP_AR == null) { ZIP_AR = ""; }
			if(ROAD_AR == null) { ROAD_AR = ""; }
			if(BLDG_NO == null) { BLDG_NO = ""; }
			if(TEL_NO == null) { TEL_NO = ""; }
			if(MOBL_NO == null) { MOBL_NO = ""; }
			if(EMAIL_AR == null) { EMAIL_AR = ""; }
			if(SEND_CD == null) { SEND_CD = ""; }
			if(SMS_YN == null) { SMS_YN = ""; }
			if(COMP_CD == null) { COMP_CD = ""; }
			if(DEPT_CD == null) { DEPT_CD = ""; }
			if(DEPT_NM == null) { DEPT_NM = ""; }
			if(DIVI_CD == null) { DIVI_CD = ""; }
			if(ENTRY_DT == null) { ENTRY_DT = ""; }
			if(DIVI_NO == null) { DIVI_NO = ""; }
			if(DIVI_CS == null) { DIVI_CS = ""; }
			if(FAMY_CD == null) { FAMY_CD = ""; }
			if(FAMY_NM == null) { FAMY_NM = ""; }
			if(FOOD_YN == null) { FOOD_YN = ""; }
			if(SALES_ID == null) { SALES_ID = ""; }
			if(EXEC_ID == null) { EXEC_ID = ""; }
			if(INSU_NO == null) { INSU_NO = ""; }
			if(INSU_CD == null) { INSU_CD = ""; }
			if(ENTY_CD == null) { ENTY_CD = ""; }
			if(ASSO_CD == null) { ASSO_CD = ""; }
			if(CNTR_CD == null) { CNTR_CD = ""; }
			if(ARMY_CD == null) { ARMY_CD = ""; }
			if(CANAD_YN == null) { CANAD_YN = ""; }
			if(CANAD_KD == null) { CANAD_KD = ""; }
			if(TOTAL_YN == null) { TOTAL_YN = ""; }
			if(ACPT_TX == null) { ACPT_TX = ""; }
			if(COMP_CD2 == null) { COMP_CD2 = ""; }
			if(MODI_ID == null) { MODI_ID = ""; }
			if(EXAM_DT == null) { EXAM_DT = ""; }
			if(EXAM_SQ == null) { EXAM_SQ = ""; }

			//
			PSNL_NM = CTr.Replace(PSNL_NM, "'", "''");
			CHART_NO = CTr.Replace(CHART_NO, "'", "''");
			SEX_CD = CTr.Replace(SEX_CD, "'", "''");
			PSNL_AGE = CTr.Replace(PSNL_AGE, "'", "''");
			ZIP_CD = CTr.Replace(ZIP_CD, "'", "''");
			ZIP_SQ = CTr.Replace(ZIP_SQ, "'", "''");
			ZIP_AR = CTr.Replace(ZIP_AR, "'", "''");
			ROAD_AR = CTr.Replace(ROAD_AR, "'", "''");
			BLDG_NO = CTr.Replace(BLDG_NO, "'", "''");
			TEL_NO = CTr.Replace(TEL_NO, "'", "''");
			MOBL_NO = CTr.Replace(MOBL_NO, "'", "''");
			EMAIL_AR = CTr.Replace(EMAIL_AR, "'", "''");
			SEND_CD = CTr.Replace(SEND_CD, "'", "''");
			SMS_YN = CTr.Replace(SMS_YN, "'", "''");
			COMP_CD = CTr.Replace(COMP_CD, "'", "''");
			DEPT_CD = CTr.Replace(DEPT_CD, "'", "''");
			DEPT_NM = CTr.Replace(DEPT_NM, "'", "''");
			DIVI_CD = CTr.Replace(DIVI_CD, "'", "''");
			ENTRY_DT = CTr.Replace(ENTRY_DT, "'", "''");
			DIVI_NO = CTr.Replace(DIVI_NO, "'", "''");
			DIVI_CS = CTr.Replace(DIVI_CS, "'", "''");
			FAMY_CD = CTr.Replace(FAMY_CD, "'", "''");
			FAMY_NM = CTr.Replace(FAMY_NM, "'", "''");
			FOOD_YN = CTr.Replace(FOOD_YN, "'", "''");
			SALES_ID = CTr.Replace(SALES_ID, "'", "''");
			EXEC_ID = CTr.Replace(EXEC_ID, "'", "''");
			INSU_NO = CTr.Replace(INSU_NO, "'", "''");
			INSU_CD = CTr.Replace(INSU_CD, "'", "''");
			ENTY_CD = CTr.Replace(ENTY_CD, "'", "''");
			ASSO_CD = CTr.Replace(ASSO_CD, "'", "''");
			CNTR_CD = CTr.Replace(CNTR_CD, "'", "''");
			ARMY_CD = CTr.Replace(ARMY_CD, "'", "''");
			CANAD_YN = CTr.Replace(CANAD_YN, "'", "''");
			CANAD_KD = CTr.Replace(CANAD_KD, "'", "''");
			TOTAL_YN = CTr.Replace(TOTAL_YN, "'", "''");
			ACPT_TX = CTr.Replace(ACPT_TX, "'", "''");
			COMP_CD2 = CTr.Replace(COMP_CD2, "'", "''");
			MODI_ID = CTr.Replace(MODI_ID, "'", "''");
			EXAM_DT = CTr.Replace(EXAM_DT, "'", "''");
			EXAM_SQ = CTr.Replace(EXAM_SQ, "'", "''");

			sql = "UPDATE ET_EXAM_ACPT SET ";
			sql += "  EEA_PSNL_NM = '" + PSNL_NM + "'";
			sql += ", EEA_CHART_NO = '" + CHART_NO + "'";
			sql += ", EEA_SEX_CD = '" + SEX_CD + "'";
			sql += ", EEA_PSNL_AGE = '" + PSNL_AGE + "'";
			sql += ", EEA_ZIP_CD = '" + ZIP_CD + "'";
			sql += ", EEA_ZIP_SQ = '" + ZIP_SQ + "'";
			sql += ", EEA_ZIP_AR = '" + ZIP_AR + "'";
			sql += ", EEA_ROAD_AR = '" + ROAD_AR + "'";
			sql += ", EEA_BLDG_NO = '" + BLDG_NO + "'";
			sql += ", EEA_TEL_NO = '" + TEL_NO + "'";
			sql += ", EEA_MOBL_NO = '" + MOBL_NO + "'";
			sql += ", EEA_EMAIL_AR = '" + EMAIL_AR + "'";
			sql += ", EEA_SEND_CD = '" + SEND_CD + "'";
			sql += ", EEA_SMS_YN = '" + SMS_YN + "'";
			sql += ", EEA_COMP_CD = '" + COMP_CD + "'";
			sql += ", EEA_DEPT_CD = '" + DEPT_CD + "'";
			sql += ", EEA_DEPT_NM = '" + DEPT_NM + "'";
			sql += ", EEA_DIVI_CD = '" + DIVI_CD + "'";
			sql += ", EEA_ENTRY_DT = '" + ENTRY_DT + "'";
			sql += ", EEA_DIVI_NO = '" + DIVI_NO + "'";
			sql += ", EEA_DIVI_CS = '" + DIVI_CS + "'";
			sql += ", EEA_FAMY_CD = '" + FAMY_CD + "'";
			sql += ", EEA_FAMY_NM = '" + FAMY_NM + "'";
			sql += ", EEA_FOOD_YN = '" + FOOD_YN + "'";
			sql += ", EEA_SALES_ID = '" + SALES_ID + "'";
			sql += ", EEA_EXEC_ID = '" + EXEC_ID + "'";
			sql += ", EEA_INSU_NO = '" + INSU_NO + "'";
			sql += ", EEA_INSU_CD = '" + INSU_CD + "'";
			sql += ", EEA_ENTY_CD = '" + ENTY_CD + "'";
			sql += ", EEA_ASSO_CD = '" + ASSO_CD + "'";
			sql += ", EEA_CNTR_CD = '" + CNTR_CD + "'";
			sql += ", EEA_ARMY_CD = '" + ARMY_CD + "'";
			sql += ", EEA_CANAD_YN = '" + CANAD_YN + "'";
			sql += ", EEA_CANAD_KD = '" + CANAD_KD + "'";
			sql += ", EEA_TOTAL_YN = '" + TOTAL_YN + "'";
			sql += ", EEA_ACPT_TX = '" + ACPT_TX + "'";
			sql += ", EEA_COMP_CD2 = '" + COMP_CD2 + "'";
			sql += ", EEA_MODI_ID = '" + MODI_ID + "'";
			sql += ", EEA_MODI_DTT = SYSDATE";
			sql += " WHERE EEA_EXAM_DT = '" + EXAM_DT + "'";
			sql += " AND EEA_EXAM_SQ = '" + EXAM_SQ + "'";

			argStmtExec.executeUpdate(sql);

		} catch (Exception e) {

			throw new FuncException(e.toString(), sql);
		}

		return sql;
	}
%>
