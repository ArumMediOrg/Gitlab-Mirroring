<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%!
	public String func_omr_insertserial_001(Statement argStmtExec, HashMap argHtMethod) throws Exception {

		String sql = "";
		String sql2 = "";
		String sql_disp = "";

		try {

			String SCANDATE = (String) argHtMethod.get("SCANDATE");

			//
			if(SCANDATE == null) { SCANDATE = ""; }

			//
			SCANDATE = CTr.Replace(SCANDATE, "'", "''");

			sql = "INSERT INTO ARUM_SERIAL (SCANDATE, SERIAL) VALUES (";
			sql += "  '" + SCANDATE + "'";
			sql += ", 0";
			sql += ")";

			argStmtExec.executeUpdate(sql);

		} catch (Exception e) {

			throw new FuncException(e.toString(), sql);
		}

		return sql;
	}
%>
