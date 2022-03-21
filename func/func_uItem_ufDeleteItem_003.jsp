<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%!
	public String func_uItem_ufDeleteItem_003(Statement argStmtExec, HashMap argHtMethod) throws Exception {

		String sql = "";
		String sql2 = "";
		String sql_disp = "";

		try {

			String IIR_ITEM_CD = (String) argHtMethod.get("IIR_ITEM_CD");

			//
			if(IIR_ITEM_CD == null) { IIR_ITEM_CD = ""; }

			//
			IIR_ITEM_CD = CTr.Replace(IIR_ITEM_CD, "'", "''");

			sql = "DELETE FROM IT_ITEM_RESULT";
			sql += " WHERE IIR_ITEM_CD = '" + IIR_ITEM_CD + "'";

			argStmtExec.executeUpdate(sql);

		} catch (Exception e) {

			throw new FuncException(e.toString(), sql);
		}

		return sql;
	}
%>
