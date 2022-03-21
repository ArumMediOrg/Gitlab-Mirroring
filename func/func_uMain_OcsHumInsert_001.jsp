<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%!
	public String func_uMain_OcsHumInsert_001(Statement argStmtExec, HashMap argHtMethod) throws Exception {

		String sql = "";
		String sql2 = "";
		String sql_disp = "";

		try {

			String OCS_NO = (String) argHtMethod.get("OCS_NO");
			String EXAM_DT = (String) argHtMethod.get("EXAM_DT");
			String EXAM_SQ = (String) argHtMethod.get("EXAM_SQ");

			//
			if(OCS_NO == null) { OCS_NO = ""; }
			if(EXAM_DT == null) { EXAM_DT = ""; }
			if(EXAM_SQ == null) { EXAM_SQ = ""; }

			//
			OCS_NO = CTr.Replace(OCS_NO, "'", "''");
			EXAM_DT = CTr.Replace(EXAM_DT, "'", "''");
			EXAM_SQ = CTr.Replace(EXAM_SQ, "'", "''");

			sql = "UPDATE ET_EXAM_ACPT SET ";
			sql += "  EEA_OCS_NO = '" + OCS_NO + "'";
			sql += " WHERE EEA_EXAM_DT = '" + EXAM_DT + "'";
			sql += " AND EEA_EXAM_SQ = '" + EXAM_SQ + "'";

			argStmtExec.executeUpdate(sql);

		} catch (Exception e) {

			throw new FuncException(e.toString(), sql);
		}

		return sql;
	}
%>
