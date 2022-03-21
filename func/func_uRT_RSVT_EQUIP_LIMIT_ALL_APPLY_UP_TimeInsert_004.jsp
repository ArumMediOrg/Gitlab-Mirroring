<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%!
	public String func_uRT_RSVT_EQUIP_LIMIT_ALL_APPLY_UP_TimeInsert_004(Statement argStmtExec, HashMap argHtMethod) throws Exception {

		String sql = "";
		String sql2 = "";
		String sql_disp = "";

		try {

			String EQUI_CD = (String) argHtMethod.get("EQUI_CD");
			String INPT_ID = (String) argHtMethod.get("INPT_ID");
			String EXAM_DT = (String) argHtMethod.get("EXAM_DT");

			//
			if(EQUI_CD == null) { EQUI_CD = ""; }
			if(INPT_ID == null) { INPT_ID = ""; }
			if(EXAM_DT == null) { EXAM_DT = ""; }

			//
			EQUI_CD = CTr.Replace(EQUI_CD, "'", "''");
			INPT_ID = CTr.Replace(INPT_ID, "'", "''");
			EXAM_DT = CTr.Replace(EXAM_DT, "'", "''");

			sql = "INSERT INTO RT_RSVT_EQUIP_LIMIT (RRL_EXAM_DT, RRL_EQUI_CD, RRL_TIME_SQ, RRL_WEEK_CD, RRL_HOLI_CD, RRL_HOLI_NM, RRL_USE_YN, RRL_INPT_ID, RRL_INPT_DTT)";
			sql += " SELECT ";
			sql += "  RRL_EXAM_DT";
			sql += ", '" + EQUI_CD + "'";
			sql += ", RRL_TIME_SQ";
			sql += ", RRL_WEEK_CD";
			sql += ", RRL_HOLI_CD";
			sql += ", RRL_HOLI_NM";
			sql += ", RRL_USE_YN";
			sql += ", '" + INPT_ID + "'";
			sql += ", SYSDATE";
			sql += " FROM RT_RSVT_EQUIP_LIMIT";
			sql += " WHERE RRL_EXAM_DT = '" + EXAM_DT  + "'";
			sql += " AND RRL_EQUI_CD = '00'";
			sql += " AND RRL_USE_YN = 'Y'";

			argStmtExec.executeUpdate(sql);

		} catch (Exception e) {

			throw new FuncException(e.toString(), sql);
		}

		return sql;
	}
%>
