<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%!
	public String func_uAcpt_List_SAVE_001_Log(Statement argStmtExec, HashMap argHtMethod) throws Exception {

		String sql = "";
		String sql2 = "";
		String sql_disp = "";

		Connection connect = argStmtExec.getConnection();
		CallableStatement CallStmtExec = null;

		try {

			String EXAM_DT = (String) argHtMethod.get("EXAM_DT");
			String EXAM_SQ = (String) argHtMethod.get("EXAM_SQ");
			String VIEW_EX = (String) argHtMethod.get("VIEW_EX");
			String USER_ID = (String) argHtMethod.get("USER_ID");
			String USER_IP = (String) argHtMethod.get("USER_IP");

			//
			if(EXAM_DT == null) { EXAM_DT = ""; }
			if(EXAM_SQ == null) { EXAM_SQ = ""; }
			if(VIEW_EX == null) { VIEW_EX = ""; }
			if(USER_ID == null) { USER_ID = ""; }
			if(USER_IP == null) { USER_IP = ""; }

			//

			sql = " Insert Into ET_EXAM_LOG ";
			sql += " (EEL_EXAM_DT, EEL_EXAM_SQ, EEL_VIEW_EX, EEL_MODI_ID, EEL_MODI_DTT, EEL_MODI_IP) ";
			sql += " VALUES ";
			sql += " (?, ?, ?, ?, SYSDATE, ?) ";

			CallStmtExec = connect.prepareCall(sql);

			CallStmtExec.setString(1, EXAM_DT);
			CallStmtExec.setString(2, EXAM_SQ);
			CallStmtExec.setString(3, VIEW_EX);
			CallStmtExec.setString(4, USER_ID);
			CallStmtExec.setString(5, USER_IP);

			CallStmtExec.executeUpdate();

		} catch (Exception e) {

			throw new FuncException(e.toString(), sql);
		}

		return sql;
	}
%>
