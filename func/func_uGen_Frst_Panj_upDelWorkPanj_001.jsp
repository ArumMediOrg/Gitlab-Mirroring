<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%!
	public String func_uGen_Frst_Panj_upDelWorkPanj_001(Statement argStmtExec, HashMap argHtMethod) throws Exception {

		String sql = "";
		String sql2 = "";
		String sql_disp = "";

		try {

			String ASGBN = (String) argHtMethod.get("ASGBN");
			String EXAM_DT = (String) argHtMethod.get("EXAM_DT");
			String EXAM_SQ = (String) argHtMethod.get("EXAM_SQ");

			//
			if(ASGBN == null) { ASGBN = ""; }
			if(EXAM_DT == null) { EXAM_DT = ""; }
			if(EXAM_SQ == null) { EXAM_SQ = ""; }

			//
			ASGBN = CTr.Replace(ASGBN, "'", "''");
			EXAM_DT = CTr.Replace(EXAM_DT, "'", "''");
			EXAM_SQ = CTr.Replace(EXAM_SQ, "'", "''");

			if(ASGBN.equals("F")) {
				sql = "DELETE FROM PT_FIR_PANJUNG";
				sql += " WHERE PFP_EXAM_DT = '" + EXAM_DT + "'";
				sql += " AND PFP_EXAM_SQ = '" + EXAM_SQ + "'";

				argStmtExec.executeUpdate(sql);
			}
			else if(ASGBN.equals("L")) {
				sql = "DELETE FROM PT_LABOR_PANJUNG";
				sql += " WHERE PLP_EXAM_DT = '" + EXAM_DT + "'";
				sql += " AND PLP_EXAM_SQ = '" + EXAM_SQ + "'";

				argStmtExec.executeUpdate(sql);
			}

		} catch (Exception e) {

			throw new FuncException(e.toString(), sql);
		}

		return sql;
	}
%>
