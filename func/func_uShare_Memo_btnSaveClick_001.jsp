<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%!
	public String func_uShare_Memo_btnSaveClick_001(Statement argStmtExec, HashMap argHtMethod) throws Exception {

		String sql = "";
		String sql2 = "";
		String sql_disp = "";

		try {

			String SAVE_KD = (String) argHtMethod.get("SAVE_KD");
			String PSNL_NM = (String) argHtMethod.get("PSNL_NM");
			String COMP_CD = (String) argHtMethod.get("COMP_CD");
			String LEAD_KD = (String) argHtMethod.get("LEAD_KD");
			String MEMO_TX = (String) argHtMethod.get("MEMO_TX");
			String RGST_ID = (String) argHtMethod.get("RGST_ID");
			String RGST_DT = (String) argHtMethod.get("RGST_DT");
			String RGST_SQ = (String) argHtMethod.get("RGST_SQ");
			String TITLE_NM = (String) argHtMethod.get("TITLE_NM");


			//
			if(SAVE_KD == null) { SAVE_KD = ""; }
			if(PSNL_NM == null) { PSNL_NM = ""; }
			if(COMP_CD == null) { COMP_CD = ""; }
			if(LEAD_KD == null) { LEAD_KD = ""; }
			if(MEMO_TX == null) { MEMO_TX = ""; }
			if(RGST_ID == null) { RGST_ID = ""; }
			if(RGST_DT == null) { RGST_DT = ""; }
			if(RGST_SQ == null) { RGST_SQ = ""; }
			if(TITLE_NM == null) { TITLE_NM = ""; }

			//
			SAVE_KD = CTr.Replace(SAVE_KD, "'", "''");
			PSNL_NM = CTr.Replace(PSNL_NM, "'", "''");
			COMP_CD = CTr.Replace(COMP_CD, "'", "''");
			LEAD_KD = CTr.Replace(LEAD_KD, "'", "''");
			MEMO_TX = CTr.Replace(MEMO_TX, "'", "''");
			RGST_ID = CTr.Replace(RGST_ID, "'", "''");
			RGST_DT = CTr.Replace(RGST_DT, "'", "''");
			RGST_SQ = CTr.Replace(RGST_SQ, "'", "''");
			TITLE_NM = CTr.Replace(TITLE_NM, "'", "''");

			if(SAVE_KD.equals("I")) {

				sql = "INSERT INTO IT_SHARE_MEMO (ISM_RGST_DT, ISM_RGST_SQ, ISM_PSNL_NM, ISM_COMP_CD, ISM_LEAD_KD, ISM_MEMO_TX, ISM_RGST_ID, ISM_TITLE_NM)";
				sql += " SELECT ";
				sql += "  TO_CHAR(SYSDATE, 'YYYY-MM-DD')";
				sql += ", NVL(MAX(ISM_RGST_SQ), 0) + 1";
				sql += ", '" + PSNL_NM + "'";
				sql += ", '" + COMP_CD + "'";
				sql += ", '" + LEAD_KD + "'";
				sql += ", '" + MEMO_TX + "'";
				sql += ", '" + RGST_ID + "'";
				sql += ", '" + TITLE_NM + "'";
				sql += " FROM IT_SHARE_MEMO";
				sql += " WHERE ISM_RGST_DT = TO_CHAR(SYSDATE, 'YYYY-MM-DD')";

				argStmtExec.executeUpdate(sql);

			} else if(SAVE_KD.equals("U")) {

				sql = "UPDATE IT_SHARE_MEMO SET ";
				sql += "  ISM_PSNL_NM = '" + PSNL_NM + "'";
				sql += ", ISM_COMP_CD = '" + COMP_CD + "'";
				sql += ", ISM_LEAD_KD = '" + LEAD_KD + "'";
				sql += ", ISM_MEMO_TX = '" + MEMO_TX + "'";
				sql += ", ISM_TITLE_NM = '" + TITLE_NM + "'";
				sql += " WHERE ISM_RGST_DT = '" + RGST_DT + "'";
				sql += " AND ISM_RGST_SQ = '" + RGST_SQ + "'";

				argStmtExec.executeUpdate(sql);

			} else if(SAVE_KD.equals("D")) {

				sql = "DELETE IT_SHARE_MEMO";
				sql += " WHERE ISM_RGST_DT = '" + RGST_DT + "'";
				sql += " AND ISM_RGST_SQ = '" + RGST_SQ + "'";
				sql += " AND ISM_RGST_ID = '" + RGST_ID + "'";

				argStmtExec.executeUpdate(sql);

			}

		} catch (Exception e) {

			throw new FuncException(e.toString(), sql);
		}

		return sql;
	}
%>