<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%!
	public String func_uBusinessTrip_btnUpLoadClick_006_TRAN002(Statement argStmtExec, HashMap argHtMethod) throws Exception {

		String sql = "";
		String sql2 = "";
		String sql_disp = "";

		try {

			String PENL_ID = (String) argHtMethod.get("PENL_ID");
			String PENL_NM = (String) argHtMethod.get("PENL_NM");
			String SEX_KD = (String) argHtMethod.get("SEX_KD");
			String NTNA_CD = (String) argHtMethod.get("NTNA_CD");
			String COMP_CD = (String) argHtMethod.get("COMP_CD");
			String ENTR_DT = (String) argHtMethod.get("ENTR_DT");
			String TEL_NO = (String) argHtMethod.get("TEL_NO");
			String MOBL_NO = (String) argHtMethod.get("MOBL_NO");
			String EMAI_AR = (String) argHtMethod.get("EMAI_AR");
			String ADDR_KD = (String) argHtMethod.get("ADDR_KD");
			String ZIP_CD = (String) argHtMethod.get("ZIP_CD");
			String ZIP_SQ = (String) argHtMethod.get("ZIP_SQ");
			String ZIP_AR = (String) argHtMethod.get("ZIP_AR");
			String ROAD_AR = (String) argHtMethod.get("ROAD_AR");
			String BLDG_NO = (String) argHtMethod.get("BLDG_NO");
			String DIVI_NM = (String) argHtMethod.get("DIVI_NM");
			String DIVI_CS = (String) argHtMethod.get("DIVI_CS");
			String DIVI_KD = (String) argHtMethod.get("DIVI_KD");
			String DIVI_NO = (String) argHtMethod.get("DIVI_NO");
			String PID_EN = (String) argHtMethod.get("PID_EN");
			String NOTE_YN = (String) argHtMethod.get("NOTE_YN");
			String INFO_YN = (String) argHtMethod.get("INFO_YN");
			String INFORE_YN = (String) argHtMethod.get("INFORE_YN");
			String MODI_ID = (String) argHtMethod.get("MODI_ID");
			String MODI_DTT = (String) argHtMethod.get("MODI_DTT");
			String CUST_NO = (String) argHtMethod.get("CUST_NO");

			//
			if(PENL_ID == null) { PENL_ID = ""; }
			if(PENL_NM == null) { PENL_NM = ""; }
			if(SEX_KD == null) { SEX_KD = ""; }
			if(NTNA_CD == null) { NTNA_CD = ""; }
			if(COMP_CD == null) { COMP_CD = ""; }
			if(ENTR_DT == null) { ENTR_DT = ""; }
			if(TEL_NO == null) { TEL_NO = ""; }
			if(MOBL_NO == null) { MOBL_NO = ""; }
			if(EMAI_AR == null) { EMAI_AR = ""; }
			if(ADDR_KD == null) { ADDR_KD = ""; }
			if(ZIP_CD == null) { ZIP_CD = ""; }
			if(ZIP_SQ == null) { ZIP_SQ = ""; }
			if(ZIP_AR == null) { ZIP_AR = ""; }
			if(ROAD_AR == null) { ROAD_AR = ""; }
			if(BLDG_NO == null) { BLDG_NO = ""; }
			if(DIVI_NM == null) { DIVI_NM = ""; }
			if(DIVI_CS == null) { DIVI_CS = ""; }
			if(DIVI_KD == null) { DIVI_KD = ""; }
			if(DIVI_NO == null) { DIVI_NO = ""; }
			if(PID_EN == null) { PID_EN = ""; }
			if(NOTE_YN == null) { NOTE_YN = ""; }
			if(INFO_YN == null) { INFO_YN = ""; }
			if(INFORE_YN == null) { INFORE_YN = ""; }
			if(MODI_ID == null) { MODI_ID = ""; }
			if(MODI_DTT == null) { MODI_DTT = ""; }
			if(CUST_NO == null) { CUST_NO = ""; }

			//
			PENL_ID = CTr.Replace(PENL_ID, "'", "''");
			PENL_NM = CTr.Replace(PENL_NM, "'", "''");
			SEX_KD = CTr.Replace(SEX_KD, "'", "''");
			NTNA_CD = CTr.Replace(NTNA_CD, "'", "''");
			COMP_CD = CTr.Replace(COMP_CD, "'", "''");
			ENTR_DT = CTr.Replace(ENTR_DT, "'", "''");
			TEL_NO = CTr.Replace(TEL_NO, "'", "''");
			MOBL_NO = CTr.Replace(MOBL_NO, "'", "''");
			EMAI_AR = CTr.Replace(EMAI_AR, "'", "''");
			ADDR_KD = CTr.Replace(ADDR_KD, "'", "''");
			ZIP_CD = CTr.Replace(ZIP_CD, "'", "''");
			ZIP_SQ = CTr.Replace(ZIP_SQ, "'", "''");
			ZIP_AR = CTr.Replace(ZIP_AR, "'", "''");
			ROAD_AR = CTr.Replace(ROAD_AR, "'", "''");
			BLDG_NO = CTr.Replace(BLDG_NO, "'", "''");
			DIVI_NM = CTr.Replace(DIVI_NM, "'", "''");
			DIVI_CS = CTr.Replace(DIVI_CS, "'", "''");
			DIVI_KD = CTr.Replace(DIVI_KD, "'", "''");
			DIVI_NO = CTr.Replace(DIVI_NO, "'", "''");
			PID_EN = CTr.Replace(PID_EN, "'", "''");
			NOTE_YN = CTr.Replace(NOTE_YN, "'", "''");
			INFO_YN = CTr.Replace(INFO_YN, "'", "''");
			INFORE_YN = CTr.Replace(INFORE_YN, "'", "''");
			MODI_ID = CTr.Replace(MODI_ID, "'", "''");
			MODI_DTT = CTr.Replace(MODI_DTT, "'", "''");
			CUST_NO = CTr.Replace(CUST_NO, "'", "''");

			sql = "UPDATE IT_CUSTOMER SET ";
			sql += "  ICR_PENL_ID = '" + PENL_ID + "'";
			sql += ", ICR_PENL_NM = '" + PENL_NM + "'";
			sql += ", ICR_SEX_KD = '" + SEX_KD + "'";
			sql += ", ICR_NTNA_CD = '" + NTNA_CD + "'";
			sql += ", ICR_COMP_CD = '" + COMP_CD + "'";
			sql += ", ICR_ENTR_DT = '" + ENTR_DT + "'";
			sql += ", ICR_TEL_NO = '" + TEL_NO + "'";
			sql += ", ICR_MOBL_NO = '" + MOBL_NO + "'";
			sql += ", ICR_EMAI_AR = '" + EMAI_AR + "'";
			sql += ", ICR_ADDR_KD = '" + ADDR_KD + "'";
			sql += ", ICR_ZIP_CD = '" + ZIP_CD + "'";
			sql += ", ICR_ZIP_SQ = '" + ZIP_SQ + "'";
			sql += ", ICR_ZIP_AR = '" + ZIP_AR + "'";
			sql += ", ICR_ROAD_AR = '" + ROAD_AR + "'";
			sql += ", ICR_BLDG_NO = '" + BLDG_NO + "'";
			sql += ", ICR_DIVI_NM = '" + DIVI_NM + "'";
			sql += ", ICR_DIVI_CS = '" + DIVI_CS + "'";
			sql += ", ICR_DIVI_KD = '" + DIVI_KD + "'";
			sql += ", ICR_DIVI_NO = '" + DIVI_NO + "'";
			sql += ", ICR_PID_EN = '" + PID_EN + "'";
			sql += ", ICR_NOTE_YN = '" + NOTE_YN + "'";
			sql += ", ICR_INFO_YN = '" + INFO_YN + "'";
			sql += ", ICR_INFORE_YN = '" + INFORE_YN + "'";
			sql += ", ICR_MODI_ID = '" + MODI_ID + "'";
			sql += ", ICR_MODI_DTT = TO_DATE('" + MODI_DTT + "' , 'YYYY-MM-DD HH24:MI:SS')";
			sql += " WHERE ICR_CUST_NO = '" + CUST_NO + "'";

			argStmtExec.executeUpdate(sql);

		} catch (Exception e) {

			throw new FuncException(e.toString(), sql);
		}

		return sql;
	}
%>
