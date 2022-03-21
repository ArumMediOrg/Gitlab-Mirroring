<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%!
	public String func_uHEALTH_TOTAL_SCREENING_SET_btnSave2Click_001(Statement argStmtExec, HashMap argHtMethod) throws Exception {

		String sql = "";
		String sql2 = "";
		String sql_disp = "";

		try {

			String AUTO_CD = (String) argHtMethod.get("AUTO_CD");

			//
			if(AUTO_CD == null) { AUTO_CD = ""; }

			//
			AUTO_CD = CTr.Replace(AUTO_CD, "'", "''");

			sql = "DELETE HT_AUTO_PAN";
			sql += " WHERE HAP_AUTO_CD = '" + AUTO_CD + "'";

			argStmtExec.executeUpdate(sql);

		} catch (Exception e) {

			throw new FuncException(e.toString(), sql);
		}

		return sql;
	}
%>
