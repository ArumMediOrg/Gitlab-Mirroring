<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%!
	public String func_EQuestionaire_SaveToNurion_005(Statement argStmtExec, HashMap argHtMethod) throws Exception {

		String sql = "";
		String sql2 = "";
		String sql_disp = "";

		try {

			String SDATE = (String) argHtMethod.get("SDATE");
			String SEXNO = (String) argHtMethod.get("SEXNO");
			String SCTNO = (String) argHtMethod.get("SCTNO");

			//
			if(SDATE == null) { SDATE = ""; }
			if(SEXNO == null) { SEXNO = ""; }
			if(SCTNO == null) { SCTNO = ""; }

			//
			SDATE = CTr.Replace(SDATE, "'", "''");
			SEXNO = CTr.Replace(SEXNO, "'", "''");
			SCTNO = CTr.Replace(SCTNO, "'", "''");

			sql = " delete from QT_QUESTION ";
			sql += " WHERE QQN_EXAM_DT = '" + SDATE + "' ";
			sql += " AND   QQN_EXAM_SQ = '" + SEXNO + "' ";
			sql += " AND   QQN_CUST_NO = '" + SCTNO + "' ";
			sql += " AND   QQN_INPT_ID <> 'OMR' ";
			sql += " AND   QQN_INPT_ID <> 'lctech' ";

			argStmtExec.executeUpdate(sql);

		} catch (Exception e) {

			throw new FuncException(e.toString(), sql);
		}

		return sql;
	}
%>
