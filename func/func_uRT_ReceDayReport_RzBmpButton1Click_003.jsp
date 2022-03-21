<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%!
	public String func_uRT_ReceDayReport_RzBmpButton1Click_003(Statement argStmtExec, HashMap argHtMethod) throws Exception {

		String sql = "";
		String sql2 = "";
		String sql_disp = "";

		try {

			String MEMO_DT = (String) argHtMethod.get("MEMO_DT");
			String MEMO_MEMO = (String) argHtMethod.get("MEMO_MEMO");

			//
			if(MEMO_DT == null) { MEMO_DT = ""; }
			if(MEMO_MEMO == null) { MEMO_MEMO = ""; }

			//
			MEMO_DT = CTr.Replace(MEMO_DT, "'", "''");
			MEMO_MEMO = CTr.Replace(MEMO_MEMO, "'", "''");

			sql = "INSERT INTO RT_RECE_MEMO (RRM_MEMO_DT,RRM_MEMO_MEMO) VALUES (";
			sql += "  '" + MEMO_DT + "'";
			sql += ", '" + MEMO_MEMO + "'";
			sql += ")";

			argStmtExec.executeUpdate(sql);

		} catch (Exception e) {

			throw new FuncException(e.toString(), sql);
		}

		return sql;
	}
%>
