<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%!
	public String func_uGen_Frst_Panj_uAutoPanBrain_012(Statement argStmtExec, HashMap argHtMethod) throws Exception {

		String sql = "";
		String sql2 = "";
		String sql_disp = "";

		try {

			String EXAM_DT = (String) argHtMethod.get("EXAM_DT");
			String EXAM_SQ = (String) argHtMethod.get("EXAM_SQ");
			String EXAM_KD = (String) argHtMethod.get("EXAM_KD");
			String ETC_KD = (String) argHtMethod.get("ETC_KD");
			String ETC1_CD = (String) argHtMethod.get("ETC1_CD");
			String ETC2_CD = (String) argHtMethod.get("ETC2_CD");
			String ETC3_CD = (String) argHtMethod.get("ETC3_CD");
			String ETC4_CD = (String) argHtMethod.get("ETC4_CD");

			//
			if(EXAM_DT == null) { EXAM_DT = ""; }
			if(EXAM_SQ == null) { EXAM_SQ = ""; }
			if(EXAM_KD == null) { EXAM_KD = ""; }
			if(ETC_KD == null) { ETC_KD = ""; }
			if(ETC1_CD == null) { ETC1_CD = ""; }
			if(ETC2_CD == null) { ETC2_CD = ""; }
			if(ETC3_CD == null) { ETC3_CD = ""; }
			if(ETC4_CD == null) { ETC4_CD = ""; }

			//
			EXAM_DT = CTr.Replace(EXAM_DT, "'", "''");
			EXAM_SQ = CTr.Replace(EXAM_SQ, "'", "''");
			EXAM_KD = CTr.Replace(EXAM_KD, "'", "''");
			ETC_KD = CTr.Replace(ETC_KD, "'", "''");
			ETC1_CD = CTr.Replace(ETC1_CD, "'", "''");
			ETC2_CD = CTr.Replace(ETC2_CD, "'", "''");
			ETC3_CD = CTr.Replace(ETC3_CD, "'", "''");
			ETC4_CD = CTr.Replace(ETC4_CD, "'", "''");

			sql = "INSERT INTO PT_DANR_PANJUNG (PDP_EXAM_DT, PDP_EXAM_SQ, PDP_EXAM_KD ,PDP_ETC_KD , PDP_ETC1_CD, PDP_ETC2_CD ,PDP_ETC3_CD,PDP_ETC4_CD) VALUES (";
			sql += "  '" + EXAM_DT + "'";
			sql += ", '" + EXAM_SQ + "'";
			sql += ", '" + EXAM_KD + "'";
			sql += ", '" + ETC_KD + "'";
			sql += ", '" + ETC1_CD + "'";
			sql += ", '" + ETC2_CD + "'";
			sql += ", '" + ETC3_CD + "'";
			sql += ", '" + ETC4_CD + "'";
			sql += ")";

			argStmtExec.executeUpdate(sql);

		} catch (Exception e) {

			throw new FuncException(e.toString(), sql);
		}

		return sql;
	}
%>
