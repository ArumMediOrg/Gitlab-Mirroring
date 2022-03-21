<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%!
	public String func_uSp_Health_Autopan_Set_dsafdaf1Click_001(Statement argStmtExec, HashMap argHtMethod) throws Exception {

		String sql = "";
		String sql2 = "";
		String sql_disp = "";

		try {

			String AUTO_CD = (String) argHtMethod.get("AUTO_CD");
			String SBCD_CD = (String) argHtMethod.get("SBCD_CD");

			//
			if(AUTO_CD == null) { AUTO_CD = ""; }
			if(SBCD_CD == null) { SBCD_CD = ""; }

			//
			AUTO_CD = CTr.Replace(AUTO_CD, "'", "''");
			SBCD_CD = CTr.Replace(SBCD_CD, "'", "''");

			sql = "DELETE SP_AUTO_PANITEM";
			sql += " WHERE SPA_AUTO_CD = '" + AUTO_CD + "'";
			sql += " AND SPA_SBCD_CD = '" + SBCD_CD + "'";

			argStmtExec.executeUpdate(sql);

		} catch (Exception e) {

			throw new FuncException(e.toString(), sql);
		}

		return sql;
	}
%>
