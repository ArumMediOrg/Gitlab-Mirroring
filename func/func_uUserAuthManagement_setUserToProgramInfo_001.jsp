<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%!
	public String func_uUserAuthManagement_setUserToProgramInfo_001(Statement argStmtExec, HashMap argHtMethod) throws Exception {

		String sql = "";
		String sql2 = "";
		String sql_disp = "";

		try {

			String IAP_USER_ID = (String) argHtMethod.get("IAP_USER_ID");

			//
			if(IAP_USER_ID == null) { IAP_USER_ID = ""; }

			//
			IAP_USER_ID = CTr.Replace(IAP_USER_ID, "'", "''");

			sql = "DELETE FROM IT_AUTH_PRGM_ID";
			sql += " WHERE IAP_USER_ID = '" + IAP_USER_ID + "'";

			argStmtExec.executeUpdate(sql);

		} catch (Exception e) {

			throw new FuncException(e.toString(), sql);
		}

		return sql;
	}
%>
