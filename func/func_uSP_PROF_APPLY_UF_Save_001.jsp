<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%!
	public String func_uSP_PROF_APPLY_UF_Save_001(Statement argStmtExec, HashMap argHtMethod) throws Exception {

		String sql = "";
		String sql2 = "";
		String sql_disp = "";

		try {

			String CHKBOXCSP_USE_YN = (String) argHtMethod.get("CHKBOXCSP_USE_YN");
			String JJ_CD = (String) argHtMethod.get("JJ_CD");
			String SBCD_CD = (String) argHtMethod.get("SBCD_CD");
			String JJ_NM = (String) argHtMethod.get("JJ_NM");
			String JANGGI_CD = (String) argHtMethod.get("JANGGI_CD");
			String CHASU = (String) argHtMethod.get("CHASU");
			String CHOC_KD = (String) argHtMethod.get("CHOC_KD");
			String INPT_ID = (String) argHtMethod.get("INPT_ID");
			String NUSE_ID = (String) argHtMethod.get("NUSE_ID");

			//
			if(CHKBOXCSP_USE_YN == null) { CHKBOXCSP_USE_YN = ""; }
			if(JJ_CD == null) { JJ_CD = ""; }
			if(SBCD_CD == null) { SBCD_CD = ""; }
			if(JJ_NM == null) { JJ_NM = ""; }
			if(JANGGI_CD == null) { JANGGI_CD = ""; }
			if(CHASU == null) { CHASU = ""; }
			if(CHOC_KD == null) { CHOC_KD = ""; }
			if(INPT_ID == null) { INPT_ID = ""; }
			if(NUSE_ID == null) { NUSE_ID = ""; }

			//
			CHKBOXCSP_USE_YN = CTr.Replace(CHKBOXCSP_USE_YN, "'", "''");
			JJ_CD = CTr.Replace(JJ_CD, "'", "''");
			SBCD_CD = CTr.Replace(SBCD_CD, "'", "''");
			JJ_NM = CTr.Replace(JJ_NM, "'", "''");
			JANGGI_CD = CTr.Replace(JANGGI_CD, "'", "''");
			CHASU = CTr.Replace(CHASU, "'", "''");
			CHOC_KD = CTr.Replace(CHOC_KD, "'", "''");
			INPT_ID = CTr.Replace(INPT_ID, "'", "''");
			NUSE_ID = CTr.Replace(NUSE_ID, "'", "''");

			if(CHKBOXCSP_USE_YN.equals("1")) {
				sql = "INSERT INTO CT_SP_PROF (CSP_JJ_CD,CSP_SBCD_CD,CSP_JJ_NM,CSP_JANGGI_CD,CSP_CHASU,CSP_CHOC_KD,CSP_USE_YN, CSP_INPT_ID,CSP_INPT_DTT) VALUES (";
				sql += "  '" + JJ_CD + "'";
				sql += ", '" + SBCD_CD + "'";
				sql += ", '" + JJ_NM + "'";
				sql += ", '" + JANGGI_CD + "'";
				sql += ", '" + CHASU + "'";
				sql += ", '" + CHOC_KD + "'";
				sql += ", 'Y'";
				sql += ", '" + INPT_ID + "'";
				sql += ", SYSDATE";
				sql += ")";

				argStmtExec.executeUpdate(sql);
			}
			else {
				sql = "INSERT INTO CT_SP_PROF (CSP_JJ_CD,CSP_SBCD_CD,CSP_JJ_NM,CSP_JANGGI_CD,CSP_CHASU,CSP_CHOC_KD,CSP_USE_YN, CSP_NUSE_ID,CSP_NUSE_DTT,CSP_INPT_ID,CSP_INPT_DTT) VALUES (";
				sql += "  '" + JJ_CD + "'";
				sql += ", '" + SBCD_CD + "'";
				sql += ", '" + JJ_NM + "'";
				sql += ", '" + JANGGI_CD + "'";
				sql += ", '" + CHASU + "'";
				sql += ", '" + CHOC_KD + "'";
				sql += ", 'N'";
				sql += ", '" + NUSE_ID + "'";
				sql += ", SYSDATE";
				sql += ", '" + INPT_ID + "'";
				sql += ", SYSDATE";
				sql += ")";

				argStmtExec.executeUpdate(sql);
			}
		} catch (Exception e) {

			throw new FuncException(e.toString(), sql);
		}

		return sql;
	}
%>
