<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%!
	public String func_uRsvn_Acpt_UF_EquipUpdate_002(Statement argStmtExec, HashMap argHtMethod) throws Exception {

		String sql = "";
		String sql2 = "";
		String sql_disp = "";

		try {

			String RSVN_CNT = (String) argHtMethod.get("RSVN_CNT");
			String PROC_CNT = (String) argHtMethod.get("PROC_CNT");
			String CUST_LT = (String) argHtMethod.get("CUST_LT");
			String EXAM_DT = (String) argHtMethod.get("EXAM_DT");
			String EQUI_CD = (String) argHtMethod.get("EQUI_CD");
			String TIME_SQ = (String) argHtMethod.get("TIME_SQ");

			//
			if(RSVN_CNT == null) { RSVN_CNT = ""; }
			if(PROC_CNT == null) { PROC_CNT = ""; }
			if(CUST_LT == null) { CUST_LT = ""; }
			if(EXAM_DT == null) { EXAM_DT = ""; }
			if(EQUI_CD == null) { EQUI_CD = ""; }
			if(TIME_SQ == null) { TIME_SQ = ""; }

			//
			RSVN_CNT = CTr.Replace(RSVN_CNT, "'", "''");
			PROC_CNT = CTr.Replace(PROC_CNT, "'", "''");
			CUST_LT = CTr.Replace(CUST_LT, "'", "''");
			EXAM_DT = CTr.Replace(EXAM_DT, "'", "''");
			EQUI_CD = CTr.Replace(EQUI_CD, "'", "''");
			TIME_SQ = CTr.Replace(TIME_SQ, "'", "''");

			sql = "UPDATE RT_RSVT_EQUIP_LIMIT SET ";
			sql += "  RRL_RSVN_CNT = RRL_RSVN_CNT + '" + RSVN_CNT + "'";
			sql += ", RRL_PROC_CNT = RRL_PROC_CNT - '" + PROC_CNT + "'";
			sql += ", RRL_CUST_LT = RRL_CUST_LT || '" + CUST_LT + "'";
			sql += " WHERE RRL_EXAM_DT = '" + EXAM_DT + "'";
			sql += " AND RRL_EQUI_CD = '" + EQUI_CD + "'";

			if(! TIME_SQ.equals("00")) {
				sql += " AND RRL_TIME_SQ = '" + TIME_SQ + "'";
			}

			argStmtExec.executeUpdate(sql);
		} catch (Exception e) {

			throw new FuncException(e.toString(), sql);
		}

		return sql;
	}
%>
