<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%!
	public String func_uExam_Result_btnEdpMj04Kd_ModClick_001(Statement argStmtExec, HashMap argHtMethod) throws Exception {

		String sql = "";
		String sql2 = "";
		String sql_disp = "";

		try {

			String VIEW_WIDTH = (String) argHtMethod.get("VIEW_WIDTH");

			//
			if(VIEW_WIDTH == null) { VIEW_WIDTH = ""; }

			//
			VIEW_WIDTH = CTr.Replace(VIEW_WIDTH, "'", "''");

			sql = "UPDATE ET_DENTAL_PANJ A SET ";
			sql += "  A.EDP_MJ04_KD = (";
			sql += "	SELECT CASE B.QQN_RESULT WHEN '1' THEN '1' ELSE '2' END";
			sql += "	FROM QT_QUESTION B";
			sql += " 	WHERE A.EDP_EXAM_DT = B.QQN_EXAM_DT";
			sql += " 	AND A.EDP_EXAM_SQ = B.QQN_EXAM_SQ";
			sql += " 	AND A.EDP_EXAM_DT >= '2018-01-01'";
			sql += " 	AND B.QQN_QSTN_CD = '66'";
			sql += ")";
			sql += " WHERE EXISTS (SELECT 0 FROM QT_QUESTION B";
			sql += " WHERE A.EDP_EXAM_DT = B.QQN_EXAM_DT";
			sql += " AND A.EDP_EXAM_SQ = B.QQN_EXAM_SQ";
			sql += " AND A.EDP_EXAM_DT >= '2018-01-01'";
			sql += " AND B.QQN_QSTN_CD = '66')";

			argStmtExec.executeUpdate(sql);

		} catch (Exception e) {

			throw new FuncException(e.toString(), sql);
		}

		return sql;
	}
%>
