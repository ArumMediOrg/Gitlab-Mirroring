<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%!
	public String func_uSp_Health_Autopan_Set_Button4Click_002(Statement argStmtExec, HashMap argHtMethod) throws Exception {

		String sql = "";
		String sql2 = "";
		String sql_disp = "";

		try {

			String AUTO_CD = (String) argHtMethod.get("AUTO_CD");
			String ORGA_CD = (String) argHtMethod.get("ORGA_CD");
			String SOKY_CD = (String) argHtMethod.get("SOKY_CD");
			String JOCH_CD = (String) argHtMethod.get("JOCH_CD");
			String SOKY_TX = (String) argHtMethod.get("SOKY_TX");
			String JOCH_TX = (String) argHtMethod.get("JOCH_TX");
			String PANJ_CD = (String) argHtMethod.get("PANJ_CD");
			String BUSI_CD = (String) argHtMethod.get("BUSI_CD");
			String POSM1_CD = (String) argHtMethod.get("POSM1_CD");
			String SPCL_CD = (String) argHtMethod.get("SPCL_CD");
			String USE_YN = (String) argHtMethod.get("USE_YN");
			String INPT_ID = (String) argHtMethod.get("INPT_ID");
			String SWING_CD = (String) argHtMethod.get("SWING_CD");

			//
			if(AUTO_CD == null) { AUTO_CD = ""; }
			if(ORGA_CD == null) { ORGA_CD = ""; }
			if(SOKY_CD == null) { SOKY_CD = ""; }
			if(JOCH_CD == null) { JOCH_CD = ""; }
			if(SOKY_TX == null) { SOKY_TX = ""; }
			if(JOCH_TX == null) { JOCH_TX = ""; }
			if(PANJ_CD == null) { PANJ_CD = ""; }
			if(BUSI_CD == null) { BUSI_CD = ""; }
			if(POSM1_CD == null) { POSM1_CD = ""; }
			if(SPCL_CD == null) { SPCL_CD = ""; }
			if(USE_YN == null) { USE_YN = ""; }
			if(INPT_ID == null) { INPT_ID = ""; }
			if(SWING_CD == null) { SWING_CD = ""; }

			//
			AUTO_CD = CTr.Replace(AUTO_CD, "'", "''");
			ORGA_CD = CTr.Replace(ORGA_CD, "'", "''");
			SOKY_CD = CTr.Replace(SOKY_CD, "'", "''");
			JOCH_CD = CTr.Replace(JOCH_CD, "'", "''");
			SOKY_TX = CTr.Replace(SOKY_TX, "'", "''");
			JOCH_TX = CTr.Replace(JOCH_TX, "'", "''");
			PANJ_CD = CTr.Replace(PANJ_CD, "'", "''");
			BUSI_CD = CTr.Replace(BUSI_CD, "'", "''");
			POSM1_CD = CTr.Replace(POSM1_CD, "'", "''");
			SPCL_CD = CTr.Replace(SPCL_CD, "'", "''");
			USE_YN = CTr.Replace(USE_YN, "'", "''");
			INPT_ID = CTr.Replace(INPT_ID, "'", "''");
			SWING_CD = CTr.Replace(SWING_CD, "'", "''");

			sql = "INSERT INTO SP_AUTO_PAN (SPA_AUTO_CD, SPA_ORGA_CD, SPA_SOKY_CD, SPA_JOCH_CD, SPA_SOKY_TX, SPA_JOCH_TX, SPA_PANJ_CD, SPA_BUSI_CD, SPA_POSM1_CD, SPA_SPCL_CD, SPA_USE_YN, SPA_INPT_ID, SPA_SWING_CD) VALUES (";
			sql += "  '" + AUTO_CD + "'";
			sql += ", '" + ORGA_CD + "'";
			sql += ", '" + SOKY_CD + "'";
			sql += ", '" + JOCH_CD + "'";
			sql += ", '" + SOKY_TX + "'";
			sql += ", '" + JOCH_TX + "'";
			sql += ", '" + PANJ_CD + "'";
			sql += ", '" + BUSI_CD + "'";
			sql += ", '" + POSM1_CD + "'";
			sql += ", '" + SPCL_CD + "'";
			sql += ", '" + USE_YN + "'";
			sql += ", '" + INPT_ID + "'";
			sql += ", '" + SWING_CD + "'";
			sql += ")";

			argStmtExec.executeUpdate(sql);

		} catch (Exception e) {

			throw new FuncException(e.toString(), sql);
		}

		return sql;
	}
%>
