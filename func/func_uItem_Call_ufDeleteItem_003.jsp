<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%!
	public String func_uItem_Call_ufDeleteItem_003(Statement argStmtExec, HashMap argHtMethod) throws Exception {

		String sql = "";
		String sql2 = "";
		String sql_disp = "";

		try {

			String SFIELD = (String) argHtMethod.get("SFIELD");
			String SVAL = (String) argHtMethod.get("SVAL");
			String MODI_ID = (String) argHtMethod.get("MODI_ID");
			String ITEM_CD = (String) argHtMethod.get("ITEM_CD");

			//
			if(SFIELD == null) { SFIELD = ""; }
			if(SVAL == null) { SVAL = ""; }
			if(MODI_ID == null) { MODI_ID = ""; }
			if(ITEM_CD == null) { ITEM_CD = ""; }

			//
			SFIELD = CTr.Replace(SFIELD, "'", "''");
			SVAL = CTr.Replace(SVAL, "'", "''");
			MODI_ID = CTr.Replace(MODI_ID, "'", "''");
			ITEM_CD = CTr.Replace(ITEM_CD, "'", "''");

			sql = "UPDATE IT_ITEM_CALL SET ";
			sql += "  " + SFIELD + " = '" + SVAL + "'";
			sql += ", IIC_MODI_ID = '" + MODI_ID + "'";
			sql += ", IIC_MODI_DTT = SYSDATE";
			sql += " WHERE IIC_ITEM_CD = '" + ITEM_CD + "'";

			argStmtExec.executeUpdate(sql);

		} catch (Exception e) {

			throw new FuncException(e.toString(), sql);
		}

		return sql;
	}
%>
