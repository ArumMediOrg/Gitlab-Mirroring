<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%!
	public String func_uHEALTH_TOTAL_SCREENING_SET_btnSave2Click_002(Statement argStmtExec, HashMap argHtMethod) throws Exception {

		String sql = "";
		String sql2 = "";
		String sql_disp = "";

		try {

			String AUTO_CD = (String) argHtMethod.get("AUTO_CD");
			String APLT_DT = (String) argHtMethod.get("APLT_DT");
			String KTITLE_NM = (String) argHtMethod.get("KTITLE_NM");
			String ETITLE_NM = (String) argHtMethod.get("ETITLE_NM");
			String CTITLE_NM = (String) argHtMethod.get("CTITLE_NM");
			String JTITLE_NM = (String) argHtMethod.get("JTITLE_NM");
			String KSOCK_TX = (String) argHtMethod.get("KSOCK_TX");
			String ESOCK_TX = (String) argHtMethod.get("ESOCK_TX");
			String CSOCK_TX = (String) argHtMethod.get("CSOCK_TX");
			String JSOCK_TX = (String) argHtMethod.get("JSOCK_TX");
			String USE_YN = (String) argHtMethod.get("USE_YN");
			String ORGA_CD = (String) argHtMethod.get("ORGA_CD");
			String RESULT = (String) argHtMethod.get("RESULT");
			String SEX_KD = (String) argHtMethod.get("SEX_KD");

			//
			if(AUTO_CD == null) { AUTO_CD = ""; }
			if(APLT_DT == null) { APLT_DT = ""; }
			if(KTITLE_NM == null) { KTITLE_NM = ""; }
			if(ETITLE_NM == null) { ETITLE_NM = ""; }
			if(CTITLE_NM == null) { CTITLE_NM = ""; }
			if(JTITLE_NM == null) { JTITLE_NM = ""; }
			if(KSOCK_TX == null) { KSOCK_TX = ""; }
			if(ESOCK_TX == null) { ESOCK_TX = ""; }
			if(CSOCK_TX == null) { CSOCK_TX = ""; }
			if(JSOCK_TX == null) { JSOCK_TX = ""; }
			if(USE_YN == null) { USE_YN = ""; }
			if(ORGA_CD == null) { ORGA_CD = ""; }
			if(RESULT == null) { RESULT = ""; }
			if(SEX_KD == null) { SEX_KD = ""; }

			//
			AUTO_CD = CTr.Replace(AUTO_CD, "'", "''");
			APLT_DT = CTr.Replace(APLT_DT, "'", "''");
			KTITLE_NM = CTr.Replace(KTITLE_NM, "'", "''");
			ETITLE_NM = CTr.Replace(ETITLE_NM, "'", "''");
			CTITLE_NM = CTr.Replace(CTITLE_NM, "'", "''");
			JTITLE_NM = CTr.Replace(JTITLE_NM, "'", "''");
			KSOCK_TX = CTr.Replace(KSOCK_TX, "'", "''");
			ESOCK_TX = CTr.Replace(ESOCK_TX, "'", "''");
			CSOCK_TX = CTr.Replace(CSOCK_TX, "'", "''");
			JSOCK_TX = CTr.Replace(JSOCK_TX, "'", "''");
			USE_YN = CTr.Replace(USE_YN, "'", "''");
			ORGA_CD = CTr.Replace(ORGA_CD, "'", "''");
			RESULT = CTr.Replace(RESULT, "'", "''");
			SEX_KD = CTr.Replace(SEX_KD, "'", "''");

			sql = "INSERT INTO HT_AUTO_PAN (HAP_AUTO_CD, HAP_APLT_DT, HAP_KTITLE_NM, HAP_ETITLE_NM, HAP_CTITLE_NM, HAP_JTITLE_NM, HAP_KSOCK_TX, HAP_ESOCK_TX, HAP_CSOCK_TX, HAP_JSOCK_TX, HAP_USE_YN, HAP_ORGA_CD, HAP_RESULT, HAP_SEX_KD) VALUES (";
			sql += "  '" + AUTO_CD + "'";
			sql += ", '" + APLT_DT + "'";
			sql += ", '" + KTITLE_NM + "'";
			sql += ", '" + ETITLE_NM + "'";
			sql += ", '" + CTITLE_NM + "'";
			sql += ", '" + JTITLE_NM + "'";
			sql += ", '" + KSOCK_TX + "'";
			sql += ", '" + ESOCK_TX + "'";
			sql += ", '" + CSOCK_TX + "'";
			sql += ", '" + JSOCK_TX + "'";
			sql += ", '" + USE_YN + "'";
			sql += ", '" + ORGA_CD + "'";
			sql += ", '" + RESULT + "'";
			sql += ", '" + SEX_KD + "'";
			sql += ")";

			argStmtExec.executeUpdate(sql);

		} catch (Exception e) {

			throw new FuncException(e.toString(), sql);
		}

		return sql;
	}
%>
