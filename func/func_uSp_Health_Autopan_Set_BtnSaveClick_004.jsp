<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%!
	public String func_uSp_Health_Autopan_Set_BtnSaveClick_004(Statement argStmtExec, HashMap argHtMethod) throws Exception {

		String sql = "";
		String sql2 = "";
		String sql_disp = "";

		try {

			String AUTO_CD = (String) argHtMethod.get("AUTO_CD");
			String ORGA_CD = (String) argHtMethod.get("ORGA_CD");
			String SBCD_CD = (String) argHtMethod.get("SBCD_CD");
			String MRSLT_LOW = (String) argHtMethod.get("MRSLT_LOW");
			String MRSLT_HIGH = (String) argHtMethod.get("MRSLT_HIGH");
			String WRSLT_LOW = (String) argHtMethod.get("WRSLT_LOW");
			String WRSLT_HIGH = (String) argHtMethod.get("WRSLT_HIGH");
			String CHAR_VAL = (String) argHtMethod.get("CHAR_VAL");
			String INPT_ID = (String) argHtMethod.get("INPT_ID");

			//
			if(AUTO_CD == null) { AUTO_CD = ""; }
			if(ORGA_CD == null) { ORGA_CD = ""; }
			if(SBCD_CD == null) { SBCD_CD = ""; }
			if(MRSLT_LOW == null) { MRSLT_LOW = ""; }
			if(MRSLT_HIGH == null) { MRSLT_HIGH = ""; }
			if(WRSLT_LOW == null) { WRSLT_LOW = ""; }
			if(WRSLT_HIGH == null) { WRSLT_HIGH = ""; }
			if(CHAR_VAL == null) { CHAR_VAL = ""; }
			if(INPT_ID == null) { INPT_ID = ""; }

			//
			AUTO_CD = CTr.Replace(AUTO_CD, "'", "''");
			ORGA_CD = CTr.Replace(ORGA_CD, "'", "''");
			SBCD_CD = CTr.Replace(SBCD_CD, "'", "''");
			MRSLT_LOW = CTr.Replace(MRSLT_LOW, "'", "''");
			MRSLT_HIGH = CTr.Replace(MRSLT_HIGH, "'", "''");
			WRSLT_LOW = CTr.Replace(WRSLT_LOW, "'", "''");
			WRSLT_HIGH = CTr.Replace(WRSLT_HIGH, "'", "''");
			CHAR_VAL = CTr.Replace(CHAR_VAL, "'", "''");
			INPT_ID = CTr.Replace(INPT_ID, "'", "''");

			sql = "INSERT INTO SP_AUTO_PANITEM (SPA_AUTO_CD, SPA_ORGA_CD, SPA_SBCD_CD, SPA_MRSLT_LOW, SPA_MRSLT_HIGH, SPA_WRSLT_LOW, SPA_WRSLT_HIGH, SPA_CHAR_VAL, SPA_USE_YN, SPA_INPT_ID, SPA_INPT_DTT) VALUES (";
			sql += "  '" + AUTO_CD + "'";
			sql += ", '" + ORGA_CD + "'";
			sql += ", '" + SBCD_CD + "'";
			sql += ", '" + MRSLT_LOW + "'";
			sql += ", '" + MRSLT_HIGH + "'";
			sql += ", '" + WRSLT_LOW + "'";
			sql += ", '" + WRSLT_HIGH + "'";
			sql += ", '" + CHAR_VAL + "'";
			sql += ", 'Y'";
			sql += ", '" + INPT_ID + "'";
			sql += ", SYSDATE";
			sql += ")";

			argStmtExec.executeUpdate(sql);

		} catch (Exception e) {

			throw new FuncException(e.toString(), sql);
		}

		return sql;
	}
%>
