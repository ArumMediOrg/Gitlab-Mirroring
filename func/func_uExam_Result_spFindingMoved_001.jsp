<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%!
	public String func_uExam_Result_spFindingMoved_001(Statement argStmtExec, HashMap argHtMethod) throws Exception {

		String sql = "";
		String sql2 = "";
		String sql_disp = "";

		try {

			String VIEW_WIDTH = (String) argHtMethod.get("VIEW_WIDTH");

			//
			if(VIEW_WIDTH == null) { VIEW_WIDTH = ""; }

			//
			VIEW_WIDTH = CTr.Replace(VIEW_WIDTH, "'", "''");

			sql = "UPDATE IT_HOSPITAL SET ";
			sql += "  IHL_VIEW_WIDTH = '" + VIEW_WIDTH + "'";

			argStmtExec.executeUpdate(sql);

		} catch (Exception e) {

			throw new FuncException(e.toString(), sql);
		}

		return sql;
	}
%>
