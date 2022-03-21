<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%!
	public String func_uSP_Health_UF_Save_006(Statement argStmtExec, HashMap argHtMethod) throws Exception {

		String sql = "";
		String sql2 = "";
		String sql_disp = "";

		Connection connect = argStmtExec.getConnection();
		CallableStatement CallStmtExec = null;

		try {

			String EXAM_DT = (String) argHtMethod.get("EXAM_DT");
			String EXAM_SQ = (String) argHtMethod.get("EXAM_SQ");
			String SUM = (String) argHtMethod.get("SUM");

			//
			if(EXAM_DT == null) { EXAM_DT = ""; }
			if(EXAM_SQ == null) { EXAM_SQ = ""; }
			if(SUM == null) { SUM = ""; }


			sql = " UPDATE QT_QUESTION_SCORE ";
			sql += " SET QQS_M0048 = ? ";
			sql += " WHERE QQS_EXAM_DT = ? ";
			sql += " AND QQS_EXAM_SQ   = ? ";

			CallStmtExec = connect.prepareCall(sql);

			CallStmtExec.setString(1, SUM);
			CallStmtExec.setString(2, EXAM_DT);
			CallStmtExec.setString(3, EXAM_SQ);

			CallStmtExec.executeUpdate();

		} catch (Exception e) {

			throw new FuncException(e.toString(), sql);
		}

		return sql;
	}
%>
