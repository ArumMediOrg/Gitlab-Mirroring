<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%!
	public String func_SmartCMS_UptToSIGNLIST_002(Statement argStmtExec, HashMap argHtMethod) throws Exception {

		String sql = "";
		String sql2 = "";
		String sql_disp = "";

		try {

			String SGUBN = (String) argHtMethod.get("SGUBN");
			String SEXDT = (String) argHtMethod.get("SEXDT");
			String SEXNO = (String) argHtMethod.get("SEXNO");
			String SDOC = (String) argHtMethod.get("SDOC");

			//
			if(SGUBN == null) { SGUBN = ""; }
			if(SEXDT == null) { SEXDT = ""; }
			if(SEXNO == null) { SEXNO = ""; }
			if(SDOC == null) { SDOC = ""; }

			//
			SGUBN = CTr.Replace(SGUBN, "'", "''");
			SEXDT = CTr.Replace(SEXDT, "'", "''");
			SEXNO = CTr.Replace(SEXNO, "'", "''");
			SDOC = CTr.Replace(SDOC, "'", "''");

			sql = "INSERT INTO SL_SIGNLIST (SL_EXAM_DATE, SL_EXAM_SQ";

			if(SGUBN.equals("0")) {
				sql += ", SL_P1_CD";
			} else if(SGUBN.equals("1")) {
				sql += ", SL_P2_CD";
			} else if(SGUBN.equals("21")) {
				sql += ", SL_C1_CD";
			} else if(SGUBN.equals("22")) {
				sql += ", SL_C2_CD";
			} else if(SGUBN.equals("23")) {
				sql += ", SL_C3_CD";
			} else if(SGUBN.equals("24")) {
				sql += ", SL_C4_CD";
			} else if(SGUBN.equals("25")) {
				sql += ", SL_C5_CD";
			} else if(SGUBN.equals("26")) {
				sql += ", SL_C6_CD";
			} else if(SGUBN.equals("3")) {
				sql += ", SL_DT_CD";
			} else if(SGUBN.equals("4")) {
				sql += ", SL_STP_CD";
			} else if(SGUBN.equals("5")) {
				sql += ", SL_STD_CD";
			} else if(SGUBN.equals("6")) {
				sql += ", SL_SP1_CD";
			} else if(SGUBN.equals("7")) {
				sql += ", SL_SP2_CD";
			}
			
			sql += ") VALUES (";
			sql += "  '" + SEXDT + "'";
			sql += ", '" + SEXNO + "'";
			sql += ", '" + SDOC + "'";
			sql += ")";

			argStmtExec.executeUpdate(sql);

		} catch (Exception e) {

			throw new FuncException(e.toString(), sql);
		}

		return sql;
	}
%>
