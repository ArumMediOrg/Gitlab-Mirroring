<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%!
	public String func_omr_updatearumtotal_002(Statement argStmtExec, HashMap argHtMethod) throws Exception {

		String sql = "";
		String sql2 = "";
		String sql_disp = "";

		try {

			String FORMNAME = (String) argHtMethod.get("FORMNAME");
			String EXAM_NO = (String) argHtMethod.get("EXAM_NO");
			String EXAM_NAME = (String) argHtMethod.get("EXAM_NAME");
			String BARCODENUMBER = (String) argHtMethod.get("BARCODENUMBER");
			String CUST_NO = (String) argHtMethod.get("CUST_NO");
			String AGE = (String) argHtMethod.get("AGE");
			String GENDER = (String) argHtMethod.get("GENDER");
			String JUMIN1 = (String) argHtMethod.get("JUMIN1");
			String JUMIN2 = (String) argHtMethod.get("JUMIN2");
			String SERIAL = (String) argHtMethod.get("SERIAL");
			String SCANDATE = (String) argHtMethod.get("SCANDATE");
			String FILENAME = (String) argHtMethod.get("FILENAME");

			//
			if(FORMNAME == null) { FORMNAME = ""; }
			if(EXAM_NO == null) { EXAM_NO = ""; }
			if(EXAM_NAME == null) { EXAM_NAME = ""; }
			if(BARCODENUMBER == null) { BARCODENUMBER = ""; }
			if(CUST_NO == null) { CUST_NO = ""; }
			if(AGE == null) { AGE = ""; }
			if(GENDER == null) { GENDER = ""; }
			if(JUMIN1 == null) { JUMIN1 = ""; }
			if(JUMIN2 == null) { JUMIN2 = ""; }
			if(SERIAL == null) { SERIAL = ""; }
			if(SCANDATE == null) { SCANDATE = ""; }
			if(FILENAME == null) { FILENAME = ""; }

			//
			FORMNAME = CTr.Replace(FORMNAME, "'", "''");
			EXAM_NO = CTr.Replace(EXAM_NO, "'", "''");
			EXAM_NAME = CTr.Replace(EXAM_NAME, "'", "''");
			BARCODENUMBER = CTr.Replace(BARCODENUMBER, "'", "''");
			CUST_NO = CTr.Replace(CUST_NO, "'", "''");
			AGE = CTr.Replace(AGE, "'", "''");
			GENDER = CTr.Replace(GENDER, "'", "''");
			JUMIN1 = CTr.Replace(JUMIN1, "'", "''");
			JUMIN2 = CTr.Replace(JUMIN2, "'", "''");
			SERIAL = CTr.Replace(SERIAL, "'", "''");
			SCANDATE = CTr.Replace(SCANDATE, "'", "''");
			FILENAME = CTr.Replace(FILENAME, "'", "''");

			sql = "UPDATE ARUM_TOTAL SET ";
			sql += "  FORMNAME = '" + FORMNAME + "'";
			sql += ", EXAM_NO = '" + EXAM_NO + "'";
			sql += ", EXAM_NAME = '" + EXAM_NAME + "'";
			sql += ", CHART_NO = '" + BARCODENUMBER + "'";
			sql += ", CUST_NO = '" + CUST_NO + "'";
			sql += ", AGE = '" + AGE + "'";
			sql += ", GENDER = '" + GENDER + "'";
			sql += ", JUMIN1 = '" + JUMIN1 + "'";
			sql += ", JUMIN2 = '" + JUMIN2 + "'";
			sql += ", SERIAL = '" + SERIAL + "'";
			sql += ", INDEXYN = 'Y'";
			sql += " WHERE SCANDATE = '" + SCANDATE + "'";
			sql += " AND FILENAME = '" + FILENAME + "'";

			argStmtExec.executeUpdate(sql);

		} catch (Exception e) {

			throw new FuncException(e.toString(), sql);
		}

		return sql;
	}
%>
