<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%!
	public String func_ubt_raceVAN_UP_SUNAB_VAN_CANCEL_003(Statement argStmtExec, HashMap argHtMethod) throws Exception {

		String sql = "";
		String sql2 = "";
		String sql_disp = "";

		try {

			String RECE_NO = (String) argHtMethod.get("RECE_NO");
			String APPR_NO = (String) argHtMethod.get("APPR_NO");
			String APPR_DT = (String) argHtMethod.get("APPR_DT");

			//
			if(RECE_NO == null) { RECE_NO = ""; }
			if(APPR_NO == null) { APPR_NO = ""; }
			if(APPR_DT == null) { APPR_DT = ""; }

			//
			RECE_NO = CTr.Replace(RECE_NO, "'", "''");
			APPR_NO = CTr.Replace(APPR_NO, "'", "''");
			APPR_DT = CTr.Replace(APPR_DT, "'", "''");

			sql = "DELETE RT_RECE_MEDICHK";
			sql += " WHERE RRM_RECE_NO = '" + RECE_NO + "'";
			sql += " AND RRM_APPR_NO = '" + APPR_NO + "'";
			sql += " AND RRM_APPR_DT = '" + APPR_DT + "'";

			argStmtExec.executeUpdate(sql);

		} catch (Exception e) {

			throw new FuncException(e.toString(), sql);
		}

		return sql;
	}
%>
