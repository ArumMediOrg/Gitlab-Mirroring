<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%!
	public String func_uExam_Acpt_btnSaveClick_001(Statement argStmtExec, HashMap argHtMethod) throws Exception {

		String sql = "";
		String sql2 = "";
		String sql_disp = "";

		try {

			String SAVE_KD = (String) argHtMethod.get("SAVE_KD");
			String EXAM_DT = (String) argHtMethod.get("EXAM_DT");
			String EXAM_SQ = (String) argHtMethod.get("EXAM_SQ");
			String RESULT_YN = (String) argHtMethod.get("RESULT_YN");
			String COLLECT_YN = (String) argHtMethod.get("COLLECT_YN");
			String CHOICE_ITEM = (String) argHtMethod.get("CHOICE_ITEM");
			String ADD_ITEM = (String) argHtMethod.get("ADD_ITEM");
			String ADD_PRICE = (String) argHtMethod.get("ADD_PRICE");
			String AGREE_CD = (String) argHtMethod.get("AGREE_CD");
			String SEND_CD = (String) argHtMethod.get("SEND_CD");
			String SERVICE_CD = (String) argHtMethod.get("SERVICE_CD");
			String ARUM_STATUS = (String) argHtMethod.get("ARUM_STATUS");
			String RSVN_NO = (String) argHtMethod.get("RSVN_NO");

			//
			if(SAVE_KD == null) { SAVE_KD = ""; }
			if(EXAM_DT == null) { EXAM_DT = ""; }
			if(EXAM_SQ == null) { EXAM_SQ = ""; }
			if(RESULT_YN == null) { RESULT_YN = ""; }
			if(COLLECT_YN == null) { COLLECT_YN = ""; }
			if(CHOICE_ITEM == null) { CHOICE_ITEM = ""; }
			if(ADD_ITEM == null) { ADD_ITEM = ""; }
			if(ADD_PRICE == null) { ADD_PRICE = ""; }
			if(AGREE_CD == null) { AGREE_CD = ""; }
			if(SEND_CD == null) { SEND_CD = ""; }
			if(SERVICE_CD == null) { SERVICE_CD = ""; }
			if(ARUM_STATUS == null) { ARUM_STATUS = ""; }
			if(RSVN_NO == null) { RSVN_NO = ""; }

			//
			SAVE_KD = CTr.Replace(SAVE_KD, "'", "''");
			EXAM_DT = CTr.Replace(EXAM_DT, "'", "''");
			EXAM_SQ = CTr.Replace(EXAM_SQ, "'", "''");
			RESULT_YN = CTr.Replace(RESULT_YN, "'", "''");
			COLLECT_YN = CTr.Replace(COLLECT_YN, "'", "''");
			CHOICE_ITEM = CTr.Replace(CHOICE_ITEM, "'", "''");
			ADD_ITEM = CTr.Replace(ADD_ITEM, "'", "''");
			ADD_PRICE = CTr.Replace(ADD_PRICE, "'", "''");
			AGREE_CD = CTr.Replace(AGREE_CD, "'", "''");
			SEND_CD = CTr.Replace(SEND_CD, "'", "''");
			SERVICE_CD = CTr.Replace(SERVICE_CD, "'", "''");
			ARUM_STATUS = CTr.Replace(ARUM_STATUS, "'", "''");
			RSVN_NO = CTr.Replace(RSVN_NO, "'", "''");

			if(SAVE_KD.equals("I")) {

				sql = " INSERT INTO UB_EXAM_ACPT (UB_EXAM_DT, UB_EXAM_SQ, UB_RVT_YN, UB_RESULT_YN, UB_COLLECT_YN, UB_CHOICE_ITEM, UB_ADD_ITEM, UB_ADD_PRICE, UB_COM_PR, UB_COMADD_PR, UB_AGREE_CD, UB_SEND_CD, UB_SERVICE_CD, UB_RECEIVE_YN, UB_GRADE_NM, ARUM_STATUS, UB_START_DT, UB_END_DT, UB_CHKST_DT, UB_CHKEN_DT, UB_TRET_TX)";
				sql += " SELECT '" + EXAM_DT + "', '" + EXAM_SQ + "', UB_RVT_YN, '" + RESULT_YN + "', '" + COLLECT_YN + "', '" + CHOICE_ITEM + "', '" + ADD_ITEM + "', '" + ADD_PRICE + "', UB_COM_PR, UB_COMADD_PR, '" + AGREE_CD + "', '" + SEND_CD + "', '" + SERVICE_CD + "', UB_RECEIVE_YN, UB_GRADE_NM, '" + ARUM_STATUS + "', UB_START_DT, UB_END_DT, UB_CHKST_DT, UB_CHKEN_DT, UB_TRET_TX";
				sql += " FROM UB_RSVT";
				sql += " WHERE UB_RSVN_NO = '" + RSVN_NO + "'";
			} else {

				sql = "UPDATE UB_EXAM_ACPT SET ";
				sql += "  UB_CHOICE_ITEM = '" + CHOICE_ITEM + "'";
				sql += ", UB_ADD_ITEM = '" + ADD_ITEM + "'";
				sql += ", UB_ADD_PRICE = '" + ADD_PRICE + "'";
				sql += ", UB_AGREE_CD = '" + AGREE_CD + "'";
				sql += ", UB_SEND_CD = '" + SEND_CD + "'";
				sql += ", ARUM_STATUS = '" + ARUM_STATUS + "'";
				sql += " WHERE UB_EXAM_DT = '" + EXAM_DT + "'";
				sql += " AND UB_EXAM_SQ = '" + EXAM_SQ + "'";

				argStmtExec.executeUpdate(sql);
			}

		} catch (Exception e) {

			throw new FuncException(e.toString(), sql);
		}

		return sql;
	}
%>
