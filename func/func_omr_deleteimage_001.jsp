<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%!
	public String func_omr_deleteimage_001(Statement argStmtExec, HashMap argHtMethod) throws Exception {

		String sql = "";
		String sql2 = "";
		String sql_disp = "";

		try {

			String FILENAME = (String) argHtMethod.get("FILENAME");
			String SERIAL = (String) argHtMethod.get("SERIAL");
			String SCANDATE = (String) argHtMethod.get("SCANDATE");

			//
			if(FILENAME == null) { FILENAME = ""; }
			if(SERIAL == null) { SERIAL = ""; }
			if(SCANDATE == null) { SCANDATE = ""; }

			//
			FILENAME = CTr.Replace(FILENAME, "'", "''");
			SERIAL = CTr.Replace(SERIAL, "'", "''");
			SCANDATE = CTr.Replace(SCANDATE, "'", "''");

			sql = "DELETE ARUM_TOTAL";
			sql += " WHERE FILENAME = '" + FILENAME + "'";
			sql += " AND SERIAL = '" + SERIAL + "'";
			sql += " AND SCANDATE = '" + SCANDATE + "'";

			argStmtExec.executeUpdate(sql);

		} catch (Exception e) {

			throw new FuncException(e.toString(), sql);
		}

		return sql;
	}
%>
