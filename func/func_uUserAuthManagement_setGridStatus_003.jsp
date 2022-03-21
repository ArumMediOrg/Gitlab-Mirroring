<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%!
	public String func_uUserAuthManagement_setGridStatus_003(Statement argStmtExec, HashMap argHtMethod) throws Exception {

		String sql = "";
		String sql2 = "";
		String sql_disp = "";

		try {

			String IAP_USER_ID = (String) argHtMethod.get("IAP_USER_ID");
			String IAP_SELECT = (String) argHtMethod.get("IAP_SELECT");
			String IAP_SAVE = (String) argHtMethod.get("IAP_SAVE");
			String IAP_PRINT = (String) argHtMethod.get("IAP_PRINT");
			String IAP_DELETE = (String) argHtMethod.get("IAP_DELETE");
			String IAP_LIBR_NM = (String) argHtMethod.get("IAP_LIBR_NM");

			//
			if(IAP_USER_ID == null) { IAP_USER_ID = ""; }
			if(IAP_SELECT == null) { IAP_SELECT = ""; }
			if(IAP_SAVE == null) { IAP_SAVE = ""; }
			if(IAP_PRINT == null) { IAP_PRINT = ""; }
			if(IAP_DELETE == null) { IAP_DELETE = ""; }
			if(IAP_LIBR_NM == null) { IAP_LIBR_NM = ""; }

			//
			IAP_USER_ID = CTr.Replace(IAP_USER_ID, "'", "''");
			IAP_SELECT = CTr.Replace(IAP_SELECT, "'", "''");
			IAP_SAVE = CTr.Replace(IAP_SAVE, "'", "''");
			IAP_PRINT = CTr.Replace(IAP_PRINT, "'", "''");
			IAP_DELETE = CTr.Replace(IAP_DELETE, "'", "''");
			IAP_LIBR_NM = CTr.Replace(IAP_LIBR_NM, "'", "''");

			sql = "INSERT INTO IT_AUTH_PRGM_ID (IAP_USER_ID, IAP_PRGM_NM, IAP_MENU_ID, IAP_LIBR_NM, IAP_PARE_ID, IAP_MENU_LV, IAP_PRGM_SQ, IAP_MENU_RU, IAP_SELECT, IAP_SAVE, IAP_PRINT, IAP_DELETE, IAP_INPT_ID, IAP_INPT_DTT)";
			sql += " SELECT ";
			sql += "  '" + IAP_USER_ID + "' IAU_EMP_NO";
			sql += ", IAP_PRGM_NM";
			sql += ", IAP_MENU_ID";
			sql += ", IAP_LIBR_NM";
			sql += ", IAP_PARE_ID";
			sql += ", IAP_MENU_LV";
			sql += ", IAP_PRGM_SQ";
			sql += ", IAP_MENU_RU";
			sql += ", '" + IAP_SELECT + "'";
			sql += ", '" + IAP_SAVE + "'";
			sql += ", '" + IAP_PRINT + "'";
			sql += ", '" + IAP_DELETE + "'";
			sql += ", 'ADMIN'";
			sql += ", SYSDATE";
			sql += " FROM IT_AUTH_PRGM";
			sql += " WHERE IAP_LIBR_NM = '" + IAP_LIBR_NM + "'";

			argStmtExec.executeUpdate(sql);

		} catch (Exception e) {

			throw new FuncException(e.toString(), sql);
		}

		return sql;
	}
%>
