<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%!
	public String func_uItem_ufDeleteItem_002(Statement argStmtExec, HashMap argHtMethod) throws Exception {

		String sql = "";
		String sql2 = "";
		String sql_disp = "";

		try {

			String IIP_ITEM_CD = (String) argHtMethod.get("IIP_ITEM_CD");

			//
			if(IIP_ITEM_CD == null) { IIP_ITEM_CD = ""; }

			//
			IIP_ITEM_CD = CTr.Replace(IIP_ITEM_CD, "'", "''");

			sql = "DELETE FROM IT_ITEM_PRICE";
			sql += " WHERE IIP_ITEM_CD = '" + IIP_ITEM_CD + "'";

			argStmtExec.executeUpdate(sql);

		} catch (Exception e) {

			throw new FuncException(e.toString(), sql);
		}

		return sql;
	}
%>
