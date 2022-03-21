<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%!
	public String func_uSP_HEALTH_ITEM_RECHK_BtnDeleteClick_001(Statement argStmtExec, HashMap argHtMethod) throws Exception {

		String sql = "";
		String sql2 = "";
		String sql_disp = "";

		try {

			String EXAM_DT = (String) argHtMethod.get("EXAM_DT");
			String EXAM_SQ = (String) argHtMethod.get("EXAM_SQ");
			String EXAM_CHA = (String) argHtMethod.get("EXAM_CHA");
			String MATT_CD = (String) argHtMethod.get("MATT_CD");
			String ORGA_CD = (String) argHtMethod.get("ORGA_CD");

			//
			if(EXAM_DT == null) { EXAM_DT = ""; }
			if(EXAM_SQ == null) { EXAM_SQ = ""; }
			if(EXAM_CHA == null) { EXAM_CHA = ""; }
			if(MATT_CD == null) { MATT_CD = ""; }
			if(ORGA_CD == null) { ORGA_CD = ""; }

			//
			EXAM_DT = CTr.Replace(EXAM_DT, "'", "''");
			EXAM_SQ = CTr.Replace(EXAM_SQ, "'", "''");
			EXAM_CHA = CTr.Replace(EXAM_CHA, "'", "''");
			MATT_CD = CTr.Replace(MATT_CD, "'", "''");
			ORGA_CD = CTr.Replace(ORGA_CD, "'", "''");

			sql = "DELETE ST_ITEM_RECHECK";
			sql += " WHERE SIR_EXAM_DT = '" + EXAM_DT + "'";
			sql += " AND SIR_EXAM_SQ = '" + EXAM_SQ + "'";
			sql += " AND SIR_EXAM_CHA = '" + EXAM_CHA + "'";
			sql += " AND SIR_MATT_CD = '" + MATT_CD + "'";
			sql += " AND SIR_ORGA_CD = '" + ORGA_CD + "'";

			argStmtExec.executeUpdate(sql);

		} catch (Exception e) {

			throw new FuncException(e.toString(), sql);
		}

		return sql;
	}
%>
