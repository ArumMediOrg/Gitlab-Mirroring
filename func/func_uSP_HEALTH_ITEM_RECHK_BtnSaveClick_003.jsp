<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%!
	public String func_uSP_HEALTH_ITEM_RECHK_BtnSaveClick_003(Statement argStmtExec, HashMap argHtMethod) throws Exception {

		String sql = "";
		String sql2 = "";
		String sql_disp = "";

		try {

			String SSAVEMODE = (String) argHtMethod.get("SSAVEMODE");
			String EXAM_DT = (String) argHtMethod.get("EXAM_DT");
			String EXAM_SQ = (String) argHtMethod.get("EXAM_SQ");
			String EXAM_CHA = (String) argHtMethod.get("EXAM_CHA");
			String MATT_CD = (String) argHtMethod.get("MATT_CD");
			String ORGA_CD = (String) argHtMethod.get("ORGA_CD");
			String MKJJ_CD = (String) argHtMethod.get("MKJJ_CD");
			String SWING_CD = (String) argHtMethod.get("SWING_CD");
			String CUST_NO = (String) argHtMethod.get("CUST_NO");
			String EITEM_LT = (String) argHtMethod.get("EITEM_LT");
			String SITEM_LT = (String) argHtMethod.get("SITEM_LT");
			String USER_ID = (String) argHtMethod.get("USER_ID");
			String ETITEM_LT = (String) argHtMethod.get("ETITEM_LT");
			String EXAM_DT2 = (String) argHtMethod.get("EXAM_DT2");
			String EXAM_SQ2 = (String) argHtMethod.get("EXAM_SQ2");
			String ADD_LT = (String) argHtMethod.get("ADD_LT");
			String ZERO_LT = (String) argHtMethod.get("ZERO_LT");

			//
			if(SSAVEMODE == null) { SSAVEMODE = ""; }
			if(EXAM_DT == null) { EXAM_DT = ""; }
			if(EXAM_SQ == null) { EXAM_SQ = ""; }
			if(EXAM_CHA == null) { EXAM_CHA = ""; }
			if(MATT_CD == null) { MATT_CD = ""; }
			if(ORGA_CD == null) { ORGA_CD = ""; }
			if(MKJJ_CD == null) { MKJJ_CD = ""; }
			if(SWING_CD == null) { SWING_CD = ""; }
			if(CUST_NO == null) { CUST_NO = ""; }
			if(EITEM_LT == null) { EITEM_LT = ""; }
			if(SITEM_LT == null) { SITEM_LT = ""; }
			if(USER_ID == null) { USER_ID = ""; }
			if(ETITEM_LT == null) { ETITEM_LT = ""; }
			if(EXAM_DT2 == null) { EXAM_DT2 = ""; }
			if(EXAM_SQ2 == null) { EXAM_SQ2 = ""; }
			if(ADD_LT == null) { ADD_LT = ""; }
			if(ZERO_LT == null) { ZERO_LT = ""; }

			//
			SSAVEMODE = CTr.Replace(SSAVEMODE, "'", "''");
			EXAM_DT = CTr.Replace(EXAM_DT, "'", "''");
			EXAM_SQ = CTr.Replace(EXAM_SQ, "'", "''");
			EXAM_CHA = CTr.Replace(EXAM_CHA, "'", "''");
			MATT_CD = CTr.Replace(MATT_CD, "'", "''");
			ORGA_CD = CTr.Replace(ORGA_CD, "'", "''");
			MKJJ_CD = CTr.Replace(MKJJ_CD, "'", "''");
			SWING_CD = CTr.Replace(SWING_CD, "'", "''");
			CUST_NO = CTr.Replace(CUST_NO, "'", "''");
			EITEM_LT = CTr.Replace(EITEM_LT, "'", "''");
			SITEM_LT = CTr.Replace(SITEM_LT, "'", "''");
			USER_ID = CTr.Replace(USER_ID, "'", "''");
			ETITEM_LT = CTr.Replace(ETITEM_LT, "'", "''");
			EXAM_DT2 = CTr.Replace(EXAM_DT2, "'", "''");
			EXAM_SQ2 = CTr.Replace(EXAM_SQ2, "'", "''");
			ADD_LT = CTr.Replace(ADD_LT, "'", "''");
			ZERO_LT = CTr.Replace(ZERO_LT, "'", "''");

			if(SSAVEMODE.equals("I")) {
				sql = "INSERT INTO ST_ITEM_RECHECK (SIR_EXAM_DT,SIR_EXAM_SQ,SIR_EXAM_CHA,SIR_MATT_CD ,SIR_ORGA_CD,SIR_MKJJ_CD,SIR_SWING_CD,SIR_CUST_NO,SIR_EITEM_LT ,SIR_SITEM_LT,SIR_INPT_ID,SIR_INPT_DTT, SIR_ETITEM_LT, SIR_EXAM_DT2, SIR_EXAM_SQ2, SIR_ADD_LT,SIR_ZERO_LT) VALUES (";
				sql += "  '" + EXAM_DT + "'";
				sql += ", '" + EXAM_SQ + "'";
				sql += ", '" + EXAM_CHA + "'";
				sql += ", '" + MATT_CD + "'";
				sql += ", '" + ORGA_CD + "'";
				sql += ", '" + MKJJ_CD + "'";
				sql += ", '" + SWING_CD + "'";
				sql += ", '" + CUST_NO + "'";
				sql += ", '" + EITEM_LT + "'";
				sql += ", '" + SITEM_LT + "'";
				sql += ", '" + USER_ID + "'";
				sql += ", SYSDATE";
				sql += ", '" + ETITEM_LT + "'";
				sql += ", '" + EXAM_DT2 + "'";
				sql += ", '" + EXAM_SQ2 + "'";
				sql += ", '" + ADD_LT + "'";
				sql += ", '" + ZERO_LT + "'";
				sql += ")";

				argStmtExec.executeUpdate(sql);
			}
			else {
				sql = "UPDATE ST_ITEM_RECHECK SET ";
				sql += "  SIR_CUST_NO = '" + CUST_NO + "'";
				sql += ", SIR_EITEM_LT = '" + EITEM_LT + "'";
				sql += ", SIR_SITEM_LT = '" + SITEM_LT + "'";
				sql += ", SIR_MODI_ID = '" + USER_ID + "'";
				sql += ", SIR_MODI_DTT = SYSDATE";
				sql += ", SIR_ETITEM_LT = '" + ETITEM_LT + "'";
				sql += ", SIR_EXAM_DT2 = '" + EXAM_DT2 + "'";
				sql += ", SIR_EXAM_SQ2 = '" + EXAM_SQ2 + "'";
				sql += ", SIR_ADD_LT = '" + ADD_LT + "'";
				sql += ", SIR_ZERO_LT = '" + ZERO_LT + "'";
				sql += " WHERE SIR_EXAM_DT = '" + EXAM_DT + "'";
				sql += " AND SIR_EXAM_SQ = '" + EXAM_SQ + "'";
				sql += " AND SIR_EXAM_CHA = '" + EXAM_CHA + "'";
				sql += " AND SIR_MATT_CD = '" + MATT_CD + "'";
				sql += " AND SIR_ORGA_CD = '" + ORGA_CD + "'";
				sql += " AND SIR_MKJJ_CD = '" + MKJJ_CD + "'";
				sql += " AND SIR_SWING_CD = '" + SWING_CD + "'";

				argStmtExec.executeUpdate(sql);
			}
		} catch (Exception e) {

			throw new FuncException(e.toString(), sql);
		}

		return sql;
	}
%>
