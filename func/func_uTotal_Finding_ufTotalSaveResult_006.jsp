<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%!
	public String func_uTotal_Finding_ufTotalSaveResult_006(Statement argStmtExec, HashMap argHtMethod) throws Exception {

		String sql = "";
		String sql2 = "";
		String sql_disp = "";

		Connection connect = argStmtExec.getConnection();
		CallableStatement CallStmtExec = null;

		try {

			String EXAM_DT = (String) argHtMethod.get("EXAM_DT");
			String EXAM_SQ = (String) argHtMethod.get("EXAM_SQ");
			String EXAM_SQL = (String) argHtMethod.get("EXAM_SQL");
			String EXAM_ID = (String) argHtMethod.get("EXAM_ID");
			String EXAM_DTT = (String) argHtMethod.get("EXAM_DTT");
			String EXAM_IP = (String) argHtMethod.get("EXAM_IP");

			//
			if(EXAM_DT == null) { EXAM_DT = ""; }
			if(EXAM_SQ == null) { EXAM_SQ = ""; }
			if(EXAM_SQL == null) { EXAM_SQL = ""; }
			if(EXAM_ID == null) { EXAM_ID = ""; }
			if(EXAM_DTT == null) { EXAM_DTT = ""; }
			if(EXAM_IP == null) { EXAM_IP = ""; }

			//

			sql = " Insert Into ST_SYTH_VIEW_LOG ";
			sql += " (SSL_EXAM_DT, SSL_EXAM_SQ, SSL_VIEW_EX, SSL_MODI_ID, SSL_MODI_DTT, SSL_MODI_IP) ";
			sql += " VALUES ";
			sql += " (?, ?, ?, ?, SYSDATE, ?) ";

			CallStmtExec = connect.prepareCall(sql);

			CallStmtExec.setString(1, EXAM_DT);
			CallStmtExec.setString(2, EXAM_SQ);
			CallStmtExec.setString(3, EXAM_SQL);
			CallStmtExec.setString(4, EXAM_ID);
			CallStmtExec.setString(5, EXAM_IP);

			CallStmtExec.executeUpdate();

		} catch (Exception e) {

			throw new FuncException(e.toString(), sql);
		}

		return sql;
	}
%>
