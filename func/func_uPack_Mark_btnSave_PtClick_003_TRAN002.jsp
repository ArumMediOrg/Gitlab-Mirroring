<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%!
	public String func_uPack_Mark_btnSave_PtClick_003_TRAN002(Statement argStmtExec, HashMap argHtMethod) throws Exception {

		String sql = "";
		String sql2 = "";
		String sql_disp = "";

		try {

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
			String GUSER = (String) argHtMethod.get("GUSER");
			String SPRNT_CD = (String) argHtMethod.get("SPRNT_CD");
			String SMAX_SQ = (String) argHtMethod.get("SMAX_SQ");

			//
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
			if(GUSER == null) { GUSER = ""; }
			if(SPRNT_CD == null) { SPRNT_CD = ""; }
			if(SMAX_SQ == null) { SMAX_SQ = ""; }

			//
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
			GUSER = CTr.Replace(GUSER, "'", "''");
			SPRNT_CD = CTr.Replace(SPRNT_CD, "'", "''");
			SMAX_SQ = CTr.Replace(SMAX_SQ, "'", "''");

			sql = "UPDATE ET_PACK_MARK SET ";
			sql += "  EPM_MARK_TNM = '" + EDPRNT_TNM + "'";
			sql += ", EPM_MARK_HNM = '" + EDPRNT_HNM + "'";
			sql += ", EPM_MARK_SNM = '" + EDPRNT_SNM + "'";
			sql += ", EPM_MARK_ENM = '" + EDPRNT_ENM + "'";
			sql += ", EPM_MARK_CNM = '" + EDPRNT_CNM + "'";
			sql += ", EPM_MARK_JNM = '" + EDPRNT_JNM + "'";
			sql += ", EPM_MARK_RNM = '" + EDPRNT_RNM + "'";
			sql += ", EPM_HLTH_YN = '" + SHLTH_YN + "'";
			sql += ", EPM_SPCL_YN = '" + SSPCL_YN + "'";
			sql += ", EPM_PRNT_PG = '" + EDPRNT_PG + "'";
			sql += ", EPM_PRNT_SQ = '" + EDPRNT_SEQ + "'";
			sql += ", EPM_PRNT_FST = '" + EDPRNT_FST + "'";
			sql += ", EPM_MODI_ID = '" + GUSER + "'";
			sql += ", EPM_MODI_DTT = SYSDATE";
			sql += " WHERE EPM_MARK_KD = '2'";
			sql += " AND EPM_MARK_CD = '" + SPRNT_CD + "'";
			sql += " AND EPM_MARK_SQ = '" + SMAX_SQ + "'";

			argStmtExec.executeUpdate(sql);

		} catch (Exception e) {

			throw new FuncException(e.toString(), sql);
		}

		return sql;
	}
%>
