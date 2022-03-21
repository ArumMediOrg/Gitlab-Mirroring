<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%!
	public String func_omr_updateresultvalue_001(Statement argStmtExec, HashMap argHtMethod) throws Exception {

		String sql = "";
		String sql2 = "";
		String sql_disp = "";

		try {

			String STRVALUE = (String) argHtMethod.get("STRVALUE");
			String REQUEST_DATE = (String) argHtMethod.get("REQUEST_DATE");
			String EXAM_NO = (String) argHtMethod.get("EXAM_NO");
			String VFILENAME = (String) argHtMethod.get("VFILENAME");

			//
			if(STRVALUE == null) { STRVALUE = ""; }
			if(REQUEST_DATE == null) { REQUEST_DATE = ""; }
			if(EXAM_NO == null) { EXAM_NO = ""; }
			if(VFILENAME == null) { VFILENAME = ""; }

			//
			STRVALUE = CTr.Replace(STRVALUE, "'", "''");
			REQUEST_DATE = CTr.Replace(REQUEST_DATE, "'", "''");
			EXAM_NO = CTr.Replace(EXAM_NO, "'", "''");
			VFILENAME = CTr.Replace(VFILENAME, "'", "''");

			sql = "UPDATE ARUM_TOTAL SET ";
			sql += "  VALUYN = 'N'";
			sql += ", SENDYN = 'Y'";
			sql += ", VALUE2 = '" + STRVALUE + "'";
			sql += " WHERE REQUEST_DATE = '" + REQUEST_DATE + "'";
			sql += " AND EXAM_NO = '" + EXAM_NO + "'";
			sql += " AND FILENAME = '" + VFILENAME + "'";

			argStmtExec.executeUpdate(sql);

		} catch (Exception e) {

			throw new FuncException(e.toString(), sql);
		}

		return sql;
	}
%>
