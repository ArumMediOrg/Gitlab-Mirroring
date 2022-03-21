<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%!
	public String func_uUserAuthManagement_setGridStatus_004(Statement argStmtExec, HashMap argHtMethod) throws Exception {

		String sql = "";
		String sql2 = "";
		String sql_disp = "";

		try {

			String IAP_SELECT = (String) argHtMethod.get("IAP_SELECT");
			String IAP_SAVE = (String) argHtMethod.get("IAP_SAVE");
			String IAP_PRINT = (String) argHtMethod.get("IAP_PRINT");
			String IAP_DELETE = (String) argHtMethod.get("IAP_DELETE");
			String IAP_MODI_ID = (String) argHtMethod.get("IAP_MODI_ID");
			String IAP_USER_ID = (String) argHtMethod.get("IAP_USER_ID");
			String IAP_LIBR_NM = (String) argHtMethod.get("IAP_LIBR_NM");

			//
			if(IAP_SELECT == null) { IAP_SELECT = ""; }
			if(IAP_SAVE == null) { IAP_SAVE = ""; }
			if(IAP_PRINT == null) { IAP_PRINT = ""; }
			if(IAP_DELETE == null) { IAP_DELETE = ""; }
			if(IAP_MODI_ID == null) { IAP_MODI_ID = ""; }
			if(IAP_USER_ID == null) { IAP_USER_ID = ""; }
			if(IAP_LIBR_NM == null) { IAP_LIBR_NM = ""; }

			//
			IAP_SELECT = CTr.Replace(IAP_SELECT, "'", "''");
			IAP_SAVE = CTr.Replace(IAP_SAVE, "'", "''");
			IAP_PRINT = CTr.Replace(IAP_PRINT, "'", "''");
			IAP_DELETE = CTr.Replace(IAP_DELETE, "'", "''");
			IAP_MODI_ID = CTr.Replace(IAP_MODI_ID, "'", "''");
			IAP_USER_ID = CTr.Replace(IAP_USER_ID, "'", "''");
			IAP_LIBR_NM = CTr.Replace(IAP_LIBR_NM, "'", "''");

			sql = "UPDATE IT_AUTH_PRGM_ID SET ";
			sql += "  IAP_SELECT = '" + IAP_SELECT + "'";
			sql += ", IAP_SAVE = '" + IAP_SAVE + "'";
			sql += ", IAP_PRINT = '" + IAP_PRINT + "'";
			sql += ", IAP_DELETE = '" + IAP_DELETE + "'";
			sql += ", IAP_MODI_ID = '" + IAP_MODI_ID + "'";
			sql += ", IAP_MODI_DTT = SYSDATE";
			sql += " WHERE IAP_USER_ID = '" + IAP_USER_ID + "'";
			sql += " AND IAP_LIBR_NM = '" + IAP_LIBR_NM + "'";

			argStmtExec.executeUpdate(sql);

		} catch (Exception e) {

			throw new FuncException(e.toString(), sql);
		}

		return sql;
	}
%>
