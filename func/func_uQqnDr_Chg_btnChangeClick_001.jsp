<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%!
	public String func_uQqnDr_Chg_btnChangeClick_001(Statement argStmtExec, HashMap argHtMethod) throws Exception {

		String sql = "";
		String sql2 = "";
		String sql_disp = "";

		try {

			String DOCTORFIR = (String) argHtMethod.get("DOCTORFIR");
			String DOCTORQQN = (String) argHtMethod.get("DOCTORQQN");
			String EXAM_DT = (String) argHtMethod.get("EXAM_DT");
			String EXAM_SQ = (String) argHtMethod.get("EXAM_SQ");

			//
			if(DOCTORFIR == null) { DOCTORFIR = ""; }
			if(DOCTORQQN == null) { DOCTORQQN = ""; }
			if(EXAM_DT == null) { EXAM_DT = ""; }
			if(EXAM_SQ == null) { EXAM_SQ = ""; }

			//
			DOCTORFIR = CTr.Replace(DOCTORFIR, "'", "''");
			DOCTORQQN = CTr.Replace(DOCTORQQN, "'", "''");
			EXAM_DT = CTr.Replace(EXAM_DT, "'", "''");
			EXAM_SQ = CTr.Replace(EXAM_SQ, "'", "''");

			sql = "UPDATE PT_FIR_PANJUNG SET ";
			sql += "  PFP_DOCTORFIR = '" + DOCTORFIR + "'";
			sql += ", PFP_DOCTORQQN = '" + DOCTORQQN + "'";
			sql += " WHERE PFP_EXAM_DT = '" + EXAM_DT + "'";
			sql += " AND PFP_EXAM_SQ = '" + EXAM_SQ + "'";

			argStmtExec.executeUpdate(sql);

		} catch (Exception e) {

			throw new FuncException(e.toString(), sql);
		}

		return sql;
	}
%>
