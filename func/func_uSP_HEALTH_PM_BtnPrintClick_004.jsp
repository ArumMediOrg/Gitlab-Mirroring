<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%!
	public String func_uSP_HEALTH_PM_BtnPrintClick_004(Statement argStmtExec, HashMap argHtMethod) throws Exception {

		String sql = "";
		String sql2 = "";
		String sql_disp = "";

		try {

			String TRANC_DATE = (String) argHtMethod.get("TRANC_DATE");
			String EXAM_DT = (String) argHtMethod.get("EXAM_DT");
			String EXAM_SQ = (String) argHtMethod.get("EXAM_SQ");

			//
			if(TRANC_DATE == null) { TRANC_DATE = ""; }
			if(EXAM_DT == null) { EXAM_DT = ""; }
			if(EXAM_SQ == null) { EXAM_SQ = ""; }

			//
			TRANC_DATE = CTr.Replace(TRANC_DATE, "'", "''");
			EXAM_DT = CTr.Replace(EXAM_DT, "'", "''");
			EXAM_SQ = CTr.Replace(EXAM_SQ, "'", "''");

			sql = "UPDATE PT_SED_PANJUNG SET ";
			sql += "  PSP_TRANC_DATE = '" + TRANC_DATE + "'";
			sql += " WHERE PSP_EXAM_DT = '" + EXAM_DT + "'";
			sql += " AND PSP_EXAM_SQ = '" + EXAM_SQ + "'";

			argStmtExec.executeUpdate(sql);

		} catch (Exception e) {

			throw new FuncException(e.toString(), sql);
		}

		return sql;
	}
%>
