<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%!
	public String func_uSP_Health_GrdEXAM_ACPTSelectionChanged_008(Statement argStmtExec, HashMap argHtMethod) throws Exception {

		String sql = "";
		String sql2 = "";
		String sql_disp = "";

		try {

			String ISSU_NO = (String) argHtMethod.get("ISSU_NO");
			String JIJO_CD = (String) argHtMethod.get("JIJO_CD");
			String GOJU_CD = (String) argHtMethod.get("GOJU_CD");
			String NCPN_LT = (String) argHtMethod.get("NCPN_LT");
			String NCHR_HH = (String) argHtMethod.get("NCHR_HH");
			String WORK_LT = (String) argHtMethod.get("WORK_LT");
			String SMTM_CD = (String) argHtMethod.get("SMTM_CD");
			String JUIP_DT = (String) argHtMethod.get("JUIP_DT");
			String EXAM_DT = (String) argHtMethod.get("EXAM_DT");
			String EXAM_SQ = (String) argHtMethod.get("EXAM_SQ");
			String EXAM_CHA = (String) argHtMethod.get("EXAM_CHA");
			String NOT_REG = (String) argHtMethod.get("NOT_REG");
			String SLNS_DELAY = (String) argHtMethod.get("SLNS_DELAY");
			String BUILD_CD = (String) argHtMethod.get("BUILD_CD");

			//
			if(ISSU_NO == null) { ISSU_NO = ""; }
			if(JIJO_CD == null) { JIJO_CD = ""; }
			if(GOJU_CD == null) { GOJU_CD = ""; }
			if(NCPN_LT == null) { NCPN_LT = ""; }
			if(NCHR_HH == null) { NCHR_HH = ""; }
			if(WORK_LT == null) { WORK_LT = ""; }
			if(SMTM_CD == null) { SMTM_CD = ""; }
			if(JUIP_DT == null) { JUIP_DT = ""; }
			if(EXAM_DT == null) { EXAM_DT = ""; }
			if(EXAM_SQ == null) { EXAM_SQ = ""; }
			if(EXAM_CHA == null) { EXAM_CHA = ""; }
			if(NOT_REG == null) { NOT_REG = ""; }
			if(SLNS_DELAY == null) { SLNS_DELAY = ""; }
			if(BUILD_CD == null) { BUILD_CD = ""; }

			//
			ISSU_NO = CTr.Replace(ISSU_NO, "'", "''");
			JIJO_CD = CTr.Replace(JIJO_CD, "'", "''");
			GOJU_CD = CTr.Replace(GOJU_CD, "'", "''");
			NCPN_LT = CTr.Replace(NCPN_LT, "'", "''");
			NCHR_HH = CTr.Replace(NCHR_HH, "'", "''");
			WORK_LT = CTr.Replace(WORK_LT, "'", "''");
			SMTM_CD = CTr.Replace(SMTM_CD, "'", "''");
			JUIP_DT = CTr.Replace(JUIP_DT, "'", "''");
			EXAM_DT = CTr.Replace(EXAM_DT, "'", "''");
			EXAM_SQ = CTr.Replace(EXAM_SQ, "'", "''");
			EXAM_CHA = CTr.Replace(EXAM_CHA, "'", "''");
			NOT_REG = CTr.Replace(NOT_REG, "'", "''");
			SLNS_DELAY = CTr.Replace(SLNS_DELAY, "'", "''");
			BUILD_CD = CTr.Replace(BUILD_CD, "'", "''");

			sql = "UPDATE ST_BASE SET ";
			sql += "  SBE_ISSU_NO = '" + ISSU_NO + "'";
			sql += ", SBE_JIJO_CD = '" + JIJO_CD + "'";
			sql += ", SBE_GOJU_CD = '" + GOJU_CD + "'";
			sql += ", SBE_NCPN_LT = '" + NCPN_LT + "'";
			sql += ", SBE_NCHR_HH = '" + NCHR_HH + "'";
			sql += ", SBE_WORK_LT = '" + WORK_LT + "'";
			sql += ", SBE_SMTM_CD = '" + SMTM_CD + "'";
			sql += ", SBE_JUIP_DT = '" + JUIP_DT + "'";
			sql += ", SBE_NOT_REG = '" + NOT_REG + "' ";
   			sql += ", SBE_SLNS_DELAY = '" + SLNS_DELAY + "' ";
   			sql += ", SBE_BUILD_CD = '" + BUILD_CD + "' ";
			sql += " WHERE SBE_EXAM_DT = '" + EXAM_DT + "'";
			sql += " AND SBE_EXAM_SQ = '" + EXAM_SQ + "'";
			sql += " AND SBE_EXAM_CHA = '" + EXAM_CHA + "'";

			argStmtExec.executeUpdate(sql);

		} catch (Exception e) {

			throw new FuncException(e.toString(), sql);
		}

		return sql;
	}
%>
