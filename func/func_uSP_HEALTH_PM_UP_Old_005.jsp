<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%!
	public String func_uSP_HEALTH_PM_UP_Old_005(Statement argStmtExec, HashMap argHtMethod) throws Exception {

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
			String EXAM_DT = (String) argHtMethod.get("EXAM_DT");
			String EXAM_SQ = (String) argHtMethod.get("EXAM_SQ");

			//
			if(ISSU_NO == null) { ISSU_NO = ""; }
			if(JIJO_CD == null) { JIJO_CD = ""; }
			if(GOJU_CD == null) { GOJU_CD = ""; }
			if(NCPN_LT == null) { NCPN_LT = ""; }
			if(NCHR_HH == null) { NCHR_HH = ""; }
			if(WORK_LT == null) { WORK_LT = ""; }
			if(EXAM_DT == null) { EXAM_DT = ""; }
			if(EXAM_SQ == null) { EXAM_SQ = ""; }

			//
			ISSU_NO = CTr.Replace(ISSU_NO, "'", "''");
			JIJO_CD = CTr.Replace(JIJO_CD, "'", "''");
			GOJU_CD = CTr.Replace(GOJU_CD, "'", "''");
			NCPN_LT = CTr.Replace(NCPN_LT, "'", "''");
			NCHR_HH = CTr.Replace(NCHR_HH, "'", "''");
			WORK_LT = CTr.Replace(WORK_LT, "'", "''");
			EXAM_DT = CTr.Replace(EXAM_DT, "'", "''");
			EXAM_SQ = CTr.Replace(EXAM_SQ, "'", "''");

			sql = "UPDATE ST_BASE SET ";
			sql += "  SBE_ISSU_NO = '" + ISSU_NO + "'";
			sql += ", SBE_JIJO_CD = '" + JIJO_CD + "'";
			sql += ", SBE_GOJU_CD = '" + GOJU_CD + "'";
			sql += ", SBE_NCPN_LT = '" + NCPN_LT + "'";
			sql += ", SBE_NCHR_HH = '" + NCHR_HH + "'";
			sql += ", SBE_WORK_LT = '" + WORK_LT + "'";
			sql += " WHERE SBE_EXAM_DT = '" + EXAM_DT + "'";
			sql += " AND SBE_EXAM_SQ = '" + EXAM_SQ + "'";
			sql += " AND SBE_EXAM_CHA = '2'";

			argStmtExec.executeUpdate(sql);

		} catch (Exception e) {

			throw new FuncException(e.toString(), sql);
		}

		return sql;
	}
%>
