<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%!
	public String func_uSp_Health_Autopan_Set_Button2Click_001(Statement argStmtExec, HashMap argHtMethod) throws Exception {

		String sql = "";
		String sql2 = "";
		String sql_disp = "";

		try {

			String MRSLT_LOW = (String) argHtMethod.get("MRSLT_LOW");
			String MRSLT_HIGH = (String) argHtMethod.get("MRSLT_HIGH");
			String WRSLT_LOW = (String) argHtMethod.get("WRSLT_LOW");
			String WRSLT_HIGH = (String) argHtMethod.get("WRSLT_HIGH");
			String CHAR_VAL = (String) argHtMethod.get("CHAR_VAL");
			String MODI_ID = (String) argHtMethod.get("MODI_ID");
			String AUTO_CD = (String) argHtMethod.get("AUTO_CD");
			String SBCD_CD = (String) argHtMethod.get("SBCD_CD");

			//
			if(MRSLT_LOW == null) { MRSLT_LOW = ""; }
			if(MRSLT_HIGH == null) { MRSLT_HIGH = ""; }
			if(WRSLT_LOW == null) { WRSLT_LOW = ""; }
			if(WRSLT_HIGH == null) { WRSLT_HIGH = ""; }
			if(CHAR_VAL == null) { CHAR_VAL = ""; }
			if(MODI_ID == null) { MODI_ID = ""; }
			if(AUTO_CD == null) { AUTO_CD = ""; }
			if(SBCD_CD == null) { SBCD_CD = ""; }

			//
			MRSLT_LOW = CTr.Replace(MRSLT_LOW, "'", "''");
			MRSLT_HIGH = CTr.Replace(MRSLT_HIGH, "'", "''");
			WRSLT_LOW = CTr.Replace(WRSLT_LOW, "'", "''");
			WRSLT_HIGH = CTr.Replace(WRSLT_HIGH, "'", "''");
			CHAR_VAL = CTr.Replace(CHAR_VAL, "'", "''");
			MODI_ID = CTr.Replace(MODI_ID, "'", "''");
			AUTO_CD = CTr.Replace(AUTO_CD, "'", "''");
			SBCD_CD = CTr.Replace(SBCD_CD, "'", "''");

			sql = "DELETE SP_AUTO_ITEM";

			argStmtExec.executeUpdate(sql);

		} catch (Exception e) {

			throw new FuncException(e.toString(), sql);
		}

		return sql;
	}
%>
