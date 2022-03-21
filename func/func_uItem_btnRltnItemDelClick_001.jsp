<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%!
	public String func_uItem_btnRltnItemDelClick_001(Statement argStmtExec, HashMap argHtMethod) throws Exception {

		String sql = "";
		String sql2 = "";
		String sql_disp = "";

		try {

			String IIN_ITEM_CD = (String) argHtMethod.get("IIN_ITEM_CD");
			String IIN_RLTN_CD = (String) argHtMethod.get("IIN_RLTN_CD");

			//
			if(IIN_ITEM_CD == null) { IIN_ITEM_CD = ""; }
			if(IIN_RLTN_CD == null) { IIN_RLTN_CD = ""; }

			//
			IIN_ITEM_CD = CTr.Replace(IIN_ITEM_CD, "'", "''");
			IIN_RLTN_CD = CTr.Replace(IIN_RLTN_CD, "'", "''");

			sql = "DELETE FROM IT_ITEM_RLTN";
			sql += " WHERE IIN_ITEM_CD = '" + IIN_ITEM_CD + "'";
			sql += " AND IIN_RLTN_CD = '" + IIN_RLTN_CD + "'";

			argStmtExec.executeUpdate(sql);

		} catch (Exception e) {

			throw new FuncException(e.toString(), sql);
		}

		return sql;
	}
%>
