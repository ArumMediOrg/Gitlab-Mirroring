<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%!
	public String func_uSP_Health_XML_COM_005(Statement argStmtExec, HashMap argHtMethod) throws Exception {

		String sql = "";
		String sql2 = "";
		String sql_disp = "";

		try {

			String EXAM_DT = (String) argHtMethod.get("EXAM_DT");
			String EXAM_SQ = (String) argHtMethod.get("EXAM_SQ");
			String SSQL_ADD = (String) argHtMethod.get("SSQL_ADD");

			//
			if(EXAM_DT == null) { EXAM_DT = ""; }
			if(EXAM_SQ == null) { EXAM_SQ = ""; }
			if(SSQL_ADD == null) { SSQL_ADD = ""; }

			//
			EXAM_DT = CTr.Replace(EXAM_DT, "'", "''");
			EXAM_SQ = CTr.Replace(EXAM_SQ, "'", "''");
			//SSQL_ADD = CTr.Replace(SSQL_ADD, "'", "''");

			sql = "DELETE FROM ST_SYMPTOM";
			sql += " WHERE SSM_EXAM_DT = '" + EXAM_DT + "'";
			sql += " AND SSM_EXAM_SQ = '" + EXAM_SQ + "'";
			sql += SSQL_ADD;

			argStmtExec.executeUpdate(sql);

		} catch (Exception e) {

			throw new FuncException(e.toString(), sql);
		}

		return sql;
	}
%>
