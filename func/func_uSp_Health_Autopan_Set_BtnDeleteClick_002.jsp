<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%!
	public String func_uSp_Health_Autopan_Set_BtnDeleteClick_002(Statement argStmtExec, HashMap argHtMethod) throws Exception {

		String sql = "";
		String sql2 = "";
		String sql_disp = "";

		try {

			String AUTO_CD = (String) argHtMethod.get("AUTO_CD");
			String ORGA_CD = (String) argHtMethod.get("ORGA_CD");

			//
			if(AUTO_CD == null) { AUTO_CD = ""; }
			if(ORGA_CD == null) { ORGA_CD = ""; }

			//
			AUTO_CD = CTr.Replace(AUTO_CD, "'", "''");
			ORGA_CD = CTr.Replace(ORGA_CD, "'", "''");

			sql = "DELETE SP_AUTO_PAN";
			sql += " WHERE SPA_AUTO_CD = '" + AUTO_CD + "'";
			sql += " AND SPA_ORGA_CD = '" + ORGA_CD + "'";

			argStmtExec.executeUpdate(sql);

		} catch (Exception e) {

			throw new FuncException(e.toString(), sql);
		}

		return sql;
	}
%>
