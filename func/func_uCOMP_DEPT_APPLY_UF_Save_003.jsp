<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%!
	public String func_uCOMP_DEPT_APPLY_UF_Save_003(Statement argStmtExec, HashMap argHtMethod) throws Exception {

		String sql = "";
		String sql2 = "";
		String sql_disp = "";

		try {

			String COMP_CD = (String) argHtMethod.get("COMP_CD");
			String MNGT_YR = (String) argHtMethod.get("MNGT_YR");
			String HALF_CD = (String) argHtMethod.get("HALF_CD");
			String DEPT_CD = (String) argHtMethod.get("DEPT_CD");

			//
			if(COMP_CD == null) { COMP_CD = ""; }
			if(MNGT_YR == null) { MNGT_YR = ""; }
			if(HALF_CD == null) { HALF_CD = ""; }
			if(DEPT_CD == null) { DEPT_CD = ""; }

			//
			COMP_CD = CTr.Replace(COMP_CD, "'", "''");
			MNGT_YR = CTr.Replace(MNGT_YR, "'", "''");
			HALF_CD = CTr.Replace(HALF_CD, "'", "''");
			DEPT_CD = CTr.Replace(DEPT_CD, "'", "''");

			sql = "DELETE FROM IT_COMP_DEPT_ITEM";
			sql += " WHERE ICI_COMP_CD = '" + COMP_CD + "'";
			sql += " AND ICI_MNGT_YR = '" + MNGT_YR + "'";
			sql += " AND ICI_HALF_CD = '" + HALF_CD + "'";
			sql += " AND ICI_DEPT_CD = '" + DEPT_CD + "'";

			argStmtExec.executeUpdate(sql);

		} catch (Exception e) {

			throw new FuncException(e.toString(), sql);
		}

		return sql;
	}
%>
