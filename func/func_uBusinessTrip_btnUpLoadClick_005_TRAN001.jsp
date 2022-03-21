<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%!
	public String func_uBusinessTrip_btnUpLoadClick_005_TRAN001(Statement argStmtExec, HashMap argHtMethod) throws Exception {

		String sql = "";
		String sql2 = "";
		String sql_disp = "";

		try {

			String CUST_NO = (String) argHtMethod.get("CUST_NO");
			String PENL_ID = (String) argHtMethod.get("PENL_ID");
			String PENL_NM = (String) argHtMethod.get("PENL_NM");
			String SEX_KD = (String) argHtMethod.get("SEX_KD");
			String MANA_KD = (String) argHtMethod.get("MANA_KD");
			String CUST_KD = (String) argHtMethod.get("CUST_KD");
			String NTNA_CD = (String) argHtMethod.get("NTNA_CD");
			String COMP_CD = (String) argHtMethod.get("COMP_CD");
			String ENTR_DT = (String) argHtMethod.get("ENTR_DT");
			String BIRH_KD = (String) argHtMethod.get("BIRH_KD");
			String BIRH_DT = (String) argHtMethod.get("BIRH_DT");
			String MARY_KD = (String) argHtMethod.get("MARY_KD");
			String MARY_DT = (String) argHtMethod.get("MARY_DT");
			String TEL_NO = (String) argHtMethod.get("TEL_NO");
			String MOBL_NO = (String) argHtMethod.get("MOBL_NO");
			String ADDR_KD = (String) argHtMethod.get("ADDR_KD");
			String ZIP_CD = (String) argHtMethod.get("ZIP_CD");
			String ZIP_SQ = (String) argHtMethod.get("ZIP_SQ");
			String ZIP_AR = (String) argHtMethod.get("ZIP_AR");
			String ROAD_AR = (String) argHtMethod.get("ROAD_AR");
			String BLDG_NO = (String) argHtMethod.get("BLDG_NO");
			String DIVI_NM = (String) argHtMethod.get("DIVI_NM");
			String DIVI_CS = (String) argHtMethod.get("DIVI_CS");
			String DIVI_KD = (String) argHtMethod.get("DIVI_KD");
			String INFO_YN = (String) argHtMethod.get("INFO_YN");
			String INFORE_YN = (String) argHtMethod.get("INFORE_YN");
			String DIVI_NO = (String) argHtMethod.get("DIVI_NO");
			String NOTE_YN = (String) argHtMethod.get("NOTE_YN");
			String EMAI_AR = (String) argHtMethod.get("EMAI_AR");
			String PID_EN = (String) argHtMethod.get("PID_EN");
			String USE_YN = (String) argHtMethod.get("USE_YN");
			String MODI_ID = (String) argHtMethod.get("MODI_ID");
			String INPT_DTT = (String) argHtMethod.get("INPT_DTT");
			String MODI_DTT = (String) argHtMethod.get("MODI_DTT");

			//
			if(CUST_NO == null) { CUST_NO = ""; }
			if(PENL_ID == null) { PENL_ID = ""; }
			if(PENL_NM == null) { PENL_NM = ""; }
			if(SEX_KD == null) { SEX_KD = ""; }
			if(MANA_KD == null) { MANA_KD = ""; }
			if(CUST_KD == null) { CUST_KD = ""; }
			if(NTNA_CD == null) { NTNA_CD = ""; }
			if(COMP_CD == null) { COMP_CD = ""; }
			if(ENTR_DT == null) { ENTR_DT = ""; }
			if(BIRH_KD == null) { BIRH_KD = ""; }
			if(BIRH_DT == null) { BIRH_DT = ""; }
			if(MARY_KD == null) { MARY_KD = ""; }
			if(MARY_DT == null) { MARY_DT = ""; }
			if(TEL_NO == null) { TEL_NO = ""; }
			if(MOBL_NO == null) { MOBL_NO = ""; }
			if(ADDR_KD == null) { ADDR_KD = ""; }
			if(ZIP_CD == null) { ZIP_CD = ""; }
			if(ZIP_SQ == null) { ZIP_SQ = ""; }
			if(ZIP_AR == null) { ZIP_AR = ""; }
			if(ROAD_AR == null) { ROAD_AR = ""; }
			if(BLDG_NO == null) { BLDG_NO = ""; }
			if(DIVI_NM == null) { DIVI_NM = ""; }
			if(DIVI_CS == null) { DIVI_CS = ""; }
			if(DIVI_KD == null) { DIVI_KD = ""; }
			if(INFO_YN == null) { INFO_YN = ""; }
			if(INFORE_YN == null) { INFORE_YN = ""; }
			if(DIVI_NO == null) { DIVI_NO = ""; }
			if(NOTE_YN == null) { NOTE_YN = ""; }
			if(EMAI_AR == null) { EMAI_AR = ""; }
			if(PID_EN == null) { PID_EN = ""; }
			if(USE_YN == null) { USE_YN = ""; }
			if(MODI_ID == null) { MODI_ID = ""; }
			if(INPT_DTT == null) { INPT_DTT = ""; }
			if(MODI_DTT == null) { MODI_DTT = ""; }

			//
			CUST_NO = CTr.Replace(CUST_NO, "'", "''");
			PENL_ID = CTr.Replace(PENL_ID, "'", "''");
			PENL_NM = CTr.Replace(PENL_NM, "'", "''");
			SEX_KD = CTr.Replace(SEX_KD, "'", "''");
			MANA_KD = CTr.Replace(MANA_KD, "'", "''");
			CUST_KD = CTr.Replace(CUST_KD, "'", "''");
			NTNA_CD = CTr.Replace(NTNA_CD, "'", "''");
			COMP_CD = CTr.Replace(COMP_CD, "'", "''");
			ENTR_DT = CTr.Replace(ENTR_DT, "'", "''");
			BIRH_KD = CTr.Replace(BIRH_KD, "'", "''");
			BIRH_DT = CTr.Replace(BIRH_DT, "'", "''");
			MARY_KD = CTr.Replace(MARY_KD, "'", "''");
			MARY_DT = CTr.Replace(MARY_DT, "'", "''");
			TEL_NO = CTr.Replace(TEL_NO, "'", "''");
			MOBL_NO = CTr.Replace(MOBL_NO, "'", "''");
			ADDR_KD = CTr.Replace(ADDR_KD, "'", "''");
			ZIP_CD = CTr.Replace(ZIP_CD, "'", "''");
			ZIP_SQ = CTr.Replace(ZIP_SQ, "'", "''");
			ZIP_AR = CTr.Replace(ZIP_AR, "'", "''");
			ROAD_AR = CTr.Replace(ROAD_AR, "'", "''");
			BLDG_NO = CTr.Replace(BLDG_NO, "'", "''");
			DIVI_NM = CTr.Replace(DIVI_NM, "'", "''");
			DIVI_CS = CTr.Replace(DIVI_CS, "'", "''");
			DIVI_KD = CTr.Replace(DIVI_KD, "'", "''");
			INFO_YN = CTr.Replace(INFO_YN, "'", "''");
			INFORE_YN = CTr.Replace(INFORE_YN, "'", "''");
			DIVI_NO = CTr.Replace(DIVI_NO, "'", "''");
			NOTE_YN = CTr.Replace(NOTE_YN, "'", "''");
			EMAI_AR = CTr.Replace(EMAI_AR, "'", "''");
			PID_EN = CTr.Replace(PID_EN, "'", "''");
			USE_YN = CTr.Replace(USE_YN, "'", "''");
			MODI_ID = CTr.Replace(MODI_ID, "'", "''");
			INPT_DTT = CTr.Replace(INPT_DTT, "'", "''");
			MODI_DTT = CTr.Replace(MODI_DTT, "'", "''");

			sql = "INSERT INTO IT_CUSTOMER (ICR_CUST_NO, ICR_PENL_ID, ICR_PENL_SQ, ICR_PENL_NM, ICR_SEX_KD, ICR_MANA_KD, ICR_CUST_KD, ICR_NTNA_CD, ICR_COMP_CD, ICR_ENTR_DT, ICR_BIRH_KD, ICR_BIRH_DT, ICR_MARY_KD, ICR_MARY_DT, ICR_TEL_NO, ICR_MOBL_NO, ICR_ADDR_KD, ICR_ZIP_CD, ICR_ZIP_SQ, ICR_ZIP_AR, ICR_ROAD_AR, ICR_BLDG_NO, ICR_DIVI_NM, ICR_DIVI_CS, ICR_DIVI_KD, ICR_INFO_YN, ICR_INFORE_YN, ICR_DIVI_NO, ICR_NOTE_YN, ICR_EMAI_AR, ICR_PID_EN, ICR_USE_YN, ICR_INPT_ID, ICR_MODI_ID, ICR_INPT_DTT, ICR_MODI_DTT) VALUES (";
			sql += "  '" + CUST_NO + "'";
			sql += ", '" + PENL_ID + "'";
			sql += ", '0'";
			sql += ", '" + PENL_NM + "'";
			sql += ", '" + SEX_KD + "'";
			sql += ", '" + MANA_KD + "'";
			sql += ", '" + CUST_KD + "'";
			sql += ", '" + NTNA_CD + "'";
			sql += ", '" + COMP_CD + "'";
			sql += ", '" + ENTR_DT + "'";
			sql += ", '" + BIRH_KD + "'";
			sql += ", '" + BIRH_DT + "'";
			sql += ", '" + MARY_KD + "'";
			sql += ", '" + MARY_DT + "'";
			sql += ", '" + TEL_NO + "'";
			sql += ", '" + MOBL_NO + "'";
			sql += ", '" + ADDR_KD + "'";
			sql += ", '" + ZIP_CD + "'";
			sql += ", '" + ZIP_SQ + "'";
			sql += ", '" + ZIP_AR + "'";
			sql += ", '" + ROAD_AR + "'";
			sql += ", '" + BLDG_NO + "'";
			sql += ", '" + DIVI_NM + "'";
			sql += ", '" + DIVI_CS + "'";
			sql += ", '" + DIVI_KD + "'";
			sql += ", '" + INFO_YN + "'";
			sql += ", '" + INFORE_YN + "'";
			sql += ", '" + DIVI_NO + "'";
			sql += ", '" + NOTE_YN + "'";
			sql += ", '" + EMAI_AR + "'";
			sql += ", '" + PID_EN + "'";
			sql += ", '" + USE_YN + "'";
			sql += ", '출장접수'";
			sql += ", '" + MODI_ID + "'";
			sql += ", TO_DATE('" + INPT_DTT + "'";
			sql += ", 'YYYY-MM-DD HH24:MI:SS')";
			sql += ", TO_DATE('" + MODI_DTT + "', 'YYYY-MM-DD HH24:MI:SS'))";

			argStmtExec.executeUpdate(sql);
		} catch (Exception e) {

			throw new FuncException(e.toString(), sql);
		}

		return sql;
	}
%>
