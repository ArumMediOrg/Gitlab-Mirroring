<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%!
	public String func_omr_insertqtqurstion_001(Statement argStmtExec, HashMap argHtMethod) throws Exception {

		String sql = "";
		String sql2 = "";
		String sql_disp = "";

		try {

			String SDATE = (String) argHtMethod.get("SDATE");
			String EXAM_NO = (String) argHtMethod.get("EXAM_NO");
			String CUST_NO = (String) argHtMethod.get("CUST_NO");
			String SCOLUMN = (String) argHtMethod.get("SCOLUMN");
			String ANSR_CD = (String) argHtMethod.get("ANSR_CD");
			String QQN_QSTN_CP = (String) argHtMethod.get("QQN_QSTN_CP");
			String SRESULT = (String) argHtMethod.get("SRESULT");
			String SCORE = (String) argHtMethod.get("SCORE");
			String QQN_SCORE_YN = (String) argHtMethod.get("QQN_SCORE_YN");

			//
			if(SDATE == null) { SDATE = ""; }
			if(EXAM_NO == null) { EXAM_NO = ""; }
			if(CUST_NO == null) { CUST_NO = ""; }
			if(SCOLUMN == null) { SCOLUMN = ""; }
			if(ANSR_CD == null) { ANSR_CD = ""; }
			if(QQN_QSTN_CP == null) { QQN_QSTN_CP = ""; }
			if(SRESULT == null) { SRESULT = ""; }
			if(SCORE == null) { SCORE = ""; }
			if(QQN_SCORE_YN == null) { QQN_SCORE_YN = ""; }

			//
			SDATE = CTr.Replace(SDATE, "'", "''");
			EXAM_NO = CTr.Replace(EXAM_NO, "'", "''");
			CUST_NO = CTr.Replace(CUST_NO, "'", "''");
			SCOLUMN = CTr.Replace(SCOLUMN, "'", "''");
			ANSR_CD = CTr.Replace(ANSR_CD, "'", "''");
			QQN_QSTN_CP = CTr.Replace(QQN_QSTN_CP, "'", "''");
			SRESULT = CTr.Replace(SRESULT, "'", "''");
			SCORE = CTr.Replace(SCORE, "'", "''");
			QQN_SCORE_YN = CTr.Replace(QQN_SCORE_YN, "'", "''");

			sql = "INSERT INTO QT_QUESTION(QQN_EXAM_DT, QQN_EXAM_SQ, QQN_CUST_NO, QQN_QSTN_CD, QQN_ANSR_CD, QQN_QSTN_CP, QQN_RESULT, QQN_SCORE, QQN_SCORE_YN, QQN_USE_YN, QQN_INPT_ID, QQN_INPT_DTT, QQN_MODI_ID, QQN_MODI_DTT ) VALUES (";
			sql += "  '" + SDATE + "'";
			sql += ", '" + EXAM_NO + "'";
			sql += ", '" + CUST_NO + "'";
			sql += ", '" + SCOLUMN + "'";
			sql += ", '" + ANSR_CD + "'";
			sql += ", '" + QQN_QSTN_CP + "'";
			sql += ", '" + SRESULT + "'";
			sql += ", '" + SCORE + "'";
			sql += ", '" + QQN_SCORE_YN + "'";
			sql += ", 'Y'";
			sql += ", 'OMR'";
			sql += ", SYSDATE";
			sql += ", 'OMR'";
			sql += ", SYSDATE";
			sql += ")";

			argStmtExec.executeUpdate(sql);

		} catch (Exception e) {

			throw new FuncException(e.toString(), sql);
		}

		return sql;
	}
%>
