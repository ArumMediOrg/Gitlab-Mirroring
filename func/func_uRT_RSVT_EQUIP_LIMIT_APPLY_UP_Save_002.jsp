<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%!
	public String func_uRT_RSVT_EQUIP_LIMIT_APPLY_UP_Save_002(Statement argStmtExec, HashMap argHtMethod) throws Exception {

		String sql = "";
		String sql2 = "";
		String sql_disp = "";

		try {

			String EXAM_DT = (String) argHtMethod.get("EXAM_DT");
			String EQUI_CD = (String) argHtMethod.get("EQUI_CD");

			//
			if(EXAM_DT == null) { EXAM_DT = ""; }
			if(EQUI_CD == null) { EQUI_CD = ""; }

			//
			EXAM_DT = CTr.Replace(EXAM_DT, "'", "''");
			EQUI_CD = CTr.Replace(EQUI_CD, "'", "''");

			sql = "DELETE RT_RSVT_EQUIP_LIMIT";
			sql += " WHERE RRL_EXAM_DT = '" + EXAM_DT + "'";
			sql += " AND RRL_EQUI_CD = '" + EQUI_CD + "'";

			argStmtExec.executeUpdate(sql);

		} catch (Exception e) {

			throw new FuncException(e.toString(), sql);
		}

		return sql;
	}
%>
