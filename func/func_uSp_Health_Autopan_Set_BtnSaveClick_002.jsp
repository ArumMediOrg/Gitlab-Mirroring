<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%!
	public String func_uSp_Health_Autopan_Set_BtnSaveClick_002(Statement argStmtExec, HashMap argHtMethod) throws Exception {

		String sql = "";
		String sql2 = "";
		String sql_disp = "";

		try {

			String SMODE = (String) argHtMethod.get("SMODE");
			String AUTO_CD = (String) argHtMethod.get("AUTO_CD");
			String ORGA_CD = (String) argHtMethod.get("ORGA_CD");
			String SOKY_CD = (String) argHtMethod.get("SOKY_CD");
			String JOCH_CD = (String) argHtMethod.get("JOCH_CD");
			String SOKY_TX = (String) argHtMethod.get("SOKY_TX");
			String JOCH_TX = (String) argHtMethod.get("JOCH_TX");
			String PANJ_CD = (String) argHtMethod.get("PANJ_CD");
			String ORSU_CD = (String) argHtMethod.get("ORSU_CD");
			String SADD_TX = (String) argHtMethod.get("SADD_TX");
			String BUSI_CD = (String) argHtMethod.get("BUSI_CD");
			String POSM1_CD = (String) argHtMethod.get("POSM1_CD");
			String POSM2_CD = (String) argHtMethod.get("POSM2_CD");
			String POSM3_CD = (String) argHtMethod.get("POSM3_CD");
			String BIGO_TX = (String) argHtMethod.get("BIGO_TX");
			String SPCL_CD = (String) argHtMethod.get("SPCL_CD");
			String USE_YN = (String) argHtMethod.get("USE_YN");
			String INPT_ID = (String) argHtMethod.get("INPT_ID");
			String SWING_CD = (String) argHtMethod.get("SWING_CD");
			String MODI_ID = (String) argHtMethod.get("MODI_ID");

			//
			if(SMODE == null) { SMODE = ""; }
			if(AUTO_CD == null) { AUTO_CD = ""; }
			if(ORGA_CD == null) { ORGA_CD = ""; }
			if(SOKY_CD == null) { SOKY_CD = ""; }
			if(JOCH_CD == null) { JOCH_CD = ""; }
			if(SOKY_TX == null) { SOKY_TX = ""; }
			if(JOCH_TX == null) { JOCH_TX = ""; }
			if(PANJ_CD == null) { PANJ_CD = ""; }
			if(ORSU_CD == null) { ORSU_CD = ""; }
			if(SADD_TX == null) { SADD_TX = ""; }
			if(BUSI_CD == null) { BUSI_CD = ""; }
			if(POSM1_CD == null) { POSM1_CD = ""; }
			if(POSM2_CD == null) { POSM2_CD = ""; }
			if(POSM3_CD == null) { POSM3_CD = ""; }
			if(BIGO_TX == null) { BIGO_TX = ""; }
			if(SPCL_CD == null) { SPCL_CD = ""; }
			if(USE_YN == null) { USE_YN = ""; }
			if(INPT_ID == null) { INPT_ID = ""; }
			if(SWING_CD == null) { SWING_CD = ""; }
			if(MODI_ID == null) { MODI_ID = ""; }

			//
			SMODE = CTr.Replace(SMODE, "'", "''");
			AUTO_CD = CTr.Replace(AUTO_CD, "'", "''");
			ORGA_CD = CTr.Replace(ORGA_CD, "'", "''");
			SOKY_CD = CTr.Replace(SOKY_CD, "'", "''");
			JOCH_CD = CTr.Replace(JOCH_CD, "'", "''");
			SOKY_TX = CTr.Replace(SOKY_TX, "'", "''");
			JOCH_TX = CTr.Replace(JOCH_TX, "'", "''");
			PANJ_CD = CTr.Replace(PANJ_CD, "'", "''");
			ORSU_CD = CTr.Replace(ORSU_CD, "'", "''");
			SADD_TX = CTr.Replace(SADD_TX, "'", "''");
			BUSI_CD = CTr.Replace(BUSI_CD, "'", "''");
			POSM1_CD = CTr.Replace(POSM1_CD, "'", "''");
			POSM2_CD = CTr.Replace(POSM2_CD, "'", "''");
			POSM3_CD = CTr.Replace(POSM3_CD, "'", "''");
			BIGO_TX = CTr.Replace(BIGO_TX, "'", "''");
			SPCL_CD = CTr.Replace(SPCL_CD, "'", "''");
			USE_YN = CTr.Replace(USE_YN, "'", "''");
			INPT_ID = CTr.Replace(INPT_ID, "'", "''");
			SWING_CD = CTr.Replace(SWING_CD, "'", "''");
			MODI_ID = CTr.Replace(MODI_ID, "'", "''");

			if(SMODE.equals("")) {
				sql = "INSERT INTO SP_AUTO_PAN (SPA_AUTO_CD, SPA_ORGA_CD, SPA_SOKY_CD, SPA_JOCH_CD, SPA_SOKY_TX, SPA_JOCH_TX, SPA_PANJ_CD, SPA_ORSU_CD, SPA_SADD_TX, SPA_BUSI_CD, SPA_POSM1_CD, SPA_POSM2_CD, SPA_POSM3_CD, SPA_BIGO_TX, SPA_SPCL_CD, SPA_USE_YN, SPA_INPT_ID, SPA_INPT_DTT, SPA_SWING_CD) VALUES (";
				sql += "  '" + AUTO_CD + "'";
				sql += ", '" + ORGA_CD + "'";
				sql += ", '" + SOKY_CD + "'";
				sql += ", '" + JOCH_CD + "'";
				sql += ", '" + SOKY_TX + "'";
				sql += ", '" + JOCH_TX + "'";
				sql += ", '" + PANJ_CD + "'";
				sql += ", '" + ORSU_CD + "'";
				sql += ", '" + SADD_TX + "'";
				sql += ", '" + BUSI_CD + "'";
				sql += ", '" + POSM1_CD + "'";
				sql += ", '" + POSM2_CD + "'";
				sql += ", '" + POSM3_CD + "'";
				sql += ", '" + BIGO_TX + "'";
				sql += ", '" + SPCL_CD + "'";
				sql += ", '" + USE_YN + "'";
				sql += ", '" + INPT_ID + "'";
				sql += ", SYSDATE";
				sql += ", '" + SWING_CD + "'";
				sql += ")";

				argStmtExec.executeUpdate(sql);
			}
			else {
				sql = "UPDATE SP_AUTO_PAN SET ";
				sql += "  SPA_SOKY_CD = '" + SOKY_CD + "'";
				sql += ", SPA_JOCH_CD = '" + JOCH_CD + "'";
				sql += ", SPA_SOKY_TX = '" + SOKY_TX + "'";
				sql += ", SPA_JOCH_TX = '" + JOCH_TX + "'";
				sql += ", SPA_PANJ_CD = '" + PANJ_CD + "'";
				sql += ", SPA_ORSU_CD = '" + ORSU_CD + "'";
				sql += ", SPA_SADD_TX = '" + SADD_TX + "'";
				sql += ", SPA_BUSI_CD = '" + BUSI_CD + "'";
				sql += ", SPA_POSM1_CD = '" + POSM1_CD + "'";
				sql += ", SPA_POSM2_CD = '" + POSM2_CD + "'";
				sql += ", SPA_POSM3_CD = '" + POSM3_CD + "'";
				sql += ", SPA_BIGO_TX = '" + BIGO_TX + "'";
				sql += ", SPA_SPCL_CD = '" + SPCL_CD + "'";
				sql += ", SPA_USE_YN = '" + USE_YN + "'";
				sql += ", SPA_MODI_ID = '" + MODI_ID + "'";
				sql += ", SPA_MODI_DTT = SYSDATE";
				sql += ", SPA_SWING_CD = '" + SWING_CD + "'";
				sql += " WHERE SPA_AUTO_CD = '" + AUTO_CD + "'";
				sql += " AND SPA_ORGA_CD = '" + ORGA_CD + "'";

				argStmtExec.executeUpdate(sql);
			}

		} catch (Exception e) {

			throw new FuncException(e.toString(), sql);
		}

		return sql;
	}
%>
