<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%!
	public String func_uQuestion_UP_QuestionSave_2019_001(Statement argStmtExec, HashMap argHtMethod) throws Exception {

		String sql = "";
		String sql2 = "";
		String sql_disp = "";

		try {

			String EXAM_DT = (String) argHtMethod.get("EXAM_DT");
			String EXAM_SQ = (String) argHtMethod.get("EXAM_SQ");
			String CUST_NO = (String) argHtMethod.get("CUST_NO");

			//
			if(EXAM_DT == null) { EXAM_DT = ""; }
			if(EXAM_SQ == null) { EXAM_SQ = ""; }
			if(CUST_NO == null) { CUST_NO = ""; }

			//
			EXAM_DT = CTr.Replace(EXAM_DT, "'", "''");
			EXAM_SQ = CTr.Replace(EXAM_SQ, "'", "''");
			CUST_NO = CTr.Replace(CUST_NO, "'", "''");

			sql = "DELETE QT_QUESTION";
			sql += " WHERE QQN_EXAM_DT = '" + EXAM_DT + "'";
			sql += " AND QQN_EXAM_SQ = '" + EXAM_SQ + "'";
			sql += " AND QQN_CUST_NO = '" + CUST_NO + "'";
			sql += " AND QQN_QSTN_CD IN (";
			sql += "	SELECT IIQ_QGTN_CD";
			sql += "	FROM IT_ITEM_QUESTION";
			sql += " 	WHERE IIQ_APLY_DT = '2019-01-01'";
			sql += " 	AND IIQ_ITEM_CD = 'M0018'";
			sql += ")";

			argStmtExec.executeUpdate(sql);

		} catch (Exception e) {

			throw new FuncException(e.toString(), sql);
		}

		return sql;
	}
%>
