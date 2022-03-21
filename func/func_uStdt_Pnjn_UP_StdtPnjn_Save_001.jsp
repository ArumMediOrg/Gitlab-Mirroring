<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%!
	public String func_uStdt_Pnjn_UP_StdtPnjn_Save_001(Statement argStmtExec, HashMap argHtMethod) throws Exception {

		String sql = "";
		String sql2 = "";
		String sql_disp = "";

		try {

			String SAVE_KD = (String) argHtMethod.get("SAVE_KD");
			String EXAM_DT = (String) argHtMethod.get("EXAM_DT");
			String EXAM_SQ = (String) argHtMethod.get("EXAM_SQ");
			String PNJN_TT = (String) argHtMethod.get("PNJN_TT");
			String PNJN_01 = (String) argHtMethod.get("PNJN_01");
			String PNJN_02 = (String) argHtMethod.get("PNJN_02");
			String PNJN_03 = (String) argHtMethod.get("PNJN_03");
			String PNJN_04 = (String) argHtMethod.get("PNJN_04");
			String PNJN_05 = (String) argHtMethod.get("PNJN_05");
			String PNJN_06 = (String) argHtMethod.get("PNJN_06");
			String PNJN_07 = (String) argHtMethod.get("PNJN_07");
			String PNJN_08 = (String) argHtMethod.get("PNJN_08");
			String PNJN_09 = (String) argHtMethod.get("PNJN_09");
			String PNJN_10 = (String) argHtMethod.get("PNJN_10");
			String PNJN_11 = (String) argHtMethod.get("PNJN_11");
			String PNJN_12 = (String) argHtMethod.get("PNJN_12");
			String PNJN_13 = (String) argHtMethod.get("PNJN_13");
			String PNJN_14 = (String) argHtMethod.get("PNJN_14");
			String QST_01 = (String) argHtMethod.get("QST_01");
			String QST_02 = (String) argHtMethod.get("QST_02");
			String QST_03 = (String) argHtMethod.get("QST_03");
			String QST_04 = (String) argHtMethod.get("QST_04");
			String EXAM_VIEW = (String) argHtMethod.get("EXAM_VIEW");
			String EXAM_ACT = (String) argHtMethod.get("EXAM_ACT");
			String ORAL_VIEW = (String) argHtMethod.get("ORAL_VIEW");
			String ORAL_ACT = (String) argHtMethod.get("ORAL_ACT");
			String EIFRM_DT = (String) argHtMethod.get("EIFRM_DT");
			String OIFRM_DT = (String) argHtMethod.get("OIFRM_DT");
			String EXAM_DR = (String) argHtMethod.get("EXAM_DR");
			String ORAL_DR = (String) argHtMethod.get("ORAL_DR");
			String EPNJN_YN = (String) argHtMethod.get("EPNJN_YN");
			String OPNJN_YN = (String) argHtMethod.get("OPNJN_YN");
			String USER_ID = (String) argHtMethod.get("USER_ID");
			String ORAL_YN = (String) argHtMethod.get("ORAL_YN");

			//
			if(SAVE_KD == null) { SAVE_KD = ""; }
			if(EXAM_DT == null) { EXAM_DT = ""; }
			if(EXAM_SQ == null) { EXAM_SQ = ""; }
			if(PNJN_TT == null) { PNJN_TT = ""; }
			if(PNJN_01 == null) { PNJN_01 = ""; }
			if(PNJN_02 == null) { PNJN_02 = ""; }
			if(PNJN_03 == null) { PNJN_03 = ""; }
			if(PNJN_04 == null) { PNJN_04 = ""; }
			if(PNJN_05 == null) { PNJN_05 = ""; }
			if(PNJN_06 == null) { PNJN_06 = ""; }
			if(PNJN_07 == null) { PNJN_07 = ""; }
			if(PNJN_08 == null) { PNJN_08 = ""; }
			if(PNJN_09 == null) { PNJN_09 = ""; }
			if(PNJN_10 == null) { PNJN_10 = ""; }
			if(PNJN_11 == null) { PNJN_11 = ""; }
			if(PNJN_12 == null) { PNJN_12 = ""; }
			if(PNJN_13 == null) { PNJN_13 = ""; }
			if(PNJN_14 == null) { PNJN_14 = ""; }
			if(QST_01 == null) { QST_01 = ""; }
			if(QST_02 == null) { QST_02 = ""; }
			if(QST_03 == null) { QST_03 = ""; }
			if(QST_04 == null) { QST_04 = ""; }
			if(EXAM_VIEW == null) { EXAM_VIEW = ""; }
			if(EXAM_ACT == null) { EXAM_ACT = ""; }
			if(ORAL_VIEW == null) { ORAL_VIEW = ""; }
			if(ORAL_ACT == null) { ORAL_ACT = ""; }
			if(EIFRM_DT == null) { EIFRM_DT = ""; }
			if(OIFRM_DT == null) { OIFRM_DT = ""; }
			if(EXAM_DR == null) { EXAM_DR = ""; }
			if(ORAL_DR == null) { ORAL_DR = ""; }
			if(EPNJN_YN == null) { EPNJN_YN = ""; }
			if(OPNJN_YN == null) { OPNJN_YN = ""; }
			if(USER_ID == null) { USER_ID = ""; }
			if(ORAL_YN == null) { ORAL_YN = ""; }

			//
			SAVE_KD = CTr.Replace(SAVE_KD, "'", "''");
			EXAM_DT = CTr.Replace(EXAM_DT, "'", "''");
			EXAM_SQ = CTr.Replace(EXAM_SQ, "'", "''");
			PNJN_TT = CTr.Replace(PNJN_TT, "'", "''");
			PNJN_01 = CTr.Replace(PNJN_01, "'", "''");
			PNJN_02 = CTr.Replace(PNJN_02, "'", "''");
			PNJN_03 = CTr.Replace(PNJN_03, "'", "''");
			PNJN_04 = CTr.Replace(PNJN_04, "'", "''");
			PNJN_05 = CTr.Replace(PNJN_05, "'", "''");
			PNJN_06 = CTr.Replace(PNJN_06, "'", "''");
			PNJN_07 = CTr.Replace(PNJN_07, "'", "''");
			PNJN_08 = CTr.Replace(PNJN_08, "'", "''");
			PNJN_09 = CTr.Replace(PNJN_09, "'", "''");
			PNJN_10 = CTr.Replace(PNJN_10, "'", "''");
			PNJN_11 = CTr.Replace(PNJN_11, "'", "''");
			PNJN_12 = CTr.Replace(PNJN_12, "'", "''");
			PNJN_13 = CTr.Replace(PNJN_13, "'", "''");
			PNJN_14 = CTr.Replace(PNJN_14, "'", "''");
			QST_01 = CTr.Replace(QST_01, "'", "''");
			QST_02 = CTr.Replace(QST_02, "'", "''");
			QST_03 = CTr.Replace(QST_03, "'", "''");
			QST_04 = CTr.Replace(QST_04, "'", "''");
			EXAM_VIEW = CTr.Replace(EXAM_VIEW, "'", "''");
			EXAM_ACT = CTr.Replace(EXAM_ACT, "'", "''");
			ORAL_VIEW = CTr.Replace(ORAL_VIEW, "'", "''");
			ORAL_ACT = CTr.Replace(ORAL_ACT, "'", "''");
			EIFRM_DT = CTr.Replace(EIFRM_DT, "'", "''");
			OIFRM_DT = CTr.Replace(OIFRM_DT, "'", "''");
			EXAM_DR = CTr.Replace(EXAM_DR, "'", "''");
			ORAL_DR = CTr.Replace(ORAL_DR, "'", "''");
			EPNJN_YN = CTr.Replace(EPNJN_YN, "'", "''");
			OPNJN_YN = CTr.Replace(OPNJN_YN, "'", "''");
			USER_ID = CTr.Replace(USER_ID, "'", "''");
			ORAL_YN = CTr.Replace(ORAL_YN, "'", "''");

			if(SAVE_KD.equals("I")) {

				sql = "INSERT INTO ET_STDT_PNJN (ESP_EXAM_DT, ESP_EXAM_SQ, ESP_PNJN_TT, ESP_PNJN_01, ESP_PNJN_02, ESP_PNJN_03, ESP_PNJN_04, ESP_PNJN_05, ESP_PNJN_06, ESP_PNJN_07, ESP_PNJN_08, ESP_PNJN_09, ESP_PNJN_10, ESP_PNJN_11, ESP_PNJN_12, ESP_PNJN_13, ESP_PNJN_14, ESP_QST_01, ESP_QST_02, ESP_QST_03, ESP_QST_04, ESP_EXAM_VIEW, ESP_EXAM_ACT, ESP_ORAL_VIEW, ESP_ORAL_ACT, ESP_EIFRM_DT, ESP_OIFRM_DT, ESP_EXAM_DR, ESP_ORAL_DR, ESP_EPNJN_YN, ESP_OPNJN_YN, ESP_INPT_ID, ESP_INPT_DTT, ESP_MODI_ID, ESP_MODI_DTT) VALUES (";
				sql += "  '" + EXAM_DT + "'";
				sql += ", '" + EXAM_SQ + "'";
				sql += ", '" + PNJN_TT + "'";
				sql += ", '" + PNJN_01 + "'";
				sql += ", '" + PNJN_02 + "'";
				sql += ", '" + PNJN_03 + "'";
				sql += ", '" + PNJN_04 + "'";
				sql += ", '" + PNJN_05 + "'";
				sql += ", '" + PNJN_06 + "'";
				sql += ", '" + PNJN_07 + "'";
				sql += ", '" + PNJN_08 + "'";
				sql += ", '" + PNJN_09 + "'";
				sql += ", '" + PNJN_10 + "'";
				sql += ", '" + PNJN_11 + "'";
				sql += ", '" + PNJN_12 + "'";
				sql += ", '" + PNJN_13 + "'";
				sql += ", '" + PNJN_14 + "'";
				sql += ", '" + QST_01 + "'";
				sql += ", '" + QST_02 + "'";
				sql += ", '" + QST_03 + "'";
				sql += ", '" + QST_04 + "'";
				sql += ", '" + EXAM_VIEW + "'";
				sql += ", '" + EXAM_ACT + "'";
				sql += ", '" + ORAL_VIEW + "'";
				sql += ", '" + ORAL_ACT + "'";
				sql += ", '" + EIFRM_DT + "'";
				sql += ", '" + OIFRM_DT + "'";
				sql += ", '" + EXAM_DR + "'";
				sql += ", '" + ORAL_DR + "'";
				sql += ", '" + EPNJN_YN + "'";
				sql += ", '" + OPNJN_YN + "'";
				sql += ", '" + USER_ID + "'";
				sql += ", SYSDATE";
				sql += ", '" + USER_ID + "'";
				sql += ", SYSDATE";
				sql += ")";

				argStmtExec.executeUpdate(sql);
			} else {
			
				sql = "UPDATE ET_STDT_PNJN SET ";
				sql += "  ESP_PNJN_TT = '" + PNJN_TT + "'";
				sql += ", ESP_PNJN_01 = '" + PNJN_01 + "'";
				sql += ", ESP_PNJN_02 = '" + PNJN_02 + "'";
				sql += ", ESP_PNJN_03 = '" + PNJN_03 + "'";
				sql += ", ESP_PNJN_04 = '" + PNJN_04 + "'";
				sql += ", ESP_PNJN_06 = '" + PNJN_06 + "'";
				sql += ", ESP_PNJN_07 = '" + PNJN_07 + "'";
				sql += ", ESP_PNJN_08 = '" + PNJN_08 + "'";
				sql += ", ESP_PNJN_09 = '" + PNJN_09 + "'";
				sql += ", ESP_PNJN_10 = '" + PNJN_10 + "'";
				sql += ", ESP_PNJN_11 = '" + PNJN_11 + "'";
				sql += ", ESP_PNJN_12 = '" + PNJN_12 + "'";
				sql += ", ESP_PNJN_13 = '" + PNJN_13 + "'";
				sql += ", ESP_PNJN_14 = '" + PNJN_14 + "'";
				sql += ", ESP_QST_01 = '" + QST_01 + "'";
				sql += ", ESP_QST_02 = '" + QST_02 + "'";
				sql += ", ESP_QST_03 = '" + QST_03 + "'";
				sql += ", ESP_QST_04 = '" + QST_04 + "'";
				sql += ", ESP_EXAM_VIEW = '" + EXAM_VIEW + "'";
				sql += ", ESP_EXAM_ACT = '" + EXAM_ACT + "'";
				sql += ", ESP_EIFRM_DT = '" + EIFRM_DT + "'";
				sql += ", ESP_OIFRM_DT = '" + OIFRM_DT + "'";
				sql += ", ESP_EXAM_DR = '" + EXAM_DR + "'";
				sql += ", ESP_EPNJN_YN = '" + EPNJN_YN + "'";

				if(ORAL_YN.equals("Y")) {

						sql += ", ESP_PNJN_05 = '" + PNJN_05 + "'";
						sql += ", ESP_ORAL_DR = '" + ORAL_DR + "'";
						sql += ", ESP_ORAL_VIEW = '" + ORAL_VIEW + "'";
						sql += ", ESP_ORAL_ACT = '" + ORAL_ACT + "'";
						sql += ", ESP_OPNJN_YN = '" + OPNJN_YN + "'";
				}

				sql += ", ESP_MODI_ID = '" + USER_ID + "'";
				sql += ", ESP_MODI_DTT = SYSDATE";
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
