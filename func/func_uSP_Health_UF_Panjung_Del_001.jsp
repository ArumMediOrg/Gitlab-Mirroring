<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%!
	public String func_uSP_Health_UF_Panjung_Del_001(Statement argStmtExec, HashMap argHtMethod) throws Exception {

		String sql = "";
		String sql2 = "";
		String sql_disp = "";

		try {

			String EXAM_DT = (String) argHtMethod.get("EXAM_DT");
			String EXAM_SQ = (String) argHtMethod.get("EXAM_SQ");
			String EXAM_CHA = (String) argHtMethod.get("EXAM_CHA");
			String MATT_CD = (String) argHtMethod.get("MATT_CD");
			String MATT_SQ = (String) argHtMethod.get("MATT_SQ");

			//
			if(EXAM_DT == null) { EXAM_DT = ""; }
			if(EXAM_SQ == null) { EXAM_SQ = ""; }
			if(EXAM_CHA == null) { EXAM_CHA = ""; }
			if(MATT_CD == null) { MATT_CD = ""; }
			if(MATT_SQ == null) { MATT_SQ = ""; }

			//
			EXAM_DT = CTr.Replace(EXAM_DT, "'", "''");
			EXAM_SQ = CTr.Replace(EXAM_SQ, "'", "''");
			EXAM_CHA = CTr.Replace(EXAM_CHA, "'", "''");
			MATT_CD = CTr.Replace(MATT_CD, "'", "''");
			MATT_SQ = CTr.Replace(MATT_SQ, "'", "''");

			sql = "DELETE FROM ST_PANJUNG";
			sql += " WHERE SPG_EXAM_DT = '" + EXAM_DT + "'";
			sql += " AND SPG_EXAM_SQ = '" + EXAM_SQ + "'";
			sql += " AND SPG_EXAM_CHA = '" + EXAM_CHA + "'";
			sql += " AND SPG_MATT_CD = '" + MATT_CD + "'";
			sql += " AND SPG_MATT_SQ = '" + MATT_SQ + "'";

			argStmtExec.executeUpdate(sql);

		} catch (Exception e) {

			throw new FuncException(e.toString(), sql);
		}

		return sql;
	}
%>
