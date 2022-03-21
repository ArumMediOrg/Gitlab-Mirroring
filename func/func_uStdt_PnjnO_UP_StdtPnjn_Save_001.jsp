<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%!
	public String func_uStdt_PnjnO_UP_StdtPnjn_Save_001(Statement argStmtExec, HashMap argHtMethod) throws Exception {

		String sql = "";
		String sql2 = "";
		String sql_disp = "";

		try {

			String SAVE_KD = (String) argHtMethod.get("SAVE_KD");
			String EXAM_DT = (String) argHtMethod.get("EXAM_DT");
			String EXAM_SQ = (String) argHtMethod.get("EXAM_SQ");
			String QST_DIAG = (String) argHtMethod.get("QST_DIAG");
			String QST_DRUG = (String) argHtMethod.get("QST_DRUG");
			String QST_STAT = (String) argHtMethod.get("QST_STAT");
			String QST_HABIT = (String) argHtMethod.get("QST_HABIT");
			String QST_INJURE = (String) argHtMethod.get("QST_INJURE");
			String QST_DRUNK = (String) argHtMethod.get("QST_DRUNK");
			String QST_SMOKE = (String) argHtMethod.get("QST_SMOKE");
			String QST_SPORT = (String) argHtMethod.get("QST_SPORT");
			String QST_WEIGHT = (String) argHtMethod.get("QST_WEIGHT");
			String PNJNB_1 = (String) argHtMethod.get("PNJNB_1");
			String PNJNB_2 = (String) argHtMethod.get("PNJNB_2");
			String PNJNB_3 = (String) argHtMethod.get("PNJNB_3");
			String PNJNB_4 = (String) argHtMethod.get("PNJNB_4");
			String PNJNB_5 = (String) argHtMethod.get("PNJNB_5");
			String PNJNB_6 = (String) argHtMethod.get("PNJNB_6");
			String PNJNB_7 = (String) argHtMethod.get("PNJNB_7");
			String PNJNB_ETC = (String) argHtMethod.get("PNJNB_ETC");
			String PNJNB_ETC2 = (String) argHtMethod.get("PNJNB_ETC2");
			String PNJNR_1 = (String) argHtMethod.get("PNJNR_1");
			String PNJNR_2 = (String) argHtMethod.get("PNJNR_2");
			String PNJNR_3 = (String) argHtMethod.get("PNJNR_3");
			String PNJNR_4 = (String) argHtMethod.get("PNJNR_4");
			String PNJNR_5 = (String) argHtMethod.get("PNJNR_5");
			String PNJNR_6 = (String) argHtMethod.get("PNJNR_6");
			String PNJNR_7 = (String) argHtMethod.get("PNJNR_7");
			String PNJNR_8 = (String) argHtMethod.get("PNJNR_8");
			String PNJNR_ETC = (String) argHtMethod.get("PNJNR_ETC");
			String PNJNR_ETC2 = (String) argHtMethod.get("PNJNR_ETC2");
			String PNJNRD_1 = (String) argHtMethod.get("PNJNRD_1");
			String PNJNRD_2 = (String) argHtMethod.get("PNJNRD_2");
			String PNJNRD_3 = (String) argHtMethod.get("PNJNRD_3");
			String PNJNRD_4 = (String) argHtMethod.get("PNJNRD_4");
			String PNJN_A = (String) argHtMethod.get("PNJN_A");
			String PNJN_B = (String) argHtMethod.get("PNJN_B");
			String PNJN_R = (String) argHtMethod.get("PNJN_R");
			String PNJN_RD = (String) argHtMethod.get("PNJN_RD");
			String PNJN_ORAL = (String) argHtMethod.get("PNJN_ORAL");
			String EXAM_VIEW = (String) argHtMethod.get("EXAM_VIEW");
			String EXAM_ACT = (String) argHtMethod.get("EXAM_ACT");
			String ORAL_VIEW = (String) argHtMethod.get("ORAL_VIEW");
			String ORAL_ACT = (String) argHtMethod.get("ORAL_ACT");
			String EPNJN_DT = (String) argHtMethod.get("EPNJN_DT");
			String OPNJN_DT = (String) argHtMethod.get("OPNJN_DT");
			String EIFRM_DT = (String) argHtMethod.get("EIFRM_DT");
			String OIFRM_DT = (String) argHtMethod.get("OIFRM_DT");
			String EXAM_DR = (String) argHtMethod.get("EXAM_DR");
			String ORAL_DR = (String) argHtMethod.get("ORAL_DR");
			String EPNJN_YN = (String) argHtMethod.get("EPNJN_YN");
			String OPNJN_YN = (String) argHtMethod.get("OPNJN_YN");
			String CHUNG_YN = (String) argHtMethod.get("CHUNG_YN");
			String USER_ID = (String) argHtMethod.get("USER_ID");
			String PNJNB_8 = (String) argHtMethod.get("PNJNB_8");
			String PNJNR_9 = (String) argHtMethod.get("PNJNR_9");
			String ADD_VIEW = (String) argHtMethod.get("ADD_VIEW");

			//
			if(SAVE_KD == null) { SAVE_KD = ""; }
			if(EXAM_DT == null) { EXAM_DT = ""; }
			if(EXAM_SQ == null) { EXAM_SQ = ""; }
			if(QST_DIAG == null) { QST_DIAG = ""; }
			if(QST_DRUG == null) { QST_DRUG = ""; }
			if(QST_STAT == null) { QST_STAT = ""; }
			if(QST_HABIT == null) { QST_HABIT = ""; }
			if(QST_INJURE == null) { QST_INJURE = ""; }
			if(QST_DRUNK == null) { QST_DRUNK = ""; }
			if(QST_SMOKE == null) { QST_SMOKE = ""; }
			if(QST_SPORT == null) { QST_SPORT = ""; }
			if(QST_WEIGHT == null) { QST_WEIGHT = ""; }
			if(PNJNB_1 == null) { PNJNB_1 = ""; }
			if(PNJNB_2 == null) { PNJNB_2 = ""; }
			if(PNJNB_3 == null) { PNJNB_3 = ""; }
			if(PNJNB_4 == null) { PNJNB_4 = ""; }
			if(PNJNB_5 == null) { PNJNB_5 = ""; }
			if(PNJNB_6 == null) { PNJNB_6 = ""; }
			if(PNJNB_7 == null) { PNJNB_7 = ""; }
			if(PNJNB_ETC == null) { PNJNB_ETC = ""; }
			if(PNJNB_ETC2 == null) { PNJNB_ETC2 = ""; }
			if(PNJNR_1 == null) { PNJNR_1 = ""; }
			if(PNJNR_2 == null) { PNJNR_2 = ""; }
			if(PNJNR_3 == null) { PNJNR_3 = ""; }
			if(PNJNR_4 == null) { PNJNR_4 = ""; }
			if(PNJNR_5 == null) { PNJNR_5 = ""; }
			if(PNJNR_6 == null) { PNJNR_6 = ""; }
			if(PNJNR_7 == null) { PNJNR_7 = ""; }
			if(PNJNR_8 == null) { PNJNR_8 = ""; }
			if(PNJNR_ETC == null) { PNJNR_ETC = ""; }
			if(PNJNR_ETC2 == null) { PNJNR_ETC2 = ""; }
			if(PNJNRD_1 == null) { PNJNRD_1 = ""; }
			if(PNJNRD_2 == null) { PNJNRD_2 = ""; }
			if(PNJNRD_3 == null) { PNJNRD_3 = ""; }
			if(PNJNRD_4 == null) { PNJNRD_4 = ""; }
			if(PNJN_A == null) { PNJN_A = ""; }
			if(PNJN_B == null) { PNJN_B = ""; }
			if(PNJN_R == null) { PNJN_R = ""; }
			if(PNJN_RD == null) { PNJN_RD = ""; }
			if(PNJN_ORAL == null) { PNJN_ORAL = ""; }
			if(EXAM_VIEW == null) { EXAM_VIEW = ""; }
			if(EXAM_ACT == null) { EXAM_ACT = ""; }
			if(ORAL_VIEW == null) { ORAL_VIEW = ""; }
			if(ORAL_ACT == null) { ORAL_ACT = ""; }
			if(EPNJN_DT == null) { EPNJN_DT = ""; }
			if(OPNJN_DT == null) { OPNJN_DT = ""; }
			if(EIFRM_DT == null) { EIFRM_DT = ""; }
			if(OIFRM_DT == null) { OIFRM_DT = ""; }
			if(EXAM_DR == null) { EXAM_DR = ""; }
			if(ORAL_DR == null) { ORAL_DR = ""; }
			if(EPNJN_YN == null) { EPNJN_YN = ""; }
			if(OPNJN_YN == null) { OPNJN_YN = ""; }
			if(CHUNG_YN == null) { CHUNG_YN = ""; }
			if(USER_ID == null) { USER_ID = ""; }
			if(PNJNB_8 == null) { PNJNB_8 = ""; }
			if(PNJNR_9 == null) { PNJNR_9 = ""; }
			if(ADD_VIEW == null) { ADD_VIEW = ""; }

			//
			SAVE_KD = CTr.Replace(SAVE_KD, "'", "''");
			EXAM_DT = CTr.Replace(EXAM_DT, "'", "''");
			EXAM_SQ = CTr.Replace(EXAM_SQ, "'", "''");
			QST_DIAG = CTr.Replace(QST_DIAG, "'", "''");
			QST_DRUG = CTr.Replace(QST_DRUG, "'", "''");
			QST_STAT = CTr.Replace(QST_STAT, "'", "''");
			QST_HABIT = CTr.Replace(QST_HABIT, "'", "''");
			QST_INJURE = CTr.Replace(QST_INJURE, "'", "''");
			QST_DRUNK = CTr.Replace(QST_DRUNK, "'", "''");
			QST_SMOKE = CTr.Replace(QST_SMOKE, "'", "''");
			QST_SPORT = CTr.Replace(QST_SPORT, "'", "''");
			QST_WEIGHT = CTr.Replace(QST_WEIGHT, "'", "''");
			PNJNB_1 = CTr.Replace(PNJNB_1, "'", "''");
			PNJNB_2 = CTr.Replace(PNJNB_2, "'", "''");
			PNJNB_3 = CTr.Replace(PNJNB_3, "'", "''");
			PNJNB_4 = CTr.Replace(PNJNB_4, "'", "''");
			PNJNB_5 = CTr.Replace(PNJNB_5, "'", "''");
			PNJNB_6 = CTr.Replace(PNJNB_6, "'", "''");
			PNJNB_7 = CTr.Replace(PNJNB_7, "'", "''");
			PNJNB_ETC = CTr.Replace(PNJNB_ETC, "'", "''");
			PNJNB_ETC2 = CTr.Replace(PNJNB_ETC2, "'", "''");
			PNJNR_1 = CTr.Replace(PNJNR_1, "'", "''");
			PNJNR_2 = CTr.Replace(PNJNR_2, "'", "''");
			PNJNR_3 = CTr.Replace(PNJNR_3, "'", "''");
			PNJNR_4 = CTr.Replace(PNJNR_4, "'", "''");
			PNJNR_5 = CTr.Replace(PNJNR_5, "'", "''");
			PNJNR_6 = CTr.Replace(PNJNR_6, "'", "''");
			PNJNR_7 = CTr.Replace(PNJNR_7, "'", "''");
			PNJNR_8 = CTr.Replace(PNJNR_8, "'", "''");
			PNJNR_ETC = CTr.Replace(PNJNR_ETC, "'", "''");
			PNJNR_ETC2 = CTr.Replace(PNJNR_ETC2, "'", "''");
			PNJNRD_1 = CTr.Replace(PNJNRD_1, "'", "''");
			PNJNRD_2 = CTr.Replace(PNJNRD_2, "'", "''");
			PNJNRD_3 = CTr.Replace(PNJNRD_3, "'", "''");
			PNJNRD_4 = CTr.Replace(PNJNRD_4, "'", "''");
			PNJN_A = CTr.Replace(PNJN_A, "'", "''");
			PNJN_B = CTr.Replace(PNJN_B, "'", "''");
			PNJN_R = CTr.Replace(PNJN_R, "'", "''");
			PNJN_RD = CTr.Replace(PNJN_RD, "'", "''");
			PNJN_ORAL = CTr.Replace(PNJN_ORAL, "'", "''");
			EXAM_VIEW = CTr.Replace(EXAM_VIEW, "'", "''");
			EXAM_ACT = CTr.Replace(EXAM_ACT, "'", "''");
			ORAL_VIEW = CTr.Replace(ORAL_VIEW, "'", "''");
			ORAL_ACT = CTr.Replace(ORAL_ACT, "'", "''");
			EPNJN_DT = CTr.Replace(EPNJN_DT, "'", "''");
			OPNJN_DT = CTr.Replace(OPNJN_DT, "'", "''");
			EIFRM_DT = CTr.Replace(EIFRM_DT, "'", "''");
			OIFRM_DT = CTr.Replace(OIFRM_DT, "'", "''");
			EXAM_DR = CTr.Replace(EXAM_DR, "'", "''");
			ORAL_DR = CTr.Replace(ORAL_DR, "'", "''");
			EPNJN_YN = CTr.Replace(EPNJN_YN, "'", "''");
			OPNJN_YN = CTr.Replace(OPNJN_YN, "'", "''");
			CHUNG_YN = CTr.Replace(CHUNG_YN, "'", "''");
			USER_ID = CTr.Replace(USER_ID, "'", "''");
			PNJNB_8 = CTr.Replace(PNJNB_8, "'", "''");
			PNJNR_9 = CTr.Replace(PNJNR_9, "'", "''");
			ADD_VIEW = CTr.Replace(ADD_VIEW, "'", "''");

			if(SAVE_KD.equals("I")) {

				sql = "INSERT INTO ET_STDT_PNJNO (ESO_EXAM_DT, ESO_EXAM_SQ, ESO_QST_DIAG, ESO_QST_DRUG, ESO_QST_STAT, ESO_QST_HABIT, ESO_QST_INJURE, ESO_QST_DRUNK, ESO_QST_SMOKE, ESO_QST_SPORT, ESO_QST_WEIGHT, ESO_PNJNB_1, ESO_PNJNB_2, ESO_PNJNB_3, ESO_PNJNB_4, ESO_PNJNB_5, ESO_PNJNB_6, ESO_PNJNB_7, ESO_PNJNB_ETC, ESO_PNJNB_ETC2, ESO_PNJNR_1, ESO_PNJNR_2, ESO_PNJNR_3, ESO_PNJNR_4, ESO_PNJNR_5, ESO_PNJNR_6, ESO_PNJNR_7, ESO_PNJNR_8, ESO_PNJNR_ETC, ESO_PNJNR_ETC2, ESO_PNJNRD_1, ESO_PNJNRD_2, ESO_PNJNRD_3, ESO_PNJNRD_4, ESO_PNJN_A, ESO_PNJN_B, ESO_PNJN_R, ESO_PNJN_RD, ESO_PNJN_ORAL, ESO_EXAM_VIEW, ESO_EXAM_ACT, ESO_ORAL_VIEW, ESO_ORAL_ACT, ESO_EPNJN_DT, ESO_OPNJN_DT, ESO_EIFRM_DT, ESO_OIFRM_DT, ESO_EXAM_DR, ESO_ORAL_DR, ESO_EPNJN_YN, ESO_OPNJN_YN, ESO_CHUNG_YN, ESO_INPT_ID, ESO_INPT_DTT, ESO_MODI_ID, ESO_MODI_DTT, ESO_PNJNB_8, ESO_PNJNR_9, ESO_ADD_VIEW) VALUES (";
				sql += "  '" + EXAM_DT + "'";
				sql += ", '" + EXAM_SQ + "'";
				sql += ", '" + QST_DIAG + "'";
				sql += ", '" + QST_DRUG + "'";
				sql += ", '" + QST_STAT + "'";
				sql += ", '" + QST_HABIT + "'";
				sql += ", '" + QST_INJURE + "'";
				sql += ", '" + QST_DRUNK + "'";
				sql += ", '" + QST_SMOKE + "'";
				sql += ", '" + QST_SPORT + "'";
				sql += ", '" + QST_WEIGHT + "'";
				sql += ", '" + PNJNB_1 + "'";
				sql += ", '" + PNJNB_2 + "'";
				sql += ", '" + PNJNB_3 + "'";
				sql += ", '" + PNJNB_4 + "'";
				sql += ", '" + PNJNB_5 + "'";
				sql += ", '" + PNJNB_6 + "'";
				sql += ", '" + PNJNB_7 + "'";
				sql += ", '" + PNJNB_ETC + "'";
				sql += ", '" + PNJNB_ETC2 + "'";
				sql += ", '" + PNJNR_1 + "'";
				sql += ", '" + PNJNR_2 + "'";
				sql += ", '" + PNJNR_3 + "'";
				sql += ", '" + PNJNR_4 + "'";
				sql += ", '" + PNJNR_5 + "'";
				sql += ", '" + PNJNR_6 + "'";
				sql += ", '" + PNJNR_7 + "'";
				sql += ", '" + PNJNR_8 + "'";
				sql += ", '" + PNJNR_ETC + "'";
				sql += ", '" + PNJNR_ETC2 + "'";
				sql += ", '" + PNJNRD_1 + "'";
				sql += ", '" + PNJNRD_2 + "'";
				sql += ", '" + PNJNRD_3 + "'";
				sql += ", '" + PNJNRD_4 + "'";
				sql += ", '" + PNJN_A + "'";
				sql += ", '" + PNJN_B + "'";
				sql += ", '" + PNJN_R + "'";
				sql += ", '" + PNJN_RD + "'";
				sql += ", '" + PNJN_ORAL + "'";
				sql += ", '" + EXAM_VIEW + "'";
				sql += ", '" + EXAM_ACT + "'";
				sql += ", '" + ORAL_VIEW + "'";
				sql += ", '" + ORAL_ACT + "'";
				sql += ", '" + EPNJN_DT + "'";
				sql += ", '" + OPNJN_DT + "'";
				sql += ", '" + EIFRM_DT + "'";
				sql += ", '" + OIFRM_DT + "'";
				sql += ", '" + EXAM_DR + "'";
				sql += ", '" + ORAL_DR + "'";
				sql += ", '" + EPNJN_YN + "'";
				sql += ", '" + OPNJN_YN + "'";
				sql += ", '" + CHUNG_YN + "'";
				sql += ", '" + USER_ID + "'";
				sql += ", SYSDATE";
				sql += ", '" + USER_ID + "'";
				sql += ", SYSDATE";
				sql += ", '" + PNJNB_8 + "'";
				sql += ", '" + PNJNR_9 + "'";
				sql += ", '" + ADD_VIEW + "'";
				sql += ")";

				argStmtExec.executeUpdate(sql);
			} else {
			
				sql = "UPDATE ET_STDT_PNJNO SET ";
				sql += "  ESO_QST_DIAG = '" + QST_DIAG + "'";
				sql += ", ESO_QST_DRUG = '" + QST_DRUG + "'";
				sql += ", ESO_QST_STAT = '" + QST_STAT + "'";
				sql += ", ESO_QST_HABIT = '" + QST_HABIT + "'";
				sql += ", ESO_QST_DRUNK = '" + QST_DRUNK + "'";
				sql += ", ESO_QST_SMOKE = '" + QST_SMOKE + "'";
				sql += ", ESO_QST_SPORT = '" + QST_SPORT + "'";
				sql += ", ESO_QST_WEIGHT = '" + QST_WEIGHT + "'";
				sql += ", ESO_QST_INJURE = '" + QST_INJURE + "'";
				sql += ", ESO_PNJNB_1 = '" + PNJNB_1 + "'";
				sql += ", ESO_PNJNB_2 = '" + PNJNB_2 + "'";
				sql += ", ESO_PNJNB_3 = '" + PNJNB_3 + "'";
				sql += ", ESO_PNJNB_4 = '" + PNJNB_4 + "'";
				sql += ", ESO_PNJNB_5 = '" + PNJNB_5 + "'";
				sql += ", ESO_PNJNB_6 = '" + PNJNB_6 + "'";
				sql += ", ESO_PNJNB_7 = '" + PNJNB_7 + "'";
				sql += ", ESO_PNJNB_8 = '" + PNJNB_8 + "'";
				sql += ", ESO_PNJNB_ETC = '" + PNJNB_ETC + "'";
				sql += ", ESO_PNJNB_ETC2 = '" + PNJNB_ETC2 + "'";
				sql += ", ESO_PNJNR_1 = '" + PNJNR_1 + "'";
				sql += ", ESO_PNJNR_2 = '" + PNJNR_2 + "'";
				sql += ", ESO_PNJNR_3 = '" + PNJNR_3 + "'";
				sql += ", ESO_PNJNR_4 = '" + PNJNR_4 + "'";
				sql += ", ESO_PNJNR_5 = '" + PNJNR_5 + "'";
				sql += ", ESO_PNJNR_6 = '" + PNJNR_6 + "'";
				sql += ", ESO_PNJNR_7 = '" + PNJNR_7 + "'";
				sql += ", ESO_PNJNR_8 = '" + PNJNR_8 + "'";
				sql += ", ESO_PNJNR_9 = '" + PNJNR_9 + "'";
				sql += ", ESO_PNJNR_ETC = '" + PNJNR_ETC + "'";
				sql += ", ESO_PNJNR_ETC2 = '" + PNJNR_ETC2 + "'";
				sql += ", ESO_PNJNRD_1 = '" + PNJNRD_1 + "'";
				sql += ", ESO_PNJNRD_2 = '" + PNJNRD_2 + "'";
				sql += ", ESO_PNJNRD_3 = '" + PNJNRD_3 + "'";
				sql += ", ESO_PNJNRD_4 = '" + PNJNRD_4 + "'";
				sql += ", ESO_PNJN_A = '" + PNJN_A + "'";
				sql += ", ESO_PNJN_B = '" + PNJN_B + "'";
				sql += ", ESO_PNJN_R = '" + PNJN_R + "'";
				sql += ", ESO_PNJN_RD = '" + PNJN_RD + "'";
				sql += ", ESO_EXAM_VIEW = '" + EXAM_VIEW + "'";
				sql += ", ESO_EXAM_ACT = '" + EXAM_ACT + "'";
				sql += ", ESO_ADD_VIEW = '" + ADD_VIEW + "'";
				sql += ", ESO_EPNJN_DT = '" + EPNJN_DT + "'";
				sql += ", ESO_EIFRM_DT = '" + EIFRM_DT + "'";
				sql += ", ESO_EXAM_DR = '" + EXAM_DR + "'";
				sql += ", ESO_EPNJN_YN = '" + EPNJN_YN + "'";
				sql += ", ESO_MODI_ID = '" + USER_ID + "'";
				sql += ", ESO_MODI_DTT = SYSDATE";
				sql += " WHERE ESO_EXAM_DT = '" + EXAM_DT + "'";
				sql += " AND ESO_EXAM_SQ = '" + EXAM_SQ + "'";

				argStmtExec.executeUpdate(sql);
			}

		} catch (Exception e) {

			throw new FuncException(e.toString(), sql);
		}

		return sql;
	}
%>
