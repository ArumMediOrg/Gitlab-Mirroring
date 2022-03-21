<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%!
	public String func_uStdt_Pnjn_UP_MunjinSave_002(Statement argStmtExec, HashMap argHtMethod) throws Exception {

		String sql = "";
		String sql2 = "";
		String sql_disp = "";

		try {

			String SAVE_KD = (String) argHtMethod.get("SAVE_KD");
			String EXAM_DT = (String) argHtMethod.get("EXAM_DT");
			String EXAM_SQ = (String) argHtMethod.get("EXAM_SQ");
			String CUST_NO = (String) argHtMethod.get("CUST_NO");
			String QSTN_CD = (String) argHtMethod.get("QSTN_CD");
			String ANSR_CD = (String) argHtMethod.get("ANSR_CD");
			String QSTN_CP = (String) argHtMethod.get("QSTN_CP");
			String RSLT_VL = (String) argHtMethod.get("RSLT_VL");
			String SCORE_VL = (String) argHtMethod.get("SCORE_VL");
			String SCORE_YN = (String) argHtMethod.get("SCORE_YN");
			String USER_ID = (String) argHtMethod.get("USER_ID");

			//
			if(SAVE_KD == null) { SAVE_KD = ""; }
			if(EXAM_DT == null) { EXAM_DT = ""; }
			if(EXAM_SQ == null) { EXAM_SQ = ""; }
			if(CUST_NO == null) { CUST_NO = ""; }
			if(QSTN_CD == null) { QSTN_CD = ""; }
			if(ANSR_CD == null) { ANSR_CD = ""; }
			if(QSTN_CP == null) { QSTN_CP = ""; }
			if(RSLT_VL == null) { RSLT_VL = ""; }
			if(SCORE_VL == null) { SCORE_VL = ""; }
			if(SCORE_YN == null) { SCORE_YN = ""; }
			if(USER_ID == null) { USER_ID = ""; }

			//
			SAVE_KD = CTr.Replace(SAVE_KD, "'", "''");
			EXAM_DT = CTr.Replace(EXAM_DT, "'", "''");
			EXAM_SQ = CTr.Replace(EXAM_SQ, "'", "''");
			CUST_NO = CTr.Replace(CUST_NO, "'", "''");
			QSTN_CD = CTr.Replace(QSTN_CD, "'", "''");
			ANSR_CD = CTr.Replace(ANSR_CD, "'", "''");
			QSTN_CP = CTr.Replace(QSTN_CP, "'", "''");
			RSLT_VL = CTr.Replace(RSLT_VL, "'", "''");
			SCORE_VL = CTr.Replace(SCORE_VL, "'", "''");
			SCORE_YN = CTr.Replace(SCORE_YN, "'", "''");
			USER_ID = CTr.Replace(USER_ID, "'", "''");

			if(SAVE_KD.equals("I")) {

				sql = "INSERT INTO QT_QUESTION (QQN_EXAM_DT, QQN_EXAM_SQ, QQN_CUST_NO, QQN_QSTN_CD, QQN_ANSR_CD, QQN_QSTN_CP, QQN_RESULT, QQN_SCORE, QQN_SCORE_YN, QQN_USE_YN, QQN_INPT_ID, QQN_INPT_DTT) VALUES (";
				sql += "  '" + EXAM_DT + "'";
				sql += ", '" + EXAM_SQ + "'";
				sql += ", '" + CUST_NO + "'";
				sql += ", '" + QSTN_CD + "'";
				sql += ", '" + ANSR_CD + "'";
				sql += ", '" + QSTN_CP + "'";
				sql += ", '" + RSLT_VL + "'";
				sql += ", '" + SCORE_VL + "'";
				sql += ", '" + SCORE_YN + "'";
				sql += ", 'Y'";
				sql += ", '" + USER_ID + "'";
				sql += ", SYSDATE";
				sql += ")";

				argStmtExec.executeUpdate(sql);
			} else {
			
				sql = "UPDATE QT_QUESTION SET ";
				sql += "  QQN_RESULT = '" + RSLT_VL + "'";
				sql += ", QQN_SCORE = '" + SCORE_VL + "'";
				sql += ", QQN_SCORE_YN = '" + SCORE_YN + "'";
				sql += ", QQN_MODI_ID = '" + USER_ID + "'";
				sql += ", QQN_MODI_DTT = SYSDATE";
				sql += " WHERE QQN_EXAM_DT = '" + EXAM_DT + "'";
				sql += " AND QQN_EXAM_SQ = '" + EXAM_SQ + "'";
				sql += " AND QQN_CUST_NO = '" + CUST_NO + "'";
				sql += " AND QQN_QSTN_CD = '" + QSTN_CD + "'";

				argStmtExec.executeUpdate(sql);
			}
		} catch (Exception e) {

			throw new FuncException(e.toString(), sql);
		}

		return sql;
	}
%>
