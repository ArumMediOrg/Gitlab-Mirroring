<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%!
	public String func_omr_insertarumtotal_003(Statement argStmtExec, HashMap argHtMethod) throws Exception {

		String sql = "";
		String sql2 = "";
		String sql_disp = "";

		try {

			String REQUEST_DATE = (String) argHtMethod.get("REQUEST_DATE");
			String SCANDATE = (String) argHtMethod.get("SCANDATE");
			String FILENAME = (String) argHtMethod.get("FILENAME");
			String FORMNAME = (String) argHtMethod.get("FORMNAME");
			String EXAM_NO = (String) argHtMethod.get("EXAM_NO");
			String EXAM_NAME = (String) argHtMethod.get("EXAM_NAME");
			String BARCODENUMBER = (String) argHtMethod.get("BARCODENUMBER");
			String CUST_NO = (String) argHtMethod.get("CUST_NO");
			String JUMIN1 = (String) argHtMethod.get("JUMIN1");
			String JUMIN2 = (String) argHtMethod.get("JUMIN2");
			String AGE = (String) argHtMethod.get("AGE");
			String GENDER = (String) argHtMethod.get("GENDER");
			String SERIAL = (String) argHtMethod.get("SERIAL");
			String USERID = (String) argHtMethod.get("USERID");

			//
			if(REQUEST_DATE == null) { REQUEST_DATE = ""; }
			if(SCANDATE == null) { SCANDATE = ""; }
			if(FILENAME == null) { FILENAME = ""; }
			if(FORMNAME == null) { FORMNAME = ""; }
			if(EXAM_NO == null) { EXAM_NO = ""; }
			if(EXAM_NAME == null) { EXAM_NAME = ""; }
			if(BARCODENUMBER == null) { BARCODENUMBER = ""; }
			if(CUST_NO == null) { CUST_NO = ""; }
			if(JUMIN1 == null) { JUMIN1 = ""; }
			if(JUMIN2 == null) { JUMIN2 = ""; }
			if(AGE == null) { AGE = ""; }
			if(GENDER == null) { GENDER = ""; }
			if(SERIAL == null) { SERIAL = ""; }
			if(USERID == null) { USERID = ""; }

			//
			REQUEST_DATE = CTr.Replace(REQUEST_DATE, "'", "''");
			SCANDATE = CTr.Replace(SCANDATE, "'", "''");
			FILENAME = CTr.Replace(FILENAME, "'", "''");
			FORMNAME = CTr.Replace(FORMNAME, "'", "''");
			EXAM_NO = CTr.Replace(EXAM_NO, "'", "''");
			EXAM_NAME = CTr.Replace(EXAM_NAME, "'", "''");
			BARCODENUMBER = CTr.Replace(BARCODENUMBER, "'", "''");
			CUST_NO = CTr.Replace(CUST_NO, "'", "''");
			JUMIN1 = CTr.Replace(JUMIN1, "'", "''");
			JUMIN2 = CTr.Replace(JUMIN2, "'", "''");
			AGE = CTr.Replace(AGE, "'", "''");
			GENDER = CTr.Replace(GENDER, "'", "''");
			SERIAL = CTr.Replace(SERIAL, "'", "''");
			USERID = CTr.Replace(USERID, "'", "''");

			sql = "INSERT INTO ARUM_TOTAL (REQUEST_DATE, SCANDATE, FILENAME, FORMNAME, EXAM_NO, EXAM_NAME, CHART_NO, CUST_NO, JUMIN1, JUMIN2, AGE, GENDER, SERIAL, OMRYN, VALUYN, SENDYN, INDEXYN, LOGINID) VALUES (";
			sql += "  '" + REQUEST_DATE + "'";
			sql += ", '" + SCANDATE + "'";
			sql += ", '" + FILENAME + "'";
			sql += ", '" + FORMNAME + "'";
			sql += ", '" + EXAM_NO + "'";
			sql += ", '" + EXAM_NAME + "'";
			sql += ", '" + BARCODENUMBER + "'";
			sql += ", '" + CUST_NO + "'";
			sql += ", '" + JUMIN1 + "'";
			sql += ", '" + JUMIN2 + "'";
			sql += ", '" + AGE + "'";
			sql += ", '" + GENDER + "'";
			sql += ", '" + SERIAL + "'";
			sql += ", 'N'";
			sql += ", 'N'";
			sql += ", 'N'";
			sql += ", 'Y'";
			sql += ", '" + USERID + "'";
			sql += ")";

			argStmtExec.executeUpdate(sql);

		} catch (Exception e) {

			throw new FuncException(e.toString(), sql);
		}

		return sql;
	}
%>
