<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%!
	public String func_uExam_Acpt_btnSaveClick_004(Statement argStmtExec, HashMap argHtMethod) throws Exception {

		String sql = "";
		String sql2 = "";
		String sql_disp = "";

		try {

			String EXAM_DT = (String) argHtMethod.get("EXAM_DT");
			String EXAM_SQ = (String) argHtMethod.get("EXAM_SQ");
			String MATT_CD = (String) argHtMethod.get("MATT_CD");
			String EXAM_CHA = (String) argHtMethod.get("EXAM_CHA");

			//
			if(EXAM_DT == null) { EXAM_DT = ""; }
			if(EXAM_SQ == null) { EXAM_SQ = ""; }
			if(MATT_CD == null) { MATT_CD = ""; }
			if(EXAM_CHA == null) { EXAM_CHA = ""; }

			//
			//EXAM_DT = CTr.Replace(EXAM_DT, "'", "''");
			//EXAM_SQ = CTr.Replace(EXAM_SQ, "'", "''");
			//MATT_CD = CTr.Replace(MATT_CD, "'", "''");
			//EXAM_CHA = CTr.Replace(EXAM_CHA, "'", "''");

			sql = "DELETE ST_PANJUNG";
			sql += " WHERE SPG_EXAM_DT = '" + EXAM_DT + "'";
			sql += " AND SPG_EXAM_SQ = '" + EXAM_SQ + "'";
			sql += " AND SPG_MATT_CD NOT IN ('" + MATT_CD + "')";
			sql += " AND SPG_EXAM_CHA = '" + EXAM_CHA + "'";

			argStmtExec.executeUpdate(sql);

		} catch (Exception e) {

			throw new FuncException(e.toString(), sql);
		}

		return sql;
	}
%>
