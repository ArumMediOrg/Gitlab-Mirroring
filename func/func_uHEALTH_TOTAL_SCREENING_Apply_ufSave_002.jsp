<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%!
	public String func_uHEALTH_TOTAL_SCREENING_Apply_ufSave_002(Statement argStmtExec, HashMap argHtMethod) throws Exception {

		String sql = "";
		String sql2 = "";
		String sql_disp = "";

		try {

			String SMODE = (String) argHtMethod.get("SMODE");
			String APLT_DT = (String) argHtMethod.get("APLT_DT");
			String ITEM_CD = (String) argHtMethod.get("ITEM_CD");
			String SOCK_SQ = (String) argHtMethod.get("SOCK_SQ");
			String SEX_CD = (String) argHtMethod.get("SEX_CD");
			String PROF_CD = (String) argHtMethod.get("PROF_CD");
			String SOCK_CD = (String) argHtMethod.get("SOCK_CD");
			String SOCK_TX = (String) argHtMethod.get("SOCK_TX");
			String ESOCK_TX = (String) argHtMethod.get("ESOCK_TX");
			String CSOCK_TX = (String) argHtMethod.get("CSOCK_TX");
			String RSOCK_TX = (String) argHtMethod.get("RSOCK_TX");
			String JSOCK_TX = (String) argHtMethod.get("JSOCK_TX");
			String TITLE_NM = (String) argHtMethod.get("TITLE_NM");
			String ETITLE_NM = (String) argHtMethod.get("ETITLE_NM");
			String CTITLE_NM = (String) argHtMethod.get("CTITLE_NM");
			String RTITLE_NM = (String) argHtMethod.get("RTITLE_NM");
			String JTITLE_NM = (String) argHtMethod.get("JTITLE_NM");
			String RSLT_LOW = (String) argHtMethod.get("RSLT_LOW");
			String RSLT_HIGH = (String) argHtMethod.get("RSLT_HIGH");
			String CHAR_VAL = (String) argHtMethod.get("CHAR_VAL");
			String PANJ_CD = (String) argHtMethod.get("PANJ_CD");
			String USE_YN = (String) argHtMethod.get("USE_YN");
			String USER_ID = (String) argHtMethod.get("USER_ID");

			//
			if(SMODE == null) { SMODE = ""; }
			if(APLT_DT == null) { APLT_DT = ""; }
			if(ITEM_CD == null) { ITEM_CD = ""; }
			if(SOCK_SQ == null) { SOCK_SQ = ""; }
			if(SEX_CD == null) { SEX_CD = ""; }
			if(PROF_CD == null) { PROF_CD = ""; }
			if(SOCK_CD == null) { SOCK_CD = ""; }
			if(SOCK_TX == null) { SOCK_TX = ""; }
			if(ESOCK_TX == null) { ESOCK_TX = ""; }
			if(CSOCK_TX == null) { CSOCK_TX = ""; }
			if(RSOCK_TX == null) { RSOCK_TX = ""; }
			if(JSOCK_TX == null) { JSOCK_TX = ""; }
			if(TITLE_NM == null) { TITLE_NM = ""; }
			if(ETITLE_NM == null) { ETITLE_NM = ""; }
			if(CTITLE_NM == null) { CTITLE_NM = ""; }
			if(RTITLE_NM == null) { RTITLE_NM = ""; }
			if(JTITLE_NM == null) { JTITLE_NM = ""; }
			if(RSLT_LOW == null) { RSLT_LOW = ""; }
			if(RSLT_HIGH == null) { RSLT_HIGH = ""; }
			if(CHAR_VAL == null) { CHAR_VAL = ""; }
			if(PANJ_CD == null) { PANJ_CD = ""; }
			if(USE_YN == null) { USE_YN = ""; }
			if(USER_ID == null) { USER_ID = ""; }

			//
			SMODE = CTr.Replace(SMODE, "'", "''");
			APLT_DT = CTr.Replace(APLT_DT, "'", "''");
			ITEM_CD = CTr.Replace(ITEM_CD, "'", "''");
			SOCK_SQ = CTr.Replace(SOCK_SQ, "'", "''");
			SEX_CD = CTr.Replace(SEX_CD, "'", "''");
			PROF_CD = CTr.Replace(PROF_CD, "'", "''");
			SOCK_CD = CTr.Replace(SOCK_CD, "'", "''");
			SOCK_TX = CTr.Replace(SOCK_TX, "'", "''");
			ESOCK_TX = CTr.Replace(ESOCK_TX, "'", "''");
			CSOCK_TX = CTr.Replace(CSOCK_TX, "'", "''");
			RSOCK_TX = CTr.Replace(RSOCK_TX, "'", "''");
			JSOCK_TX = CTr.Replace(JSOCK_TX, "'", "''");
			TITLE_NM = CTr.Replace(TITLE_NM, "'", "''");
			ETITLE_NM = CTr.Replace(ETITLE_NM, "'", "''");
			CTITLE_NM = CTr.Replace(CTITLE_NM, "'", "''");
			RTITLE_NM = CTr.Replace(RTITLE_NM, "'", "''");
			JTITLE_NM = CTr.Replace(JTITLE_NM, "'", "''");
			RSLT_LOW = CTr.Replace(RSLT_LOW, "'", "''");
			RSLT_HIGH = CTr.Replace(RSLT_HIGH, "'", "''");
			CHAR_VAL = CTr.Replace(CHAR_VAL, "'", "''");
			PANJ_CD = CTr.Replace(PANJ_CD, "'", "''");
			USE_YN = CTr.Replace(USE_YN, "'", "''");
			USER_ID = CTr.Replace(USER_ID, "'", "''");

			if(SMODE.equals("I")) {

				sql = "INSERT INTO HEALTH_TOTALSCREENING_ITEM (HTI_APLT_DT, HTI_ITEM_CD, HTI_SOCK_SQ, HTI_SEX_CD, HTI_PROF_CD, HTI_SOCK_CD, HTI_SOCK_TX, HTI_ESOCK_TX, HTI_CSOCK_TX, HTI_RSOCK_TX, HTI_JSOCK_TX, HTI_TITLE_NM, HTI_ETITLE_NM, HTI_CTITLE_NM, HTI_RTITLE_NM, HTI_JTITLE_NM, HTI_RSLT_LOW, HTI_RSLT_HIGH, HTI_CHAR_VAL, HTI_PANJ_CD, HTI_USE_YN, HTI_INPT_ID, HTI_INPT_DTT) VALUES (";
				sql += "  '" + APLT_DT + "'";
				sql += ", '" + ITEM_CD + "'";
				sql += ", '" + SOCK_SQ + "'";
				sql += ", '" + SEX_CD + "'";
				sql += ", '" + PROF_CD + "'";
				sql += ", '" + SOCK_CD + "'";
				sql += ", '" + SOCK_TX + "'";
				sql += ", '" + ESOCK_TX + "'";
				sql += ", '" + CSOCK_TX + "'";
				sql += ", '" + RSOCK_TX + "'";
				sql += ", '" + JSOCK_TX + "'";
				sql += ", '" + TITLE_NM + "'";
				sql += ", '" + ETITLE_NM + "'";
				sql += ", '" + CTITLE_NM + "'";
				sql += ", '" + RTITLE_NM + "'";
				sql += ", '" + JTITLE_NM + "'";
				sql += ", '" + RSLT_LOW + "'";
				sql += ", '" + RSLT_HIGH + "'";
				sql += ", '" + CHAR_VAL + "'";
				sql += ", '" + PANJ_CD + "'";
				sql += ", '" + USE_YN + "'";
				sql += ", '" + USER_ID + "'";
				sql += ", SYSDATE";
				sql += ")";

				argStmtExec.executeUpdate(sql);
			} else {
			
				sql = "UPDATE HEALTH_TOTALSCREENING_ITEM SET ";
				sql += "  HTI_SEX_CD = '" + SEX_CD + "'";
				sql += ", HTI_PROF_CD = '" + PROF_CD + "'";
				sql += ", HTI_SOCK_CD = '" + SOCK_CD + "'";
				sql += ", HTI_SOCK_TX = '" + SOCK_TX + "'";
				sql += ", HTI_ESOCK_TX = '" + ESOCK_TX + "'";
				sql += ", HTI_CSOCK_TX = '" + CSOCK_TX + "'";
				sql += ", HTI_RSOCK_TX = '" + RSOCK_TX + "'";
				sql += ", HTI_JSOCK_TX = '" + JSOCK_TX + "'";
				sql += ", HTI_TITLE_NM = '" + TITLE_NM + "'";
				sql += ", HTI_ETITLE_NM = '" + ETITLE_NM + "'";
				sql += ", HTI_CTITLE_NM = '" + CTITLE_NM + "'";
				sql += ", HTI_RTITLE_NM = '" + RTITLE_NM + "'";
				sql += ", HTI_JTITLE_NM = '" + JTITLE_NM + "'";
				sql += ", HTI_RSLT_LOW = '" + RSLT_LOW + "'";
				sql += ", HTI_RSLT_HIGH = '" + RSLT_HIGH + "'";
				sql += ", HTI_CHAR_VAL = '" + CHAR_VAL + "'";
				sql += ", HTI_PANJ_CD = '" + PANJ_CD + "'";
				sql += ", HTI_USE_YN = '" + USE_YN + "'";
				sql += ", HTI_MODI_ID = '" + USER_ID + "'";
				sql += ", HTI_MODI_DTT = SYSDATE";
				sql += " WHERE HTI_APLT_DT = '" + APLT_DT + "'";
				sql += " AND HTI_ITEM_CD = '" + ITEM_CD + "'";
				sql += " AND HTI_SOCK_SQ = '" + SOCK_SQ + "'";

				argStmtExec.executeUpdate(sql);
			}

		} catch (Exception e) {

			throw new FuncException(e.toString(), sql);
		}

		return sql;
	}
%>
