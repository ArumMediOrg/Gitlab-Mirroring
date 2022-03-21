<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%!
	public String func_uStdt_AcptO_btnInjkSaveClick_001(Statement argStmtExec, HashMap argHtMethod) throws Exception {

		String sql = "";
		String sql2 = "";
		String sql_disp = "";

		try {

			String PSNL_NM = (String) argHtMethod.get("PSNL_NM");
			String PLCE_CD = (String) argHtMethod.get("PLCE_CD");
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
			String COMP_CD = (String) argHtMethod.get("COMP_CD");
			String COTK_CD = (String) argHtMethod.get("COTK_CD");
			String FOOD_YN = (String) argHtMethod.get("FOOD_YN");
			String SALES_ID = (String) argHtMethod.get("SALES_ID");
			String FAMY_NM = (String) argHtMethod.get("FAMY_NM");
			String ARMY_CD = (String) argHtMethod.get("ARMY_CD");
			String INSU_NO = (String) argHtMethod.get("INSU_NO");
			String INSU_CD = (String) argHtMethod.get("INSU_CD");
			String ENTY_CD = (String) argHtMethod.get("ENTY_CD");
			String NHIC_TX = (String) argHtMethod.get("NHIC_TX");
			String ACPT_TX = (String) argHtMethod.get("ACPT_TX");
			String MODI_ID = (String) argHtMethod.get("MODI_ID");
			String EXAM_DT = (String) argHtMethod.get("EXAM_DT");
			String EXAM_SQ = (String) argHtMethod.get("EXAM_SQ");

			//
			if(PSNL_NM == null) { PSNL_NM = ""; }
			if(PLCE_CD == null) { PLCE_CD = ""; }
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
			if(COMP_CD == null) { COMP_CD = ""; }
			if(COTK_CD == null) { COTK_CD = ""; }
			if(FOOD_YN == null) { FOOD_YN = ""; }
			if(SALES_ID == null) { SALES_ID = ""; }
			if(FAMY_NM == null) { FAMY_NM = ""; }
			if(ARMY_CD == null) { ARMY_CD = ""; }
			if(INSU_NO == null) { INSU_NO = ""; }
			if(INSU_CD == null) { INSU_CD = ""; }
			if(ENTY_CD == null) { ENTY_CD = ""; }
			if(NHIC_TX == null) { NHIC_TX = ""; }
			if(ACPT_TX == null) { ACPT_TX = ""; }
			if(MODI_ID == null) { MODI_ID = ""; }
			if(EXAM_DT == null) { EXAM_DT = ""; }
			if(EXAM_SQ == null) { EXAM_SQ = ""; }

			//
			PSNL_NM = CTr.Replace(PSNL_NM, "'", "''");
			PLCE_CD = CTr.Replace(PLCE_CD, "'", "''");
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
			COMP_CD = CTr.Replace(COMP_CD, "'", "''");
			COTK_CD = CTr.Replace(COTK_CD, "'", "''");
			FOOD_YN = CTr.Replace(FOOD_YN, "'", "''");
			SALES_ID = CTr.Replace(SALES_ID, "'", "''");
			FAMY_NM = CTr.Replace(FAMY_NM, "'", "''");
			ARMY_CD = CTr.Replace(ARMY_CD, "'", "''");
			INSU_NO = CTr.Replace(INSU_NO, "'", "''");
			INSU_CD = CTr.Replace(INSU_CD, "'", "''");
			ENTY_CD = CTr.Replace(ENTY_CD, "'", "''");
			NHIC_TX = CTr.Replace(NHIC_TX, "'", "''");
			ACPT_TX = CTr.Replace(ACPT_TX, "'", "''");
			MODI_ID = CTr.Replace(MODI_ID, "'", "''");
			EXAM_DT = CTr.Replace(EXAM_DT, "'", "''");
			EXAM_SQ = CTr.Replace(EXAM_SQ, "'", "''");

			sql = "UPDATE ET_EXAM_ACPT SET ";
			sql += "  EEA_PSNL_NM = '" + PSNL_NM + "'";
			sql += ", EEA_PLCE_CD = '" + PLCE_CD + "'";
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
			sql += ", EEA_COMP_CD = '" + COMP_CD + "'";
			sql += ", EEA_COTK_CD = '" + COTK_CD + "'";
			sql += ", EEA_FOOD_YN = '" + FOOD_YN + "'";
			sql += ", EEA_SALES_ID = '" + SALES_ID + "'";
			sql += ", EEA_FAMY_NM = '" + FAMY_NM + "'";
			sql += ", EEA_ARMY_CD = '" + ARMY_CD + "'";
			sql += ", EEA_INSU_NO = '" + INSU_NO + "'";
			sql += ", EEA_INSU_CD = '" + INSU_CD + "'";
			sql += ", EEA_ENTY_CD = '" + ENTY_CD + "'";
			sql += ", EEA_NHIC_TX = '" + NHIC_TX + "'";
			sql += ", EEA_ACPT_TX = '" + ACPT_TX + "'";
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
