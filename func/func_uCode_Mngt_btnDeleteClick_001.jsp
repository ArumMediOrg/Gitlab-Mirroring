<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%!
	public String func_uCode_Mngt_btnDeleteClick_001(Statement argStmtExec, HashMap argHtMethod) throws Exception {

		String sql = "";
		String sql2 = "";
		String sql_disp = "";

		try {

			String STRLARGE = (String) argHtMethod.get("STRLARGE");
			String EDCD_SMALL = (String) argHtMethod.get("EDCD_SMALL");

			//
			if(STRLARGE == null) { STRLARGE = ""; }
			if(EDCD_SMALL == null) { EDCD_SMALL = ""; }

			//
			STRLARGE = CTr.Replace(STRLARGE, "'", "''");
			EDCD_SMALL = CTr.Replace(EDCD_SMALL, "'", "''");

			sql = "UPDATE CT_COMMON SET ";
			sql += "  CCN_USE_YN = 'N'";
			sql += " WHERE CCN_LARGE = '" + STRLARGE + "'";
			sql += " AND CCN_SMALL = '" + EDCD_SMALL + "'";

			argStmtExec.executeUpdate(sql);

		} catch (Exception e) {

			throw new FuncException(e.toString(), sql);
		}

		return sql;
	}
%>
