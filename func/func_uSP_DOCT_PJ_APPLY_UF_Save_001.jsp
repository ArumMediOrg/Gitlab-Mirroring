<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%!
	public String func_uSP_DOCT_PJ_APPLY_UF_Save_001(Statement argStmtExec, HashMap argHtMethod) throws Exception {

		String sql = "";
		String sql2 = "";
		String sql_disp = "";

		try {

			String GSMODE = (String) argHtMethod.get("GSMODE");
			String BKMK_CD = (String) argHtMethod.get("BKMK_CD");
			String BKMK_NM = (String) argHtMethod.get("BKMK_NM");
			String MATT_CD = (String) argHtMethod.get("MATT_CD");
			String ORGA_CD = (String) argHtMethod.get("ORGA_CD");
			String ORSU_CD = (String) argHtMethod.get("ORSU_CD");
			String PANJ_CD = (String) argHtMethod.get("PANJ_CD");
			String SOKY_CD = (String) argHtMethod.get("SOKY_CD");
			String SOKY_NM = (String) argHtMethod.get("SOKY_NM");
			String SOKY_TX = (String) argHtMethod.get("SOKY_TX");
			String JOCHI_CD = (String) argHtMethod.get("JOCHI_CD");
			String JOCHI_NM = (String) argHtMethod.get("JOCHI_NM");
			String JILH_CD = (String) argHtMethod.get("JILH_CD");
			String POSM1_CD = (String) argHtMethod.get("POSM1_CD");
			String POSM2_CD = (String) argHtMethod.get("POSM2_CD");
			String POSM3_CD = (String) argHtMethod.get("POSM3_CD");
			String POSM1_TX = (String) argHtMethod.get("POSM1_TX");
			String POSM2_TX = (String) argHtMethod.get("POSM2_TX");
			String POSM3_TX = (String) argHtMethod.get("POSM3_TX");
			String POSM1_DT = (String) argHtMethod.get("POSM1_DT");
			String POSM2_DT = (String) argHtMethod.get("POSM2_DT");
			String POSM3_DT = (String) argHtMethod.get("POSM3_DT");
			String BUSI_CD = (String) argHtMethod.get("BUSI_CD");
			String USER_ID = (String) argHtMethod.get("USER_ID");
			String USE_YN = (String) argHtMethod.get("USE_YN");

			//
			if(GSMODE == null) { GSMODE = ""; }
			if(BKMK_CD == null) { BKMK_CD = ""; }
			if(BKMK_NM == null) { BKMK_NM = ""; }
			if(MATT_CD == null) { MATT_CD = ""; }
			if(ORGA_CD == null) { ORGA_CD = ""; }
			if(ORSU_CD == null) { ORSU_CD = ""; }
			if(PANJ_CD == null) { PANJ_CD = ""; }
			if(SOKY_CD == null) { SOKY_CD = ""; }
			if(SOKY_NM == null) { SOKY_NM = ""; }
			if(SOKY_TX == null) { SOKY_TX = ""; }
			if(JOCHI_CD == null) { JOCHI_CD = ""; }
			if(JOCHI_NM == null) { JOCHI_NM = ""; }
			if(JILH_CD == null) { JILH_CD = ""; }
			if(POSM1_CD == null) { POSM1_CD = ""; }
			if(POSM2_CD == null) { POSM2_CD = ""; }
			if(POSM3_CD == null) { POSM3_CD = ""; }
			if(POSM1_TX == null) { POSM1_TX = ""; }
			if(POSM2_TX == null) { POSM2_TX = ""; }
			if(POSM3_TX == null) { POSM3_TX = ""; }
			if(POSM1_DT == null) { POSM1_DT = ""; }
			if(POSM2_DT == null) { POSM2_DT = ""; }
			if(POSM3_DT == null) { POSM3_DT = ""; }
			if(BUSI_CD == null) { BUSI_CD = ""; }
			if(USER_ID == null) { USER_ID = ""; }
			if(USE_YN == null) { USE_YN = ""; }

			//
			GSMODE = CTr.Replace(GSMODE, "'", "''");
			BKMK_CD = CTr.Replace(BKMK_CD, "'", "''");
			BKMK_NM = CTr.Replace(BKMK_NM, "'", "''");
			MATT_CD = CTr.Replace(MATT_CD, "'", "''");
			ORGA_CD = CTr.Replace(ORGA_CD, "'", "''");
			ORSU_CD = CTr.Replace(ORSU_CD, "'", "''");
			PANJ_CD = CTr.Replace(PANJ_CD, "'", "''");
			SOKY_CD = CTr.Replace(SOKY_CD, "'", "''");
			SOKY_NM = CTr.Replace(SOKY_NM, "'", "''");
			SOKY_TX = CTr.Replace(SOKY_TX, "'", "''");
			JOCHI_CD = CTr.Replace(JOCHI_CD, "'", "''");
			JOCHI_NM = CTr.Replace(JOCHI_NM, "'", "''");
			JILH_CD = CTr.Replace(JILH_CD, "'", "''");
			POSM1_CD = CTr.Replace(POSM1_CD, "'", "''");
			POSM2_CD = CTr.Replace(POSM2_CD, "'", "''");
			POSM3_CD = CTr.Replace(POSM3_CD, "'", "''");
			POSM1_TX = CTr.Replace(POSM1_TX, "'", "''");
			POSM2_TX = CTr.Replace(POSM2_TX, "'", "''");
			POSM3_TX = CTr.Replace(POSM3_TX, "'", "''");
			POSM1_DT = CTr.Replace(POSM1_DT, "'", "''");
			POSM2_DT = CTr.Replace(POSM2_DT, "'", "''");
			POSM3_DT = CTr.Replace(POSM3_DT, "'", "''");
			BUSI_CD = CTr.Replace(BUSI_CD, "'", "''");
			USER_ID = CTr.Replace(USER_ID, "'", "''");
			USE_YN = CTr.Replace(USE_YN, "'", "''");

			if(GSMODE.equals("INSERT")) {
				sql = "INSERT INTO ST_BOOKMARK_PANJ (SBP_BKMK_CD, SBP_BKMK_NM, SBP_MATT_CD, SBP_ORGA_CD, SBP_ORSU_CD, SBP_PANJ_CD, SBP_SOKY_CD, SBP_SOKY_NM, SBP_SOKY_TX, SBP_JOCHI_CD, SBP_JOCHI_NM, SBP_JILH_CD, SBP_POSM1_CD, SBP_POSM2_CD, SBP_POSM3_CD, SBP_POSM1_TX, SBP_POSM2_TX, SBP_POSM3_TX, SBP_POSM1_DT, SBP_POSM2_DT, SBP_POSM3_DT, SBP_BUSI_CD, SBP_INPT_ID, SBP_INPT_DTT, SBP_USE_YN) VALUES (";
				sql += "  '" + BKMK_CD + "'";
				sql += ", '" + BKMK_NM + "'";
				sql += ", '" + MATT_CD + "'";
				sql += ", '" + ORGA_CD + "'";
				sql += ", '" + ORSU_CD + "'";
				sql += ", '" + PANJ_CD + "'";
				sql += ", '" + SOKY_CD + "'";
				sql += ", '" + SOKY_NM + "'";
				sql += ", '" + SOKY_TX + "'";
				sql += ", '" + JOCHI_CD + "'";
				sql += ", '" + JOCHI_NM + "'";
				sql += ", '" + JILH_CD + "'";
				sql += ", '" + POSM1_CD + "'";
				sql += ", '" + POSM2_CD + "'";
				sql += ", '" + POSM3_CD + "'";
				sql += ", '" + POSM1_TX + "'";
				sql += ", '" + POSM2_TX + "'";
				sql += ", '" + POSM3_TX + "'";
				sql += ", '" + POSM1_DT + "'";
				sql += ", '" + POSM2_DT + "'";
				sql += ", '" + POSM3_DT + "'";
				sql += ", '" + BUSI_CD + "'";
				sql += ", '" + USER_ID + "'";
				sql += ", SYSDATE";
				sql += ", '" + USE_YN + "'";
				sql += ")";

				argStmtExec.executeUpdate(sql);
			}
			else {
				sql = "UPDATE ST_BOOKMARK_PANJ SET ";
				sql += "  SBP_BKMK_NM = '" + BKMK_NM + "'";
				sql += ", SBP_MATT_CD = '" + MATT_CD + "'";
				sql += ", SBP_ORGA_CD = '" + ORGA_CD + "'";
				sql += ", SBP_ORSU_CD = '" + ORSU_CD + "'";
				sql += ", SBP_PANJ_CD = '" + PANJ_CD + "'";
				sql += ", SBP_SOKY_CD = '" + SOKY_CD + "'";
				sql += ", SBP_SOKY_NM = '" + SOKY_NM + "'";
				sql += ", SBP_SOKY_TX = '" + SOKY_TX + "'";
				sql += ", SBP_JOCHI_CD = '" + JOCHI_CD + "'";
				sql += ", SBP_JOCHI_NM = '" + JOCHI_NM + "'";
				sql += ", SBP_JILH_CD = '" + JILH_CD + "'";
				sql += ", SBP_POSM1_CD = '" + POSM1_CD + "'";
				sql += ", SBP_POSM2_CD = '" + POSM2_CD + "'";
				sql += ", SBP_POSM3_CD = '" + POSM3_CD + "'";
				sql += ", SBP_POSM1_TX = '" + POSM1_TX + "'";
				sql += ", SBP_POSM2_TX = '" + POSM2_TX + "'";
				sql += ", SBP_POSM3_TX = '" + POSM3_TX + "'";
				sql += ", SBP_POSM1_DT = '" + POSM1_DT + "'";
				sql += ", SBP_POSM2_DT = '" + POSM2_DT + "'";
				sql += ", SBP_POSM3_DT = '" + POSM3_DT + "'";
				sql += ", SBP_BUSI_CD = '" + BUSI_CD + "'";
				sql += ", SBP_MODI_ID = '" + USER_ID + "'";
				sql += ", SBP_USE_YN = '" + USE_YN + "'";
				sql += ", SBP_MODI_DTT = SYSDATE";
				sql += " WHERE SBP_BKMK_CD = '" + BKMK_CD + "'";

				argStmtExec.executeUpdate(sql);
			}

		} catch (Exception e) {

			throw new FuncException(e.toString(), sql);
		}

		return sql;
	}
%>
