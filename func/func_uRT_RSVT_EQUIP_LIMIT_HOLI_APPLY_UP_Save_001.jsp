<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%!
	public String func_uRT_RSVT_EQUIP_LIMIT_HOLI_APPLY_UP_Save_001(Statement argStmtExec, HashMap argHtMethod) throws Exception {

		String sql = "";
		String sql2 = "";
		String sql_disp = "";

		try {

			String WEEK_CD = (String) argHtMethod.get("WEEK_CD");
			String HOLI_CD = (String) argHtMethod.get("HOLI_CD");
			String HOLI_NM = (String) argHtMethod.get("HOLI_NM");
			String MODI_ID = (String) argHtMethod.get("MODI_ID");
			String EXAM_DT = (String) argHtMethod.get("EXAM_DT");
			String EQUI_CD = (String) argHtMethod.get("EQUI_CD");
			String DATA_KD = (String) argHtMethod.get("DATA_KD");
			String TIME_SQ = (String) argHtMethod.get("TIME_SQ");

			//
			if(WEEK_CD == null) { WEEK_CD = ""; }
			if(HOLI_CD == null) { HOLI_CD = ""; }
			if(HOLI_NM == null) { HOLI_NM = ""; }
			if(MODI_ID == null) { MODI_ID = ""; }
			if(EXAM_DT == null) { EXAM_DT = ""; }
			if(EQUI_CD == null) { EQUI_CD = ""; }
			if(DATA_KD == null) { DATA_KD = ""; }
			if(TIME_SQ == null) { TIME_SQ = ""; }

			//
			WEEK_CD = CTr.Replace(WEEK_CD, "'", "''");
			HOLI_CD = CTr.Replace(HOLI_CD, "'", "''");
			HOLI_NM = CTr.Replace(HOLI_NM, "'", "''");
			MODI_ID = CTr.Replace(MODI_ID, "'", "''");
			EXAM_DT = CTr.Replace(EXAM_DT, "'", "''");
			EQUI_CD = CTr.Replace(EQUI_CD, "'", "''");
			DATA_KD = CTr.Replace(DATA_KD, "'", "''");
			TIME_SQ = CTr.Replace(TIME_SQ, "'", "''");

			if(DATA_KD.equals("D")){
				sql = " DELETE RT_RSVT_EQUIP_LIMIT ";
				sql += " WHERE RRL_EXAM_DT  = '" + EXAM_DT + "' ";
				sql += " 	AND RRL_EQUI_CD  = '" + EQUI_CD + "' ";
				sql += " 	AND RRL_TIME_SQ  = '" + TIME_SQ + "' ";

				argStmtExec.executeUpdate(sql);
			} else {
				sql = "UPDATE RT_RSVT_EQUIP_LIMIT SET ";
				sql += "  RRL_WEEK_CD = '" + WEEK_CD + "'";
				sql += ", RRL_HOLI_CD = '" + HOLI_CD + "'";
				sql += ", RRL_HOLI_NM = '" + HOLI_NM + "'";
				sql += ", RRL_MODI_ID = '" + MODI_ID + "'";
				sql += ", RRL_MODI_DTT = SYSDATE";
				sql += " WHERE RRL_EXAM_DT = '" + EXAM_DT + "'";
				sql += " AND RRL_EQUI_CD = '" + EQUI_CD + "'";
				sql += " AND RRL_TIME_SQ = '" + TIME_SQ + "'";

				argStmtExec.executeUpdate(sql);
			}

		} catch (Exception e) {

			throw new FuncException(e.toString(), sql);
		}

		return sql;
	}
%>
