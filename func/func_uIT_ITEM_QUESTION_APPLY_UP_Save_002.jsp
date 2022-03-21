<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%!
	public String func_uIT_ITEM_QUESTION_APPLY_UP_Save_002(Statement argStmtExec, HashMap argHtMethod) throws Exception {

		String sql = "";
		String sql2 = "";
		String sql_disp = "";

		try {

			String APLY_DT = (String) argHtMethod.get("APLY_DT");
			String ITEM_CD = (String) argHtMethod.get("ITEM_CD");

			//
			if(APLY_DT == null) { APLY_DT = ""; }
			if(ITEM_CD == null) { ITEM_CD = ""; }

			//
			APLY_DT = CTr.Replace(APLY_DT, "'", "''");
			ITEM_CD = CTr.Replace(ITEM_CD, "'", "''");

			sql = "DELETE FROM IT_ITEM_QUESTION";
			sql += " WHERE IIQ_APLY_DT = '" + APLY_DT + "'";
			sql += " AND IIQ_ITEM_CD = '" + ITEM_CD + "'";

			argStmtExec.executeUpdate(sql);

		} catch (Exception e) {

			throw new FuncException(e.toString(), sql);
		}

		return sql;
	}
%>
