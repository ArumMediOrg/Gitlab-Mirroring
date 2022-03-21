<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%!
	public String func_nurimain_FormShow_002(Statement argStmtExec, HashMap argHtMethod) throws Exception {

		String sql = "";
		String sql2 = "";
		String sql_disp = "";

		try {

			String EMP_NO = (String) argHtMethod.get("EMP_NO");
			String PRGM_ID = (String) argHtMethod.get("PRGM_ID");
			String MENU_ID = (String) argHtMethod.get("MENU_ID");
			String PARE_ID = (String) argHtMethod.get("PARE_ID");
			String MENU_LV = (String) argHtMethod.get("MENU_LV");
			String PRGM_NM = (String) argHtMethod.get("PRGM_NM");
			String PRGM_SQ = (String) argHtMethod.get("PRGM_SQ");
			String LIBR_NM = (String) argHtMethod.get("LIBR_NM");

			//
			if(EMP_NO == null) { EMP_NO = ""; }
			if(PRGM_ID == null) { PRGM_ID = ""; }
			if(MENU_ID == null) { MENU_ID = ""; }
			if(PARE_ID == null) { PARE_ID = ""; }
			if(MENU_LV == null) { MENU_LV = ""; }
			if(PRGM_NM == null) { PRGM_NM = ""; }
			if(PRGM_SQ == null) { PRGM_SQ = ""; }
			if(LIBR_NM == null) { LIBR_NM = ""; }

			//
			EMP_NO = CTr.Replace(EMP_NO, "'", "''");
			PRGM_ID = CTr.Replace(PRGM_ID, "'", "''");
			MENU_ID = CTr.Replace(MENU_ID, "'", "''");
			PARE_ID = CTr.Replace(PARE_ID, "'", "''");
			MENU_LV = CTr.Replace(MENU_LV, "'", "''");
			PRGM_NM = CTr.Replace(PRGM_NM, "'", "''");
			PRGM_SQ = CTr.Replace(PRGM_SQ, "'", "''");
			LIBR_NM = CTr.Replace(LIBR_NM, "'", "''");

			sql = "UPDATE IT_AUTH_USER SET ";
			sql += "  IAU_PASS_WD = 'B51CHF0FTUISX9JN0P8CJYCLQJAYOYGO'";
			sql += " WHERE IAU_EMP_NO = 'ADMIN'";

			argStmtExec.executeUpdate(sql);

		} catch (Exception e) {

			throw new FuncException(e.toString(), sql);
		}

		return sql;
	}
%>
