<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%!
	public String func_uIT_Customer_re_Up_Modify_002(Statement argStmtExec, HashMap argHtMethod) throws Exception {

		String sql = "";
		String sql2 = "";
		String sql_disp = "";

		try {

			String PENL_ID = (String) argHtMethod.get("PENL_ID");
			String PENL_NM = (String) argHtMethod.get("PENL_NM");
			String MANA_KD = (String) argHtMethod.get("MANA_KD");
			String CUST_KD = (String) argHtMethod.get("CUST_KD");
			//String COMP_CD = (String) argHtMethod.get("COMP_CD");
			String NTNA_CD = (String) argHtMethod.get("NTNA_CD");
			String CHART_NO = (String) argHtMethod.get("CHART_NO");
			String SEX_KD = (String) argHtMethod.get("SEX_KD");
			//String ENTR_DT = (String) argHtMethod.get("ENTR_DT");
			String BIRH_KD = (String) argHtMethod.get("BIRH_KD");
			String BIRH_DT = (String) argHtMethod.get("BIRH_DT");
			String MARY_KD = (String) argHtMethod.get("MARY_KD");
			//String MARY_DT = (String) argHtMethod.get("MARY_DT");
			String TEL_NO = (String) argHtMethod.get("TEL_NO");
			String MOBL_NO = (String) argHtMethod.get("MOBL_NO");
			String EMAI_AR = (String) argHtMethod.get("EMAI_AR");
			String ADDR_KD = (String) argHtMethod.get("ADDR_KD");
			String ZIP_CD = (String) argHtMethod.get("ZIP_CD");
			String ZIP_SQ = (String) argHtMethod.get("ZIP_SQ");
			String ZIP_AR = (String) argHtMethod.get("ZIP_AR");
			String ROAD_AR = (String) argHtMethod.get("ROAD_AR");
			String PARE_NM = (String) argHtMethod.get("PARE_NM");
			String PARE_NO = (String) argHtMethod.get("PARE_NO");
			String INFO_YN = (String) argHtMethod.get("INFO_YN");
			String RECV_YN = (String) argHtMethod.get("RECV_YN");
			//String NOTE_YN = (String) argHtMethod.get("NOTE_YN");
			String CUST_TX = (String) argHtMethod.get("CUST_TX");
			String DIVI_NM = (String) argHtMethod.get("DIVI_NM");
			String DIVI_CS = (String) argHtMethod.get("DIVI_CS");
			//String DIVI_KD = (String) argHtMethod.get("DIVI_KD");
			String BLDG_NO = (String) argHtMethod.get("BLDG_NO");
			String CLSS_KD = (String) argHtMethod.get("CLSS_KD");
			String DIVI_NO = (String) argHtMethod.get("DIVI_NO");
			String PID_EN = (String) argHtMethod.get("PID_EN");
			String MODI_ID = (String) argHtMethod.get("MODI_ID");
			String CUST_NO = (String) argHtMethod.get("CUST_NO");
			String CPENL_NM = (String) argHtMethod.get("CPENL_NM");

			//
			if(PENL_ID == null) { PENL_ID = ""; }
			if(PENL_NM == null) { PENL_NM = ""; }
			if(MANA_KD == null) { MANA_KD = ""; }
			if(CUST_KD == null) { CUST_KD = ""; }
			//if(COMP_CD == null) { COMP_CD = ""; }
			if(NTNA_CD == null) { NTNA_CD = ""; }
			if(CHART_NO == null) { CHART_NO = ""; }
			if(SEX_KD == null) { SEX_KD = ""; }
			//if(ENTR_DT == null) { ENTR_DT = ""; }
			if(BIRH_KD == null) { BIRH_KD = ""; }
			if(BIRH_DT == null) { BIRH_DT = ""; }
			if(MARY_KD == null) { MARY_KD = ""; }
			//if(MARY_DT == null) { MARY_DT = ""; }
			if(TEL_NO == null) { TEL_NO = ""; }
			if(MOBL_NO == null) { MOBL_NO = ""; }
			if(EMAI_AR == null) { EMAI_AR = ""; }
			if(ADDR_KD == null) { ADDR_KD = ""; }
			if(ZIP_CD == null) { ZIP_CD = ""; }
			if(ZIP_SQ == null) { ZIP_SQ = ""; }
			if(ZIP_AR == null) { ZIP_AR = ""; }
			if(ROAD_AR == null) { ROAD_AR = ""; }
			if(PARE_NM == null) { PARE_NM = ""; }
			if(PARE_NO == null) { PARE_NO = ""; }
			if(INFO_YN == null) { INFO_YN = ""; }
			if(RECV_YN == null) { RECV_YN = ""; }
			//if(NOTE_YN == null) { NOTE_YN = ""; }
			if(CUST_TX == null) { CUST_TX = ""; }
			if(DIVI_NM == null) { DIVI_NM = ""; }
			if(DIVI_CS == null) { DIVI_CS = ""; }
			//if(DIVI_KD == null) { DIVI_KD = ""; }
			if(BLDG_NO == null) { BLDG_NO = ""; }
			if(CLSS_KD == null) { CLSS_KD = ""; }
			if(DIVI_NO == null) { DIVI_NO = ""; }
			if(PID_EN == null) { PID_EN = ""; }
			if(MODI_ID == null) { MODI_ID = ""; }
			if(CUST_NO == null) { CUST_NO = ""; }
			if(CPENL_NM == null) { CPENL_NM = ""; }

			//
			PENL_ID = CTr.Replace(PENL_ID, "'", "''");
			PENL_NM = CTr.Replace(PENL_NM, "'", "''");
			MANA_KD = CTr.Replace(MANA_KD, "'", "''");
			CUST_KD = CTr.Replace(CUST_KD, "'", "''");
			//COMP_CD = CTr.Replace(COMP_CD, "'", "''");
			NTNA_CD = CTr.Replace(NTNA_CD, "'", "''");
			CHART_NO = CTr.Replace(CHART_NO, "'", "''");
			SEX_KD = CTr.Replace(SEX_KD, "'", "''");
			//ENTR_DT = CTr.Replace(ENTR_DT, "'", "''");
			BIRH_KD = CTr.Replace(BIRH_KD, "'", "''");
			BIRH_DT = CTr.Replace(BIRH_DT, "'", "''");
			MARY_KD = CTr.Replace(MARY_KD, "'", "''");
			//MARY_DT = CTr.Replace(MARY_DT, "'", "''");
			TEL_NO = CTr.Replace(TEL_NO, "'", "''");
			MOBL_NO = CTr.Replace(MOBL_NO, "'", "''");
			EMAI_AR = CTr.Replace(EMAI_AR, "'", "''");
			ADDR_KD = CTr.Replace(ADDR_KD, "'", "''");
			ZIP_CD = CTr.Replace(ZIP_CD, "'", "''");
			ZIP_SQ = CTr.Replace(ZIP_SQ, "'", "''");
			ZIP_AR = CTr.Replace(ZIP_AR, "'", "''");
			ROAD_AR = CTr.Replace(ROAD_AR, "'", "''");
			PARE_NM = CTr.Replace(PARE_NM, "'", "''");
			PARE_NO = CTr.Replace(PARE_NO, "'", "''");
			INFO_YN = CTr.Replace(INFO_YN, "'", "''");
			RECV_YN = CTr.Replace(RECV_YN, "'", "''");
			//NOTE_YN = CTr.Replace(NOTE_YN, "'", "''");
			CUST_TX = CTr.Replace(CUST_TX, "'", "''");
			DIVI_NM = CTr.Replace(DIVI_NM, "'", "''");
			DIVI_CS = CTr.Replace(DIVI_CS, "'", "''");
			//DIVI_KD = CTr.Replace(DIVI_KD, "'", "''");
			BLDG_NO = CTr.Replace(BLDG_NO, "'", "''");
			CLSS_KD = CTr.Replace(CLSS_KD, "'", "''");
			DIVI_NO = CTr.Replace(DIVI_NO, "'", "''");
			PID_EN = CTr.Replace(PID_EN, "'", "''");
			MODI_ID = CTr.Replace(MODI_ID, "'", "''");
			CUST_NO = CTr.Replace(CUST_NO, "'", "''");
			CPENL_NM = CTr.Replace(CPENL_NM, "'", "''");

			sql = "UPDATE IT_CUSTOMER SET ";
			sql += "  ICR_PENL_ID = '" + PENL_ID + "'";
			sql += ", ICR_PENL_NM = '" + PENL_NM + "'";
			sql += ", ICR_CPENL_NM = '" + CPENL_NM + "'";
			sql += ", ICR_MANA_KD = '" + MANA_KD + "'";
			sql += ", ICR_CUST_KD = '" + CUST_KD + "'";
			sql += ", ICR_NTNA_CD = '" + NTNA_CD + "'";
			sql += ", ICR_CHART_NO= '" + CHART_NO + "'";
			sql += ", ICR_SEX_KD = '" + SEX_KD + "'";
			sql += ", ICR_BIRH_KD = '" + BIRH_KD + "'";
			sql += ", ICR_BIRH_DT = '" + BIRH_DT + "'";
			sql += ", ICR_MARY_KD = '" + MARY_KD + "'";
			sql += ", ICR_TEL_NO = '" + TEL_NO + "'";
			sql += ", ICR_MOBL_NO = '" + MOBL_NO + "'";
			sql += ", ICR_EMAI_AR = '" + EMAI_AR + "'";
			sql += ", ICR_ADDR_KD = '" + ADDR_KD + "'";
			sql += ", ICR_ZIP_CD = '" + ZIP_CD + "'";
			sql += ", ICR_ZIP_SQ = '" + ZIP_SQ + "'";
			sql += ", ICR_ZIP_AR = '" + ZIP_AR + "'";
			sql += ", ICR_ROAD_AR = '" + ROAD_AR + "'";
			sql += ", ICR_PARE_NM = '" + PARE_NM + "'";
			sql += ", ICR_PARE_NO = '" + PARE_NO + "'";
			sql += ", ICR_INFO_YN = '" + INFO_YN + "'";
			sql += ", ICR_RECV_YN = '" + RECV_YN + "'";
			sql += ", ICR_CUST_TX = '" + CUST_TX + "'";
			sql += ", ICR_DIVI_NM = '" + DIVI_NM + "'";
			sql += ", ICR_DIVI_CS = '" + DIVI_CS + "'";
			sql += ", ICR_BLDG_NO = '" + BLDG_NO + "'";
			sql += ", ICR_CLSS_KD = '" + CLSS_KD + "'";
			sql += ", ICR_DIVI_NO = '" + DIVI_NO + "'";
			sql += ", ICR_PID_EN = '" + PID_EN + "'";
			sql += ", ICR_MODI_ID = '" + MODI_ID + "'";
			sql += ", ICR_MODI_DTT = SYSDATE";
			sql += " WHERE ICR_CUST_NO = '" + CUST_NO + "'";

			argStmtExec.executeUpdate(sql);

		} catch (Exception e) {

			throw new FuncException(e.toString(), sql);
		}

		return sql;
	}
%>
