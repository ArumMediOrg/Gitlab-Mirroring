<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%!
	public String func_EQuestionnaire_ufSaveNurionQuestionnaire_002(Statement argStmtExec, HashMap argHtMethod) throws Exception {

		String sql = "";
		String sql2 = "";
		String sql_disp = "";

		Connection connect = argStmtExec.getConnection();
		CallableStatement CallStmtExec = null;

		try {
			String SDATE = (String) argHtMethod.get("SDATE");
			String SEXNO = (String) argHtMethod.get("SEXNO");
			String SCTNO = (String) argHtMethod.get("SCTNO");
			String SDELCD = (String) argHtMethod.get("SDELCD");

			//

			if(SDATE == null) { SDATE = ""; }
			if(SEXNO == null) { SEXNO = ""; }
			if(SCTNO == null) { SCTNO = ""; }
			if(SDELCD == null) { SDELCD = ""; }

			//

			sql = " delete from QT_QUESTION ";
			sql += " WHERE QQN_EXAM_DT = ? ";
			sql += " AND   QQN_EXAM_SQ = ? ";
			sql += " AND   QQN_CUST_NO = ? ";
			sql += " AND   QQN_QSTN_CD in (" + SDELCD + ") ";
			sql += " AND   QQN_INPT_ID <> 'OMR' ";
			sql += " AND   QQN_INPT_ID <> 'lctech' ";



			CallStmtExec = connect.prepareCall(sql);

			CallStmtExec.setString(1, SDATE);
			CallStmtExec.setString(2, SEXNO);
			CallStmtExec.setString(3, SCTNO);
			//CallStmtExec.setString(4, SDELCD);

			CallStmtExec.executeUpdate();

		} catch (Exception e) {

			throw new FuncException(e.toString(), sql);
		}

		return sql;
	}
%>
