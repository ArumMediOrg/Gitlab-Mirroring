<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%!
	public String func_uUserAuthManagement_setGroupProgramInfo_002(Statement argStmtExec, HashMap argHtMethod) throws Exception {

		String sql = "";
		String sql2 = "";
		String sql_disp = "";

		try {

			String USER_ID = (String) argHtMethod.get("USER_ID");
			String PRGM_NM = (String) argHtMethod.get("PRGM_NM");
			String MENU_ID = (String) argHtMethod.get("MENU_ID");
			String LIBR_NM = (String) argHtMethod.get("LIBR_NM");
			String PARE_ID = (String) argHtMethod.get("PARE_ID");
			String MENU_LV = (String) argHtMethod.get("MENU_LV");
			String PRGM_SQ = (String) argHtMethod.get("PRGM_SQ");
			String MENU_RU = (String) argHtMethod.get("MENU_RU");

			//
			if(USER_ID == null) { USER_ID = ""; }
			if(PRGM_NM == null) { PRGM_NM = ""; }
			if(MENU_ID == null) { MENU_ID = ""; }
			if(LIBR_NM == null) { LIBR_NM = ""; }
			if(PARE_ID == null) { PARE_ID = ""; }
			if(MENU_LV == null) { MENU_LV = ""; }
			if(PRGM_SQ == null) { PRGM_SQ = ""; }
			if(MENU_RU == null) { MENU_RU = ""; }

			//
			USER_ID = CTr.Replace(USER_ID, "'", "''");
			PRGM_NM = CTr.Replace(PRGM_NM, "'", "''");
			MENU_ID = CTr.Replace(MENU_ID, "'", "''");
			LIBR_NM = CTr.Replace(LIBR_NM, "'", "''");
			PARE_ID = CTr.Replace(PARE_ID, "'", "''");
			MENU_LV = CTr.Replace(MENU_LV, "'", "''");
			PRGM_SQ = CTr.Replace(PRGM_SQ, "'", "''");
			MENU_RU = CTr.Replace(MENU_RU, "'", "''");

			sql = "INSERT INTO IT_AUTH_PRGM_ID (IAP_USER_ID, IAP_PRGM_NM, IAP_MENU_ID, IAP_LIBR_NM, IAP_PARE_ID, IAP_MENU_LV, IAP_PRGM_SQ, IAP_MENU_RU, IAP_SELECT, IAP_SAVE, IAP_PRINT, IAP_DELETE, IAP_INPT_ID, IAP_INPT_DTT) VALUES (";
			sql += "  '" + USER_ID + "'";
			sql += ", '" + PRGM_NM + "'";
			sql += ", '" + MENU_ID + "'";
			sql += ", '" + LIBR_NM + "'";
			sql += ", '" + PARE_ID + "'";
			sql += ", '" + MENU_LV + "'";
			sql += ", '" + PRGM_SQ + "'";
			sql += ", '" + MENU_RU + "'";
			sql += ", 'Y'";
			sql += ", 'Y'";
			sql += ", 'Y'";
			sql += ", 'Y'";
			sql += ", 'ADMIN'";
			sql += ", SYSDATE";
			sql += ")";

			argStmtExec.executeUpdate(sql);

		} catch (Exception e) {

			throw new FuncException(e.toString(), sql);
		}

		return sql;
	}
%>
