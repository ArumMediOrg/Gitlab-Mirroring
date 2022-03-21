<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%!
	public String func_EQuestionaire_SaveToNurionAddress_003(Statement argStmtExec, HashMap argHtMethod) throws Exception {

		String sql = "";
		String sql2 = "";
		String sql_disp = "";

		try {

			String SEMAI = (String) argHtMethod.get("SEMAI");
			String SPSID = (String) argHtMethod.get("SPSID");
			String SPSNM = (String) argHtMethod.get("SPSNM");

			//
			if(SEMAI == null) { SEMAI = ""; }
			if(SPSID == null) { SPSID = ""; }
			if(SPSNM == null) { SPSNM = ""; }

			//
			SEMAI = CTr.Replace(SEMAI, "'", "''");
			SPSID = CTr.Replace(SPSID, "'", "''");
			SPSNM = CTr.Replace(SPSNM, "'", "''");

			sql = "UPDATE IT_CUSTOMER SET ";
			sql += "  ICR_EMAI_AR = '" + SEMAI + "'";
			sql += " WHERE ICR_PENL_ID = '" + SPSID + "'";
			sql += " AND ICR_PENL_NM = '" + SPSNM + "'";

			argStmtExec.executeUpdate(sql);

		} catch (Exception e) {

			throw new FuncException(e.toString(), sql);
		}

		return sql;
	}
%>
