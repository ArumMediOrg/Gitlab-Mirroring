<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%!
	public String func_uExam_Result_btnQstnSaveClick_003(Statement argStmtExec, HashMap argHtMethod) throws Exception {

		String sql = "";
		String sql2 = "";
		String sql_disp = "";

		try {

			String EXAM_DT = (String) argHtMethod.get("EXAM_DT");
			String EXAM_SQ = (String) argHtMethod.get("EXAM_SQ");
			String DOCTORQQN = (String) argHtMethod.get("DOCTORQQN");

			//
			if(EXAM_DT == null) { EXAM_DT = ""; }
			if(EXAM_SQ == null) { EXAM_SQ = ""; }
			if(DOCTORQQN == null) { DOCTORQQN = ""; }

			//
			EXAM_DT = CTr.Replace(EXAM_DT, "'", "''");
			EXAM_SQ = CTr.Replace(EXAM_SQ, "'", "''");
			DOCTORQQN = CTr.Replace(DOCTORQQN, "'", "''");

			sql = "INSERT INTO PT_FIR_PANJUNG (PFP_EXAM_DT, PFP_EXAM_SQ, PFP_DOCTORQQN) VALUES (";
			sql += "  '" + EXAM_DT + "'";
			sql += ", '" + EXAM_SQ + "'";
			sql += ", '" + DOCTORQQN + "'";
			sql += ")";

			argStmtExec.executeUpdate(sql);

		} catch (Exception e) {

			throw new FuncException(e.toString(), sql);
		}

		return sql;
	}
%>
