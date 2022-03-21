<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%!
	public String func_omr_updateresultvalue_002(Statement argStmtExec, HashMap argHtMethod) throws Exception {

		String sql = "";
		String sql2 = "";
		String sql_disp = "";

		try {

			String SCANDATE = (String) argHtMethod.get("SCANDATE");
			String EXAM_NO = (String) argHtMethod.get("EXAM_NO");
			String SERIAL = (String) argHtMethod.get("SERIAL");

			//
			if(SCANDATE == null) { SCANDATE = ""; }
			if(EXAM_NO == null) { EXAM_NO = ""; }
			if(SERIAL == null) { SERIAL = ""; }

			//
			SCANDATE = CTr.Replace(SCANDATE, "'", "''");
			EXAM_NO = CTr.Replace(EXAM_NO, "'", "''");
			SERIAL = CTr.Replace(SERIAL, "'", "''");

			sql = "UPDATE ARUM_TOTAL SET ";
			sql += "  VALUYN = 'Y'";
			sql += ", SENDYN = 'Y'";
			sql += ", CDBURN = 'N'";
			sql += " WHERE SCANDATE = '" + SCANDATE + "'";
			sql += " AND EXAM_NO = '" + EXAM_NO + "'";
			sql += " AND VALUYN = 'N'";
			sql += " AND SERIAL = '" + SERIAL + "'";

			argStmtExec.executeUpdate(sql);

		} catch (Exception e) {

			throw new FuncException(e.toString(), sql);
		}

		return sql;
	}
%>
