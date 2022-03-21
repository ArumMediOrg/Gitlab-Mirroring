<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%!
	public String func_uDT_CCDT_PANJ_UP_Save_001(Statement argStmtExec, HashMap argHtMethod) throws Exception {

		String sql = "";
		String sql2 = "";
		String sql_disp = "";

		try {

			String EXAM_DT = (String) argHtMethod.get("EXAM_DT");
			String EXAM_SQ = (String) argHtMethod.get("EXAM_SQ");
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
			String INPT_ID = (String) argHtMethod.get("INPT_ID");
			String FMSEX_CD = (String) argHtMethod.get("FMSEX_CD");

			//
			if(EXAM_DT == null) { EXAM_DT = ""; }
			if(EXAM_SQ == null) { EXAM_SQ = ""; }
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
			if(INPT_ID == null) { INPT_ID = ""; }
			if(FMSEX_CD == null) { FMSEX_CD = ""; }

			//
			EXAM_DT = CTr.Replace(EXAM_DT, "'", "''");
			EXAM_SQ = CTr.Replace(EXAM_SQ, "'", "''");
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
			INPT_ID = CTr.Replace(INPT_ID, "'", "''");
			FMSEX_CD = CTr.Replace(FMSEX_CD, "'", "''");

			sql = "INSERT INTO DT_CCDT_PANJ (DCP_EXAM_DT,DCP_EXAM_SQ,DCP_SMOK_YN,DCP_DRINK_YN,DCP_SPORT_KD, DCP_PAST_LT,DCP_FMGN_KD,DCP_FMAG_INT,DCP_FMSC_KD,DCP_TARG_KD, DCP_SICK_KD,DCP_PAN_KD,DCP_WORK_KD,DCP_SOKUN_LT,DCP_INJA_CNT, DCP_INJA_LT,DCP_BD_LT,DCP_PAN_DT,DCP_DOCT_CD,DCP_COMP_YN, DCP_INPT_ID,DCP_INPT_DTT, DCP_FMSEX_CD) VALUES (";
			sql += "  '" + EXAM_DT + "'";
			sql += ", '" + EXAM_SQ + "'";
			sql += ", '" + SMOK_YN + "'";
			sql += ", '" + DRINK_YN + "'";
			sql += ", '" + SPORT_KD + "'";
			sql += ", '" + PAST_LT + "'";
			sql += ", '" + FMGN_KD + "'";
			sql += ", '" + FMAG_INT + "'";
			sql += ", '" + FMSC_KD + "'";
			sql += ", '" + TARG_KD + "'";
			sql += ", '" + SICK_KD + "'";
			sql += ", '" + PAN_KD + "'";
			sql += ", '" + WORK_KD + "'";
			sql += ", '" + SOKUN_LT + "'";
			sql += ", '" + INJA_CNT + "'";
			sql += ", '" + INJA_LT + "'";
			sql += ", '" + BD_LT + "'";
			sql += ", '" + PAN_DT + "'";
			sql += ", '" + DOCT_CD + "'";
			sql += ", '" + COMP_YN + "'";
			sql += ", '" + INPT_ID + "'";
			sql += ", SYSDATE";
			sql += ", '" + FMSEX_CD + "'";
			sql += ")";

			argStmtExec.executeUpdate(sql);

		} catch (Exception e) {

			throw new FuncException(e.toString(), sql);
		}

		return sql;
	}
%>
