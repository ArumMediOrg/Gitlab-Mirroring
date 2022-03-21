<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%!
	public String func_omr_updatechartnoedit_002(Statement argStmtExec, HashMap argHtMethod) throws Exception {

		String sql = "";
		String sql2 = "";
		String sql_disp = "";

		try {

			String EXAM_NO = (String) argHtMethod.get("EXAM_NO");
			String REQUEST_DATE = (String) argHtMethod.get("REQUEST_DATE");
			String SERIAL = (String) argHtMethod.get("SERIAL");

			//
			if(EXAM_NO == null) { EXAM_NO = ""; }
			if(REQUEST_DATE == null) { REQUEST_DATE = ""; }
			if(SERIAL == null) { SERIAL = ""; }

			//
			EXAM_NO = CTr.Replace(EXAM_NO, "'", "''");
			REQUEST_DATE = CTr.Replace(REQUEST_DATE, "'", "''");
			SERIAL = CTr.Replace(SERIAL, "'", "''");

			sql = "UPDATE ARUM_TOTAL SET ";
			sql += "  CUST_NO = ''";
			sql += ", CHART_NO = '" + EXAM_NO + "'";
			sql += ", EXAM_NAME = '?'";
			sql += ", JUMIN1 = ''";
			sql += ", JUMIN2 = ''";
			sql += " WHERE REQUEST_DATE = '" + REQUEST_DATE + "'";
			sql += " AND SERIAL = '" + SERIAL + "'";

			argStmtExec.executeUpdate(sql);

		} catch (Exception e) {

			throw new FuncException(e.toString(), sql);
		}

		return sql;
	}
%>
