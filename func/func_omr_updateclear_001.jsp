<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%!
	public String func_omr_updateclear_001(Statement argStmtExec, HashMap argHtMethod) throws Exception {

		String sql = "";
		String sql2 = "";
		String sql_disp = "";

		try {

			String REQUEST_DATE = (String) argHtMethod.get("REQUEST_DATE");
			String EXAM_NO = (String) argHtMethod.get("EXAM_NO");
			String SERIAL = (String) argHtMethod.get("SERIAL");

			//
			if(REQUEST_DATE == null) { REQUEST_DATE = ""; }
			if(EXAM_NO == null) { EXAM_NO = ""; }
			if(SERIAL == null) { SERIAL = ""; }

			//
			REQUEST_DATE = CTr.Replace(REQUEST_DATE, "'", "''");
			EXAM_NO = CTr.Replace(EXAM_NO, "'", "''");
			SERIAL = CTr.Replace(SERIAL, "'", "''");

			sql = "UPDATE ARUM_TOTAL SET ";
			sql += "  OMRYN = 'N'";
			sql += ", SENDYN = 'N'";
			sql += ", VALUYN = 'N'";
			sql += " WHERE REQUEST_DATE = '" + REQUEST_DATE + "'";
			sql += " AND CHART_NO = '" + EXAM_NO + "'";
			sql += " AND SERIAL = '" + SERIAL + "'";

			argStmtExec.executeUpdate(sql);

		} catch (Exception e) {

			throw new FuncException(e.toString(), sql);
		}

		return sql;
	}
%>
