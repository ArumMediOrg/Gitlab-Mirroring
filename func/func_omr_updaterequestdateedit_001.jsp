<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%!
	public String func_omr_updaterequestdateedit_001(Statement argStmtExec, HashMap argHtMethod) throws Exception {

		String sql = "";
		String sql2 = "";
		String sql_disp = "";

		try {

			String REQUEST_DATE = (String) argHtMethod.get("REQUEST_DATE");
			String BEFORE_SCANDATE = (String) argHtMethod.get("BEFORE_SCANDATE");
			String SERIAL = (String) argHtMethod.get("SERIAL");

			//
			if(REQUEST_DATE == null) { REQUEST_DATE = ""; }
			if(BEFORE_SCANDATE == null) { BEFORE_SCANDATE = ""; }
			if(SERIAL == null) { SERIAL = ""; }

			//
			REQUEST_DATE = CTr.Replace(REQUEST_DATE, "'", "''");
			BEFORE_SCANDATE = CTr.Replace(BEFORE_SCANDATE, "'", "''");
			SERIAL = CTr.Replace(SERIAL, "'", "''");

			sql = "UPDATE ARUM_TOTAL SET ";
			sql += "  REQUEST_DATE = '" + REQUEST_DATE + "'";
			sql += " WHERE SCANDATE = '" + BEFORE_SCANDATE + "'";
			sql += " AND SERIAL = '" + SERIAL + "'";

			argStmtExec.executeUpdate(sql);

		} catch (Exception e) {

			throw new FuncException(e.toString(), sql);
		}

		return sql;
	}
%>
