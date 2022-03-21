<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%!
	public String func_uSP_Health_UF_SP2CHA_CREATE_009(Statement argStmtExec, HashMap argHtMethod) throws Exception {

		String sql = "";
		String sql2 = "";
		String sql_disp = "";

		try {

			String EXAM_DT2 = (String) argHtMethod.get("EXAM_DT2");
			String EXAM_SQ2 = (String) argHtMethod.get("EXAM_SQ2");
			String EXAM_DT = (String) argHtMethod.get("EXAM_DT");
			String EXAM_SQ = (String) argHtMethod.get("EXAM_SQ");
			String MATT_CD = (String) argHtMethod.get("MATT_CD");

			//
			if(EXAM_DT2 == null) { EXAM_DT2 = ""; }
			if(EXAM_SQ2 == null) { EXAM_SQ2 = ""; }
			if(EXAM_DT == null) { EXAM_DT = ""; }
			if(EXAM_SQ == null) { EXAM_SQ = ""; }
			if(MATT_CD == null) { MATT_CD = ""; }

			//
			EXAM_DT2 = CTr.Replace(EXAM_DT2, "'", "''");
			EXAM_SQ2 = CTr.Replace(EXAM_SQ2, "'", "''");
			EXAM_DT = CTr.Replace(EXAM_DT, "'", "''");
			EXAM_SQ = CTr.Replace(EXAM_SQ, "'", "''");
			MATT_CD = CTr.Replace(MATT_CD, "'", "''");

			sql = "UPDATE ST_ITEM_RECHECK SET ";
			sql += "  SIR_EXAM_DT2 = '" + EXAM_DT2 + "'";
			sql += ", SIR_EXAM_SQ2 = '" + EXAM_SQ2 + "'";
			sql += " WHERE SIR_EXAM_DT = '" + EXAM_DT + "'";
			sql += " AND SIR_EXAM_SQ = '" + EXAM_SQ + "'";
			sql += " AND SIR_EXAM_CHA = '1'";
			sql += " AND SIR_MATT_CD = '" + MATT_CD + "'";
			sql += " AND SIR_ORGA_CD = '05'";
			sql += " AND SIR_MKJJ_CD = '05205'";

			argStmtExec.executeUpdate(sql);

		} catch (Exception e) {

			throw new FuncException(e.toString(), sql);
		}

		return sql;
	}
%>
