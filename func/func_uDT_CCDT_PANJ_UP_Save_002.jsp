<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%!
	public String func_uDT_CCDT_PANJ_UP_Save_002(Statement argStmtExec, HashMap argHtMethod) throws Exception {

		String sql = "";
		String sql2 = "";
		String sql_disp = "";

		try {

			String SMOK_YN = (String) argHtMethod.get("SMOK_YN");
			String DRINK_YN = (String) argHtMethod.get("DRINK_YN");
			String SPORT_KD = (String) argHtMethod.get("SPORT_KD");
			String PAST_LT = (String) argHtMethod.get("PAST_LT");
			String FMGN_KD = (String) argHtMethod.get("FMGN_KD");
			String FMAG_INT = (String) argHtMethod.get("FMAG_INT");
			String FMSC_KD = (String) argHtMethod.get("FMSC_KD");
			String TARG_KD = (String) argHtMethod.get("TARG_KD");
			String SICK_KD = (String) argHtMethod.get("SICK_KD");
			String PAN_KD = (String) argHtMethod.get("PAN_KD");
			String WORK_KD = (String) argHtMethod.get("WORK_KD");
			String SOKUN_LT = (String) argHtMethod.get("SOKUN_LT");
			String INJA_CNT = (String) argHtMethod.get("INJA_CNT");
			String INJA_LT = (String) argHtMethod.get("INJA_LT");
			String BD_LT = (String) argHtMethod.get("BD_LT");
			String PAN_DT = (String) argHtMethod.get("PAN_DT");
			String DOCT_CD = (String) argHtMethod.get("DOCT_CD");
			String COMP_YN = (String) argHtMethod.get("COMP_YN");
			String MODI_ID = (String) argHtMethod.get("MODI_ID");
			String FMSEX_CD = (String) argHtMethod.get("FMSEX_CD");
			String EXAM_DT = (String) argHtMethod.get("EXAM_DT");
			String EXAM_SQ = (String) argHtMethod.get("EXAM_SQ");

			//
			if(SMOK_YN == null) { SMOK_YN = ""; }
			if(DRINK_YN == null) { DRINK_YN = ""; }
			if(SPORT_KD == null) { SPORT_KD = ""; }
			if(PAST_LT == null) { PAST_LT = ""; }
			if(FMGN_KD == null) { FMGN_KD = ""; }
			if(FMAG_INT == null) { FMAG_INT = ""; }
			if(FMSC_KD == null) { FMSC_KD = ""; }
			if(TARG_KD == null) { TARG_KD = ""; }
			if(SICK_KD == null) { SICK_KD = ""; }
			if(PAN_KD == null) { PAN_KD = ""; }
			if(WORK_KD == null) { WORK_KD = ""; }
			if(SOKUN_LT == null) { SOKUN_LT = ""; }
			if(INJA_CNT == null) { INJA_CNT = ""; }
			if(INJA_LT == null) { INJA_LT = ""; }
			if(BD_LT == null) { BD_LT = ""; }
			if(PAN_DT == null) { PAN_DT = ""; }
			if(DOCT_CD == null) { DOCT_CD = ""; }
			if(COMP_YN == null) { COMP_YN = ""; }
			if(MODI_ID == null) { MODI_ID = ""; }
			if(FMSEX_CD == null) { FMSEX_CD = ""; }
			if(EXAM_DT == null) { EXAM_DT = ""; }
			if(EXAM_SQ == null) { EXAM_SQ = ""; }

			//
			SMOK_YN = CTr.Replace(SMOK_YN, "'", "''");
			DRINK_YN = CTr.Replace(DRINK_YN, "'", "''");
			SPORT_KD = CTr.Replace(SPORT_KD, "'", "''");
			PAST_LT = CTr.Replace(PAST_LT, "'", "''");
			FMGN_KD = CTr.Replace(FMGN_KD, "'", "''");
			FMAG_INT = CTr.Replace(FMAG_INT, "'", "''");
			FMSC_KD = CTr.Replace(FMSC_KD, "'", "''");
			TARG_KD = CTr.Replace(TARG_KD, "'", "''");
			SICK_KD = CTr.Replace(SICK_KD, "'", "''");
			PAN_KD = CTr.Replace(PAN_KD, "'", "''");
			WORK_KD = CTr.Replace(WORK_KD, "'", "''");
			SOKUN_LT = CTr.Replace(SOKUN_LT, "'", "''");
			INJA_CNT = CTr.Replace(INJA_CNT, "'", "''");
			INJA_LT = CTr.Replace(INJA_LT, "'", "''");
			BD_LT = CTr.Replace(BD_LT, "'", "''");
			PAN_DT = CTr.Replace(PAN_DT, "'", "''");
			DOCT_CD = CTr.Replace(DOCT_CD, "'", "''");
			COMP_YN = CTr.Replace(COMP_YN, "'", "''");
			MODI_ID = CTr.Replace(MODI_ID, "'", "''");
			FMSEX_CD = CTr.Replace(FMSEX_CD, "'", "''");
			EXAM_DT = CTr.Replace(EXAM_DT, "'", "''");
			EXAM_SQ = CTr.Replace(EXAM_SQ, "'", "''");

			sql = "UPDATE DT_CCDT_PANJ SET ";
			sql += "  DCP_SMOK_YN = '" + SMOK_YN + "'";
			sql += ", DCP_DRINK_YN = '" + DRINK_YN + "'";
			sql += ", DCP_SPORT_KD = '" + SPORT_KD + "'";
			sql += ", DCP_PAST_LT = '" + PAST_LT + "'";
			sql += ", DCP_FMGN_KD = '" + FMGN_KD + "'";
			sql += ", DCP_FMAG_INT = '" + FMAG_INT + "'";
			sql += ", DCP_FMSC_KD = '" + FMSC_KD + "'";
			sql += ", DCP_TARG_KD = '" + TARG_KD + "'";
			sql += ", DCP_SICK_KD = '" + SICK_KD + "'";
			sql += ", DCP_PAN_KD = '" + PAN_KD + "'";
			sql += ", DCP_WORK_KD = '" + WORK_KD + "'";
			sql += ", DCP_SOKUN_LT = '" + SOKUN_LT + "'";
			sql += ", DCP_INJA_CNT = '" + INJA_CNT + "'";
			sql += ", DCP_INJA_LT = '" + INJA_LT + "'";
			sql += ", DCP_BD_LT = '" + BD_LT + "'";
			sql += ", DCP_PAN_DT = '" + PAN_DT + "'";
			sql += ", DCP_DOCT_CD = '" + DOCT_CD + "'";
			sql += ", DCP_COMP_YN = '" + COMP_YN + "'";
			sql += ", DCP_MODI_ID = '" + MODI_ID + "'";
			sql += ", DCP_MODI_DTT = SYSDATE";
			sql += ", DCP_FMSEX_CD = '" + FMSEX_CD + "'";
			sql += " WHERE DCP_EXAM_DT = '" + EXAM_DT + "'";
			sql += " AND DCP_EXAM_SQ = '" + EXAM_SQ + "'";

			argStmtExec.executeUpdate(sql);

		} catch (Exception e) {

			throw new FuncException(e.toString(), sql);
		}

		return sql;
	}
%>
