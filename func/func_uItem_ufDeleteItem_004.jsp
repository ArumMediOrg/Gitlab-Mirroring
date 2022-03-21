<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%!
	public String func_uItem_ufDeleteItem_004(Statement argStmtExec, HashMap argHtMethod) throws Exception {

		String sql = "";
		String sql2 = "";
		String sql_disp = "";

		try {

			String IIV_ITEM_CD = (String) argHtMethod.get("IIV_ITEM_CD");

			//
			if(IIV_ITEM_CD == null) { IIV_ITEM_CD = ""; }

			//
			IIV_ITEM_CD = CTr.Replace(IIV_ITEM_CD, "'", "''");

			sql = "DELETE FROM IT_ITEM_VLDT";
			sql += " WHERE IIV_ITEM_CD = '" + IIV_ITEM_CD + "'";

			argStmtExec.executeUpdate(sql);

		} catch (Exception e) {

			throw new FuncException(e.toString(), sql);
		}

		return sql;
	}
%>
