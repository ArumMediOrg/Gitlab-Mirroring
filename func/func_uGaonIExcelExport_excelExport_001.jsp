<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%!
	public String func_uGaonIExcelExport_excelExport_001(Statement argStmtExec, HashMap argHtMethod) throws Exception {

		String sql = "";
		String sql2 = "";
		String sql_disp = "";

		try {

			String SDATE = (String) argHtMethod.get("SDATE");
			String TRACE_CD = (String) argHtMethod.get("TRACE_CD");
			String DEAL_NO = (String) argHtMethod.get("DEAL_NO");

			//
			if(SDATE == null) { SDATE = ""; }
			if(TRACE_CD == null) { TRACE_CD = ""; }
			if(DEAL_NO == null) { DEAL_NO = ""; }

			//
			SDATE = CTr.Replace(SDATE, "'", "''");
			TRACE_CD = CTr.Replace(TRACE_CD, "'", "''");
			DEAL_NO = CTr.Replace(DEAL_NO, "'", "''");

			sql = "UPDATE RT_CARD_RECE SET ";
			sql += "  RCR_XLS_DT = '" + SDATE + "'";

			if(TRACE_CD.equals("C")) {
				sql += " WHERE RCR_PDEAL_NO = '" + DEAL_NO + "'";
			} else if(TRACE_CD.equals("A")) {
				sql += " WHERE RCR_DEAL_NO = '" + DEAL_NO + "'";
			}

			argStmtExec.executeUpdate(sql);
		} catch (Exception e) {

			throw new FuncException(e.toString(), sql);
		}

		return sql;
	}
%>
