<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%!
	public String func_uCOMP_AGEA_TRNS_OKBtnClick_002(Statement argStmtExec, HashMap argHtMethod) throws Exception {

		String sql = "";
		String sql2 = "";
		String sql_disp = "";

		try {

			String USER_ID = (String) argHtMethod.get("USER_ID");
			String COMP_CD = (String) argHtMethod.get("COMP_CD");
			String MNGT_YR = (String) argHtMethod.get("MNGT_YR");

			//
			if(USER_ID == null) { USER_ID = ""; }
			if(COMP_CD == null) { COMP_CD = ""; }
			if(MNGT_YR == null) { MNGT_YR = ""; }

			//
			USER_ID = CTr.Replace(USER_ID, "'", "''");
			COMP_CD = CTr.Replace(COMP_CD, "'", "''");
			MNGT_YR = CTr.Replace(MNGT_YR, "'", "''");

			sql = "UPDATE ET_COMP_AGEA SET ";
			sql += "  ECA_USE_YN = 'N'";
			sql += ", ECA_NUSE_ID = '" + USER_ID + "'";
			sql += ", ECA_NUSE_DTT = SYSDATE";
			sql += " WHERE ECA_COMP_CD = '" + COMP_CD + "'";
			sql += " AND ECA_MNGT_YR = '" + MNGT_YR + "'";
			sql += " AND ECA_USE_YN = 'Y'";

			argStmtExec.executeUpdate(sql);

		} catch (Exception e) {

			throw new FuncException(e.toString(), sql);
		}

		return sql;
	}
%>
