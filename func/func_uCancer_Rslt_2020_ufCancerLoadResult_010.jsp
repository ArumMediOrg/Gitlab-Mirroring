<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%!
	public String func_uCancer_Rslt_2020_ufCancerLoadResult_010(Statement argStmtExec, HashMap argHtMethod) throws Exception {

		String sql = "";
		String sql2 = "";
		String sql_disp = "";

		try {

			String SRSLT_CD = (String) argHtMethod.get("SRSLT_CD");
			String USE = (String) argHtMethod.get("USE");

			//
			if(SRSLT_CD == null) { SRSLT_CD = ""; }
			if(USE == null) { USE = ""; }

			//
			SRSLT_CD = CTr.Replace(SRSLT_CD, "'", "''");
			USE = CTr.Replace(USE, "'", "''");

			sql = " UPDATE ET_SAVED_RSLT SET ";
			sql += " ESR_USE_YN = '" + USE + "' ";
			sql += " WHERE ESR_RSLT_CD = '" + SRSLT_CD + "'";

			argStmtExec.executeUpdate(sql);

		} catch (Exception e) {

			throw new FuncException(e.toString(), sql);
		}

		return sql;
	}
%>
