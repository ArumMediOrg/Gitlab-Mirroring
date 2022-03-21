<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%!
	public String func_uStdt_PnjnO_UP_OralPnjn_Save_001(Statement argStmtExec, HashMap argHtMethod) throws Exception {

		String sql = "";
		String sql2 = "";
		String sql_disp = "";

		try {

			String SAVE_KD = (String) argHtMethod.get("SAVE_KD");
			String EXAM_DT = (String) argHtMethod.get("EXAM_DT");
			String EXAM_SQ = (String) argHtMethod.get("EXAM_SQ");
			String PNJN_ORAL = (String) argHtMethod.get("PNJN_ORAL");
			String ORAL_VIEW = (String) argHtMethod.get("ORAL_VIEW");
			String ORAL_ACT = (String) argHtMethod.get("ORAL_ACT");
			String OPNJN_DT = (String) argHtMethod.get("OPNJN_DT");
			String OIFRM_DT = (String) argHtMethod.get("OIFRM_DT");
			String ORAL_DR = (String) argHtMethod.get("ORAL_DR");
			String OPNJN_YN = (String) argHtMethod.get("OPNJN_YN");
			String USER_ID = (String) argHtMethod.get("USER_ID");

			//
			if(SAVE_KD == null) { SAVE_KD = ""; }
			if(EXAM_DT == null) { EXAM_DT = ""; }
			if(EXAM_SQ == null) { EXAM_SQ = ""; }
			if(PNJN_ORAL == null) { PNJN_ORAL = ""; }
			if(ORAL_VIEW == null) { ORAL_VIEW = ""; }
			if(ORAL_ACT == null) { ORAL_ACT = ""; }
			if(OPNJN_DT == null) { OPNJN_DT = ""; }
			if(OIFRM_DT == null) { OIFRM_DT = ""; }
			if(ORAL_DR == null) { ORAL_DR = ""; }
			if(OPNJN_YN == null) { OPNJN_YN = ""; }
			if(USER_ID == null) { USER_ID = ""; }

			//
			SAVE_KD = CTr.Replace(SAVE_KD, "'", "''");
			EXAM_DT = CTr.Replace(EXAM_DT, "'", "''");
			EXAM_SQ = CTr.Replace(EXAM_SQ, "'", "''");
			PNJN_ORAL = CTr.Replace(PNJN_ORAL, "'", "''");
			ORAL_VIEW = CTr.Replace(ORAL_VIEW, "'", "''");
			ORAL_ACT = CTr.Replace(ORAL_ACT, "'", "''");
			OPNJN_DT = CTr.Replace(OPNJN_DT, "'", "''");
			OIFRM_DT = CTr.Replace(OIFRM_DT, "'", "''");
			ORAL_DR = CTr.Replace(ORAL_DR, "'", "''");
			OPNJN_YN = CTr.Replace(OPNJN_YN, "'", "''");
			USER_ID = CTr.Replace(USER_ID, "'", "''");

			if(SAVE_KD.equals("I")) {

				sql = "INSERT INTO ET_STDT_PNJNO (ESO_EXAM_DT, ESO_EXAM_SQ, ESO_PNJN_ORAL, ESO_ORAL_VIEW, ESO_ORAL_ACT, ESO_OPNJN_DT, ESO_OIFRM_DT, ESO_ORAL_DR, ESO_OPNJN_YN, ESO_INPT_ID, ESO_INPT_DTT, ESO_MODI_ID, ESO_MODI_DTT) VALUES (";
				sql += "  '" + EXAM_DT + "'";
				sql += ", '" + EXAM_SQ + "'";
				sql += ", '" + PNJN_ORAL + "'";
				sql += ", '" + ORAL_VIEW + "'";
				sql += ", '" + ORAL_ACT + "'";
				sql += ", '" + OPNJN_DT + "'";
				sql += ", '" + OIFRM_DT + "'";
				sql += ", '" + ORAL_DR + "'";
				sql += ", '" + OPNJN_YN + "'";
				sql += ", '" + USER_ID + "'";
				sql += ", SYSDATE";
				sql += ", '" + USER_ID + "'";
				sql += ", SYSDATE";
				sql += ")";

				argStmtExec.executeUpdate(sql);
			} else {
			
				sql = "UPDATE ET_STDT_PNJNO SET ";
				sql += "  ESO_PNJN_ORAL = '" + PNJN_ORAL + "'";
				sql += ", ESO_ORAL_VIEW = '" + ORAL_VIEW + "'";
				sql += ", ESO_ORAL_ACT = '" + ORAL_ACT + "'";
				sql += ", ESO_OPNJN_DT = '" + OPNJN_DT + "'";
				sql += ", ESO_ORAL_DR = '" + ORAL_DR + "'";
				sql += ", ESO_OPNJN_YN = '" + OPNJN_YN + "'";
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
