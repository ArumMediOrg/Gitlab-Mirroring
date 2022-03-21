<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%!
	public String func_uSP_HEALTH_HPRI_BtnSaveClick_001(Statement argStmtExec, HashMap argHtMethod) throws Exception {

		String sql = "";
		String sql2 = "";
		String sql_disp = "";

		try {

			String SSAVEMODE = (String) argHtMethod.get("SSAVEMODE");
			String EXAM_DT = (String) argHtMethod.get("EXAM_DT");
			String EXAM_SQ = (String) argHtMethod.get("EXAM_SQ");
			String EXAM_CHA = (String) argHtMethod.get("EXAM_CHA");
			String ITEM_CD = (String) argHtMethod.get("ITEM_CD");
			String SBCD_CD = (String) argHtMethod.get("SBCD_CD");
			String HIPR_CD = (String) argHtMethod.get("HIPR_CD");
			String HIPR_LT = (String) argHtMethod.get("HIPR_LT");
			String USER_ID = (String) argHtMethod.get("USER_ID");

			//
			if(SSAVEMODE == null) { SSAVEMODE = ""; }
			if(EXAM_DT == null) { EXAM_DT = ""; }
			if(EXAM_SQ == null) { EXAM_SQ = ""; }
			if(EXAM_CHA == null) { EXAM_CHA = ""; }
			if(ITEM_CD == null) { ITEM_CD = ""; }
			if(SBCD_CD == null) { SBCD_CD = ""; }
			if(HIPR_CD == null) { HIPR_CD = ""; }
			if(HIPR_LT == null) { HIPR_LT = ""; }
			if(USER_ID == null) { USER_ID = ""; }

			//
			SSAVEMODE = CTr.Replace(SSAVEMODE, "'", "''");
			EXAM_DT = CTr.Replace(EXAM_DT, "'", "''");
			EXAM_SQ = CTr.Replace(EXAM_SQ, "'", "''");
			EXAM_CHA = CTr.Replace(EXAM_CHA, "'", "''");
			ITEM_CD = CTr.Replace(ITEM_CD, "'", "''");
			SBCD_CD = CTr.Replace(SBCD_CD, "'", "''");
			HIPR_CD = CTr.Replace(HIPR_CD, "'", "''");
			HIPR_LT = CTr.Replace(HIPR_LT, "'", "''");
			USER_ID = CTr.Replace(USER_ID, "'", "''");

			if(SSAVEMODE.equals("I")) {
				sql = "INSERT INTO ST_ITEM_HIGHPRICE (SIH_EXAM_DT,SIH_EXAM_SQ,SIH_EXAM_CHA, SIH_ITEM_CD,SIH_SBCD_CD,SIH_HIPR_CD, SIH_HIPR_LT,SIH_INPT_ID,SIH_INPT_DTT) VALUES (";
				sql += "  '" + EXAM_DT + "'";
				sql += ", '" + EXAM_SQ + "'";
				sql += ", '" + EXAM_CHA + "'";
				sql += ", '" + ITEM_CD + "'";
				sql += ", '" + SBCD_CD + "'";
				sql += ", '" + HIPR_CD + "'";
				sql += ", '" + HIPR_LT + "'";
				sql += ", '" + USER_ID + "'";
				sql += ", SYSDATE";
				sql += ")";

				argStmtExec.executeUpdate(sql);
			}
			else {
				sql = "UPDATE ST_ITEM_HIGHPRICE SET ";
				sql += "  SIH_SBCD_CD = '" + SBCD_CD + "'";
				sql += ", SIH_HIPR_CD = '" + HIPR_CD + "'";
				sql += ", SIH_HIPR_LT = '" + HIPR_LT + "'";
				sql += ", SIH_MODI_ID = '" + USER_ID + "'";
				sql += ", SIH_MODI_DTT = SYSDATE";
				sql += " WHERE SIH_EXAM_DT = '" + EXAM_DT + "'";
				sql += " AND SIH_EXAM_SQ = '" + EXAM_SQ + "'";
				sql += " AND SIH_EXAM_CHA = '" + EXAM_CHA + "'";
				sql += " AND SIH_ITEM_CD = '" + ITEM_CD + "'";

				argStmtExec.executeUpdate(sql);
			}

		} catch (Exception e) {

			throw new FuncException(e.toString(), sql);
		}

		return sql;
	}
%>
