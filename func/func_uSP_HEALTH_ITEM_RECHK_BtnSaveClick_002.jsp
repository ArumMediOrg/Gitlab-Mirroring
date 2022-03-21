<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%!
	public String func_uSP_HEALTH_ITEM_RECHK_BtnSaveClick_002(Statement argStmtExec, HashMap argHtMethod) throws Exception {

		String sql = "";
		String sql2 = "";
		String sql_disp = "";

		try {

			String ADD_LT = (String) argHtMethod.get("ADD_LT");
			String ZERO_LT = (String) argHtMethod.get("ZERO_LT");
			String EXAM_DT = (String) argHtMethod.get("EXAM_DT");
			String EXAM_SQ = (String) argHtMethod.get("EXAM_SQ");

			//
			if(ADD_LT == null) { ADD_LT = ""; }
			if(ZERO_LT == null) { ZERO_LT = ""; }
			if(EXAM_DT == null) { EXAM_DT = ""; }
			if(EXAM_SQ == null) { EXAM_SQ = ""; }

			//
			ADD_LT = CTr.Replace(ADD_LT, "'", "''");
			ZERO_LT = CTr.Replace(ZERO_LT, "'", "''");
			EXAM_DT = CTr.Replace(EXAM_DT, "'", "''");
			EXAM_SQ = CTr.Replace(EXAM_SQ, "'", "''");

			sql = "UPDATE ST_ITEM_RECHECK SET ";
			sql += "  SIR_ADD_LT = '" + ADD_LT + "'";
			sql += ", SIR_ZERO_LT = '" + ZERO_LT + "'";
			sql += " WHERE SIR_EXAM_DT = '" + EXAM_DT + "'";
			sql += " AND SIR_EXAM_SQ = '" + EXAM_SQ + "'";

			argStmtExec.executeUpdate(sql);

		} catch (Exception e) {

			throw new FuncException(e.toString(), sql);
		}

		return sql;
	}
%>
