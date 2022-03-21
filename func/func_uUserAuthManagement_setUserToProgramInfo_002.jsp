<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%!
	public String func_uUserAuthManagement_setUserToProgramInfo_002(Statement argStmtExec, HashMap argHtMethod) throws Exception {

		String sql = "";
		String sql2 = "";
		String sql_disp = "";

		try {

			String AUSERKEY = (String) argHtMethod.get("AUSERKEY");
			String AGROUPKEY = (String) argHtMethod.get("AGROUPKEY");

			//
			if(AUSERKEY == null) { AUSERKEY = ""; }
			if(AGROUPKEY == null) { AGROUPKEY = ""; }

			//
			AUSERKEY = CTr.Replace(AUSERKEY, "'", "''");
			AGROUPKEY = CTr.Replace(AGROUPKEY, "'", "''");

			sql = "INSERT INTO IT_AUTH_PRGM_ID (IAP_USER_ID, IAP_PRGM_NM, IAP_MENU_ID, IAP_LIBR_NM, IAP_PARE_ID, IAP_MENU_LV, IAP_PRGM_SQ, IAP_MENU_RU, IAP_SELECT, IAP_SAVE, IAP_PRINT, IAP_DELETE, IAP_INPT_ID, IAP_INPT_DTT)";
			sql += " SELECT ";
			sql += "  '" + AUSERKEY + "' IAU_EMP_NO";
			sql += ", IAP_PRGM_NM";
			sql += ", IAP_MENU_ID";
			sql += ", IAP_LIBR_NM";
			sql += ", IAP_PARE_ID";
			sql += ", IAP_MENU_LV";
			sql += ", IAP_PRGM_SQ";
			sql += ", IAP_MENU_RU";
			sql += ", IAP_SELECT";
			sql += ", IAP_SAVE";
			sql += ", IAP_PRINT";
			sql += ", IAP_DELETE";
			sql += ", 'ADMIN'";
			sql += ", SYSDATE";
			sql += " FROM IT_AUTH_PRGM_ID";
			sql += " WHERE IAP_USER_ID = '" + AGROUPKEY + "'";

			argStmtExec.executeUpdate(sql);

		} catch (Exception e) {

			throw new FuncException(e.toString(), sql);
		}

		return sql;
	}
%>
