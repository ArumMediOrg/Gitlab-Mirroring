<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%!
	public String func_SmartCMS_UptToSIGNLIST_003(Statement argStmtExec, HashMap argHtMethod) throws Exception {

		String sql = "";
		String sql2 = "";
		String sql_disp = "";

		try {

			String SGUBN = (String) argHtMethod.get("SGUBN");
			String SDOC = (String) argHtMethod.get("SDOC");
			String SEXDT = (String) argHtMethod.get("SEXDT");
			String SEXNO = (String) argHtMethod.get("SEXNO");

			//
			if(SGUBN == null) { SGUBN = ""; }
			if(SDOC == null) { SDOC = ""; }
			if(SEXDT == null) { SEXDT = ""; }
			if(SEXNO == null) { SEXNO = ""; }

			//
			SGUBN = CTr.Replace(SGUBN, "'", "''");
			SDOC = CTr.Replace(SDOC, "'", "''");
			SEXDT = CTr.Replace(SEXDT, "'", "''");
			SEXNO = CTr.Replace(SEXNO, "'", "''");

			sql = "UPDATE SL_SIGNLIST SET ";

			if(SGUBN.equals("0")) {
				sql += "  SL_P1_CD = '" + SDOC + "'";
			} else if(SGUBN.equals("1")) {
				sql += "  SL_P2_CD = '" + SDOC + "'";
			} else if(SGUBN.equals("21")) {
				sql += "  SL_C1_CD = '" + SDOC + "'";
			} else if(SGUBN.equals("22")) {
				sql += "  SL_C2_CD = '" + SDOC + "'";
			} else if(SGUBN.equals("23")) {
				sql += "  SL_C3_CD = '" + SDOC + "'";
			} else if(SGUBN.equals("24")) {
				sql += "  SL_C4_CD = '" + SDOC + "'";
			} else if(SGUBN.equals("25")) {
				sql += "  SL_C5_CD = '" + SDOC + "'";
			} else if(SGUBN.equals("26")) {
				sql += "  SL_C6_CD = '" + SDOC + "'";
			} else if(SGUBN.equals("3")) {
				sql += "  SL_DT_CD = '" + SDOC + "'";
			} else if(SGUBN.equals("4")) {
				sql += "  SL_STP_CD = '" + SDOC + "'";
			} else if(SGUBN.equals("5")) {
				sql += "  SL_STD_CD = '" + SDOC + "'";
			} else if(SGUBN.equals("6")) {
				sql += "  SL_SP1_CD = '" + SDOC + "'";
			} else if(SGUBN.equals("7")) {
				sql += "  SL_SP2_CD = '" + SDOC + "'";
			}

			sql += " WHERE SL_EXAM_DATE = '" + SEXDT + "'";
			sql += " AND SL_EXAM_SQ = '" + SEXNO + "'";

			argStmtExec.executeUpdate(sql);
		} catch (Exception e) {

			throw new FuncException(e.toString(), sql);
		}

		return sql;
	}
%>
