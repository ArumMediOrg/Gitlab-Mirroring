<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%!
	public String func_uBT_ESTI_PROF_APPLY_UP_OPTION_DML_001(Statement argStmtExec, HashMap argHtMethod) throws Exception {

		String sql = "";
		String sql2 = "";
		String sql_disp = "";

		try {

			String SUSE_YN = (String) argHtMethod.get("SUSE_YN");
			String MNGT_YR = (String) argHtMethod.get("MNGT_YR");
			String ESTI_CD = (String) argHtMethod.get("ESTI_CD");
			String PROF_SQ = (String) argHtMethod.get("PROF_SQ");
			String OPTN_SQ = (String) argHtMethod.get("OPTN_SQ");
			String OPTN_NM = (String) argHtMethod.get("OPTN_NM");
			String OPTN_CNT = (String) argHtMethod.get("OPTN_CNT");
			String OPTN_PR = (String) argHtMethod.get("OPTN_PR");
			String USE_YN = (String) argHtMethod.get("USE_YN");
			String NUSE_ID = (String) argHtMethod.get("NUSE_ID");
			String INPT_ID = (String) argHtMethod.get("INPT_ID");

			//
			if(SUSE_YN == null) { SUSE_YN = ""; }
			if(MNGT_YR == null) { MNGT_YR = ""; }
			if(ESTI_CD == null) { ESTI_CD = ""; }
			if(PROF_SQ == null) { PROF_SQ = ""; }
			if(OPTN_SQ == null) { OPTN_SQ = ""; }
			if(OPTN_NM == null) { OPTN_NM = ""; }
			if(OPTN_CNT == null) { OPTN_CNT = ""; }
			if(OPTN_PR == null) { OPTN_PR = ""; }
			if(USE_YN == null) { USE_YN = ""; }
			if(NUSE_ID == null) { NUSE_ID = ""; }
			if(INPT_ID == null) { INPT_ID = ""; }

			//
			SUSE_YN = CTr.Replace(SUSE_YN, "'", "''");
			MNGT_YR = CTr.Replace(MNGT_YR, "'", "''");
			ESTI_CD = CTr.Replace(ESTI_CD, "'", "''");
			PROF_SQ = CTr.Replace(PROF_SQ, "'", "''");
			OPTN_SQ = CTr.Replace(OPTN_SQ, "'", "''");
			OPTN_NM = CTr.Replace(OPTN_NM, "'", "''");
			OPTN_CNT = CTr.Replace(OPTN_CNT, "'", "''");
			OPTN_PR = CTr.Replace(OPTN_PR, "'", "''");
			USE_YN = CTr.Replace(USE_YN, "'", "''");
			NUSE_ID = CTr.Replace(NUSE_ID, "'", "''");
			INPT_ID = CTr.Replace(INPT_ID, "'", "''");

			if(SUSE_YN.equals("N")) {
				sql = "INSERT INTO BT_ESTI_OPTN (BEO_MNGT_YR, BEO_ESTI_CD, BEO_PROF_SQ, BEO_OPTN_SQ, BEO_OPTN_NM, BEO_OPTN_CNT, BEO_OPTN_PR, BEO_USE_YN, BEO_NUSE_ID, BEO_NUSE_DTT, BEO_INPT_ID, BEO_INPT_DTT) VALUES (";
				sql += "  '" + MNGT_YR + "'";
				sql += ", '" + ESTI_CD + "'";
				sql += ", '" + PROF_SQ + "'";
				sql += ", '" + OPTN_SQ + "'";
				sql += ", '" + OPTN_NM + "'";
				sql += ", '" + OPTN_CNT + "'";
				sql += ", '" + OPTN_PR + "'";
				sql += ", '" + USE_YN + "'";
				sql += ", '" + NUSE_ID + "'";
				sql += ", SYSDATE";
				sql += ", '" + INPT_ID + "'";
				sql += ", SYSDATE";
				sql += ")";

				argStmtExec.executeUpdate(sql);

			} else {
				sql = "INSERT INTO BT_ESTI_OPTN (BEO_MNGT_YR, BEO_ESTI_CD, BEO_PROF_SQ, BEO_OPTN_SQ, BEO_OPTN_NM, BEO_OPTN_CNT, BEO_OPTN_PR, BEO_USE_YN, BEO_INPT_ID, BEO_INPT_DTT) VALUES (";
				sql += "  '" + MNGT_YR + "'";
				sql += ", '" + ESTI_CD + "'";
				sql += ", '" + PROF_SQ + "'";
				sql += ", '" + OPTN_SQ + "'";
				sql += ", '" + OPTN_NM + "'";
				sql += ", '" + OPTN_CNT + "'";
				sql += ", '" + OPTN_PR + "'";
				sql += ", '" + USE_YN + "'";
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
