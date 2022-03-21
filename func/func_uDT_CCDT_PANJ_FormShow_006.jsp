<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%!
	public String func_uDT_CCDT_PANJ_FormShow_006(Statement argStmtExec, HashMap argHtMethod) throws Exception {

		String sql = "";
		String sql2 = "";
		String sql_disp = "";

		try {

			String VALUE = (String) argHtMethod.get("VALUE");
			String LARGE = (String) argHtMethod.get("LARGE");
			String LEVEL = (String) argHtMethod.get("LEVEL");
			String USE_YN = (String) argHtMethod.get("USE_YN");
			String SMALL = (String) argHtMethod.get("SMALL");

			//
			if(VALUE == null) { VALUE = ""; }
			if(LARGE == null) { LARGE = ""; }
			if(LEVEL == null) { LEVEL = ""; }
			if(USE_YN == null) { USE_YN = ""; }
			if(SMALL == null) { SMALL = ""; }

			//
			VALUE = CTr.Replace(VALUE, "'", "''");
			LARGE = CTr.Replace(LARGE, "'", "''");
			LEVEL = CTr.Replace(LEVEL, "'", "''");
			USE_YN = CTr.Replace(USE_YN, "'", "''");
			SMALL = CTr.Replace(SMALL, "'", "''");

			sql = "UPDATE CT_COMMON SET ";
			sql += "  CCN_VALUE = '" + VALUE + "'";
			sql += " WHERE CCN_LARGE = '" + LARGE + "'";
			sql += " AND CCN_LEVEL = '" + LEVEL + "'";
			sql += " AND CCN_USE_YN = '" + USE_YN + "'";
			sql += " AND CCN_SMALL = '" + SMALL + "'";

			argStmtExec.executeUpdate(sql);

		} catch (Exception e) {

			throw new FuncException(e.toString(), sql);
		}

		return sql;
	}
%>
