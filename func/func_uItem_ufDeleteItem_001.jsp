<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%!
	public String func_uItem_ufDeleteItem_001(Statement argStmtExec, HashMap argHtMethod) throws Exception {

		String sql = "";
		String sql2 = "";
		String sql_disp = "";

		try {

			String IIM_ITEM_CD = (String) argHtMethod.get("IIM_ITEM_CD");

			//
			if(IIM_ITEM_CD == null) { IIM_ITEM_CD = ""; }

			//
			IIM_ITEM_CD = CTr.Replace(IIM_ITEM_CD, "'", "''");

			sql = "DELETE FROM IT_ITEM";
			sql += " WHERE IIM_ITEM_CD = '" + IIM_ITEM_CD + "'";

			argStmtExec.executeUpdate(sql);

		} catch (Exception e) {

			throw new FuncException(e.toString(), sql);
		}

		return sql;
	}
%>
