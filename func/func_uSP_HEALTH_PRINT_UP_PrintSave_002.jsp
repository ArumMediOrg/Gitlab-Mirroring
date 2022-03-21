<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%!
	public String func_uSP_HEALTH_PRINT_UP_PrintSave_002(Statement argStmtExec, HashMap argHtMethod) throws Exception {

		String sql = "";
		String sql2 = "";
		String sql_disp = "";

		try {

			String SSQL_ADD = (String) argHtMethod.get("SSQL_ADD");
			String EXAM_DT = (String) argHtMethod.get("EXAM_DT");
			String EXAM_SQ = (String) argHtMethod.get("EXAM_SQ");
			String MATT_CD = (String) argHtMethod.get("MATT_CD");
			String MATT_SQ = (String) argHtMethod.get("MATT_SQ");
			String ORGA_CD = (String) argHtMethod.get("ORGA_CD");
			String SWING_CD = (String) argHtMethod.get("SWING_CD");

			//
			if(SSQL_ADD == null) { SSQL_ADD = ""; }
			if(EXAM_DT == null) { EXAM_DT = ""; }
			if(EXAM_SQ == null) { EXAM_SQ = ""; }
			if(MATT_CD == null) { MATT_CD = ""; }
			if(MATT_SQ == null) { MATT_SQ = ""; }
			if(ORGA_CD == null) { ORGA_CD = ""; }
			if(SWING_CD == null) { SWING_CD = ""; }

			//
			SSQL_ADD = CTr.Replace(SSQL_ADD, "'", "''");
			EXAM_DT = CTr.Replace(EXAM_DT, "'", "''");
			EXAM_SQ = CTr.Replace(EXAM_SQ, "'", "''");
			MATT_CD = CTr.Replace(MATT_CD, "'", "''");
			MATT_SQ = CTr.Replace(MATT_SQ, "'", "''");
			ORGA_CD = CTr.Replace(ORGA_CD, "'", "''");
			SWING_CD = CTr.Replace(SWING_CD, "'", "''");

			sql = "UPDATE ST_PANJUNG ";
			sql += SSQL_ADD;
			sql += "  WHERE SPG_EXAM_DT = '" + EXAM_DT + "'";
			sql += " AND SPG_EXAM_SQ = '" + EXAM_SQ + "'";
			sql += " AND SPG_MATT_CD = '" + MATT_CD + "'";
			sql += " AND SPG_MATT_SQ = '" + MATT_SQ + "'";
			sql += " AND SPG_ORGA_CD = '" + ORGA_CD + "'";
			sql += " AND SPG_SWING_CD = '" + SWING_CD + "'";

			argStmtExec.executeUpdate(sql);

		} catch (Exception e) {

			throw new FuncException(e.toString(), sql);
		}

		return sql;
	}
%>
