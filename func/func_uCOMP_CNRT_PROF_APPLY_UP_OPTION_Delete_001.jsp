<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%!
	public String func_uCOMP_CNRT_PROF_APPLY_UP_OPTION_Delete_001(Statement argStmtExec, HashMap argHtMethod) throws Exception {

		String sql = "";
		String sql2 = "";
		String sql_disp = "";

		try {

			String COMP_CD = (String) argHtMethod.get("COMP_CD");
			String MNGT_YR = (String) argHtMethod.get("MNGT_YR");
			String CNRT_SQ = (String) argHtMethod.get("CNRT_SQ");
			String PROF_SQ = (String) argHtMethod.get("PROF_SQ");
			String OPTN_SQ = (String) argHtMethod.get("OPTN_SQ");

			//
			if(COMP_CD == null) { COMP_CD = ""; }
			if(MNGT_YR == null) { MNGT_YR = ""; }
			if(CNRT_SQ == null) { CNRT_SQ = ""; }
			if(PROF_SQ == null) { PROF_SQ = ""; }
			if(OPTN_SQ == null) { OPTN_SQ = ""; }

			//
			COMP_CD = CTr.Replace(COMP_CD, "'", "''");
			MNGT_YR = CTr.Replace(MNGT_YR, "'", "''");
			CNRT_SQ = CTr.Replace(CNRT_SQ, "'", "''");
			PROF_SQ = CTr.Replace(PROF_SQ, "'", "''");
			OPTN_SQ = CTr.Replace(OPTN_SQ, "'", "''");

			sql = "DELETE FROM ET_COMP_CNRT_OPTN";
			sql += " WHERE ECO_COMP_CD = '" + COMP_CD + "'";
			sql += " AND ECO_MNGT_YR = '" + MNGT_YR + "'";
			sql += " AND ECO_CNRT_SQ = '" + CNRT_SQ + "'";
			sql += " AND ECO_PROF_SQ = '" + PROF_SQ + "'";
			sql += " AND ECO_OPTN_SQ = '" + OPTN_SQ + "'";

			argStmtExec.executeUpdate(sql);

		} catch (Exception e) {

			throw new FuncException(e.toString(), sql);
		}

		return sql;
	}
%>
