<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%!
	public String func_uQuestion_UP_QuestionSave_2019_002(Statement argStmtExec, HashMap argHtMethod) throws Exception {

		String sql = "";
		String sql2 = "";
		String sql_disp = "";

		try {

			String EXAM_DT = (String) argHtMethod.get("EXAM_DT");
			String EXAM_SQ = (String) argHtMethod.get("EXAM_SQ");
			String CUST_NO = (String) argHtMethod.get("CUST_NO");
			String QSTN_CD = (String) argHtMethod.get("QSTN_CD");
			String RESULT = (String) argHtMethod.get("RESULT");
			String USER_ID = (String) argHtMethod.get("USER_ID");
			String QGTN_CD = (String) argHtMethod.get("QGTN_CD");
			String MODI_ID = (String) argHtMethod.get("MODI_ID");

			//
			if(EXAM_DT == null) { EXAM_DT = ""; }
			if(EXAM_SQ == null) { EXAM_SQ = ""; }
			if(CUST_NO == null) { CUST_NO = ""; }
			if(QSTN_CD == null) { QSTN_CD = ""; }
			if(RESULT == null) { RESULT = ""; }
			if(USER_ID == null) { USER_ID = ""; }
			if(QGTN_CD == null) { QGTN_CD = ""; }
			if(MODI_ID == null) { MODI_ID = ""; }

			//
			EXAM_DT = CTr.Replace(EXAM_DT, "'", "''");
			EXAM_SQ = CTr.Replace(EXAM_SQ, "'", "''");
			CUST_NO = CTr.Replace(CUST_NO, "'", "''");
			QSTN_CD = CTr.Replace(QSTN_CD, "'", "''");
			RESULT = CTr.Replace(RESULT, "'", "''");
			USER_ID = CTr.Replace(USER_ID, "'", "''");
			QGTN_CD = CTr.Replace(QGTN_CD, "'", "''");
			MODI_ID = CTr.Replace(MODI_ID, "'", "''");

			sql = "INSERT INTO QT_QUESTION (QQN_EXAM_DT ,QQN_EXAM_SQ ,QQN_CUST_NO, QQN_QSTN_CD, QQN_ANSR_CD, QQN_QSTN_CP ,QQN_RESULT, QQN_SCORE, QQN_SCORE_YN, QQN_USE_YN, QQN_INPT_ID, QQN_INPT_DTT, QQN_MODI_ID)";
			sql += " SELECT";
			sql += " '" + EXAM_DT + "'";
			sql += ", '" + EXAM_SQ + "'";
			sql += ", '" + CUST_NO + "'";
			sql += ", '" + QSTN_CD + "'";
			sql += ", C.CQN_ANSR_CD";
			sql += ", C.CQN_QSTN_CP";
			sql += ", '" + RESULT + "'";
			sql += ", B.QQN_SCORE";
			sql += ", C.CQN_SCOR_YN";
			sql += ", 'Y'";
			sql += ", '" + USER_ID + "'";
			sql += ", SYSDATE";
			sql += ", '" + MODI_ID + "'";
			sql += " FROM IT_ITEM_QUESTION A LEFT OUTER JOIN QT_QUESTION B ON A.IIQ_QGTN_CD = B.QQN_QSTN_CD";
			sql += " AND B.QQN_EXAM_DT = '" + EXAM_DT + "'";
			sql += " AND B.QQN_EXAM_SQ = '" + EXAM_SQ + "' LEFT OUTER JOIN CT_QUESTION C ON A.IIQ_QGTN_CD = C.CQN_QSTN_CD";
			sql += " WHERE A.IIQ_ITEM_CD = 'M0018'";
			sql += " AND A.IIQ_APLY_DT = GETITEM_QUESTION_APPLYDATE('M0018', '" + EXAM_DT + "')";
			sql += " AND A.IIQ_QGTN_CD = '" + QGTN_CD  + "'";
			sql += " AND A.IIQ_USE_YN = 'Y' ORDER BY A.IIQ_SORT_NO";

			argStmtExec.executeUpdate(sql);
		} catch (Exception e) {

			throw new FuncException(e.toString(), sql);
		}

		return sql;
	}
%>
