<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%!
	public String func_uCT_QUESTION_APPLY_UP_Save_001_TRAN001(Statement argStmtExec, HashMap argHtMethod) throws Exception {

		String sql = "";
		String sql2 = "";
		String sql_disp = "";

		try {

			String USE_YN = (String) argHtMethod.get("USE_YN");
			String QSTN_CD = (String) argHtMethod.get("QSTN_CD");
			String EXEM_CD = (String) argHtMethod.get("EXEM_CD");
			String QSKD_CD = (String) argHtMethod.get("QSKD_CD");
			String QSTN_SQ = (String) argHtMethod.get("QSTN_SQ");
			String QSTN_LV = (String) argHtMethod.get("QSTN_LV");
			String QSTN_NM = (String) argHtMethod.get("QSTN_NM");
			String ANSR_CD = (String) argHtMethod.get("ANSR_CD");
			String ANSE_EX = (String) argHtMethod.get("ANSE_EX");
			String QSTN_CP = (String) argHtMethod.get("QSTN_CP");
			String DEFULT = (String) argHtMethod.get("DEFULT");
			String SCOR_YN = (String) argHtMethod.get("SCOR_YN");
			String SCOR_CNT = (String) argHtMethod.get("SCOR_CNT");
			String SCOR_NO = (String) argHtMethod.get("SCOR_NO");
			String SCOR_SCR = (String) argHtMethod.get("SCOR_SCR");
			String INPT_ID = (String) argHtMethod.get("INPT_ID");
			String NUSE_ID = (String) argHtMethod.get("NUSE_ID");
			String SEX_CD = (String) argHtMethod.get("SEX_CD");
			//
			if(USE_YN == null) { USE_YN = ""; }
			if(QSTN_CD == null) { QSTN_CD = ""; }
			if(EXEM_CD == null) { EXEM_CD = ""; }
			if(QSKD_CD == null) { QSKD_CD = ""; }
			if(QSTN_SQ == null) { QSTN_SQ = ""; }
			if(QSTN_LV == null) { QSTN_LV = ""; }
			if(QSTN_NM == null) { QSTN_NM = ""; }
			if(ANSR_CD == null) { ANSR_CD = ""; }
			if(ANSE_EX == null) { ANSE_EX = ""; }
			if(QSTN_CP == null) { QSTN_CP = ""; }
			if(DEFULT == null) { DEFULT = ""; }
			if(SCOR_YN == null) { SCOR_YN = ""; }
			if(SCOR_CNT == null) { SCOR_CNT = ""; }
			if(SCOR_NO == null) { SCOR_NO = ""; }
			if(SCOR_SCR == null) { SCOR_SCR = ""; }
			if(INPT_ID == null) { INPT_ID = ""; }
			if(NUSE_ID == null) { NUSE_ID = ""; }
			if(SEX_CD == null) { SEX_CD = ""; }

			//
			USE_YN = CTr.Replace(USE_YN, "'", "''");
			QSTN_CD = CTr.Replace(QSTN_CD, "'", "''");
			EXEM_CD = CTr.Replace(EXEM_CD, "'", "''");
			QSKD_CD = CTr.Replace(QSKD_CD, "'", "''");
			QSTN_SQ = CTr.Replace(QSTN_SQ, "'", "''");
			QSTN_LV = CTr.Replace(QSTN_LV, "'", "''");
			QSTN_NM = CTr.Replace(QSTN_NM, "'", "''");
			ANSR_CD = CTr.Replace(ANSR_CD, "'", "''");
			ANSE_EX = CTr.Replace(ANSE_EX, "'", "''");
			QSTN_CP = CTr.Replace(QSTN_CP, "'", "''");
			DEFULT = CTr.Replace(DEFULT, "'", "''");
			SCOR_YN = CTr.Replace(SCOR_YN, "'", "''");
			SCOR_CNT = CTr.Replace(SCOR_CNT, "'", "''");
			SCOR_NO = CTr.Replace(SCOR_NO, "'", "''");
			SCOR_SCR = CTr.Replace(SCOR_SCR, "'", "''");
			INPT_ID = CTr.Replace(INPT_ID, "'", "''");
			NUSE_ID = CTr.Replace(NUSE_ID, "'", "''");
			SEX_CD = CTr.Replace(SEX_CD, "'", "''");

			if(USE_YN.equals("Y")) {
				sql = "INSERT INTO CT_QUESTION (CQN_QSTN_CD, CQN_EXEM_CD, CQN_QSKD_CD, CQN_QSTN_SQ, CQN_QSTN_LV, CQN_QSTN_NM, CQN_ANSR_CD, ";
				sql += " CQN_ANSE_EX, CQN_QSTN_CP, CQN_DEFULT, CQN_SCOR_YN, CQN_SCOR_CNT, CQN_SCOR_NO, CQN_SCOR_SCR, CQN_SEX_CD, CQN_USE_YN, CQN_INPT_ID, CQN_INPT_DTT) VALUES (";
				sql += "  '" + QSTN_CD + "'";
				sql += ", '" + EXEM_CD + "'";
				sql += ", '" + QSKD_CD + "'";
				sql += ", '" + QSTN_SQ + "'";
				sql += ", '" + QSTN_LV + "'";
				sql += ", '" + QSTN_NM + "'";
				sql += ", '" + ANSR_CD + "'";
				sql += ", '" + ANSE_EX + "'";
				sql += ", '" + QSTN_CP + "'";
				sql += ", '" + DEFULT + "'";
				sql += ", '" + SCOR_YN + "'";
				sql += ", '" + SCOR_CNT + "'";
				sql += ", '" + SCOR_NO + "'";
				sql += ", '" + SCOR_SCR + "'";
				sql += ", '" + SEX_CD + "'";
				sql += ", '" + USE_YN + "'";
				sql += ", '" + INPT_ID + "'";
				sql += ", SYSDATE";
				sql += ")";

				argStmtExec.executeUpdate(sql);
			}
			else {
				sql = "INSERT INTO CT_QUESTION (CQN_QSTN_CD, CQN_EXEM_CD, CQN_QSKD_CD, CQN_QSTN_SQ, CQN_QSTN_LV, CQN_QSTN_NM, CQN_ANSR_CD, ";
				sql += " CQN_ANSE_EX, CQN_QSTN_CP, CQN_DEFULT, CQN_SCOR_YN, CQN_SCOR_CNT, CQN_SCOR_NO, CQN_SCOR_SCR, CQN_SEX_CD, CQN_USE_YN, CQN_NUSE_ID, CQN_NUSE_DTT, CQN_INPT_ID, CQN_INPT_DTT) VALUES (";
				sql += "  '" + QSTN_CD + "'";
				sql += ", '" + EXEM_CD + "'";
				sql += ", '" + QSKD_CD + "'";
				sql += ", '" + QSTN_SQ + "'";
				sql += ", '" + QSTN_LV + "'";
				sql += ", '" + QSTN_NM + "'";
				sql += ", '" + ANSR_CD + "'";
				sql += ", '" + ANSE_EX + "'";
				sql += ", '" + QSTN_CP + "'";
				sql += ", '" + DEFULT + "'";
				sql += ", '" + SCOR_YN + "'";
				sql += ", '" + SCOR_CNT + "'";
				sql += ", '" + SCOR_NO + "'";
				sql += ", '" + SCOR_SCR + "'";
				sql += ", '" + SEX_CD + "'";
				sql += ", '" + USE_YN + "'";
				sql += ", '" + NUSE_ID + "'";
				sql += ", SYSDATE";
				sql += ", '" + INPT_ID + "'";
				sql += ", SYSDATE";
				sql += ")";

				argStmtExec.executeUpdate(sql);
			}
		} catch (Exception e) {

			throw new FuncException(e.toString(), sql);
		}

		return sql;
	}
%>
