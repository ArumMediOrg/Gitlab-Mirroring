<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%!
	public String func_uIT_Hospital_Up_Insert_001(Statement argStmtExec, HashMap argHtMethod) throws Exception {

		String sql = "";
		String sql2 = "";
		String sql_disp = "";

		try {

			String HOSP_NO = (String) argHtMethod.get("HOSP_NO");
			String HOSP_NM = (String) argHtMethod.get("HOSP_NM");
			String BUSI_NO = (String) argHtMethod.get("BUSI_NO");
			String BUCO_NO = (String) argHtMethod.get("BUCO_NO");
			String BUCA_NO = (String) argHtMethod.get("BUCA_NO");
			String PRES_NM = (String) argHtMethod.get("PRES_NM");
			String ZIP_CD = (String) argHtMethod.get("ZIP_CD");
			String ZIP_AR = (String) argHtMethod.get("ZIP_AR");
			String ROAD_AR = (String) argHtMethod.get("ROAD_AR");
			String ASSO_NO = (String) argHtMethod.get("ASSO_NO");
			String ASSO_NM = (String) argHtMethod.get("ASSO_NM");
			String STAN_CD = (String) argHtMethod.get("STAN_CD");
			String HECK_CD = (String) argHtMethod.get("HECK_CD");
			String SYCK_CD = (String) argHtMethod.get("SYCK_CD");
			String SUCK_CD = (String) argHtMethod.get("SUCK_CD");
			String EOCK_CD = (String) argHtMethod.get("EOCK_CD");
			String EBCK_CD = (String) argHtMethod.get("EBCK_CD");
			String SACK_CD = (String) argHtMethod.get("SACK_CD");
			String GUCK_CD = (String) argHtMethod.get("GUCK_CD");
			String HYCK_CD = (String) argHtMethod.get("HYCK_CD");
			String SPCK_CD = (String) argHtMethod.get("SPCK_CD");
			String MACK_CD = (String) argHtMethod.get("MACK_CD");
			String BLCD_CD = (String) argHtMethod.get("BLCD_CD");
			String SECK_CD = (String) argHtMethod.get("SECK_CD");
			String BUSI_CD = (String) argHtMethod.get("BUSI_CD");
			String CHAR_YN = (String) argHtMethod.get("CHAR_YN");
			String SUBO_CD = (String) argHtMethod.get("SUBO_CD");
			String JTEL_NO = (String) argHtMethod.get("JTEL_NO");
			String HOSP_IMG = (String) argHtMethod.get("HOSP_IMG");
			String GTEL_NO = (String) argHtMethod.get("GTEL_NO");
			String STEL_NO = (String) argHtMethod.get("STEL_NO");
			String ACNU1_NO = (String) argHtMethod.get("ACNU1_NO");
			String ACNU2_NO = (String) argHtMethod.get("ACNU2_NO");
			String ACNU3_NO = (String) argHtMethod.get("ACNU3_NO");
			String INPT_ID = (String) argHtMethod.get("INPT_ID");
			String INPT_DTT = (String) argHtMethod.get("INPT_DTT");
			String MODI_ID = (String) argHtMethod.get("MODI_ID");
			String MODI_DTT = (String) argHtMethod.get("MODI_DTT");
			String HOSP_NO2 = (String) argHtMethod.get("HOSP_NO2");
			String HOSP_NM2 = (String) argHtMethod.get("HOSP_NM2");
			String DTTEL_NO = (String) argHtMethod.get("DTTEL_NO");
			String ZIP_CD2 = (String) argHtMethod.get("ZIP_CD2");
			String ZIP_AR2 = (String) argHtMethod.get("ZIP_AR2");
			String ROAD_AR2 = (String) argHtMethod.get("ROAD_AR2");
			String HOSP_IMG2 = (String) argHtMethod.get("HOSP_IMG2");
			String HOSP_CD = (String) argHtMethod.get("HOSP_CD");
			String NETDOWN_PATH = (String) argHtMethod.get("NETDOWN_PATH");

			//
			if(HOSP_NO == null) { HOSP_NO = ""; }
			if(HOSP_NM == null) { HOSP_NM = ""; }
			if(BUSI_NO == null) { BUSI_NO = ""; }
			if(BUCO_NO == null) { BUCO_NO = ""; }
			if(BUCA_NO == null) { BUCA_NO = ""; }
			if(PRES_NM == null) { PRES_NM = ""; }
			if(ZIP_CD == null) { ZIP_CD = ""; }
			if(ZIP_AR == null) { ZIP_AR = ""; }
			if(ROAD_AR == null) { ROAD_AR = ""; }
			if(ASSO_NO == null) { ASSO_NO = ""; }
			if(ASSO_NM == null) { ASSO_NM = ""; }
			if(STAN_CD == null) { STAN_CD = ""; }
			if(HECK_CD == null) { HECK_CD = ""; }
			if(SYCK_CD == null) { SYCK_CD = ""; }
			if(SUCK_CD == null) { SUCK_CD = ""; }
			if(EOCK_CD == null) { EOCK_CD = ""; }
			if(EBCK_CD == null) { EBCK_CD = ""; }
			if(SACK_CD == null) { SACK_CD = ""; }
			if(GUCK_CD == null) { GUCK_CD = ""; }
			if(HYCK_CD == null) { HYCK_CD = ""; }
			if(SPCK_CD == null) { SPCK_CD = ""; }
			if(MACK_CD == null) { MACK_CD = ""; }
			if(BLCD_CD == null) { BLCD_CD = ""; }
			if(SECK_CD == null) { SECK_CD = ""; }
			if(BUSI_CD == null) { BUSI_CD = ""; }
			if(CHAR_YN == null) { CHAR_YN = ""; }
			if(SUBO_CD == null) { SUBO_CD = ""; }
			if(JTEL_NO == null) { JTEL_NO = ""; }
			if(HOSP_IMG == null) { HOSP_IMG = ""; }
			if(GTEL_NO == null) { GTEL_NO = ""; }
			if(STEL_NO == null) { STEL_NO = ""; }
			if(ACNU1_NO == null) { ACNU1_NO = ""; }
			if(ACNU2_NO == null) { ACNU2_NO = ""; }
			if(ACNU3_NO == null) { ACNU3_NO = ""; }
			if(INPT_ID == null) { INPT_ID = ""; }
			if(INPT_DTT == null) { INPT_DTT = ""; }
			if(MODI_ID == null) { MODI_ID = ""; }
			if(MODI_DTT == null) { MODI_DTT = ""; }
			if(HOSP_NO2 == null) { HOSP_NO2 = ""; }
			if(HOSP_NM2 == null) { HOSP_NM2 = ""; }
			if(DTTEL_NO == null) { DTTEL_NO = ""; }
			if(ZIP_CD2 == null) { ZIP_CD2 = ""; }
			if(ZIP_AR2 == null) { ZIP_AR2 = ""; }
			if(ROAD_AR2 == null) { ROAD_AR2 = ""; }
			if(HOSP_IMG2 == null) { HOSP_IMG2 = ""; }
			if(HOSP_CD == null) { HOSP_CD = ""; }
			if(NETDOWN_PATH == null) { NETDOWN_PATH = ""; }

			//
			HOSP_NO = CTr.Replace(HOSP_NO, "'", "''");
			HOSP_NM = CTr.Replace(HOSP_NM, "'", "''");
			BUSI_NO = CTr.Replace(BUSI_NO, "'", "''");
			BUCO_NO = CTr.Replace(BUCO_NO, "'", "''");
			BUCA_NO = CTr.Replace(BUCA_NO, "'", "''");
			PRES_NM = CTr.Replace(PRES_NM, "'", "''");
			ZIP_CD = CTr.Replace(ZIP_CD, "'", "''");
			ZIP_AR = CTr.Replace(ZIP_AR, "'", "''");
			ROAD_AR = CTr.Replace(ROAD_AR, "'", "''");
			ASSO_NO = CTr.Replace(ASSO_NO, "'", "''");
			ASSO_NM = CTr.Replace(ASSO_NM, "'", "''");
			STAN_CD = CTr.Replace(STAN_CD, "'", "''");
			HECK_CD = CTr.Replace(HECK_CD, "'", "''");
			SYCK_CD = CTr.Replace(SYCK_CD, "'", "''");
			SUCK_CD = CTr.Replace(SUCK_CD, "'", "''");
			EOCK_CD = CTr.Replace(EOCK_CD, "'", "''");
			EBCK_CD = CTr.Replace(EBCK_CD, "'", "''");
			SACK_CD = CTr.Replace(SACK_CD, "'", "''");
			GUCK_CD = CTr.Replace(GUCK_CD, "'", "''");
			HYCK_CD = CTr.Replace(HYCK_CD, "'", "''");
			SPCK_CD = CTr.Replace(SPCK_CD, "'", "''");
			MACK_CD = CTr.Replace(MACK_CD, "'", "''");
			BLCD_CD = CTr.Replace(BLCD_CD, "'", "''");
			SECK_CD = CTr.Replace(SECK_CD, "'", "''");
			BUSI_CD = CTr.Replace(BUSI_CD, "'", "''");
			CHAR_YN = CTr.Replace(CHAR_YN, "'", "''");
			SUBO_CD = CTr.Replace(SUBO_CD, "'", "''");
			JTEL_NO = CTr.Replace(JTEL_NO, "'", "''");
			HOSP_IMG = CTr.Replace(HOSP_IMG, "'", "''");
			GTEL_NO = CTr.Replace(GTEL_NO, "'", "''");
			STEL_NO = CTr.Replace(STEL_NO, "'", "''");
			ACNU1_NO = CTr.Replace(ACNU1_NO, "'", "''");
			ACNU2_NO = CTr.Replace(ACNU2_NO, "'", "''");
			ACNU3_NO = CTr.Replace(ACNU3_NO, "'", "''");
			INPT_ID = CTr.Replace(INPT_ID, "'", "''");
			INPT_DTT = CTr.Replace(INPT_DTT, "'", "''");
			MODI_ID = CTr.Replace(MODI_ID, "'", "''");
			MODI_DTT = CTr.Replace(MODI_DTT, "'", "''");
			HOSP_NO2 = CTr.Replace(HOSP_NO2, "'", "''");
			HOSP_NM2 = CTr.Replace(HOSP_NM2, "'", "''");
			DTTEL_NO = CTr.Replace(DTTEL_NO, "'", "''");
			ZIP_CD2 = CTr.Replace(ZIP_CD2, "'", "''");
			ZIP_AR2 = CTr.Replace(ZIP_AR2, "'", "''");
			ROAD_AR2 = CTr.Replace(ROAD_AR2, "'", "''");
			HOSP_IMG2 = CTr.Replace(HOSP_IMG2, "'", "''");
			HOSP_CD = CTr.Replace(HOSP_CD, "'", "''");
			NETDOWN_PATH = CTr.Replace(NETDOWN_PATH, "'", "''");

			sql = "INSERT INTO IT_HOSPITAL( IHL_HOSP_NO, IHL_HOSP_NM, IHL_BUSI_NO, IHL_BUCO_NO, IHL_BUCA_NO, IHL_PRES_NM, IHL_ZIP_CD, IHL_ZIP_AR, IHL_ROAD_AR, IHL_ASSO_NO, IHL_ASSO_NM, IHL_STAN_CD, IHL_HECK_CD, IHL_SYCK_CD, IHL_SUCK_CD, IHL_EOCK_CD, IHL_EBCK_CD, IHL_SACK_CD, IHL_GUCK_CD, IHL_HYCK_CD, IHL_SPCK_CD , IHL_MACK_CD, IHL_BLCK_CD, IHL_SECK_CD, IHL_BUSI_CD, IHL_CHAR_YN, IHL_SUBO_CD, IHL_JTEL_NO, IHL_HOSP_IMG, IHL_GTEL_NO, IHL_STEL_NO, IHL_ACNU1_NO,IHL_ACNU2_NO,IHL_ACNU3_NO,IHL_INPT_ID, IHL_INPT_DTT, IHL_MODI_ID, IHL_MODI_DTT, IHL_HOSP_NO2,IHL_HOSP_NM2,IHL_DTTEL_NO,IHL_ZIP_CD2, IHL_ZIP_AR2, IHL_ROAD_AR2,IHL_HOSP_IMG2, IHL_HOSP_CD, NETDOWN_PATH) VALUES (";
			sql += "  '" + HOSP_NO + "'";
			sql += ", '" + HOSP_NM + "'";
			sql += ", '" + BUSI_NO + "'";
			sql += ", '" + BUCO_NO + "'";
			sql += ", '" + BUCA_NO + "'";
			sql += ", '" + PRES_NM + "'";
			sql += ", '" + ZIP_CD + "'";
			sql += ", '" + ZIP_AR + "'";
			sql += ", '" + ROAD_AR + "'";
			sql += ", '" + ASSO_NO + "'";
			sql += ", '" + ASSO_NM + "'";
			sql += ", '" + STAN_CD + "'";
			sql += ", '" + HECK_CD + "'";
			sql += ", '" + SYCK_CD + "'";
			sql += ", '" + SUCK_CD + "'";
			sql += ", '" + EOCK_CD + "'";
			sql += ", '" + EBCK_CD + "'";
			sql += ", '" + SACK_CD + "'";
			sql += ", '" + GUCK_CD + "'";
			sql += ", '" + HYCK_CD + "'";
			sql += ", '" + SPCK_CD + "'";
			sql += ", '" + MACK_CD + "'";
			sql += ", '" + BLCD_CD + "'";
			sql += ", '" + SECK_CD + "'";
			sql += ", '" + BUSI_CD + "'";
			sql += ", '" + CHAR_YN + "'";
			sql += ", '" + SUBO_CD + "'";
			sql += ", '" + JTEL_NO + "'";
			sql += ", '" + HOSP_IMG + "'";
			sql += ", '" + GTEL_NO + "'";
			sql += ", '" + STEL_NO + "'";
			sql += ", '" + ACNU1_NO + "'";
			sql += ", '" + ACNU2_NO + "'";
			sql += ", '" + ACNU3_NO + "'";
			sql += ", '" + INPT_ID + "'";
			sql += ", '" + INPT_DTT + "'";
			sql += ", '" + MODI_ID + "'";
			sql += ", '" + MODI_DTT + "'";
			sql += ", '" + HOSP_NO2 + "'";
			sql += ", '" + HOSP_NM2 + "'";
			sql += ", '" + DTTEL_NO + "'";
			sql += ", '" + ZIP_CD2 + "'";
			sql += ", '" + ZIP_AR2 + "'";
			sql += ", '" + ROAD_AR2 + "'";
			sql += ", '" + HOSP_IMG2 + "'";
			sql += ", '" + HOSP_CD + "'";
			sql += ", '" + NETDOWN_PATH + "'";
			sql += ")";

			argStmtExec.executeUpdate(sql);

		} catch (Exception e) {

			throw new FuncException(e.toString(), sql);
		}

		return sql;
	}
%>
