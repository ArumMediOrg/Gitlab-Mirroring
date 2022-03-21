<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%!
	public String func_uEmail_Send_LOG_Insert_001(Statement argStmtExec, HashMap argHtMethod) throws Exception {

		String sql = "";
		String sql2 = "";
		String sql_disp = "";

		Connection connect = argStmtExec.getConnection();
		CallableStatement CallStmtExec = null;

		try {

			String EXAM_DT = (String) argHtMethod.get("EXAM_DT");
			String EXAM_SQ = (String) argHtMethod.get("EXAM_SQ");

			//
			if(EXAM_DT == null) { EXAM_DT = ""; }
			if(EXAM_SQ == null) { EXAM_SQ = ""; }

			//

			sql = " Delete from ET_RSLTWEB_LOG ";
			sql += " where ERL_EXAM_DT = ? ";
			sql += "   And ERL_EXAM_SQ = ? ";

			CallStmtExec = connect.prepareCall(sql);

			CallStmtExec.setString(1, EXAM_DT);
			CallStmtExec.setString(2, EXAM_SQ);

			CallStmtExec.executeUpdate();

		} catch (Exception e) {

			throw new FuncException(e.toString(), sql);
		}

		return sql;
	}
%>
