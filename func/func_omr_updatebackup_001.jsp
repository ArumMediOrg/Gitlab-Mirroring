<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%!
	public String func_omr_updatebackup_001(Statement argStmtExec, HashMap argHtMethod) throws Exception {

		String sql = "";
		String sql2 = "";
		String sql_disp = "";

		try {

			String CDNUMBER = (String) argHtMethod.get("CDNUMBER");
			String SCANDATE = (String) argHtMethod.get("SCANDATE");
			String FILENAME = (String) argHtMethod.get("FILENAME");

			//
			if(CDNUMBER == null) { CDNUMBER = ""; }
			if(SCANDATE == null) { SCANDATE = ""; }
			if(FILENAME == null) { FILENAME = ""; }

			//
			CDNUMBER = CTr.Replace(CDNUMBER, "'", "''");
			SCANDATE = CTr.Replace(SCANDATE, "'", "''");
			FILENAME = CTr.Replace(FILENAME, "'", "''");

			sql = "UPDATE ARUM_TOTAL SET ";
			sql += "  CDBURN = 'Y'";
			sql += ", CDNUMBER = '" + CDNUMBER + "'";
			sql += " WHERE REQUEST_DATE = '" + SCANDATE + "'";
			sql += " AND FILENAME = '" + FILENAME + "'";

			argStmtExec.executeUpdate(sql);

		} catch (Exception e) {

			throw new FuncException(e.toString(), sql);
		}

		return sql;
	}
%>
