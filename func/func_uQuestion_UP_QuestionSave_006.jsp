<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%!
	public String func_uQuestion_UP_QuestionSave_006(Statement argStmtExec, HashMap argHtMethod) throws Exception {

		String sql = "";
		String sql2 = "";
		String sql_disp = "";

		try {

			String CKITEM_CD = (String) argHtMethod.get("CKITEM_CD");
			String SSCORE = (String) argHtMethod.get("SSCORE");
			String EXAM_DT = (String) argHtMethod.get("EXAM_DT");
			String EXAM_SQ = (String) argHtMethod.get("EXAM_SQ");

			//
			if(CKITEM_CD == null) { CKITEM_CD = ""; }
			if(SSCORE == null) { SSCORE = ""; }
			if(EXAM_DT == null) { EXAM_DT = ""; }
			if(EXAM_SQ == null) { EXAM_SQ = ""; }

			//
			CKITEM_CD = CTr.Replace(CKITEM_CD, "'", "''");
			SSCORE = CTr.Replace(SSCORE, "'", "''");
			EXAM_DT = CTr.Replace(EXAM_DT, "'", "''");
			EXAM_SQ = CTr.Replace(EXAM_SQ, "'", "''");

			if(CKITEM_CD.equals("M0047")) {
				sql = "UPDATE QT_QUESTION_SCORE SET ";
				sql += "  QQS_M0047 = '" + SSCORE + "'";
				sql += " WHERE QQS_EXAM_DT = '" + EXAM_DT + "'";
				sql += " AND QQS_EXAM_SQ = '" + EXAM_SQ + "'";

				argStmtExec.executeUpdate(sql);

			} else if(CKITEM_CD.equals("M0048")) {
				sql = "UPDATE QT_QUESTION_SCORE SET ";
				sql += "  QQS_M0048 = '" + SSCORE + "'";
				sql += " WHERE QQS_EXAM_DT = '" + EXAM_DT + "'";
				sql += " AND QQS_EXAM_SQ = '" + EXAM_SQ + "'";

				argStmtExec.executeUpdate(sql);

			} else if(CKITEM_CD.equals("M0050")) {
				sql = "UPDATE QT_QUESTION_SCORE SET ";
				sql += "  QQS_M0050 = '" + SSCORE + "'";
				sql += " WHERE QQS_EXAM_DT = '" + EXAM_DT + "'";
				sql += " AND QQS_EXAM_SQ = '" + EXAM_SQ + "'";

				argStmtExec.executeUpdate(sql);

			} else if(CKITEM_CD.equals("M0051")) {
				sql = "UPDATE QT_QUESTION_SCORE SET ";
				sql += "  QQS_M0051 = '" + SSCORE + "'";
				sql += " WHERE QQS_EXAM_DT = '" + EXAM_DT + "'";
				sql += " AND QQS_EXAM_SQ = '" + EXAM_SQ + "'";

				argStmtExec.executeUpdate(sql);

			} else if(CKITEM_CD.equals("M0060")) {
				sql = "UPDATE QT_QUESTION_SCORE SET ";
				sql += "  QQS_M0060 = '" + SSCORE + "'";
				sql += " WHERE QQS_EXAM_DT = '" + EXAM_DT + "'";
				sql += " AND QQS_EXAM_SQ = '" + EXAM_SQ + "'";

				argStmtExec.executeUpdate(sql);

			} else if(CKITEM_CD.equals("M0061")) {
				sql = "UPDATE QT_QUESTION_SCORE SET ";
				sql += "  QQS_M0061 = '" + SSCORE + "'";
				sql += " WHERE QQS_EXAM_DT = '" + EXAM_DT + "'";
				sql += " AND QQS_EXAM_SQ = '" + EXAM_SQ + "'";

				argStmtExec.executeUpdate(sql);

			}
		} catch (Exception e) {

			throw new FuncException(e.toString(), sql);
		}

		return sql;
	}
%>
