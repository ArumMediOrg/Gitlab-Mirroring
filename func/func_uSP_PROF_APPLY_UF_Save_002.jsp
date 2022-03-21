<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%!
	public String func_uSP_PROF_APPLY_UF_Save_002(Statement argStmtExec, HashMap argHtMethod) throws Exception {

		String sql = "";
		String sql2 = "";
		String sql_disp = "";

		try {

			String CHKBOXCSP_USE_YN = (String) argHtMethod.get("CHKBOXCSP_USE_YN");
			String JANGGI_CD = (String) argHtMethod.get("JANGGI_CD");
			String CHASU = (String) argHtMethod.get("CHASU");
			String CHOC_KD = (String) argHtMethod.get("CHOC_KD");
			String MODI_ID = (String) argHtMethod.get("MODI_ID");
			String SBCD_CD = (String) argHtMethod.get("SBCD_CD");
			String JJ_NM = (String) argHtMethod.get("JJ_NM");
			String JJ_CD = (String) argHtMethod.get("JJ_CD");
			String NUSE_ID = (String) argHtMethod.get("NUSE_ID");

			//
			if(CHKBOXCSP_USE_YN == null) { CHKBOXCSP_USE_YN = ""; }
			if(JANGGI_CD == null) { JANGGI_CD = ""; }
			if(CHASU == null) { CHASU = ""; }
			if(CHOC_KD == null) { CHOC_KD = ""; }
			if(MODI_ID == null) { MODI_ID = ""; }
			if(SBCD_CD == null) { SBCD_CD = ""; }
			if(JJ_NM == null) { JJ_NM = ""; }
			if(JJ_CD == null) { JJ_CD = ""; }
			if(NUSE_ID == null) { NUSE_ID = ""; }

			//
			CHKBOXCSP_USE_YN = CTr.Replace(CHKBOXCSP_USE_YN, "'", "''");
			JANGGI_CD = CTr.Replace(JANGGI_CD, "'", "''");
			CHASU = CTr.Replace(CHASU, "'", "''");
			CHOC_KD = CTr.Replace(CHOC_KD, "'", "''");
			MODI_ID = CTr.Replace(MODI_ID, "'", "''");
			SBCD_CD = CTr.Replace(SBCD_CD, "'", "''");
			JJ_NM = CTr.Replace(JJ_NM, "'", "''");
			JJ_CD = CTr.Replace(JJ_CD, "'", "''");
			NUSE_ID = CTr.Replace(NUSE_ID, "'", "''");

			if(CHKBOXCSP_USE_YN.equals("1")) {
				sql = "UPDATE CT_SP_PROF SET ";
				sql += "  CSP_JANGGI_CD = '" + JANGGI_CD + "'";
				sql += ", CSP_CHASU = '" + CHASU + "'";
				sql += ", CSP_CHOC_KD = '" + CHOC_KD + "'";
				sql += ", CSP_MODI_ID = '" + MODI_ID + "'";
				sql += ", CSP_MODI_DTT = SYSDATE";
				sql += ", CSP_SBCD_CD = '" + SBCD_CD + "'";
				sql += ", CSP_JJ_NM = '" + JJ_NM + "'";
				sql += ", CSP_USE_YN = 'Y'";
				sql += " WHERE CSP_JJ_CD = '" + JJ_CD + "'";
				sql += " AND CSP_SBCD_CD = '" + SBCD_CD + "'";

				argStmtExec.executeUpdate(sql);
			}
			else {
				sql = "UPDATE CT_SP_PROF SET ";
				sql += "  CSP_JANGGI_CD = '" + JANGGI_CD + "'";
				sql += ", CSP_CHASU = '" + CHASU + "'";
				sql += ", CSP_CHOC_KD = '" + CHOC_KD + "'";
				sql += ", CSP_MODI_ID = '" + MODI_ID + "'";
				sql += ", CSP_MODI_DTT = SYSDATE";
				sql += ", CSP_SBCD_CD = '" + SBCD_CD + "'";
				sql += ", CSP_JJ_NM = '" + JJ_NM + "'";
				sql += ", CSP_USE_YN = 'N'";
				sql += ", CSP_NUSE_ID = '" + NUSE_ID + "'";
				sql += ", CSP_NUSE_DTT = SYSDATE";
				sql += " WHERE CSP_JJ_CD = '" + JJ_CD + "'";
				sql += " AND CSP_SBCD_CD = '" + SBCD_CD + "'";

				argStmtExec.executeUpdate(sql);
			}
		} catch (Exception e) {

			throw new FuncException(e.toString(), sql);
		}

		return sql;
	}
%>
