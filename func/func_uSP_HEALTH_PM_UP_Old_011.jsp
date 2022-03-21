<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%!
	public String func_uSP_HEALTH_PM_UP_Old_011(Statement argStmtExec, HashMap argHtMethod) throws Exception {

		String sql = "";
		String sql2 = "";
		String sql_disp = "";

		try {

			String EXAM_DT = (String) argHtMethod.get("EXAM_DT");
			String EXAM_SQ = (String) argHtMethod.get("EXAM_SQ");
			String SYMP_CD = (String) argHtMethod.get("SYMP_CD");
			String SYMP_SQ = (String) argHtMethod.get("SYMP_SQ");
			String SYSQ_CD = (String) argHtMethod.get("SYSQ_CD");
			String SYSQ_NM = (String) argHtMethod.get("SYSQ_NM");
			String ETC_TX = (String) argHtMethod.get("ETC_TX");

			//
			if(EXAM_DT == null) { EXAM_DT = ""; }
			if(EXAM_SQ == null) { EXAM_SQ = ""; }
			if(SYMP_CD == null) { SYMP_CD = ""; }
			if(SYMP_SQ == null) { SYMP_SQ = ""; }
			if(SYSQ_CD == null) { SYSQ_CD = ""; }
			if(SYSQ_NM == null) { SYSQ_NM = ""; }
			if(ETC_TX == null) { ETC_TX = ""; }

			//
			EXAM_DT = CTr.Replace(EXAM_DT, "'", "''");
			EXAM_SQ = CTr.Replace(EXAM_SQ, "'", "''");
			SYMP_CD = CTr.Replace(SYMP_CD, "'", "''");
			SYMP_SQ = CTr.Replace(SYMP_SQ, "'", "''");
			SYSQ_CD = CTr.Replace(SYSQ_CD, "'", "''");
			SYSQ_NM = CTr.Replace(SYSQ_NM, "'", "''");
			ETC_TX = CTr.Replace(ETC_TX, "'", "''");

			sql = "INSERT INTO ST_SYMPTOM (SSM_EXAM_DT, SSM_EXAM_SQ, SSM_EXAM_CHA, SSM_SYMP_CD, SSM_SYMP_SQ, SSM_SYSQ_CD, SSM_SYSQ_NM, SSM_ETC_TX) VALUES (";
			sql += "  '" + EXAM_DT + "'";
			sql += ", '" + EXAM_SQ + "'";
			sql += ", '2'";
			sql += ", '" + SYMP_CD + "'";
			sql += ", '" + SYMP_SQ + "'";
			sql += ", '" + SYSQ_CD + "'";
			sql += ", '" + SYSQ_NM + "'";
			sql += ", '" + ETC_TX + "'";
			sql += ")";

			argStmtExec.executeUpdate(sql);

		} catch (Exception e) {

			throw new FuncException(e.toString(), sql);
		}

		return sql;
	}
%>
