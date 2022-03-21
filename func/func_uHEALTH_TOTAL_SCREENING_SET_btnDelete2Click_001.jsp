<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%!
	public String func_uHEALTH_TOTAL_SCREENING_SET_btnDelete2Click_001(Statement argStmtExec, HashMap argHtMethod) throws Exception {

		String sql = "";
		String sql2 = "";
		String sql_disp = "";

		try {

			String USE_YN = (String) argHtMethod.get("USE_YN");
			String AUTO_CD = (String) argHtMethod.get("AUTO_CD");

			//
			if(USE_YN == null) { USE_YN = ""; }
			if(AUTO_CD == null) { AUTO_CD = ""; }

			//
			USE_YN = CTr.Replace(USE_YN, "'", "''");
			AUTO_CD = CTr.Replace(AUTO_CD, "'", "''");

			sql = "UPDATE HT_AUTO_PAN SET ";
			sql += "  HAP_USE_YN = '" + USE_YN + "'";
			sql += " WHERE HAP_AUTO_CD = '" + AUTO_CD + "'";

			argStmtExec.executeUpdate(sql);

		} catch (Exception e) {

			throw new FuncException(e.toString(), sql);
		}

		return sql;
	}
%>
