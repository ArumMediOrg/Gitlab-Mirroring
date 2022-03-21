<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%!
	public String func_uPack_Mark_btnSave_VwClick_002_TRAN001(Statement argStmtExec, HashMap argHtMethod) throws Exception {

		String sql = "";
		String sql2 = "";
		String sql_disp = "";

		try {

			String SVIEW_CD = (String) argHtMethod.get("SVIEW_CD");
			String SMAX_SQ = (String) argHtMethod.get("SMAX_SQ");
			String EDMARK_TNM = (String) argHtMethod.get("EDMARK_TNM");
			String EDMARK_HNM = (String) argHtMethod.get("EDMARK_HNM");
			String EDMARK_SNM = (String) argHtMethod.get("EDMARK_SNM");
			String EDMARK_ENM = (String) argHtMethod.get("EDMARK_ENM");
			String EDMARK_CNM = (String) argHtMethod.get("EDMARK_CNM");
			String EDMARK_JNM = (String) argHtMethod.get("EDMARK_JNM");
			String EDMARK_RNM = (String) argHtMethod.get("EDMARK_RNM");
			String SHLTH_YN = (String) argHtMethod.get("SHLTH_YN");
			String SSPCL_YN = (String) argHtMethod.get("SSPCL_YN");
			String GUSER1 = (String) argHtMethod.get("GUSER1");
			String GUSER2 = (String) argHtMethod.get("GUSER2");

			//
			if(SVIEW_CD == null) { SVIEW_CD = ""; }
			if(SMAX_SQ == null) { SMAX_SQ = ""; }
			if(EDMARK_TNM == null) { EDMARK_TNM = ""; }
			if(EDMARK_HNM == null) { EDMARK_HNM = ""; }
			if(EDMARK_SNM == null) { EDMARK_SNM = ""; }
			if(EDMARK_ENM == null) { EDMARK_ENM = ""; }
			if(EDMARK_CNM == null) { EDMARK_CNM = ""; }
			if(EDMARK_JNM == null) { EDMARK_JNM = ""; }
			if(EDMARK_RNM == null) { EDMARK_RNM = ""; }
			if(SHLTH_YN == null) { SHLTH_YN = ""; }
			if(SSPCL_YN == null) { SSPCL_YN = ""; }
			if(GUSER1 == null) { GUSER1 = ""; }
			if(GUSER2 == null) { GUSER2 = ""; }

			//
			SVIEW_CD = CTr.Replace(SVIEW_CD, "'", "''");
			SMAX_SQ = CTr.Replace(SMAX_SQ, "'", "''");
			EDMARK_TNM = CTr.Replace(EDMARK_TNM, "'", "''");
			EDMARK_HNM = CTr.Replace(EDMARK_HNM, "'", "''");
			EDMARK_SNM = CTr.Replace(EDMARK_SNM, "'", "''");
			EDMARK_ENM = CTr.Replace(EDMARK_ENM, "'", "''");
			EDMARK_CNM = CTr.Replace(EDMARK_CNM, "'", "''");
			EDMARK_JNM = CTr.Replace(EDMARK_JNM, "'", "''");
			EDMARK_RNM = CTr.Replace(EDMARK_RNM, "'", "''");
			SHLTH_YN = CTr.Replace(SHLTH_YN, "'", "''");
			SSPCL_YN = CTr.Replace(SSPCL_YN, "'", "''");
			GUSER1 = CTr.Replace(GUSER1, "'", "''");
			GUSER2 = CTr.Replace(GUSER2, "'", "''");

			sql = "INSERT INTO ET_PACK_MARK VALUES (";
			sql += "  '1'";
			sql += ", '" + SVIEW_CD + "'";
			sql += ", '" + SMAX_SQ + "'";
			sql += ", '" + EDMARK_TNM + "'";
			sql += ", '" + EDMARK_HNM + "'";
			sql += ", '" + EDMARK_SNM + "'";
			sql += ", '" + EDMARK_ENM + "'";
			sql += ", '" + EDMARK_CNM + "'";
			sql += ", '" + EDMARK_JNM + "'";
			sql += ", '" + EDMARK_RNM + "'";
			sql += ", ''";
			sql += ", '" + SHLTH_YN + "'";
			sql += ", '" + SSPCL_YN + "'";
			sql += ", 0";
			sql += ", 0";
			sql += ", 0";
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
