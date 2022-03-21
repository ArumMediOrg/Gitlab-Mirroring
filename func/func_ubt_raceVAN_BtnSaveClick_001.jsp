<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%!
	public String func_ubt_raceVAN_BtnSaveClick_001(Statement argStmtExec, HashMap argHtMethod) throws Exception {

		String sql = "";
		String sql2 = "";
		String sql_disp = "";

		try {

			String RECE_NO = (String) argHtMethod.get("RECE_NO");
			String CUST_NO = (String) argHtMethod.get("CUST_NO");
			String TRACE_CD = (String) argHtMethod.get("TRACE_CD");
			String TID = (String) argHtMethod.get("TID");
			String WCC = (String) argHtMethod.get("WCC");
			String ALLOT_MM = (String) argHtMethod.get("ALLOT_MM");
			String RECE_PR = (String) argHtMethod.get("RECE_PR");
			String APPR_NO = (String) argHtMethod.get("APPR_NO");
			String APPR_DT = (String) argHtMethod.get("APPR_DT");
			String ISSUE_CD = (String) argHtMethod.get("ISSUE_CD");
			String CARD_NM = (String) argHtMethod.get("CARD_NM");
			String PURCH_CD = (String) argHtMethod.get("PURCH_CD");
			String PURCH_NM = (String) argHtMethod.get("PURCH_NM");
			String USER_ID = (String) argHtMethod.get("USER_ID");
			String DSC_KD = (String) argHtMethod.get("DSC_KD");
			String CARD_NO = (String) argHtMethod.get("CARD_NO");

			//
			if(RECE_NO == null) { RECE_NO = ""; }
			if(CUST_NO == null) { CUST_NO = ""; }
			if(TRACE_CD == null) { TRACE_CD = ""; }
			if(TID == null) { TID = ""; }
			if(WCC == null) { WCC = ""; }
			if(ALLOT_MM == null) { ALLOT_MM = ""; }
			if(RECE_PR == null) { RECE_PR = ""; }
			if(APPR_NO == null) { APPR_NO = ""; }
			if(APPR_DT == null) { APPR_DT = ""; }
			if(ISSUE_CD == null) { ISSUE_CD = ""; }
			if(CARD_NM == null) { CARD_NM = ""; }
			if(PURCH_CD == null) { PURCH_CD = ""; }
			if(PURCH_NM == null) { PURCH_NM = ""; }
			if(USER_ID == null) { USER_ID = ""; }
			if(DSC_KD == null) { DSC_KD = ""; }
			if(CARD_NO == null) { CARD_NO = ""; }

			//
			RECE_NO = CTr.Replace(RECE_NO, "'", "''");
			CUST_NO = CTr.Replace(CUST_NO, "'", "''");
			TRACE_CD = CTr.Replace(TRACE_CD, "'", "''");
			TID = CTr.Replace(TID, "'", "''");
			WCC = CTr.Replace(WCC, "'", "''");
			ALLOT_MM = CTr.Replace(ALLOT_MM, "'", "''");
			RECE_PR = CTr.Replace(RECE_PR, "'", "''");
			APPR_NO = CTr.Replace(APPR_NO, "'", "''");
			APPR_DT = CTr.Replace(APPR_DT, "'", "''");
			ISSUE_CD = CTr.Replace(ISSUE_CD, "'", "''");
			CARD_NM = CTr.Replace(CARD_NM, "'", "''");
			PURCH_CD = CTr.Replace(PURCH_CD, "'", "''");
			PURCH_NM = CTr.Replace(PURCH_NM, "'", "''");
			USER_ID = CTr.Replace(USER_ID, "'", "''");
			DSC_KD = CTr.Replace(DSC_KD, "'", "''");
			CARD_NO = CTr.Replace(CARD_NO, "'", "''");

			sql = "INSERT INTO RT_CARD_RECE ( RCR_RECE_NO ,RCR_CUST_NO ,RCR_TRACE_CD ,RCR_TID ,RCR_WCC ,RCR_ALLOT_MM ,RCR_RECE_PR ,RCR_APPR_NO ,RCR_APPR_DT ,RCR_ISSUE_CD ,RCR_CARD_NM ,RCR_PURCH_CD ,RCR_PURCH_NM ,RCR_INPUT_ID ,RCR_INPUT_DTT ,RCR_DSC_KD ,RCR_CARD_NO ) VALUES (";
			sql += "  '" + RECE_NO + "'";
			sql += ", '" + CUST_NO + "'";
			sql += ", '" + TRACE_CD + "'";
			sql += ", '" + TID + "'";
			sql += ", '" + WCC + "'";
			sql += ", '" + ALLOT_MM + "'";
			sql += ", '" + RECE_PR + "'";
			sql += ", '" + APPR_NO + "'";
			sql += ", '" + APPR_DT + "'";
			sql += ", '" + ISSUE_CD + "'";
			sql += ", '" + CARD_NM + "'";
			sql += ", '" + PURCH_CD + "'";
			sql += ", '" + PURCH_NM + "'";
			sql += ", '" + USER_ID + "'";
			sql += ", SYSDATE";
			sql += ", '" + DSC_KD + "'";
			sql += ", '" + CARD_NO + "'";
			sql += ")";

			argStmtExec.executeUpdate(sql);

		} catch (Exception e) {

			throw new FuncException(e.toString(), sql);
		}

		return sql;
	}
%>
