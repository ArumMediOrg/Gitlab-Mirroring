<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%!
	public String func_uRT_RSVT_EQUIP_LIMIT_ALL_APPLY_UP_TimeInsert_002(Statement argStmtExec, HashMap argHtMethod) throws Exception {

		String sql = "";
		String sql2 = "";
		String sql_disp = "";

		try {

			String EXAM_DT = (String) argHtMethod.get("EXAM_DT");
			String EQUI_CD = (String) argHtMethod.get("EQUI_CD");
			String TIME_SQ = (String) argHtMethod.get("TIME_SQ");
			String WEEK_CD = (String) argHtMethod.get("WEEK_CD");
			String ITEM_LT = (String) argHtMethod.get("ITEM_LT");
			String HOLI_CD = (String) argHtMethod.get("HOLI_CD");
			String HOLI_NM = (String) argHtMethod.get("HOLI_NM");
			String TIME_CD = (String) argHtMethod.get("TIME_CD");
			String TIME_STM = (String) argHtMethod.get("TIME_STM");
			String TIME_ETM = (String) argHtMethod.get("TIME_ETM");
			String TOT_CNT = (String) argHtMethod.get("TOT_CNT");
			String RSVN_CNT = (String) argHtMethod.get("RSVN_CNT");
			String PROC_CNT = (String) argHtMethod.get("PROC_CNT");
			String USE_YN = (String) argHtMethod.get("USE_YN");
			String INPT_ID = (String) argHtMethod.get("INPT_ID");

			//
			if(EXAM_DT == null) { EXAM_DT = ""; }
			if(EQUI_CD == null) { EQUI_CD = ""; }
			if(TIME_SQ == null) { TIME_SQ = ""; }
			if(WEEK_CD == null) { WEEK_CD = ""; }
			if(ITEM_LT == null) { ITEM_LT = ""; }
			if(HOLI_CD == null) { HOLI_CD = ""; }
			if(HOLI_NM == null) { HOLI_NM = ""; }
			if(TIME_CD == null) { TIME_CD = ""; }
			if(TIME_STM == null) { TIME_STM = ""; }
			if(TIME_ETM == null) { TIME_ETM = ""; }
			if(TOT_CNT == null) { TOT_CNT = ""; }
			if(RSVN_CNT == null) { RSVN_CNT = ""; }
			if(PROC_CNT == null) { PROC_CNT = ""; }
			if(USE_YN == null) { USE_YN = ""; }
			if(INPT_ID == null) { INPT_ID = ""; }

			//
			EXAM_DT = CTr.Replace(EXAM_DT, "'", "''");
			EQUI_CD = CTr.Replace(EQUI_CD, "'", "''");
			TIME_SQ = CTr.Replace(TIME_SQ, "'", "''");
			WEEK_CD = CTr.Replace(WEEK_CD, "'", "''");
			ITEM_LT = CTr.Replace(ITEM_LT, "'", "''");
			HOLI_CD = CTr.Replace(HOLI_CD, "'", "''");
			HOLI_NM = CTr.Replace(HOLI_NM, "'", "''");
			TIME_CD = CTr.Replace(TIME_CD, "'", "''");
			TIME_STM = CTr.Replace(TIME_STM, "'", "''");
			TIME_ETM = CTr.Replace(TIME_ETM, "'", "''");
			TOT_CNT = CTr.Replace(TOT_CNT, "'", "''");
			RSVN_CNT = CTr.Replace(RSVN_CNT, "'", "''");
			PROC_CNT = CTr.Replace(PROC_CNT, "'", "''");
			USE_YN = CTr.Replace(USE_YN, "'", "''");
			INPT_ID = CTr.Replace(INPT_ID, "'", "''");

			sql = "INSERT INTO RT_RSVT_EQUIP_LIMIT (RRL_EXAM_DT, RRL_EQUI_CD, RRL_TIME_SQ, RRL_WEEK_CD, RRL_ITEM_LT, RRL_HOLI_CD, RRL_HOLI_NM, RRL_TIME_CD, RRL_TIME_STM, RRL_TIME_ETM, RRL_TOT_CNT, RRL_RSVN_CNT, RRL_PROC_CNT, RRL_USE_YN, RRL_INPT_ID, RRL_INPT_DTT) VALUES (";
			sql += "  '" + EXAM_DT + "'";
			sql += ", '" + EQUI_CD + "'";
			sql += ", '" + TIME_SQ + "'";
			sql += ", '" + WEEK_CD + "'";
			sql += ", '" + ITEM_LT + "'";
			sql += ", '" + HOLI_CD + "'";
			sql += ", '" + HOLI_NM + "'";
			sql += ", '" + TIME_CD + "'";
			sql += ", '" + TIME_STM + "'";
			sql += ", '" + TIME_ETM + "'";
			sql += ", '" + TOT_CNT + "'";
			sql += ", '" + RSVN_CNT + "'";
			sql += ", '" + PROC_CNT + "'";
			sql += ", '" + USE_YN + "'";
			sql += ", '" + INPT_ID + "'";
			sql += ", SYSDATE";
			sql += ")";

			argStmtExec.executeUpdate(sql);

		} catch (Exception e) {

			throw new FuncException(e.toString(), sql);
		}

		return sql;
	}
%>
