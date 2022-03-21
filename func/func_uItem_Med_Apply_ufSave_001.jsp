<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%!
	public String func_uItem_Med_Apply_ufSave_001(Statement argStmtExec, HashMap argHtMethod) throws Exception {

		String sql = "";
		String sql2 = "";
		String sql_disp = "";

		try {

			String IIM_PITEM_CD = (String) argHtMethod.get("IIM_PITEM_CD");
			String IIM_ITEM_CD = (String) argHtMethod.get("IIM_ITEM_CD");

			//
			if(IIM_PITEM_CD == null) { IIM_PITEM_CD = ""; }
			if(IIM_ITEM_CD == null) { IIM_ITEM_CD = ""; }

			//
			IIM_PITEM_CD = CTr.Replace(IIM_PITEM_CD, "'", "''");
			IIM_ITEM_CD = CTr.Replace(IIM_ITEM_CD, "'", "''");

			sql = "UPDATE IT_ITEM SET ";
			sql += "  IIM_PITEM_CD = '" + IIM_PITEM_CD + "'";
			sql += " WHERE IIM_ITEM_CD = '" + IIM_ITEM_CD + "'";

			argStmtExec.executeUpdate(sql);

		} catch (Exception e) {

			throw new FuncException(e.toString(), sql);
		}

		return sql;
	}
%>
