<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%!
	public String func_omr_BRSTCancer_002(Statement argStmtExec, HashMap argHtMethod) throws Exception {

		String sql = "";
		String sql2 = "";
		String sql_disp = "";

		try {

			String EXAM_SQ = (String) argHtMethod.get("EXAM_SQ");
			String EXAM_DT = (String) argHtMethod.get("EXAM_DT");

			//
			if(EXAM_SQ == null) { EXAM_SQ = ""; }
			if(EXAM_DT == null) { EXAM_DT = ""; }

			//
			EXAM_SQ = CTr.Replace(EXAM_SQ, "'", "''");
			EXAM_DT = CTr.Replace(EXAM_DT, "'", "''");

			sql = "INSERT INTO ET_CANCER_BRST( ECB_EXAM_SQ, ECB_EXAM_DT, ECB_MGEX_DT ) VALUES (";
			sql += "  '" + EXAM_SQ + "'";
			sql += ", '" + EXAM_DT + "'";
			sql += ", '" + EXAM_DT + "'";
			sql += ")";

			argStmtExec.executeUpdate(sql);

		} catch (Exception e) {

			throw new FuncException(e.toString(), sql);
		}

		return sql;
	}
%>
