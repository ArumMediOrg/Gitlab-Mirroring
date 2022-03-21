<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%!
	public String func_uEmail_Send_LOG_Insert_002(Statement argStmtExec, HashMap argHtMethod) throws Exception {

		String sql = "";
		String sql2 = "";
		String sql_disp = "";

		Connection connect = argStmtExec.getConnection();
		CallableStatement CallStmtExec = null;

		try {

			String EXAM_DT = (String) argHtMethod.get("EXAM_DT");
			String EXAM_SQ = (String) argHtMethod.get("EXAM_SQ");
			String SUCC_YN = (String) argHtMethod.get("SUCC_YN");
			String USER_ID = (String) argHtMethod.get("USER_ID");
			String ERROR = (String) argHtMethod.get("ERROR");

			//
			if(EXAM_DT == null) { EXAM_DT = ""; }
			if(EXAM_SQ == null) { EXAM_SQ = ""; }
			if(SUCC_YN == null) { SUCC_YN = ""; }
			if(USER_ID == null) { USER_ID = ""; }
			if(ERROR == null) { ERROR = ""; }

			//

			sql = " Insert into ET_RSLTWEB_LOG ";
			sql += " (ERL_LOG_SEQ, ERL_EXAM_DT, ERL_EXAM_SQ, ERL_SUCC_YN, ERL_SEND_ID, ERL_ERROR_MSG) ";
			sql += " values ";
			sql += " (ET_RSLTWEB_LOG_SEQ.NEXTVAL, ?, ?, ?, ?, ?) ";

			CallStmtExec = connect.prepareCall(sql);

			CallStmtExec.setString(1, EXAM_DT);
			CallStmtExec.setString(2, EXAM_SQ);
			CallStmtExec.setString(3, SUCC_YN);
			CallStmtExec.setString(4, USER_ID);
			CallStmtExec.setString(5, ERROR);

			CallStmtExec.executeUpdate();

		} catch (Exception e) {

			throw new FuncException(e.toString(), sql);
		}

		return sql;
	}
%>
