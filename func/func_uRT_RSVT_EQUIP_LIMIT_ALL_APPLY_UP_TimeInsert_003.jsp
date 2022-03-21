<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%!
	public String func_uRT_RSVT_EQUIP_LIMIT_ALL_APPLY_UP_TimeInsert_003(Statement argStmtExec, HashMap argHtMethod) throws Exception {

		String sql = "";
		String sql2 = "";
		String sql_disp = "";

		try {

			String EXAM_DT = (String) argHtMethod.get("EXAM_DT");
			String WEEK_CD = (String) argHtMethod.get("WEEK_CD");
			String INPT_ID = (String) argHtMethod.get("INPT_ID");
			String SEXAM_DT = (String) argHtMethod.get("SEXAM_DT");
			String SEQUI_CD = (String) argHtMethod.get("SEQUI_CD");

			//
			if(EXAM_DT == null) { EXAM_DT = ""; }
			if(WEEK_CD == null) { WEEK_CD = ""; }
			if(INPT_ID == null) { INPT_ID = ""; }
			if(SEXAM_DT == null) { SEXAM_DT = ""; }
			if(SEQUI_CD == null) { SEQUI_CD = ""; }

			//
			EXAM_DT = CTr.Replace(EXAM_DT, "'", "''");
			WEEK_CD = CTr.Replace(WEEK_CD, "'", "''");
			INPT_ID = CTr.Replace(INPT_ID, "'", "''");
			SEXAM_DT = CTr.Replace(SEXAM_DT, "'", "''");
			SEQUI_CD = CTr.Replace(SEQUI_CD, "'", "''");

			sql = "INSERT INTO RT_RSVT_EQUIP_LIMIT (RRL_EXAM_DT, RRL_EQUI_CD, RRL_TIME_SQ, RRL_WEEK_CD, RRL_ITEM_LT, RRL_HOLI_CD, RRL_HOLI_NM, RRL_TIME_CD, RRL_TIME_STM, RRL_TIME_ETM, RRL_TOT_CNT, RRL_RSVN_CNT, RRL_PROC_CNT, RRL_USE_YN, RRL_INPT_ID, RRL_INPT_DTT)";
			sql += " SELECT ";
			sql += "  '" + EXAM_DT + "'";
			sql += ", RRL_EQUI_CD";
			sql += ", RRL_TIME_SQ";
			sql += ", '" + WEEK_CD + "'";
			sql += ", RRL_ITEM_LT";
			sql += ", RRL_HOLI_CD";
			sql += ", RRL_HOLI_NM";
			sql += ", RRL_TIME_CD";
			sql += ", RRL_TIME_STM";
			sql += ", RRL_TIME_ETM";
			sql += ", RRL_TOT_CNT";
			sql += ", RRL_RSVN_CNT";
			sql += ", RRL_PROC_CNT";
			sql += ", RRL_USE_YN";
			sql += ", '" + INPT_ID + "'";
			sql += ", SYSDATE";
			sql += " FROM RT_RSVT_EQUIP_LIMIT";
			sql += " WHERE RRL_EXAM_DT = '" + SEXAM_DT  + "'";
			sql += " AND RRL_EQUI_CD = '" + SEQUI_CD + "'";

			argStmtExec.executeUpdate(sql);

		} catch (Exception e) {

			throw new FuncException(e.toString(), sql);
		}

		return sql;
	}
%>
