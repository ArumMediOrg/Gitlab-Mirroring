<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%!
	public String func_uVT1000Apply_M_Update_SQ_002(Statement argStmtExec, HashMap argHtMethod) throws Exception {

		String sql = "";
		String sql2 = "";
		String sql_disp = "";

		try {

			String RSLT_CD = (String) argHtMethod.get("RSLT_CD");
			String ORDR_SQ = (String) argHtMethod.get("ORDR_SQ");
			String RSLT_CD2 = (String) argHtMethod.get("RSLT_CD2");

			//
			if(RSLT_CD == null) { RSLT_CD = ""; }
			if(ORDR_SQ == null) { ORDR_SQ = ""; }
			if(RSLT_CD2 == null) { RSLT_CD2 = ""; }

			//
			RSLT_CD = CTr.Replace(RSLT_CD, "'", "''");
			ORDR_SQ = CTr.Replace(ORDR_SQ, "'", "''");
			RSLT_CD2 = CTr.Replace(RSLT_CD2, "'", "''");

			sql = "UPDATE IT_DEV_RSLT SET ";
			sql += "  IDR_RSLT_CD = '" + RSLT_CD + "'";
			sql += ", IDR_ORDR_SQ = '" + ORDR_SQ + "'";
			sql += " WHERE IDR_RSLT_CD = '" + RSLT_CD2 + "'";

			argStmtExec.executeUpdate(sql);

		} catch (Exception e) {

			throw new FuncException(e.toString(), sql);
		}

		return sql;
	}
%>
