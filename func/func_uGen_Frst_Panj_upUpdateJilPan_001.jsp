<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%!
	public String func_uGen_Frst_Panj_upUpdateJilPan_001(Statement argStmtExec, HashMap argHtMethod) throws Exception {

		String sql = "";
		String sql2 = "";
		String sql_disp = "";

		try {

			String JLPN_TTPN = (String) argHtMethod.get("JLPN_TTPN");
			String JLPN_WORK = (String) argHtMethod.get("JLPN_WORK");
			String EXAM_DT = (String) argHtMethod.get("EXAM_DT");
			String EXAM_SQ = (String) argHtMethod.get("EXAM_SQ");

			//
			if(JLPN_TTPN == null) { JLPN_TTPN = ""; }
			if(JLPN_WORK == null) { JLPN_WORK = ""; }
			if(EXAM_DT == null) { EXAM_DT = ""; }
			if(EXAM_SQ == null) { EXAM_SQ = ""; }

			//
			JLPN_TTPN = CTr.Replace(JLPN_TTPN, "'", "''");
			JLPN_WORK = CTr.Replace(JLPN_WORK, "'", "''");
			EXAM_DT = CTr.Replace(EXAM_DT, "'", "''");
			EXAM_SQ = CTr.Replace(EXAM_SQ, "'", "''");

			sql = "UPDATE PT_LABOR_PANJUNG SET ";
			sql += "  PLP_JLPN_TTPN = '" + JLPN_TTPN + "'";
			sql += ", PLP_JLPN_WORK = '" + JLPN_WORK + "'";
			sql += " WHERE PLP_EXAM_DT = '" + EXAM_DT + "'";
			sql += " AND PLP_EXAM_SQ = '" + EXAM_SQ + "'";

			argStmtExec.executeUpdate(sql);

		} catch (Exception e) {

			throw new FuncException(e.toString(), sql);
		}

		return sql;
	}
%>
