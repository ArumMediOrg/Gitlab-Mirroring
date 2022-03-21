<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%!
	public String func_UConfig_UP_GerSetting_002(Statement argStmtExec, HashMap argHtMethod) throws Exception {

		String sql = "";
		String sql2 = "";
		String sql_disp = "";

		try {

			String CFG_NM = (String) argHtMethod.get("CFG_NM");
			String BIGO = (String) argHtMethod.get("BIGO");
			String USER_NO = (String) argHtMethod.get("USER_NO");
			String CFG_CD = (String) argHtMethod.get("CFG_CD");

			//
			if(CFG_NM == null) { CFG_NM = ""; }
			if(BIGO == null) { BIGO = ""; }
			if(USER_NO == null) { USER_NO = ""; }
			if(CFG_CD == null) { CFG_CD = ""; }

			//
			CFG_NM = CTr.Replace(CFG_NM, "'", "''");
			BIGO = CTr.Replace(BIGO, "'", "''");
			USER_NO = CTr.Replace(USER_NO, "'", "''");
			CFG_CD = CTr.Replace(CFG_CD, "'", "''");

			sql = "UPDATE UT_USRCFG SET ";
			sql += "  UUC_CFG_NM ='" + CFG_NM + "'";
			sql += ", UUC_BIGO ='" + BIGO + "'";
			sql += " WHERE UUC_USER_NO = '" + USER_NO + "'";
			sql += " AND UUC_CFG_CD = '" + CFG_CD + "'";

			argStmtExec.executeUpdate(sql);

		} catch (Exception e) {

			throw new FuncException(e.toString(), sql);
		}

		return sql;
	}
%>
