<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%!
	public String func_UConfig_UP_GerSetting_003(Statement argStmtExec, HashMap argHtMethod) throws Exception {

		String sql = "";
		String sql2 = "";
		String sql_disp = "";

		try {

			String USER_NO = (String) argHtMethod.get("USER_NO");
			String CFG_CD = (String) argHtMethod.get("CFG_CD");
			String CFG_NM = (String) argHtMethod.get("CFG_NM");
			String BIGO = (String) argHtMethod.get("BIGO");

			//
			if(USER_NO == null) { USER_NO = ""; }
			if(CFG_CD == null) { CFG_CD = ""; }
			if(CFG_NM == null) { CFG_NM = ""; }
			if(BIGO == null) { BIGO = ""; }

			//
			USER_NO = CTr.Replace(USER_NO, "'", "''");
			CFG_CD = CTr.Replace(CFG_CD, "'", "''");
			CFG_NM = CTr.Replace(CFG_NM, "'", "''");
			BIGO = CTr.Replace(BIGO, "'", "''");

			sql = "INSERT INTO UT_USRCFG (UUC_USER_NO,UUC_CFG_CD,UUC_CFG_NM,UUC_BIGO,UUC_INPUT_DTT,UUC_INPUT_ID) VALUES (";
			sql += "  '" + USER_NO + "'";
			sql += ", '" + CFG_CD + "'";
			sql += ", '" + CFG_NM + "'";
			sql += ", '" + BIGO + "'";
			sql += ", SYSDATE";
			sql += ", '" + USER_NO + "'";
			sql += ")";

			argStmtExec.executeUpdate(sql);

		} catch (Exception e) {

			throw new FuncException(e.toString(), sql);
		}

		return sql;
	}
%>
