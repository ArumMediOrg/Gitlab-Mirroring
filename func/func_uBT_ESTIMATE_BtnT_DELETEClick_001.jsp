<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%!
	public String func_uBT_ESTIMATE_BtnT_DELETEClick_001(Statement argStmtExec, HashMap argHtMethod) throws Exception {

		String sql = "";
		String sql2 = "";
		String sql_disp = "";

		try {

			String MNGT_YR = (String) argHtMethod.get("MNGT_YR");
			String ESTI_CD = (String) argHtMethod.get("ESTI_CD");
			String DEPT_SQ = (String) argHtMethod.get("DEPT_SQ");

			//
			if(MNGT_YR == null) { MNGT_YR = ""; }
			if(ESTI_CD == null) { ESTI_CD = ""; }
			if(DEPT_SQ == null) { DEPT_SQ = ""; }

			//
			MNGT_YR = CTr.Replace(MNGT_YR, "'", "''");
			ESTI_CD = CTr.Replace(ESTI_CD, "'", "''");
			DEPT_SQ = CTr.Replace(DEPT_SQ, "'", "''");

			sql = "DELETE FROM BT_ESTI_DEPT";
			sql += " WHERE BED_MNGT_YR = '" + MNGT_YR + "'";
			sql += " AND BED_ESTI_CD = '" + ESTI_CD + "'";
			sql += " AND BED_DEPT_SQ = '" + DEPT_SQ + "'";

			argStmtExec.executeUpdate(sql);

			sql = "DELETE FROM BT_ESTI_DEPT_ITEM";
			sql += " WHERE BET_MNGT_YR = '" + MNGT_YR + "'";
			sql += " AND BET_ESTI_CD = '" + ESTI_CD + "'";
			sql += " AND BET_DEPT_SQ = '" + DEPT_SQ + "'";

			argStmtExec.executeUpdate(sql);

		} catch (Exception e) {

			throw new FuncException(e.toString(), sql);
		}

		return sql;
	}
%>
