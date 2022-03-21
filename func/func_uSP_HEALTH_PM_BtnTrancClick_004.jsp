<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%!
	public String func_uSP_HEALTH_PM_BtnTrancClick_004(Statement argStmtExec, HashMap argHtMethod) throws Exception {

		String sql = "";
		String sql2 = "";
		String sql_disp = "";

		try {

			String TOBO_DT = (String) argHtMethod.get("TOBO_DT");
			String EXAM_DT = (String) argHtMethod.get("EXAM_DT");
			String EXAM_SQ = (String) argHtMethod.get("EXAM_SQ");
			String EXAM_CHA = (String) argHtMethod.get("EXAM_CHA");

			//
			if(TOBO_DT == null) { TOBO_DT = ""; }
			if(EXAM_DT == null) { EXAM_DT = ""; }
			if(EXAM_SQ == null) { EXAM_SQ = ""; }
			if(EXAM_CHA == null) { EXAM_CHA = ""; }

			//
			TOBO_DT = CTr.Replace(TOBO_DT, "'", "''");
			EXAM_DT = CTr.Replace(EXAM_DT, "'", "''");
			EXAM_SQ = CTr.Replace(EXAM_SQ, "'", "''");
			EXAM_CHA = CTr.Replace(EXAM_CHA, "'", "''");

			sql = "UPDATE ST_BASE SET ";
			sql += "  SBE_TOBO_DT = '" + TOBO_DT + "'";
			sql += " WHERE SBE_EXAM_DT = '" + EXAM_DT + "'";
			sql += " AND SBE_EXAM_SQ = '" + EXAM_SQ + "'";
			sql += " AND SBE_EXAM_CHA = '" + EXAM_CHA + "'";

			argStmtExec.executeUpdate(sql);

		} catch (Exception e) {

			throw new FuncException(e.toString(), sql);
		}

		return sql;
	}
%>
