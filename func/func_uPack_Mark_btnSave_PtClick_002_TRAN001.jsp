<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%!
	public String func_uPack_Mark_btnSave_PtClick_002_TRAN001(Statement argStmtExec, HashMap argHtMethod) throws Exception {

		String sql = "";
		String sql2 = "";
		String sql_disp = "";

		try {

			String SPRNT_CD = (String) argHtMethod.get("SPRNT_CD");
			String SMAX_SQ = (String) argHtMethod.get("SMAX_SQ");
			String EDPRNT_TNM = (String) argHtMethod.get("EDPRNT_TNM");
			String EDPRNT_HNM = (String) argHtMethod.get("EDPRNT_HNM");
			String EDPRNT_SNM = (String) argHtMethod.get("EDPRNT_SNM");
			String EDPRNT_ENM = (String) argHtMethod.get("EDPRNT_ENM");
			String EDPRNT_CNM = (String) argHtMethod.get("EDPRNT_CNM");
			String EDPRNT_JNM = (String) argHtMethod.get("EDPRNT_JNM");
			String EDPRNT_RNM = (String) argHtMethod.get("EDPRNT_RNM");
			String SHLTH_YN = (String) argHtMethod.get("SHLTH_YN");
			String SSPCL_YN = (String) argHtMethod.get("SSPCL_YN");
			String EDPRNT_PG = (String) argHtMethod.get("EDPRNT_PG");
			String EDPRNT_SEQ = (String) argHtMethod.get("EDPRNT_SEQ");
			String EDPRNT_FST = (String) argHtMethod.get("EDPRNT_FST");
			String GUSER1 = (String) argHtMethod.get("GUSER1");
			String GUSER2 = (String) argHtMethod.get("GUSER2");

			//
			if(SPRNT_CD == null) { SPRNT_CD = ""; }
			if(SMAX_SQ == null) { SMAX_SQ = ""; }
			if(EDPRNT_TNM == null) { EDPRNT_TNM = ""; }
			if(EDPRNT_HNM == null) { EDPRNT_HNM = ""; }
			if(EDPRNT_SNM == null) { EDPRNT_SNM = ""; }
			if(EDPRNT_ENM == null) { EDPRNT_ENM = ""; }
			if(EDPRNT_CNM == null) { EDPRNT_CNM = ""; }
			if(EDPRNT_JNM == null) { EDPRNT_JNM = ""; }
			if(EDPRNT_RNM == null) { EDPRNT_RNM = ""; }
			if(SHLTH_YN == null) { SHLTH_YN = ""; }
			if(SSPCL_YN == null) { SSPCL_YN = ""; }
			if(EDPRNT_PG == null) { EDPRNT_PG = ""; }
			if(EDPRNT_SEQ == null) { EDPRNT_SEQ = ""; }
			if(EDPRNT_FST == null) { EDPRNT_FST = ""; }
			if(GUSER1 == null) { GUSER1 = ""; }
			if(GUSER2 == null) { GUSER2 = ""; }

			//
			SPRNT_CD = CTr.Replace(SPRNT_CD, "'", "''");
			SMAX_SQ = CTr.Replace(SMAX_SQ, "'", "''");
			EDPRNT_TNM = CTr.Replace(EDPRNT_TNM, "'", "''");
			EDPRNT_HNM = CTr.Replace(EDPRNT_HNM, "'", "''");
			EDPRNT_SNM = CTr.Replace(EDPRNT_SNM, "'", "''");
			EDPRNT_ENM = CTr.Replace(EDPRNT_ENM, "'", "''");
			EDPRNT_CNM = CTr.Replace(EDPRNT_CNM, "'", "''");
			EDPRNT_JNM = CTr.Replace(EDPRNT_JNM, "'", "''");
			EDPRNT_RNM = CTr.Replace(EDPRNT_RNM, "'", "''");
			SHLTH_YN = CTr.Replace(SHLTH_YN, "'", "''");
			SSPCL_YN = CTr.Replace(SSPCL_YN, "'", "''");
			EDPRNT_PG = CTr.Replace(EDPRNT_PG, "'", "''");
			EDPRNT_SEQ = CTr.Replace(EDPRNT_SEQ, "'", "''");
			EDPRNT_FST = CTr.Replace(EDPRNT_FST, "'", "''");
			GUSER1 = CTr.Replace(GUSER1, "'", "''");
			GUSER2 = CTr.Replace(GUSER2, "'", "''");

			sql = "INSERT INTO ET_PACK_MARK VALUES (";
			sql += "  '2'";
			sql += ", '" + SPRNT_CD + "'";
			sql += ", '" + SMAX_SQ + "'";
			sql += ", '" + EDPRNT_TNM + "'";
			sql += ", '" + EDPRNT_HNM + "'";
			sql += ", '" + EDPRNT_SNM + "'";
			sql += ", '" + EDPRNT_ENM + "'";
			sql += ", '" + EDPRNT_CNM + "'";
			sql += ", '" + EDPRNT_JNM + "'";
			sql += ", '" + EDPRNT_RNM + "'";
			sql += ", ''";
			sql += ", '" + SHLTH_YN + "'";
			sql += ", '" + SSPCL_YN + "'";
			sql += ", '" + EDPRNT_PG + "'";
			sql += ", '" + EDPRNT_SEQ + "'";
			sql += ", '" + EDPRNT_FST + "'";
			sql += ", 'Y'";
			sql += ", ''";
			sql += ", NULL";
			sql += ", '" + GUSER1 + "'";
			sql += ", SYSDATE";
			sql += ", '" + GUSER2 + "'";
			sql += ", SYSDATE";
			sql += ")";

			argStmtExec.executeUpdate(sql);

		} catch (Exception e) {

			throw new FuncException(e.toString(), sql);
		}

		return sql;
	}
%>
