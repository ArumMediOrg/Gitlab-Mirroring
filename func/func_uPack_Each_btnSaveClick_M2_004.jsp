<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%!
	public String func_uPack_Each_btnSaveClick_M2_004(Statement argStmtExec, HashMap argHtMethod) throws Exception {

		String sql = "";
		String sql2 = "";
		String sql_disp = "";

		try {

			String SEXAM_CD = (String) argHtMethod.get("SEXAM_CD");
			String SMAX_SQ = (String) argHtMethod.get("SMAX_SQ");
			String SOPTN_CD = (String) argHtMethod.get("SOPTN_CD");
			String SOPTN_NM = (String) argHtMethod.get("SOPTN_NM");
			String IOPTN_PR = (String) argHtMethod.get("IOPTN_PR");
			String IOPTN_CNT = (String) argHtMethod.get("IOPTN_CNT");
			String SOPTN_LT = (String) argHtMethod.get("SOPTN_LT");
			String SCALC_CD = (String) argHtMethod.get("SCALC_CD");
			String SOPTN_USE = (String) argHtMethod.get("SOPTN_USE");
			String GUSER = (String) argHtMethod.get("GUSER");
			String GUSER2 = (String) argHtMethod.get("GUSER2");

			//
			if(SEXAM_CD == null) { SEXAM_CD = ""; }
			if(SMAX_SQ == null) { SMAX_SQ = ""; }
			if(SOPTN_CD == null) { SOPTN_CD = ""; }
			if(SOPTN_NM == null) { SOPTN_NM = ""; }
			if(IOPTN_PR == null) { IOPTN_PR = ""; }
			if(IOPTN_CNT == null) { IOPTN_CNT = ""; }
			if(SOPTN_LT == null) { SOPTN_LT = ""; }
			if(SCALC_CD == null) { SCALC_CD = ""; }
			if(SOPTN_USE == null) { SOPTN_USE = ""; }
			if(GUSER == null) { GUSER = ""; }
			if(GUSER2 == null) { GUSER2 = ""; }

			//
			SEXAM_CD = CTr.Replace(SEXAM_CD, "'", "''");
			SMAX_SQ = CTr.Replace(SMAX_SQ, "'", "''");
			SOPTN_CD = CTr.Replace(SOPTN_CD, "'", "''");
			SOPTN_NM = CTr.Replace(SOPTN_NM, "'", "''");
			IOPTN_PR = CTr.Replace(IOPTN_PR, "'", "''");
			IOPTN_CNT = CTr.Replace(IOPTN_CNT, "'", "''");
			SOPTN_LT = CTr.Replace(SOPTN_LT, "'", "''");
			SCALC_CD = CTr.Replace(SCALC_CD, "'", "''");
			SOPTN_USE = CTr.Replace(SOPTN_USE, "'", "''");
			GUSER = CTr.Replace(GUSER, "'", "''");
			GUSER2 = CTr.Replace(GUSER2, "'", "''");

			sql = "INSERT INTO ET_PACK_OPTN VALUES (";
			sql += "  '" + SEXAM_CD + "'";
			sql += ", '" + SMAX_SQ + "'";
			sql += ", '" + SOPTN_CD + "'";
			sql += ", '" + SOPTN_NM + "'";
			sql += ", '" + IOPTN_PR + "'";
			sql += ", '" + IOPTN_CNT + "'";
			sql += ", '" + SOPTN_LT + "'";
			sql += ", '" + SCALC_CD + "'";
			sql += ", SYSDATE";
			sql += ", '" + SOPTN_USE + "'";
			sql += ", ''";
			sql += ", NULL";
			sql += ", '" + GUSER + "'";
			sql += ", SYSDATE";
			sql += ", '" + GUSER2 + "'";
			sql += ", SYSDATE";
			sql += ", ''";
			sql += ", NULL";
			sql += ")";

			argStmtExec.executeUpdate(sql);

		} catch (Exception e) {

			throw new FuncException(e.toString(), sql);
		}

		return sql;
	}
%>
