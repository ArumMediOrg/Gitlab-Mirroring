<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%!
	public String func_omr_insertarumtotal_001(Statement argStmtExec, HashMap argHtMethod) throws Exception {

		String sql = "";
		String sql2 = "";
		String sql_disp = "";

		try {

			String SCANDATE = (String) argHtMethod.get("SCANDATE");
			String FILENAME = (String) argHtMethod.get("FILENAME");
			String USERID = (String) argHtMethod.get("USERID");

			//
			if(SCANDATE == null) { SCANDATE = ""; }
			if(FILENAME == null) { FILENAME = ""; }
			if(USERID == null) { USERID = ""; }

			//
			SCANDATE = CTr.Replace(SCANDATE, "'", "''");
			FILENAME = CTr.Replace(FILENAME, "'", "''");
			USERID = CTr.Replace(USERID, "'", "''");

			sql = "INSERT INTO ARUM_TOTAL (REQUEST_DATE, SCANDATE, FILENAME, OMRYN, SENDYN, VALUYN, LOGINID) VALUES (";
			sql += "  '" + SCANDATE + "'";
			sql += ", '" + SCANDATE + "'";
			sql += ", '" + FILENAME + "'";
			sql += ", 'N'";
			sql += ", 'N'";
			sql += ", 'N'";
			sql += ", '" + USERID + "'";
			sql += ")";

			argStmtExec.executeUpdate(sql);

		} catch (Exception e) {

			throw new FuncException(e.toString(), sql);
		}

		return sql;
	}
%>
