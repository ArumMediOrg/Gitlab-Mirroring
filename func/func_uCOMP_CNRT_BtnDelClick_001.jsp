<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%!
	public String func_uCOMP_CNRT_BtnDelClick_001(Statement argStmtExec, HashMap argHtMethod) throws Exception {

		String sql = "";
		String sql2 = "";
		String sql_disp = "";

		try {

			String COMP_CD = (String) argHtMethod.get("COMP_CD");
			String MNGT_YR = (String) argHtMethod.get("MNGT_YR");
			String CNRT_SQ = (String) argHtMethod.get("CNRT_SQ");
			String CUST_SQ = (String) argHtMethod.get("CUST_SQ");

			//
			if(COMP_CD == null) { COMP_CD = ""; }
			if(MNGT_YR == null) { MNGT_YR = ""; }
			if(CNRT_SQ == null) { CNRT_SQ = ""; }
			if(CUST_SQ == null) { CUST_SQ = ""; }

			//
			COMP_CD = CTr.Replace(COMP_CD, "'", "''");
			MNGT_YR = CTr.Replace(MNGT_YR, "'", "''");
			CNRT_SQ = CTr.Replace(CNRT_SQ, "'", "''");
			CUST_SQ = CTr.Replace(CUST_SQ, "'", "''");

			sql = "DELETE FROM ET_COMP_CNRT_CUST";
			sql += " WHERE ECT_COMP_CD = '" + COMP_CD + "'";
			sql += " AND ECT_MNGT_YR = '" + MNGT_YR + "'";
			sql += " AND ECT_CNRT_SQ = '" + CNRT_SQ + "'";
			sql += " AND ECT_CUST_SQ = '" + CUST_SQ + "'";

			argStmtExec.executeUpdate(sql);

		} catch (Exception e) {

			throw new FuncException(e.toString(), sql);
		}

		return sql;
	}
%>
