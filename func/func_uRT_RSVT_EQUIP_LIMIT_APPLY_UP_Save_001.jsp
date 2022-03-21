<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%!
	public String func_uRT_RSVT_EQUIP_LIMIT_APPLY_UP_Save_001(Statement argStmtExec, HashMap argHtMethod) throws Exception {

		String sql = "";
		String sql2 = "";
		String sql_disp = "";

		try {

			String ITEM_LT = (String) argHtMethod.get("ITEM_LT");
			String TOT_CNT = (String) argHtMethod.get("TOT_CNT");
			String PROC_CNT = (String) argHtMethod.get("PROC_CNT");
			String USE_YN = (String) argHtMethod.get("USE_YN");
			String MODI_ID = (String) argHtMethod.get("MODI_ID");
			String EXAM_DT = (String) argHtMethod.get("EXAM_DT");
			String EQUI_CD = (String) argHtMethod.get("EQUI_CD");
			String TIME_SQ = (String) argHtMethod.get("TIME_SQ");

			//
			if(ITEM_LT == null) { ITEM_LT = ""; }
			if(TOT_CNT == null) { TOT_CNT = ""; }
			if(PROC_CNT == null) { PROC_CNT = ""; }
			if(USE_YN == null) { USE_YN = ""; }
			if(MODI_ID == null) { MODI_ID = ""; }
			if(EXAM_DT == null) { EXAM_DT = ""; }
			if(EQUI_CD == null) { EQUI_CD = ""; }
			if(TIME_SQ == null) { TIME_SQ = ""; }

			//
			ITEM_LT = CTr.Replace(ITEM_LT, "'", "''");
			TOT_CNT = CTr.Replace(TOT_CNT, "'", "''");
			PROC_CNT = CTr.Replace(PROC_CNT, "'", "''");
			USE_YN = CTr.Replace(USE_YN, "'", "''");
			MODI_ID = CTr.Replace(MODI_ID, "'", "''");
			EXAM_DT = CTr.Replace(EXAM_DT, "'", "''");
			EQUI_CD = CTr.Replace(EQUI_CD, "'", "''");
			TIME_SQ = CTr.Replace(TIME_SQ, "'", "''");

			sql = "UPDATE RT_RSVT_EQUIP_LIMIT SET ";
			sql += "  RRL_ITEM_LT = '" + ITEM_LT + "'";
			sql += ", RRL_TOT_CNT = '" + TOT_CNT + "'";
			sql += ", RRL_PROC_CNT = '" + PROC_CNT + "'";
			sql += ", RRL_USE_YN = '" + USE_YN + "'";
			sql += ", RRL_MODI_ID = '" + MODI_ID + "'";
			sql += ", RRL_MODI_DTT = SYSDATE";
			sql += " WHERE RRL_EXAM_DT = '" + EXAM_DT + "'";
			sql += " AND RRL_EQUI_CD = '" + EQUI_CD + "'";
			sql += " AND RRL_TIME_SQ = '" + TIME_SQ + "'";

			argStmtExec.executeUpdate(sql);

		} catch (Exception e) {

			throw new FuncException(e.toString(), sql);
		}

		return sql;
	}
%>
