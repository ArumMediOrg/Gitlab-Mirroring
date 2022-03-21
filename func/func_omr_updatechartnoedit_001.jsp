<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%!
	public String func_omr_updatechartnoedit_001(Statement argStmtExec, HashMap argHtMethod) throws Exception {

		String sql = "";
		String sql2 = "";
		String sql_disp = "";

		try {

			String CUST_NO = (String) argHtMethod.get("CUST_NO");
			String CHART_NO = (String) argHtMethod.get("CHART_NO");
			String EXAM_NAME = (String) argHtMethod.get("EXAM_NAME");
			String EXAM_NO = (String) argHtMethod.get("EXAM_NO");
			String AGE = (String) argHtMethod.get("AGE");
			String GENDER = (String) argHtMethod.get("GENDER");
			String JUMIN1 = (String) argHtMethod.get("JUMIN1");
			String JUMIN2 = (String) argHtMethod.get("JUMIN2");
			String REQUEST_DATE = (String) argHtMethod.get("REQUEST_DATE");
			String SERIAL = (String) argHtMethod.get("SERIAL");

			//
			if(CUST_NO == null) { CUST_NO = ""; }
			if(CHART_NO == null) { CHART_NO = ""; }
			if(EXAM_NAME == null) { EXAM_NAME = ""; }
			if(EXAM_NO == null) { EXAM_NO = ""; }
			if(AGE == null) { AGE = ""; }
			if(GENDER == null) { GENDER = ""; }
			if(JUMIN1 == null) { JUMIN1 = ""; }
			if(JUMIN2 == null) { JUMIN2 = ""; }
			if(REQUEST_DATE == null) { REQUEST_DATE = ""; }
			if(SERIAL == null) { SERIAL = ""; }

			//
			CUST_NO = CTr.Replace(CUST_NO, "'", "''");
			CHART_NO = CTr.Replace(CHART_NO, "'", "''");
			EXAM_NAME = CTr.Replace(EXAM_NAME, "'", "''");
			EXAM_NO = CTr.Replace(EXAM_NO, "'", "''");
			AGE = CTr.Replace(AGE, "'", "''");
			GENDER = CTr.Replace(GENDER, "'", "''");
			JUMIN1 = CTr.Replace(JUMIN1, "'", "''");
			JUMIN2 = CTr.Replace(JUMIN2, "'", "''");
			REQUEST_DATE = CTr.Replace(REQUEST_DATE, "'", "''");
			SERIAL = CTr.Replace(SERIAL, "'", "''");

			sql = "UPDATE ARUM_TOTAL SET ";
			sql += "  CUST_NO = '" + CUST_NO + "'";
			sql += ", CHART_NO = '" + CHART_NO + "'";
			sql += ", EXAM_NAME = '" + EXAM_NAME + "'";
			sql += ", EXAM_NO = '" + EXAM_NO + "'";
			sql += ", AGE = '" + AGE + "'";
			sql += ", GENDER = '" + GENDER + "'";
			sql += ", JUMIN1 = '" + JUMIN1 + "'";
			sql += ", JUMIN2 = '" + JUMIN2 + "'";
			sql += " WHERE REQUEST_DATE = '" + REQUEST_DATE + "'";
			sql += " AND SERIAL = '" + SERIAL + "'";

			argStmtExec.executeUpdate(sql);

		} catch (Exception e) {

			throw new FuncException(e.toString(), sql);
		}

		return sql;
	}
%>
