<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%!
	public String func_uStdt_Pnjn_btnView_SaveClick_002(Statement argStmtExec, HashMap argHtMethod) throws Exception {

		String sql = "";
		String sql2 = "";
		String sql_disp = "";

		try {

			String SAVE_KD = (String) argHtMethod.get("SAVE_KD");
			String MARK_CD = (String) argHtMethod.get("MARK_CD");
			String PNJN_KD = (String) argHtMethod.get("PNJN_KD");
			String ITEM_CD = (String) argHtMethod.get("ITEM_CD");
			String CHAR_REF1 = (String) argHtMethod.get("CHAR_REF1");
			String CHAR_REF = (String) argHtMethod.get("CHAR_REF");
			String CHAR_REF3 = (String) argHtMethod.get("CHAR_REF3");
			String CHAR_REF4 = (String) argHtMethod.get("CHAR_REF4");
			String CHAR_REF5 = (String) argHtMethod.get("CHAR_REF5");
			String CHAR_REF6 = (String) argHtMethod.get("CHAR_REF6");
			String CHAR_REF7 = (String) argHtMethod.get("CHAR_REF7");
			String CHAR_REF8 = (String) argHtMethod.get("CHAR_REF8");
			String CHAR_REF9 = (String) argHtMethod.get("CHAR_REF9");
			String CHAR_REF10 = (String) argHtMethod.get("CHAR_REF10");
			String APLY_KD = (String) argHtMethod.get("APLY_KD");
			String RSLT_KD = (String) argHtMethod.get("RSLT_KD");
			String VIEW_TXT = (String) argHtMethod.get("VIEW_TXT");
			String ACT_TXT = (String) argHtMethod.get("ACT_TXT");
			String USER_ID = (String) argHtMethod.get("USER_ID");
			String CHAR_REF2 = (String) argHtMethod.get("CHAR_REF2");
			String USE_YN = (String) argHtMethod.get("USE_YN");
			String MARK_SQ = (String) argHtMethod.get("MARK_SQ");

			//
			if(SAVE_KD == null) { SAVE_KD = ""; }
			if(MARK_CD == null) { MARK_CD = ""; }
			if(PNJN_KD == null) { PNJN_KD = ""; }
			if(ITEM_CD == null) { ITEM_CD = ""; }
			if(CHAR_REF1 == null) { CHAR_REF1 = ""; }
			if(CHAR_REF == null) { CHAR_REF = ""; }
			if(CHAR_REF3 == null) { CHAR_REF3 = ""; }
			if(CHAR_REF4 == null) { CHAR_REF4 = ""; }
			if(CHAR_REF5 == null) { CHAR_REF5 = ""; }
			if(CHAR_REF6 == null) { CHAR_REF6 = ""; }
			if(CHAR_REF7 == null) { CHAR_REF7 = ""; }
			if(CHAR_REF8 == null) { CHAR_REF8 = ""; }
			if(CHAR_REF9 == null) { CHAR_REF9 = ""; }
			if(CHAR_REF10 == null) { CHAR_REF10 = ""; }
			if(APLY_KD == null) { APLY_KD = ""; }
			if(RSLT_KD == null) { RSLT_KD = ""; }
			if(VIEW_TXT == null) { VIEW_TXT = ""; }
			if(ACT_TXT == null) { ACT_TXT = ""; }
			if(USER_ID == null) { USER_ID = ""; }
			if(CHAR_REF2 == null) { CHAR_REF2 = ""; }
			if(USE_YN == null) { USE_YN = ""; }
			if(MARK_SQ == null) { MARK_SQ = ""; }

			//
			SAVE_KD = CTr.Replace(SAVE_KD, "'", "''");
			MARK_CD = CTr.Replace(MARK_CD, "'", "''");
			PNJN_KD = CTr.Replace(PNJN_KD, "'", "''");
			ITEM_CD = CTr.Replace(ITEM_CD, "'", "''");
			CHAR_REF1 = CTr.Replace(CHAR_REF1, "'", "''");
			CHAR_REF = CTr.Replace(CHAR_REF, "'", "''");
			CHAR_REF3 = CTr.Replace(CHAR_REF3, "'", "''");
			CHAR_REF4 = CTr.Replace(CHAR_REF4, "'", "''");
			CHAR_REF5 = CTr.Replace(CHAR_REF5, "'", "''");
			CHAR_REF6 = CTr.Replace(CHAR_REF6, "'", "''");
			CHAR_REF7 = CTr.Replace(CHAR_REF7, "'", "''");
			CHAR_REF8 = CTr.Replace(CHAR_REF8, "'", "''");
			CHAR_REF9 = CTr.Replace(CHAR_REF9, "'", "''");
			CHAR_REF10 = CTr.Replace(CHAR_REF10, "'", "''");
			APLY_KD = CTr.Replace(APLY_KD, "'", "''");
			RSLT_KD = CTr.Replace(RSLT_KD, "'", "''");
			VIEW_TXT = CTr.Replace(VIEW_TXT, "'", "''");
			ACT_TXT = CTr.Replace(ACT_TXT, "'", "''");
			USER_ID = CTr.Replace(USER_ID, "'", "''");
			CHAR_REF2 = CTr.Replace(CHAR_REF2, "'", "''");
			USE_YN = CTr.Replace(USE_YN, "'", "''");
			MARK_SQ = CTr.Replace(MARK_SQ, "'", "''");

			if(SAVE_KD.equals("I")) {

				sql = "INSERT INTO ET_STDT_VIEW (ESV_MARK_CD, ESV_MARK_SQ, ESV_PNJN_KD, ESV_ITEM_CD, ESV_CHAR_REF1, ESV_CHAR_REF2, ESV_CHAR_REF3, ESV_CHAR_REF4, ESV_CHAR_REF5, ESV_CHAR_REF6, ESV_CHAR_REF7, ESV_CHAR_REF8, ESV_CHAR_REF9, ESV_CHAR_REF10, ESV_APLY_KD, ESV_RSLT_KD, ESV_VIEW_TXT, ESV_ACT_TXT, ESV_USE_YN, ESV_INPT_ID, ESV_INPT_DTT, ESV_MODI_ID, ESV_MODI_DTT)";
				sql += " SELECT ";
				sql += "  '" + MARK_CD + "'";
				sql += ", F_LPAD(NVL(MAX(ESV_MARK_SQ), 0) + 1, 3, '0')";
				sql += ", '" + PNJN_KD + "'";
				sql += ", '" + ITEM_CD + "'";
				sql += ", '" + CHAR_REF1 + "'";
				sql += ", '" + CHAR_REF + "'";
				sql += ", '" + CHAR_REF3 + "'";
				sql += ", '" + CHAR_REF4 + "'";
				sql += ", '" + CHAR_REF5 + "'";
				sql += ", '" + CHAR_REF6 + "'";
				sql += ", '" + CHAR_REF7 + "'";
				sql += ", '" + CHAR_REF8 + "'";
				sql += ", '" + CHAR_REF9 + "'";
				sql += ", '" + CHAR_REF10 + "'";
				sql += ", '" + APLY_KD + "'";
				sql += ", '" + RSLT_KD + "'";
				sql += ", '" + VIEW_TXT + "'";
				sql += ", '" + ACT_TXT + "'";
				sql += ", 'Y'";
				sql += ", '" + USER_ID + "'";
				sql += ", SYSDATE";
				sql += ", '" + USER_ID + "'";
				sql += ", SYSDATE";
				sql += " FROM ET_STDT_VIEW";
				sql += " WHERE ESV_MARK_CD = '" + MARK_CD + "'";

				argStmtExec.executeUpdate(sql);
			} else {
			
				sql = "UPDATE ET_STDT_VIEW SET ";
				sql += "  ESV_PNJN_KD = '" + PNJN_KD + "'";
				sql += ", ESV_ITEM_CD = '" + ITEM_CD + "'";
				sql += ", ESV_CHAR_REF1 = '" + CHAR_REF1 + "'";
				sql += ", ESV_CHAR_REF2 = '" + CHAR_REF2 + "'";
				sql += ", ESV_CHAR_REF3 = '" + CHAR_REF3 + "'";
				sql += ", ESV_CHAR_REF4 = '" + CHAR_REF4 + "'";
				sql += ", ESV_CHAR_REF5 = '" + CHAR_REF5 + "'";
				sql += ", ESV_CHAR_REF6 = '" + CHAR_REF6 + "'";
				sql += ", ESV_CHAR_REF7 = '" + CHAR_REF7 + "'";
				sql += ", ESV_CHAR_REF8 = '" + CHAR_REF8 + "'";
				sql += ", ESV_CHAR_REF9 = '" + CHAR_REF9 + "'";
				sql += ", ESV_CHAR_REF10 = '" + CHAR_REF10 + "'";
				sql += ", ESV_APLY_KD = '" + APLY_KD + "'";
				sql += ", ESV_RSLT_KD = '" + RSLT_KD + "'";
				sql += ", ESV_VIEW_TXT = '" + VIEW_TXT + "'";
				sql += ", ESV_ACT_TXT = '" + ACT_TXT + "'";
				sql += ", ESV_USE_YN = '" + USE_YN + "'";
				sql += ", ESV_MODI_ID = '" + USER_ID + "'";
				sql += ", ESV_MODI_DTT = SYSDATE";
				sql += " WHERE ESV_MARK_CD = '" + MARK_CD + "'";
				sql += " AND ESV_MARK_SQ = '" + MARK_SQ + "'";

				argStmtExec.executeUpdate(sql);
			}
		} catch (Exception e) {

			throw new FuncException(e.toString(), sql);
		}

		return sql;
	}
%>
