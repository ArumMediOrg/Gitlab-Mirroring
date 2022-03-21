<%!
	public String uQuestion_UP_QuestionSave_2019_002(Statement argStmtExec, HashMap argHtMethod) throws Exception {
	
		String sql;

		String EXAM_DT = (String) argHtMethod.get("EXAM_DT");
		String EXAM_SQ = (String) argHtMethod.get("EXAM_SQ");
		String CUST_NO = (String) argHtMethod.get("CUST_NO");
		String QSTN_CD = (String) argHtMethod.get("QSTN_CD");
		String RESULT = (String) argHtMethod.get("RESULT");
		String USER_ID = (String) argHtMethod.get("USER_ID");
		String QGTN_CD = (String) argHtMethod.get("QGTN_CD");

		//
		if(EXAM_DT == null) { EXAM_DT = ""; }
		if(EXAM_SQ == null) { EXAM_SQ = ""; }
		if(CUST_NO == null) { CUST_NO = ""; }
		if(QSTN_CD == null) { QSTN_CD = ""; }
		if(RESULT == null) { RESULT = ""; }
		if(USER_ID == null) { USER_ID = ""; }
		if(QGTN_CD == null) { QGTN_CD = ""; }


		//
		sql = "INSERT INTO QT_QUESTION (QQN_EXAM_DT ,QQN_EXAM_SQ ,QQN_CUST_NO, QQN_QSTN_CD, QQN_ANSR_CD, QQN_QSTN_CP ,QQN_RESULT, QQN_SCORE, QQN_SCORE_YN, QQN_USE_YN, QQN_INPT_ID, QQN_INPT_DTT)";
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
		sql += " FROM IT_ITEM_QUESTION A LEFT OUTER JOIN QT_QUESTION B ON A.IIQ_QGTN_CD = B.QQN_QSTN_CD";
		sql += " AND B.QQN_EXAM_DT = '" + EXAM_DT + "'";
		sql += " AND B.QQN_EXAM_SQ = '" + EXAM_SQ + "' LEFT OUTER JOIN CT_QUESTION C ON A.IIQ_QGTN_CD = C.CQN_QSTN_CD";
		sql += " WHERE A.IIQ_ITEM_CD = 'M0018'";
		sql += " AND A.IIQ_APLY_DT = GETITEM_QUESTION_APPLYDATE('M0018', '" + EXAM_SQ + "')";
		sql += " AND A.IIQ_QGTN_CD = '" + QGTN_CD  + "'";
		sql += " AND A.IIQ_USE_YN = 'Y' ORDER BY A.IIQ_SORT_NO";

		argStmtExec.executeUpdate(sql);

		return sql;
	}
%>