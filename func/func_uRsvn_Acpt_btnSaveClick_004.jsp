<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%!
	public String func_uRsvn_Acpt_btnSaveClick_004(Statement argStmtExec, HashMap argHtMethod) throws Exception {

		String sql = "";
		String sql2 = "";
		String sql_disp = "";

		try {

			String SAVE_KD = (String) argHtMethod.get("SAVE_KD");
			String RSVN_NO = (String) argHtMethod.get("RSVN_NO");
			String RVT_YN = (String) argHtMethod.get("RVT_YN");
			String PACKAGE_CD = (String) argHtMethod.get("PACKAGE_CD");
			String USER_ID = (String) argHtMethod.get("USER_ID");
			String RESERVATION_ID = (String) argHtMethod.get("RESERVATION_ID");
			String KEEPER_YN = (String) argHtMethod.get("KEEPER_YN");
			String CHOICE_ITEM = (String) argHtMethod.get("CHOICE_ITEM");
			String ADD_ITEM = (String) argHtMethod.get("ADD_ITEM");
			String ADD_PRICE = (String) argHtMethod.get("ADD_PRICE");
			String COM_PR = (String) argHtMethod.get("COM_PR");
			String COMADD_PR = (String) argHtMethod.get("COMADD_PR");
			String CHOICE_PR = (String) argHtMethod.get("CHOICE_PR");
			String PACKAGE_PR = (String) argHtMethod.get("PACKAGE_PR");
			String PERSONAL_PR = (String) argHtMethod.get("PERSONAL_PR");
			String AGREE_CD = (String) argHtMethod.get("AGREE_CD");
			String SEND_CD = (String) argHtMethod.get("SEND_CD");
			String SERVICE_CD = (String) argHtMethod.get("SERVICE_CD");
			String RECEIVE_YN = (String) argHtMethod.get("RECEIVE_YN");
			String GRADE_NM = (String) argHtMethod.get("GRADE_NM");
			String ARUM_STATUS = (String) argHtMethod.get("ARUM_STATUS");
			String START_DT = (String) argHtMethod.get("START_DT");
			String END_DT = (String) argHtMethod.get("END_DT");
			String CHKST_DT = (String) argHtMethod.get("CHKST_DT");
			String CHKEN_DT = (String) argHtMethod.get("CHKEN_DT");
			String TRET_TX = (String) argHtMethod.get("TRET_TX");

			//
			if(SAVE_KD == null) { SAVE_KD = ""; }
			if(RSVN_NO == null) { RSVN_NO = ""; }
			if(RVT_YN == null) { RVT_YN = ""; }
			if(PACKAGE_CD == null) { PACKAGE_CD = ""; }
			if(USER_ID == null) { USER_ID = ""; }
			if(RESERVATION_ID == null) { RESERVATION_ID = ""; }
			if(KEEPER_YN == null) { KEEPER_YN = ""; }
			if(CHOICE_ITEM == null) { CHOICE_ITEM = ""; }
			if(ADD_ITEM == null) { ADD_ITEM = ""; }
			if(ADD_PRICE == null) { ADD_PRICE = ""; }
			if(COM_PR == null) { COM_PR = ""; }
			if(COMADD_PR == null) { COMADD_PR = ""; }
			if(CHOICE_PR == null) { CHOICE_PR = ""; }
			if(PACKAGE_PR == null) { PACKAGE_PR = ""; }
			if(PERSONAL_PR == null) { PERSONAL_PR = ""; }
			if(AGREE_CD == null) { AGREE_CD = ""; }
			if(SEND_CD == null) { SEND_CD = ""; }
			if(SERVICE_CD == null) { SERVICE_CD = ""; }
			if(RECEIVE_YN == null) { RECEIVE_YN = ""; }
			if(GRADE_NM == null) { GRADE_NM = ""; }
			if(ARUM_STATUS == null) { ARUM_STATUS = ""; }
			if(START_DT == null) { START_DT = ""; }
			if(END_DT == null) { END_DT = ""; }
			if(CHKST_DT == null) { CHKST_DT = ""; }
			if(CHKEN_DT == null) { CHKEN_DT = ""; }
			if(TRET_TX == null) { TRET_TX = ""; }

			//
			SAVE_KD = CTr.Replace(SAVE_KD, "'", "''");
			RSVN_NO = CTr.Replace(RSVN_NO, "'", "''");
			RVT_YN = CTr.Replace(RVT_YN, "'", "''");
			PACKAGE_CD = CTr.Replace(PACKAGE_CD, "'", "''");
			USER_ID = CTr.Replace(USER_ID, "'", "''");
			RESERVATION_ID = CTr.Replace(RESERVATION_ID, "'", "''");
			KEEPER_YN = CTr.Replace(KEEPER_YN, "'", "''");
			CHOICE_ITEM = CTr.Replace(CHOICE_ITEM, "'", "''");
			ADD_ITEM = CTr.Replace(ADD_ITEM, "'", "''");
			ADD_PRICE = CTr.Replace(ADD_PRICE, "'", "''");
			COM_PR = CTr.Replace(COM_PR, "'", "''");
			COMADD_PR = CTr.Replace(COMADD_PR, "'", "''");
			CHOICE_PR = CTr.Replace(CHOICE_PR, "'", "''");
			PACKAGE_PR = CTr.Replace(PACKAGE_PR, "'", "''");
			PERSONAL_PR = CTr.Replace(PERSONAL_PR, "'", "''");
			AGREE_CD = CTr.Replace(AGREE_CD, "'", "''");
			SEND_CD = CTr.Replace(SEND_CD, "'", "''");
			SERVICE_CD = CTr.Replace(SERVICE_CD, "'", "''");
			RECEIVE_YN = CTr.Replace(RECEIVE_YN, "'", "''");
			GRADE_NM = CTr.Replace(GRADE_NM, "'", "''");
			ARUM_STATUS = CTr.Replace(ARUM_STATUS, "'", "''");
			START_DT = CTr.Replace(START_DT, "'", "''");
			END_DT = CTr.Replace(END_DT, "'", "''");
			CHKST_DT = CTr.Replace(CHKST_DT, "'", "''");
			CHKEN_DT = CTr.Replace(CHKEN_DT, "'", "''");
			TRET_TX = CTr.Replace(TRET_TX, "'", "''");

			if(SAVE_KD.equals("I")) {

				sql = "INSERT INTO UB_RSVT (UB_RSVN_NO, UB_RVT_YN, UB_PACKAGE_CD, UB_USER_ID, UB_RESERVATION_ID, UB_KEEPER_YN, UB_CHOICE_ITEM, UB_ADD_ITEM, UB_ADD_PRICE, UB_COM_PR, UB_COMADD_PR, UB_CHOICE_PR, UB_PACKAGE_PR, UB_PERSONAL_PR, UB_AGREE_CD, UB_SEND_CD, UB_SERVICE_CD, UB_RECEIVE_YN, UB_GRADE_NM, ARUM_STATUS, UB_START_DT, UB_END_DT, UB_CHKST_DT, UB_CHKEN_DT, UB_TRET_TX) VALUES (";
				sql += "  '" + RSVN_NO + "'";
				sql += ", '" + RVT_YN + "'";
				sql += ", '" + PACKAGE_CD + "'";
				sql += ", '" + USER_ID + "'";
				sql += ", '" + RESERVATION_ID + "'";
				sql += ", '" + KEEPER_YN + "'";
				sql += ", '" + CHOICE_ITEM + "'";
				sql += ", '" + ADD_ITEM + "'";
				sql += ", '" + ADD_PRICE + "'";
				sql += ", '" + COM_PR + "'";
				sql += ", '" + COMADD_PR + "'";
				sql += ", '" + CHOICE_PR + "'";
				sql += ", '" + PACKAGE_PR + "'";
				sql += ", '" + PERSONAL_PR + "'";
				sql += ", '" + AGREE_CD + "'";
				sql += ", '" + SEND_CD + "'";
				sql += ", '" + SERVICE_CD + "'";
				sql += ", '" + RECEIVE_YN + "'";
				sql += ", '" + GRADE_NM + "'";
				sql += ", '" + ARUM_STATUS + "'";
				sql += ", '" + START_DT + "'";
				sql += ", '" + END_DT + "'";
				sql += ", '" + CHKST_DT + "'";
				sql += ", '" + CHKEN_DT + "'";
				sql += ", '" + TRET_TX + "'";
				sql += ")";

				argStmtExec.executeUpdate(sql);
			} else {
			
				sql = "UPDATE UB_RSVT SET ";
				sql += "  UB_PACKAGE_CD = '" + PACKAGE_CD + "'";
				sql += ", UB_CHOICE_ITEM = '" + CHOICE_ITEM + "'";
				sql += ", UB_ADD_ITEM = '" + ADD_ITEM + "'";
				sql += ", UB_ADD_PRICE = '" + ADD_PRICE + "'";
				sql += ", UB_CHOICE_PR = '" + CHOICE_PR + "'";
				sql += ", UB_PACKAGE_PR = '" + PACKAGE_PR + "'";
				sql += ", UB_PERSONAL_PR = '" + PERSONAL_PR + "'";
				sql += ", UB_AGREE_CD = '" + AGREE_CD + "'";
				sql += ", UB_SEND_CD = '" + SEND_CD + "'";
				sql += ", ARUM_STATUS = '" + ARUM_STATUS + "'";
				sql += " WHERE UB_RSVN_NO = '" + RSVN_NO + "'";

				argStmtExec.executeUpdate(sql);
			}

		} catch (Exception e) {

			throw new FuncException(e.toString(), sql);
		}

		return sql;
	}
%>
