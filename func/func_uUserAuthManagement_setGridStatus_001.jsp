<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%!
	public String func_uUserAuthManagement_setGridStatus_001(Statement argStmtExec, HashMap argHtMethod) throws Exception {

		String sql = "";
		String sql2 = "";
		String sql_disp = "";

		try {

			String IAU_EMP_NO = (String) argHtMethod.get("IAU_EMP_NO");
			String IAP_LIBR_NM = (String) argHtMethod.get("IAP_LIBR_NM");

			//
			if(IAU_EMP_NO == null) { IAU_EMP_NO = ""; }
			if(IAP_LIBR_NM == null) { IAP_LIBR_NM = ""; }

			//
			IAU_EMP_NO = CTr.Replace(IAU_EMP_NO, "'", "''");
			IAP_LIBR_NM = CTr.Replace(IAP_LIBR_NM, "'", "''");

			sql = "INSERT INTO IT_AUTH_PRGM_ID (IAP_USER_ID, IAP_PRGM_NM, IAP_MENU_ID, IAP_LIBR_NM, IAP_PARE_ID, IAP_MENU_LV, IAP_PRGM_SQ, IAP_MENU_RU, IAP_SELECT, IAP_SAVE, IAP_PRINT, IAP_DELETE, IAP_INPT_ID, IAP_INPT_DTT)";
			sql += " SELECT ";
			sql += "  '" + IAU_EMP_NO + "' IAU_EMP_NO";
			sql += ", IAP_PRGM_NM";
			sql += ", IAP_MENU_ID";
			sql += ", IAP_LIBR_NM";
			sql += ", IAP_PARE_ID";
			sql += ", IAP_MENU_LV";
			sql += ", IAP_PRGM_SQ";
			sql += ", IAP_MENU_RU";
			sql += ", 'Y'";
			sql += ", 'Y'";
			sql += ", 'Y'";
			sql += ", 'Y'";
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
