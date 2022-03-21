<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%!
	public String func_uSp_Health_Autopan_Set_Button4Click_001(Statement argStmtExec, HashMap argHtMethod) throws Exception {

		String sql = "";
		String sql2 = "";
		String sql_disp = "";

		try {

			String ORGA_CD = (String) argHtMethod.get("ORGA_CD");
			String SBCD_CD = (String) argHtMethod.get("SBCD_CD");
			String USE_YN = (String) argHtMethod.get("USE_YN");
			String INPT_ID = (String) argHtMethod.get("INPT_ID");

			//
			if(ORGA_CD == null) { ORGA_CD = ""; }
			if(SBCD_CD == null) { SBCD_CD = ""; }
			if(USE_YN == null) { USE_YN = ""; }
			if(INPT_ID == null) { INPT_ID = ""; }

			//
			ORGA_CD = CTr.Replace(ORGA_CD, "'", "''");
			SBCD_CD = CTr.Replace(SBCD_CD, "'", "''");
			USE_YN = CTr.Replace(USE_YN, "'", "''");
			INPT_ID = CTr.Replace(INPT_ID, "'", "''");

			sql = "DELETE SP_AUTO_PAN";

			argStmtExec.executeUpdate(sql);

		} catch (Exception e) {

			throw new FuncException(e.toString(), sql);
		}

		return sql;
	}
%>
