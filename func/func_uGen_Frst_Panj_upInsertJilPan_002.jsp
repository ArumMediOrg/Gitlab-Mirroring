<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%!
	public String func_uGen_Frst_Panj_upInsertJilPan_002(Statement argStmtExec, HashMap argHtMethod) throws Exception {

		String sql = "";
		String sql2 = "";
		String sql_disp = "";

		try {

			String SMODE = (String) argHtMethod.get("SMODE");
			String EXAM_DT = (String) argHtMethod.get("EXAM_DT");
			String EXAM_SQ = (String) argHtMethod.get("EXAM_SQ");
			String JLPN_DSCD = (String) argHtMethod.get("JLPN_DSCD");
			String JLPN_PNCD = (String) argHtMethod.get("JLPN_PNCD");
			String JLPN_SH01 = (String) argHtMethod.get("JLPN_SH01");
			String JLPN_SH02 = (String) argHtMethod.get("JLPN_SH02");
			String JLPN_SH03 = (String) argHtMethod.get("JLPN_SH03");
			String JLPN_SHDS = (String) argHtMethod.get("JLPN_SHDS");
			String JLPN_DOCV = (String) argHtMethod.get("JLPN_DOCV");
			String JLPN_TTPN = (String) argHtMethod.get("JLPN_TTPN");
			String JLPN_WORK = (String) argHtMethod.get("JLPN_WORK");
			String SYSDATE = (String) argHtMethod.get("SYSDATE");
			String USER_ID = (String) argHtMethod.get("USER_ID");
			String ETC_EX = (String) argHtMethod.get("ETC_EX");

			//
			if(SMODE == null) { SMODE = ""; }
			if(EXAM_DT == null) { EXAM_DT = ""; }
			if(EXAM_SQ == null) { EXAM_SQ = ""; }
			if(JLPN_DSCD == null) { JLPN_DSCD = ""; }
			if(JLPN_PNCD == null) { JLPN_PNCD = ""; }
			if(JLPN_SH01 == null) { JLPN_SH01 = ""; }
			if(JLPN_SH02 == null) { JLPN_SH02 = ""; }
			if(JLPN_SH03 == null) { JLPN_SH03 = ""; }
			if(JLPN_SHDS == null) { JLPN_SHDS = ""; }
			if(JLPN_DOCV == null) { JLPN_DOCV = ""; }
			if(JLPN_TTPN == null) { JLPN_TTPN = ""; }
			if(JLPN_WORK == null) { JLPN_WORK = ""; }
			if(SYSDATE == null) { SYSDATE = ""; }
			if(USER_ID == null) { USER_ID = ""; }
			if(ETC_EX == null) { ETC_EX = ""; }

			//
			SMODE = CTr.Replace(SMODE, "'", "''");
			EXAM_DT = CTr.Replace(EXAM_DT, "'", "''");
			EXAM_SQ = CTr.Replace(EXAM_SQ, "'", "''");
			JLPN_DSCD = CTr.Replace(JLPN_DSCD, "'", "''");
			JLPN_PNCD = CTr.Replace(JLPN_PNCD, "'", "''");
			JLPN_SH01 = CTr.Replace(JLPN_SH01, "'", "''");
			JLPN_SH02 = CTr.Replace(JLPN_SH02, "'", "''");
			JLPN_SH03 = CTr.Replace(JLPN_SH03, "'", "''");
			JLPN_SHDS = CTr.Replace(JLPN_SHDS, "'", "''");
			JLPN_DOCV = CTr.Replace(JLPN_DOCV, "'", "''");
			JLPN_TTPN = CTr.Replace(JLPN_TTPN, "'", "''");
			JLPN_WORK = CTr.Replace(JLPN_WORK, "'", "''");
			SYSDATE = CTr.Replace(SYSDATE, "'", "''");
			USER_ID = CTr.Replace(USER_ID, "'", "''");
			ETC_EX = CTr.Replace(ETC_EX, "'", "''");

			if (SMODE.equals("I")) {
				sql = "INSERT INTO PT_LABOR_PANJUNG ( PLP_EXAM_DT, PLP_EXAM_SQ, PLP_JLPN_DSCD, PLP_JLPN_PNCD, PLP_JLPN_SH01 , PLP_JLPN_SH02, PLP_JLPN_SH03, PLP_JLPN_SHDS, PLP_JLPN_DOCV, PLP_JLPN_TTPN , PLP_JLPN_WORK, PLP_JLPN_INDT, PLP_JLPN_INID, PLP_ETC_EX ) VALUES (";
				sql += "  '" + EXAM_DT + "'";
				sql += ", '" + EXAM_SQ + "'";
				sql += ", '" + JLPN_DSCD + "'";
				sql += ", '" + JLPN_PNCD + "'";
				sql += ", '" + JLPN_SH01 + "'";
				sql += ", '" + JLPN_SH02 + "'";
				sql += ", '" + JLPN_SH03 + "'";
				sql += ", '" + JLPN_SHDS + "'";
				sql += ", '" + JLPN_DOCV + "'";
				sql += ", '" + JLPN_TTPN + "'";
				sql += ", '" + JLPN_WORK + "'";
				sql += ", '" + SYSDATE + "'";
				sql += ", '" + USER_ID + "'";
				sql += ", '" + ETC_EX + "'";
				sql += ")";

				argStmtExec.executeUpdate(sql);
			}
			else {
				sql = "UPDATE PT_LABOR_PANJUNG SET ";
				sql += "  PLP_JLPN_PNCD = '" + JLPN_PNCD + "'";
				sql += ", PLP_JLPN_SH01 = '" + JLPN_SH01 + "'";
				sql += ", PLP_JLPN_SH02 = '" + JLPN_SH02 + "'";
				sql += ", PLP_JLPN_SH03 = '" + JLPN_SH03 + "'";
				sql += ", PLP_JLPN_SHDS = '" + JLPN_SHDS + "'";
				sql += ", PLP_JLPN_DOCV = '" + JLPN_DOCV + "'";
				sql += ", PLP_JLPN_TTPN = '" + JLPN_TTPN + "'";
				sql += ", PLP_JLPN_WORK = '" + JLPN_WORK + "'";
				sql += ", PLP_JLPN_LTDT = SYSDATE";
				sql += ", PLP_JLPN_LTID = '" + USER_ID + "'";
				sql += ", PLP_ETC_EX = '" + ETC_EX + "'";
				sql += " WHERE PLP_EXAM_DT = '" + EXAM_DT + "'";
				sql += " AND PLP_EXAM_SQ = '" + EXAM_SQ + "'";
				sql += " AND PLP_JLPN_DSCD = '" + JLPN_DSCD + "'";

				argStmtExec.executeUpdate(sql);
			}
		} catch (Exception e) {

			throw new FuncException(e.toString(), sql);
		}

		return sql;
	}
%>
