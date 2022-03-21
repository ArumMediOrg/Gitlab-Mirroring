<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%!
	public String func_uExam_Ticket_btnS3_ClearClick_001(Statement argStmtExec, HashMap argHtMethod) throws Exception {

		String sql = "";
		String sql2 = "";
		String sql_disp = "";

		try {

			String COMP_CD = (String) argHtMethod.get("COMP_CD");

			//
			if(COMP_CD == null) { COMP_CD = ""; }

			//
			COMP_CD = CTr.Replace(COMP_CD, "'", "''");

			sql = "DELETE FROM IT_TICKET_COMP";
			sql += " WHERE ITC_COMP_CD = '" + COMP_CD + "'";

			argStmtExec.executeUpdate(sql);

		} catch (Exception e) {

			throw new FuncException(e.toString(), sql);
		}

		return sql;
	}
%>
