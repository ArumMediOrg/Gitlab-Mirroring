<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%!
	public String func_uBT_ESTIMATE_BtnJ_DELETEClick_001(Statement argStmtExec, HashMap argHtMethod) throws Exception {

		String sql = "";
		String sql2 = "";
		String sql_disp = "";

		try {

			String MNGT_YR = (String) argHtMethod.get("MNGT_YR");
			String ESTI_CD = (String) argHtMethod.get("ESTI_CD");
			String PROF_SQ = (String) argHtMethod.get("PROF_SQ");

			//
			if(MNGT_YR == null) { MNGT_YR = ""; }
			if(ESTI_CD == null) { ESTI_CD = ""; }
			if(PROF_SQ == null) { PROF_SQ = ""; }

			//
			MNGT_YR = CTr.Replace(MNGT_YR, "'", "''");
			ESTI_CD = CTr.Replace(ESTI_CD, "'", "''");
			PROF_SQ = CTr.Replace(PROF_SQ, "'", "''");

			sql = "DELETE FROM BT_ESTI_PROF";
			sql += " WHERE BEP_MNGT_YR = '" + MNGT_YR + "'";
			sql += " AND BEP_ESTI_CD = '" + ESTI_CD + "'";
			sql += " AND BEP_PROF_SQ = '" + PROF_SQ + "'";

			argStmtExec.executeUpdate(sql);

			sql = "DELETE FROM BT_ESTI_PROF_ITEM";
			sql += " WHERE BEI_MNGT_YR = '" + MNGT_YR + "'";
			sql += " AND BEI_ESTI_CD = '" + ESTI_CD + "'";
			sql += " AND BEI_PROF_SQ = '" + PROF_SQ + "'";

			argStmtExec.executeUpdate(sql);

			sql = "DELETE FROM BT_ESTI_OPTN";
			sql += " WHERE BEO_MNGT_YR = '" + MNGT_YR + "'";
			sql += " AND BEO_ESTI_CD = '" + ESTI_CD + "'";
			sql += " AND BEO_PROF_SQ = '" + PROF_SQ + "'";

			argStmtExec.executeUpdate(sql);

			sql = "DELETE FROM BT_ESTI_OPTN_ITEM";
			sql += " WHERE BEM_MNGT_YR = '" + MNGT_YR + "'";
			sql += " AND BEM_ESTI_CD = '" + ESTI_CD + "'";
			sql += " AND BEM_PROF_SQ = '" + PROF_SQ + "'";

			argStmtExec.executeUpdate(sql);

		} catch (Exception e) {

			throw new FuncException(e.toString(), sql);
		}

		return sql;
	}
%>
