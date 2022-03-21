<%!
	public String uPack_Mark_btnSave_VwClick_003_TRAN002(Statement argStmtExec, HashMap argHtMethod) throws Exception {
	
		String sql;

		String EDMARK_TNM = (String) argHtMethod.get("EDMARK_TNM");
		String EDMARK_HNM = (String) argHtMethod.get("EDMARK_HNM");
		String EDMARK_SNM = (String) argHtMethod.get("EDMARK_SNM");
		String EDMARK_ENM = (String) argHtMethod.get("EDMARK_ENM");
		String EDMARK_CNM = (String) argHtMethod.get("EDMARK_CNM");
		String EDMARK_JNM = (String) argHtMethod.get("EDMARK_JNM");
		String EDMARK_RNM = (String) argHtMethod.get("EDMARK_RNM");
		String SHLTH_YN = (String) argHtMethod.get("SHLTH_YN");
		String SSPCL_YN = (String) argHtMethod.get("SSPCL_YN");
		String GUSER = (String) argHtMethod.get("GUSER");
		String SVIEW_CD = (String) argHtMethod.get("SVIEW_CD");
		String SMAX_SQ = (String) argHtMethod.get("SMAX_SQ");

		//
		if(EDMARK_TNM == null) { EDMARK_TNM = ""; }
		if(EDMARK_HNM == null) { EDMARK_HNM = ""; }
		if(EDMARK_SNM == null) { EDMARK_SNM = ""; }
		if(EDMARK_ENM == null) { EDMARK_ENM = ""; }
		if(EDMARK_CNM == null) { EDMARK_CNM = ""; }
		if(EDMARK_JNM == null) { EDMARK_JNM = ""; }
		if(EDMARK_RNM == null) { EDMARK_RNM = ""; }
		if(SHLTH_YN == null) { SHLTH_YN = ""; }
		if(SSPCL_YN == null) { SSPCL_YN = ""; }
		if(GUSER == null) { GUSER = ""; }
		if(SVIEW_CD == null) { SVIEW_CD = ""; }
		if(SMAX_SQ == null) { SMAX_SQ = ""; }
		
		sql = "UPDATE ET_PACK_MARK SET ";
		sql += "  EPM_MARK_TNM = '" + EDMARK_TNM + "'";
		sql += ", EPM_MARK_HNM = '" + EDMARK_HNM + "'";
		sql += ", EPM_MARK_SNM = '" + EDMARK_SNM + "'";
		sql += ", EPM_MARK_ENM = '" + EDMARK_ENM + "'";
		sql += ", EPM_MARK_CNM = '" + EDMARK_CNM + "'";
		sql += ", EPM_MARK_JNM = '" + EDMARK_JNM + "'";
		sql += ", EPM_MARK_RNM = '" + EDMARK_RNM + "'";
		sql += ", EPM_HLTH_YN = '" + SHLTH_YN + "'";
		sql += ", EPM_SPCL_YN = '" + SSPCL_YN + "'";
		sql += ", EPM_PRNT_PG = 0";
		sql += ", EPM_PRNT_SQ = 0";
		sql += ", EPM_PRNT_FST = 0";
		sql += ", EPM_MODI_ID = '" + GUSER + "'";
		sql += ", EPM_MODI_DTT = SYSDATE";
		sql += " WHERE EPM_MARK_KD = '1'";
		sql += " AND EPM_MARK_CD = '" + SVIEW_CD + "'";
		sql += " AND EPM_MARK_SQ = '" + SMAX_SQ + "'";
		
		argStmtExec.executeUpdate(sql);

		return sql;
	}
%>