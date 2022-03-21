<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%!
	public String func_uExam_Result_chkSsv_Rslt_InputMouseUp_001(Statement argStmtExec, HashMap argHtMethod) throws Exception {

		String sql = "";
		String sql2 = "";
		String sql_disp = "";

		try {

			String RSLT_INPUT = (String) argHtMethod.get("RSLT_INPUT");
			String EXAM_DT = (String) argHtMethod.get("EXAM_DT");
			String EXAM_SQ = (String) argHtMethod.get("EXAM_SQ");

			//
			if(RSLT_INPUT == null) { RSLT_INPUT = ""; }
			if(EXAM_DT == null) { EXAM_DT = ""; }
			if(EXAM_SQ == null) { EXAM_SQ = ""; }

			//
			RSLT_INPUT = CTr.Replace(RSLT_INPUT, "'", "''");
			EXAM_DT = CTr.Replace(EXAM_DT, "'", "''");
			EXAM_SQ = CTr.Replace(EXAM_SQ, "'", "''");

			sql = "UPDATE ST_SYTH_VIEW SET ";
			sql += "  SSV_RSLT_INPUT = '" + RSLT_INPUT + "'";
			sql += " WHERE SSV_EXAM_DT = '" + EXAM_DT + "'";
			sql += " AND SSV_EXAM_SQ = '" + EXAM_SQ + "'";

			argStmtExec.executeUpdate(sql);

		} catch (Exception e) {

			throw new FuncException(e.toString(), sql);
		}

		return sql;
	}
%>
