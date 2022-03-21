<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%!
	public String func_uDT_CCDT_PANJ_ITEM_UP_Save_001(Statement argStmtExec, HashMap argHtMethod) throws Exception {

		String sql = "";
		String sql2 = "";
		String sql_disp = "";

		try {

			String VALUE = (String) argHtMethod.get("VALUE");
			String MODI_ID = (String) argHtMethod.get("MODI_ID");
			String SMALL = (String) argHtMethod.get("SMALL");

			//
			if(VALUE == null) { VALUE = ""; }
			if(MODI_ID == null) { MODI_ID = ""; }
			if(SMALL == null) { SMALL = ""; }

			//
			VALUE = CTr.Replace(VALUE, "'", "''");
			MODI_ID = CTr.Replace(MODI_ID, "'", "''");
			SMALL = CTr.Replace(SMALL, "'", "''");

			sql = "UPDATE CT_COMMON SET ";
			sql += "  CCN_VALUE = '" + VALUE + "'";
			sql += ", CCN_MODI_ID = '" + MODI_ID + "'";
			sql += ", CCN_MODI_DTT = SYSDATE";
			sql += " WHERE CCN_LARGE = '0601'";
			sql += " AND CCN_SMALL = '" + SMALL + "'";
			sql += " AND CCN_LEVEL = '5'";

			argStmtExec.executeUpdate(sql);

		} catch (Exception e) {

			throw new FuncException(e.toString(), sql);
		}

		return sql;
	}
%>
