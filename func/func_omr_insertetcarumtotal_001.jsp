<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%!
	public String func_omr_insertetcarumtotal_001(Statement argStmtExec, HashMap argHtMethod) throws Exception {

		String sql = "";
		String sql2 = "";
		String sql_disp = "";

		try {

			String REQUEST_DATE = (String) argHtMethod.get("REQUEST_DATE");
			String SCANDATE = (String) argHtMethod.get("SCANDATE");
			String FILENAME = (String) argHtMethod.get("FILENAME");
			String EXAM_NAME = (String) argHtMethod.get("EXAM_NAME");
			String BARCODENUMBER = (String) argHtMethod.get("BARCODENUMBER");
			String EXAM_NO = (String) argHtMethod.get("EXAM_NO");
			String JUMIN1 = (String) argHtMethod.get("JUMIN1");
			String JUMIN2 = (String) argHtMethod.get("JUMIN2");
			String SERIAL = (String) argHtMethod.get("SERIAL");
			String USERID = (String) argHtMethod.get("USERID");

			//
			if(REQUEST_DATE == null) { REQUEST_DATE = ""; }
			if(SCANDATE == null) { SCANDATE = ""; }
			if(FILENAME == null) { FILENAME = ""; }
			if(EXAM_NAME == null) { EXAM_NAME = ""; }
			if(BARCODENUMBER == null) { BARCODENUMBER = ""; }
			if(EXAM_NO == null) { EXAM_NO = ""; }
			if(JUMIN1 == null) { JUMIN1 = ""; }
			if(JUMIN2 == null) { JUMIN2 = ""; }
			if(SERIAL == null) { SERIAL = ""; }
			if(USERID == null) { USERID = ""; }

			//
			REQUEST_DATE = CTr.Replace(REQUEST_DATE, "'", "''");
			SCANDATE = CTr.Replace(SCANDATE, "'", "''");
			FILENAME = CTr.Replace(FILENAME, "'", "''");
			EXAM_NAME = CTr.Replace(EXAM_NAME, "'", "''");
			BARCODENUMBER = CTr.Replace(BARCODENUMBER, "'", "''");
			EXAM_NO = CTr.Replace(EXAM_NO, "'", "''");
			JUMIN1 = CTr.Replace(JUMIN1, "'", "''");
			JUMIN2 = CTr.Replace(JUMIN2, "'", "''");
			SERIAL = CTr.Replace(SERIAL, "'", "''");
			USERID = CTr.Replace(USERID, "'", "''");

			sql = "INSERT INTO ARUM_TOTAL (REQUEST_DATE, SCANDATE, FILENAME, FORMNAME, EXAM_NAME, CHART_NO, EXAM_NO, JUMIN1, JUMIN2, SERIAL, PERSONINFO, OMRYN, VALUYN, SENDYN, INDEXYN, LOGINID) VALUES (";
			sql += "  '" + REQUEST_DATE + "'";
			sql += ", '" + SCANDATE + "'";
			sql += ", '" + FILENAME + "'";
			sql += ", '777'";
			sql += ", '" + EXAM_NAME + "'";
			sql += ", '" + BARCODENUMBER + "'";
			sql += ", '" + EXAM_NO + "'";
			sql += ", '" + JUMIN1 + "'";
			sql += ", '" + JUMIN2 + "'";
			sql += ", '" + SERIAL + "'";
			sql += ", 'Y'";
			sql += ", 'N'";
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
