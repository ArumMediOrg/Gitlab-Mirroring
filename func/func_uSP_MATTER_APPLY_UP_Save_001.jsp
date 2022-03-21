<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%!
	public String func_uSP_MATTER_APPLY_UP_Save_001(Statement argStmtExec, HashMap argHtMethod) throws Exception {

		String sql = "";
		String sql2 = "";
		String sql_disp = "";

		try {

			String CHKBOXCSM_USE_YN = (String) argHtMethod.get("CHKBOXCSM_USE_YN");
			String LARGE = (String) argHtMethod.get("LARGE");
			String MATT_CD = (String) argHtMethod.get("MATT_CD");
			String MATT_NM = (String) argHtMethod.get("MATT_NM");
			String JIB_CD = (String) argHtMethod.get("JIB_CD");
			String INJA_CD = (String) argHtMethod.get("INJA_CD");
			String PERIOD_TM = (String) argHtMethod.get("PERIOD_TM");
			String AFTER_TM = (String) argHtMethod.get("AFTER_TM");
			String COMM_CD = (String) argHtMethod.get("COMM_CD");
			String STAT_YR = (String) argHtMethod.get("STAT_YR");
			String INPT_ID = (String) argHtMethod.get("INPT_ID");
			String NUSE_ID = (String) argHtMethod.get("NUSE_ID");

			//
			if(CHKBOXCSM_USE_YN == null) { CHKBOXCSM_USE_YN = ""; }
			if(LARGE == null) { LARGE = ""; }
			if(MATT_CD == null) { MATT_CD = ""; }
			if(MATT_NM == null) { MATT_NM = ""; }
			if(JIB_CD == null) { JIB_CD = ""; }
			if(INJA_CD == null) { INJA_CD = ""; }
			if(PERIOD_TM == null) { PERIOD_TM = ""; }
			if(AFTER_TM == null) { AFTER_TM = ""; }
			if(COMM_CD == null) { COMM_CD = ""; }
			if(STAT_YR == null) { STAT_YR = ""; }
			if(INPT_ID == null) { INPT_ID = ""; }
			if(NUSE_ID == null) { NUSE_ID = ""; }

			//
			CHKBOXCSM_USE_YN = CTr.Replace(CHKBOXCSM_USE_YN, "'", "''");
			LARGE = CTr.Replace(LARGE, "'", "''");
			MATT_CD = CTr.Replace(MATT_CD, "'", "''");
			MATT_NM = CTr.Replace(MATT_NM, "'", "''");
			JIB_CD = CTr.Replace(JIB_CD, "'", "''");
			INJA_CD = CTr.Replace(INJA_CD, "'", "''");
			PERIOD_TM = CTr.Replace(PERIOD_TM, "'", "''");
			AFTER_TM = CTr.Replace(AFTER_TM, "'", "''");
			COMM_CD = CTr.Replace(COMM_CD, "'", "''");
			STAT_YR = CTr.Replace(STAT_YR, "'", "''");
			INPT_ID = CTr.Replace(INPT_ID, "'", "''");
			NUSE_ID = CTr.Replace(NUSE_ID, "'", "''");

			if(CHKBOXCSM_USE_YN.equals("1")) {
				sql = "INSERT INTO CT_SP_MATTER (CSM_LARGE,CSM_MATT_CD,CSM_MATT_NM,CSM_JIB_CD,CSM_INJA_CD,CSM_PERIOD_TM,CSM_AFTER_TM,CSM_COMM_CD,CSM_STAT_YR,CSM_USE_YN, CSM_INPT_ID,CSM_INPT_DTT) VALUES (";
				sql += "  '" + LARGE + "'";
				sql += ", '" + MATT_CD + "'";
				sql += ", '" + MATT_NM + "'";
				sql += ", '" + JIB_CD + "'";
				sql += ", '" + INJA_CD + "'";
				sql += ", '" + PERIOD_TM + "'";
				sql += ", '" + AFTER_TM + "'";
				sql += ", '" + COMM_CD + "'";
				sql += ", '" + STAT_YR + "'";
				sql += ", 'Y'";
				sql += ", '" + INPT_ID + "'";
				sql += ", SYSDATE";
				sql += ")";

				argStmtExec.executeUpdate(sql);
			}
			else {
				sql = "INSERT INTO CT_SP_MATTER (CSM_LARGE,CSM_MATT_CD,CSM_MATT_NM,CSM_JIB_CD,CSM_INJA_CD,CSM_PERIOD_TM,CSM_AFTER_TM,CSM_COMM_CD,CSM_STAT_YR,CSM_USE_YN, CSM_NUSE_ID,CSM_NUSE_DTT,CSM_INPT_ID,CSM_INPT_DTT) VALUES (";
				sql += "  '" + LARGE + "'";
				sql += ", '" + MATT_CD + "'";
				sql += ", '" + MATT_NM + "'";
				sql += ", '" + JIB_CD + "'";
				sql += ", '" + INJA_CD + "'";
				sql += ", '" + PERIOD_TM + "'";
				sql += ", '" + AFTER_TM + "'";
				sql += ", '" + COMM_CD + "'";
				sql += ", '" + STAT_YR + "'";
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
