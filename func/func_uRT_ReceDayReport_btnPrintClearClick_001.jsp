<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%!
	public String func_uRT_ReceDayReport_btnPrintClearClick_001(Statement argStmtExec, HashMap argHtMethod) throws Exception {

		String sql = "";
		String sql2 = "";
		String sql_disp = "";

		try {

			String DP_FROMDT = (String) argHtMethod.get("DP_FROMDT");
			String DP_TODT = (String) argHtMethod.get("DP_TODT");

			//
			if(DP_FROMDT == null) { DP_FROMDT = ""; }
			if(DP_TODT == null) { DP_TODT = ""; }

			//
			DP_FROMDT = CTr.Replace(DP_FROMDT, "'", "''");
			DP_TODT = CTr.Replace(DP_TODT, "'", "''");

			sql = "UPDATE RT_CARD_RECE SET ";
			sql += "  RCR_XLS_DT = ''";
			sql += " WHERE (RCR_TRACE_CD IN ('신용승인','신용취소'))";
			sql += " AND (TO_CHAR(TO_DATE('20'||SUBSTR(RCR_APPR_DT, 1, 6),'YYYY-MM-DD'),'YYYY-MM-DD') BETWEEN TO_CHAR(TO_DATE('" + DP_FROMDT + "','YYYY-MM-DD'),'YYYY-MM-DD')";
			sql += " AND TO_CHAR(TO_DATE('" + DP_TODT + "','YYYY-MM-DD')+1,'YYYY-MM-DD'))";
			sql += " AND ((NVL(RCR_DEAL_NO, ' ') = ' ') OR (NVL(RCR_PDEAL_NO, ' ') = ' '))";

			argStmtExec.executeUpdate(sql);

		} catch (Exception e) {

			throw new FuncException(e.toString(), sql);
		}

		return sql;
	}
%>
