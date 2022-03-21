<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%!
	public String func_omr_deleteimage_002(Statement argStmtExec, HashMap argHtMethod) throws Exception {

		String sql = "";
		String sql2 = "";
		String sql_disp = "";

		try {

			String FILENAME = (String) argHtMethod.get("FILENAME");

			//
			if(FILENAME == null) { FILENAME = ""; }

			//
			FILENAME = CTr.Replace(FILENAME, "'", "''");

			sql = "DELETE ARUM_TOTAL";
			sql += " WHERE FILENAME = '" + FILENAME + "'";

			argStmtExec.executeUpdate(sql);

		} catch (Exception e) {

			throw new FuncException(e.toString(), sql);
		}

		return sql;
	}
%>
