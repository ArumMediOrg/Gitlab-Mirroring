<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%!
	public String func_omr_updateetcarumtotal_001(Statement argStmtExec, HashMap argHtMethod) throws Exception {

		String sql = "";
		String sql2 = "";
		String sql_disp = "";

		try {

			String EXAM_NO = (String) argHtMethod.get("EXAM_NO");
			String BARCODENUMBER = (String) argHtMethod.get("BARCODENUMBER");
			String EXAM_NAME = (String) argHtMethod.get("EXAM_NAME");
			String JUMIN1 = (String) argHtMethod.get("JUMIN1");
			String JUMIN2 = (String) argHtMethod.get("JUMIN2");
			String SERIAL = (String) argHtMethod.get("SERIAL");
			String SCANDATE = (String) argHtMethod.get("SCANDATE");
			String FILENAME = (String) argHtMethod.get("FILENAME");

			//
			if(EXAM_NO == null) { EXAM_NO = ""; }
			if(BARCODENUMBER == null) { BARCODENUMBER = ""; }
			if(EXAM_NAME == null) { EXAM_NAME = ""; }
			if(JUMIN1 == null) { JUMIN1 = ""; }
			if(JUMIN2 == null) { JUMIN2 = ""; }
			if(SERIAL == null) { SERIAL = ""; }
			if(SCANDATE == null) { SCANDATE = ""; }
			if(FILENAME == null) { FILENAME = ""; }

			//
			EXAM_NO = CTr.Replace(EXAM_NO, "'", "''");
			BARCODENUMBER = CTr.Replace(BARCODENUMBER, "'", "''");
			EXAM_NAME = CTr.Replace(EXAM_NAME, "'", "''");
			JUMIN1 = CTr.Replace(JUMIN1, "'", "''");
			JUMIN2 = CTr.Replace(JUMIN2, "'", "''");
			SERIAL = CTr.Replace(SERIAL, "'", "''");
			SCANDATE = CTr.Replace(SCANDATE, "'", "''");
			FILENAME = CTr.Replace(FILENAME, "'", "''");

			sql = "UPDATE ARUM_TOTAL SET ";
			sql += "  FORMNAME = '777'";
			sql += ", CUST_NO = '" + EXAM_NO + "'";
			sql += ", CHART_NO = '" + BARCODENUMBER + "'";
			sql += ", EXAM_NAME = '" + EXAM_NAME + "'";
			sql += ", JUMIN1 = '" + JUMIN1 + "'";
			sql += ", JUMIN2 = '" + JUMIN2 + "'";
			sql += ", SERIAL = '" + SERIAL + "'";
			sql += ", PERSONINFO = 'N'";
			sql += ", OMRYN = 'Y'";
			sql += ", SENDYN = 'N'";
			sql += ", VALUYN = 'N'";
			sql += ", INDEXYN = 'N'";
			sql += " WHERE SCANDATE = '" + SCANDATE + "'";
			sql += " AND FILENAME = '" + FILENAME + "'";

			argStmtExec.executeUpdate(sql);

		} catch (Exception e) {

			throw new FuncException(e.toString(), sql);
		}

		return sql;
	}
%>
