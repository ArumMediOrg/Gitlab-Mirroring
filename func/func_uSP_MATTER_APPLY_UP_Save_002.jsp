<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%!
	public String func_uSP_MATTER_APPLY_UP_Save_002(Statement argStmtExec, HashMap argHtMethod) throws Exception {

		String sql = "";
		String sql2 = "";
		String sql_disp = "";

		try {

			String CHKBOXCSM_USE_YN = (String) argHtMethod.get("CHKBOXCSM_USE_YN");
			String LARGE = (String) argHtMethod.get("LARGE");
			String MATT_NM = (String) argHtMethod.get("MATT_NM");
			String JIB_CD = (String) argHtMethod.get("JIB_CD");
			String INJA_CD = (String) argHtMethod.get("INJA_CD");
			String PERIOD_TM = (String) argHtMethod.get("PERIOD_TM");
			String AFTER_TM = (String) argHtMethod.get("AFTER_TM");
			String COMM_CD = (String) argHtMethod.get("COMM_CD");
			String STAT_YR = (String) argHtMethod.get("STAT_YR");
			String MODI_ID = (String) argHtMethod.get("MODI_ID");
			String MATT_CD = (String) argHtMethod.get("MATT_CD");
			String NUSE_ID = (String) argHtMethod.get("NUSE_ID");

			//
			if(CHKBOXCSM_USE_YN == null) { CHKBOXCSM_USE_YN = ""; }
			if(LARGE == null) { LARGE = ""; }
			if(MATT_NM == null) { MATT_NM = ""; }
			if(JIB_CD == null) { JIB_CD = ""; }
			if(INJA_CD == null) { INJA_CD = ""; }
			if(PERIOD_TM == null) { PERIOD_TM = ""; }
			if(AFTER_TM == null) { AFTER_TM = ""; }
			if(COMM_CD == null) { COMM_CD = ""; }
			if(STAT_YR == null) { STAT_YR = ""; }
			if(MODI_ID == null) { MODI_ID = ""; }
			if(MATT_CD == null) { MATT_CD = ""; }
			if(NUSE_ID == null) { NUSE_ID = ""; }

			//
			CHKBOXCSM_USE_YN = CTr.Replace(CHKBOXCSM_USE_YN, "'", "''");
			LARGE = CTr.Replace(LARGE, "'", "''");
			MATT_NM = CTr.Replace(MATT_NM, "'", "''");
			JIB_CD = CTr.Replace(JIB_CD, "'", "''");
			INJA_CD = CTr.Replace(INJA_CD, "'", "''");
			PERIOD_TM = CTr.Replace(PERIOD_TM, "'", "''");
			AFTER_TM = CTr.Replace(AFTER_TM, "'", "''");
			COMM_CD = CTr.Replace(COMM_CD, "'", "''");
			STAT_YR = CTr.Replace(STAT_YR, "'", "''");
			MODI_ID = CTr.Replace(MODI_ID, "'", "''");
			MATT_CD = CTr.Replace(MATT_CD, "'", "''");
			NUSE_ID = CTr.Replace(NUSE_ID, "'", "''");

			if(CHKBOXCSM_USE_YN.equals("1")) {
				sql = "UPDATE CT_SP_MATTER SET ";
				sql += "  CSM_LARGE = '" + LARGE + "'";
				sql += ", CSM_MATT_NM = '" + MATT_NM + "'";
				sql += ", CSM_JIB_CD = '" + JIB_CD + "'";
				sql += ", CSM_INJA_CD = '" + INJA_CD + "'";
				sql += ", CSM_PERIOD_TM = '" + PERIOD_TM + "'";
				sql += ", CSM_AFTER_TM = '" + AFTER_TM + "'";
				sql += ", CSM_COMM_CD = '" + COMM_CD + "'";
				sql += ", CSM_STAT_YR = '" + STAT_YR + "'";
				sql += ", CSM_MODI_ID = '" + MODI_ID + "'";
				sql += ", CSM_MODI_DTT = SYSDATE";
				sql += ", CSM_USE_YN = 'Y'";
				sql += " WHERE CSM_MATT_CD = '" + MATT_CD + "'";

				argStmtExec.executeUpdate(sql);
			}
			else {
				sql = "UPDATE CT_SP_MATTER SET ";
				sql += "  CSM_LARGE = '" + LARGE + "'";
				sql += ", CSM_MATT_NM = '" + MATT_NM + "'";
				sql += ", CSM_JIB_CD = '" + JIB_CD + "'";
				sql += ", CSM_INJA_CD = '" + INJA_CD + "'";
				sql += ", CSM_PERIOD_TM = '" + PERIOD_TM + "'";
				sql += ", CSM_AFTER_TM = '" + AFTER_TM + "'";
				sql += ", CSM_COMM_CD = '" + COMM_CD + "'";
				sql += ", CSM_STAT_YR = '" + STAT_YR + "'";
				sql += ", CSM_MODI_ID = '" + MODI_ID + "'";
				sql += ", CSM_MODI_DTT = SYSDATE";
				sql += ", CSM_USE_YN = 'N'";
				sql += ", CSM_NUSE_ID = '" + NUSE_ID + "'";
				sql += ", CSM_NUSE_DTT = SYSDATE";
				sql += " WHERE CSM_MATT_CD = '" + MATT_CD + "'";

				argStmtExec.executeUpdate(sql);
			}
		} catch (Exception e) {

			throw new FuncException(e.toString(), sql);
		}

		return sql;
	}
%>
