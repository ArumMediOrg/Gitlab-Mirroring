<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%!
	public String func_uSP_HEALTH_PM_UP_Old_007(Statement argStmtExec, HashMap argHtMethod) throws Exception {

		String sql = "";
		String sql2 = "";
		String sql_disp = "";

		try {

			String ENTRY_DT = (String) argHtMethod.get("ENTRY_DT");
			String EXAM_DT = (String) argHtMethod.get("EXAM_DT");
			String EXAM_SQ = (String) argHtMethod.get("EXAM_SQ");

			//
			if(ENTRY_DT == null) { ENTRY_DT = ""; }
			if(EXAM_DT == null) { EXAM_DT = ""; }
			if(EXAM_SQ == null) { EXAM_SQ = ""; }

			//
			ENTRY_DT = CTr.Replace(ENTRY_DT, "'", "''");
			EXAM_DT = CTr.Replace(EXAM_DT, "'", "''");
			EXAM_SQ = CTr.Replace(EXAM_SQ, "'", "''");

			sql = "UPDATE ET_EXAM_ACPT SET ";
			sql += "  EEA_ENTRY_DT = '" + ENTRY_DT + "'";
			sql += " WHERE EEA_EXAM_DT = '" + EXAM_DT + "'";
			sql += " AND EEA_EXAM_SQ = '" + EXAM_SQ + "'";

			argStmtExec.executeUpdate(sql);

		} catch (Exception e) {

			throw new FuncException(e.toString(), sql);
		}

		return sql;
	}
%>
