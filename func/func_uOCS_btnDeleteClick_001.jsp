<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%!
	public String func_uOCS_btnDeleteClick_001(Statement argStmtExec, HashMap argHtMethod) throws Exception {

		String sql = "";
		String sql2 = "";
		String sql_disp = "";

		try {

			String IOC_ITEM_CD = (String) argHtMethod.get("IOC_ITEM_CD");
			String IOC_OCS_CD = (String) argHtMethod.get("IOC_OCS_CD");

			//
			if(IOC_ITEM_CD == null) { IOC_ITEM_CD = ""; }
			if(IOC_OCS_CD == null) { IOC_OCS_CD = ""; }

			//
			IOC_ITEM_CD = CTr.Replace(IOC_ITEM_CD, "'", "''");
			IOC_OCS_CD = CTr.Replace(IOC_OCS_CD, "'", "''");

			sql = "DELETE FROM IT_OCS_CODE";
			sql += " WHERE IOC_ITEM_CD = '" + IOC_ITEM_CD + "'";
			sql += " AND IOC_OCS_CD = '" + IOC_OCS_CD + "'";

			argStmtExec.executeUpdate(sql);

		} catch (Exception e) {

			throw new FuncException(e.toString(), sql);
		}

		return sql;
	}
%>
