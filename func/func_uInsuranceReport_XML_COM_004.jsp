<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%!
	public String func_uInsuranceReport_XML_COM_004(Statement argStmtExec, HashMap argHtMethod) throws Exception {

		String sql = "";
		String sql2 = "";
		String sql_disp = "";

		try {

			String TOBO_DT = (String) argHtMethod.get("TOBO_DT");
			String EXAM_DT = (String) argHtMethod.get("EXAM_DT");
			String EXAM_SQ = (String) argHtMethod.get("EXAM_SQ");

			//
			if(TOBO_DT == null) { TOBO_DT = ""; }
			if(EXAM_DT == null) { EXAM_DT = ""; }
			if(EXAM_SQ == null) { EXAM_SQ = ""; }

			//
			TOBO_DT = CTr.Replace(TOBO_DT, "'", "''");
			EXAM_DT = CTr.Replace(EXAM_DT, "'", "''");
			EXAM_SQ = CTr.Replace(EXAM_SQ, "'", "''");

			sql = "UPDATE ET_DENTAL_PANJ SET ";
			sql += "  EDP_TOBO_DT = '" + TOBO_DT + "'";
			sql += " WHERE EDP_EXAM_DT = '" + EXAM_DT + "'";
			sql += " AND EDP_EXAM_SQ = '" + EXAM_SQ + "'";
			sql += " AND NVL(EDP_TOBO_DT, ' ') <> '" + TOBO_DT + "'";

			argStmtExec.executeUpdate(sql);

		} catch (Exception e) {

			throw new FuncException(e.toString(), sql);
		}

		return sql;
	}
%>
