<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%!
	public String func_uExam_Ticket_btnS1_DeleteClick_001(Statement argStmtExec, HashMap argHtMethod) throws Exception {

		String sql = "";
		String sql2 = "";
		String sql_disp = "";

		try {

			String PUB_CD = (String) argHtMethod.get("PUB_CD");

			//
			if(PUB_CD == null) { PUB_CD = ""; }

			//
			PUB_CD = CTr.Replace(PUB_CD, "'", "''");

			sql = "DELETE FROM IT_TICKET";
			sql += " WHERE ITK_PUB_CD = '" + PUB_CD + "'";

			argStmtExec.executeUpdate(sql);

		} catch (Exception e) {

			throw new FuncException(e.toString(), sql);
		}

		return sql;
	}
%>
