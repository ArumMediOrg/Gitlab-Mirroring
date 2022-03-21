<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%!
	public String func_uBusinessTrip_UP_UF_InsRecordInADOQuery_001(Statement argStmtExec, HashMap argHtMethod) throws Exception {

		String sql = "";
		String sql2 = "";
		String sql_disp = "";

		try {

			String STRTABLENAME = (String) argHtMethod.get("STRTABLENAME");
			String STRFIELD = (String) argHtMethod.get("STRFIELD");
			String STRVALUE = (String) argHtMethod.get("STRVALUE");

			//
			if(STRTABLENAME == null) { STRTABLENAME = ""; }
			if(STRFIELD == null) { STRFIELD = ""; }
			if(STRVALUE == null) { STRVALUE = ""; }

			//
			STRTABLENAME = CTr.Replace(STRTABLENAME, "'", "''");
			STRFIELD = CTr.Replace(STRFIELD, "'", "''");
			STRVALUE = CTr.Replace(STRVALUE, "'", "''");

			sql = "INSERT INTO ";
			sql += STRTABLENAME;
			sql += STRFIELD;
			sql += STRVALUE;
		} catch (Exception e) {

			throw new FuncException(e.toString(), sql);
		}

		return sql;
	}
%>
