<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%!
	public String func_uStdt_Pnjn_UP_OralPnjn_Save_001(Statement argStmtExec, HashMap argHtMethod) throws Exception {

		String sql = "";
		String sql2 = "";
		String sql_disp = "";

		try {

			String SAVE_KD = (String) argHtMethod.get("SAVE_KD");
			String EXAM_DT = (String) argHtMethod.get("EXAM_DT");
			String EXAM_SQ = (String) argHtMethod.get("EXAM_SQ");
			String PNJN_05 = (String) argHtMethod.get("PNJN_05");
			String ORAL_VIEW = (String) argHtMethod.get("ORAL_VIEW");
			String ORAL_ACT = (String) argHtMethod.get("ORAL_ACT");
			String ORAL_DR = (String) argHtMethod.get("ORAL_DR");
			String OPNJN_YN = (String) argHtMethod.get("OPNJN_YN");
			String USER_ID = (String) argHtMethod.get("USER_ID");
			String PERI_DIS = (String) argHtMethod.get("PERI_DIS");
			String PERI_TXT = (String) argHtMethod.get("PERI_TXT");

			//
			if(SAVE_KD == null) { SAVE_KD = ""; }
			if(EXAM_DT == null) { EXAM_DT = ""; }
			if(EXAM_SQ == null) { EXAM_SQ = ""; }
			if(PNJN_05 == null) { PNJN_05 = ""; }
			if(ORAL_VIEW == null) { ORAL_VIEW = ""; }
			if(ORAL_ACT == null) { ORAL_ACT = ""; }
			if(ORAL_DR == null) { ORAL_DR = ""; }
			if(OPNJN_YN == null) { OPNJN_YN = ""; }
			if(USER_ID == null) { USER_ID = ""; }
			if(PERI_DIS == null) { PERI_DIS = ""; }
			if(PERI_TXT == null) { PERI_TXT = ""; }

			//
			SAVE_KD = CTr.Replace(SAVE_KD, "'", "''");
			EXAM_DT = CTr.Replace(EXAM_DT, "'", "''");
			EXAM_SQ = CTr.Replace(EXAM_SQ, "'", "''");
			PNJN_05 = CTr.Replace(PNJN_05, "'", "''");
			ORAL_VIEW = CTr.Replace(ORAL_VIEW, "'", "''");
			ORAL_ACT = CTr.Replace(ORAL_ACT, "'", "''");
			ORAL_DR = CTr.Replace(ORAL_DR, "'", "''");
			OPNJN_YN = CTr.Replace(OPNJN_YN, "'", "''");
			USER_ID = CTr.Replace(USER_ID, "'", "''");
			PERI_DIS = CTr.Replace(PERI_DIS, "'", "''");
			PERI_TXT = CTr.Replace(PERI_TXT, "'", "''");

			if(SAVE_KD.equals("I")) {

				sql = "INSERT INTO ET_STDT_PNJN (ESP_EXAM_DT, ESP_EXAM_SQ, ESP_PNJN_05, ESP_ORAL_VIEW, ESP_ORAL_ACT, ESP_ORAL_DR, ESP_OPNJN_YN, ESP_INPT_ID, ESP_INPT_DTT, ESP_MODI_ID, ESP_MODI_DTT, ESP_PERI_DIS, ESP_PERI_TXT) VALUES (";
				sql += "  '" + EXAM_DT + "'";
				sql += ", '" + EXAM_SQ + "'";
				sql += ", '" + PNJN_05 + "'";
				sql += ", '" + ORAL_VIEW + "'";
				sql += ", '" + ORAL_ACT + "'";
				sql += ", '" + ORAL_DR + "'";
				sql += ", '" + OPNJN_YN + "'";
				sql += ", '" + USER_ID + "'";
				sql += ", SYSDATE";
				sql += ", '" + USER_ID + "'";
				sql += ", SYSDATE";
				sql += ", '" + PERI_DIS + "'";
				sql += ", '" + PERI_TXT + "'";
				sql += ")";

				argStmtExec.executeUpdate(sql);
			} else {

				sql = "UPDATE ET_STDT_PNJN SET ";
				sql += "  ESP_PNJN_05 = '" + PNJN_05 + "'";
				sql += ", ESP_ORAL_VIEW = '" + ORAL_VIEW + "'";
				sql += ", ESP_ORAL_ACT = '" + ORAL_ACT + "'";
				sql += ", ESP_ORAL_DR = '" + ORAL_DR + "'";
				sql += ", ESP_OPNJN_YN = '" + OPNJN_YN + "'";
				sql += ", ESP_MODI_ID = '" + USER_ID + "'";
				sql += ", ESP_MODI_DTT = SYSDATE";
				sql += ", ESP_PERI_DIS = '" + PERI_DIS + "'";
         		sql += ", ESP_PERI_TXT = '" + PERI_TXT + "'";
				sql += " WHERE ESP_EXAM_DT = '" + EXAM_DT + "'";
				sql += " AND ESP_EXAM_SQ = '" + EXAM_SQ + "'";

				argStmtExec.executeUpdate(sql);
			}
		} catch (Exception e) {

			throw new FuncException(e.toString(), sql);
		}

		return sql;
	}
%>
