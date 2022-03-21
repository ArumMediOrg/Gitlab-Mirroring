<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%!
	public String func_USQLQuery_Button1Click_002(Statement argStmtExec, HashMap argHtMethod) throws Exception {

		String sql = "";
		String sql2 = "";
		String sql_disp = "";

		try {

			String SQLQUERY = (String) argHtMethod.get("SQLQUERY");

			//
			if(SQLQUERY == null) { SQLQUERY = ""; }

			//
			// SQLQUERY = CTr.Replace(SQLQUERY, "'", "''");

			sql = SQLQUERY;

			argStmtExec.executeUpdate(sql);
		} catch (Exception e) {

			throw new FuncException(e.toString(), sql);
		}

		return sql;
	}
%>
