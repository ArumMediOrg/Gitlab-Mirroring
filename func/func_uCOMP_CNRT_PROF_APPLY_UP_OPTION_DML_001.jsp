<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%!
	public String func_uCOMP_CNRT_PROF_APPLY_UP_OPTION_DML_001(Statement argStmtExec, HashMap argHtMethod) throws Exception {

		String sql = "";
		String sql2 = "";
		String sql_disp = "";

		try {

			String SOPTN_SQ = (String) argHtMethod.get("SOPTN_SQ");
			String COMP_CD = (String) argHtMethod.get("COMP_CD");
			String MNGT_YR = (String) argHtMethod.get("MNGT_YR");
			String CNRT_SQ = (String) argHtMethod.get("CNRT_SQ");
			String PROF_SQ = (String) argHtMethod.get("PROF_SQ");
			String OPTN_SQ = (String) argHtMethod.get("OPTN_SQ");
			String OPTN_NM = (String) argHtMethod.get("OPTN_NM");
			String OPTN_CNT = (String) argHtMethod.get("OPTN_CNT");
			String OPTN_PR = (String) argHtMethod.get("OPTN_PR");
			String OPTN_LT = (String) argHtMethod.get("OPTN_LT");
			String USE_YN = (String) argHtMethod.get("USE_YN");
			String USER_ID = (String) argHtMethod.get("USER_ID");

			//
			if(SOPTN_SQ == null) { SOPTN_SQ = ""; }
			if(COMP_CD == null) { COMP_CD = ""; }
			if(MNGT_YR == null) { MNGT_YR = ""; }
			if(CNRT_SQ == null) { CNRT_SQ = ""; }
			if(PROF_SQ == null) { PROF_SQ = ""; }
			if(OPTN_SQ == null) { OPTN_SQ = ""; }
			if(OPTN_NM == null) { OPTN_NM = ""; }
			if(OPTN_CNT == null) { OPTN_CNT = ""; }
			if(OPTN_PR == null) { OPTN_PR = ""; }
			if(OPTN_LT == null) { OPTN_LT = ""; }
			if(USE_YN == null) { USE_YN = ""; }
			if(USER_ID == null) { USER_ID = ""; }

			//
			SOPTN_SQ = CTr.Replace(SOPTN_SQ, "'", "''");
			COMP_CD = CTr.Replace(COMP_CD, "'", "''");
			MNGT_YR = CTr.Replace(MNGT_YR, "'", "''");
			CNRT_SQ = CTr.Replace(CNRT_SQ, "'", "''");
			PROF_SQ = CTr.Replace(PROF_SQ, "'", "''");
			OPTN_SQ = CTr.Replace(OPTN_SQ, "'", "''");
			OPTN_NM = CTr.Replace(OPTN_NM, "'", "''");
			OPTN_CNT = CTr.Replace(OPTN_CNT, "'", "''");
			OPTN_PR = CTr.Replace(OPTN_PR, "'", "''");
			OPTN_LT = CTr.Replace(OPTN_LT, "'", "''");
			USE_YN = CTr.Replace(USE_YN, "'", "''");
			USER_ID = CTr.Replace(USER_ID, "'", "''");

			if(SOPTN_SQ.equals("")){
				sql = "INSERT INTO ET_COMP_CNRT_OPTN (ECO_COMP_CD, ECO_MNGT_YR, ECO_CNRT_SQ, ECO_PROF_SQ, ECO_OPTN_SQ, ECO_OPTN_NM, ECO_OPTN_CNT, ECO_OPTN_PR, ECO_OPTN_LT, ECO_USE_YN, ECO_INPT_ID, ECO_INPT_DTT) VALUES (";
				sql += "  '" + COMP_CD + "'";
				sql += ", '" + MNGT_YR + "'";
				sql += ", '" + CNRT_SQ + "'";
				sql += ", '" + PROF_SQ + "'";
				sql += ", '" + OPTN_SQ + "'";
				sql += ", '" + OPTN_NM + "'";
				sql += ", '" + OPTN_CNT + "'";
				sql += ", '" + OPTN_PR + "'";
				sql += ", '" + OPTN_LT + "'";
				sql += ", '" + USE_YN + "'";
				sql += ", '" + USER_ID + "'";
				sql += ", SYSDATE";
				sql += ")";

				argStmtExec.executeUpdate(sql);
			}
			else{
				sql = "UPDATE ET_COMP_CNRT_OPTN SET ";
				sql += "  ECO_OPTN_NM = '" + OPTN_NM + "'";
				sql += ", ECO_OPTN_CNT = '" + OPTN_CNT + "'";
				sql += ", ECO_OPTN_PR = '" + OPTN_PR + "'";
				sql += ", ECO_OPTN_LT = '" + OPTN_LT + "'";
				sql += ", ECO_USE_YN = '" + USE_YN + "'";
				sql += ", ECO_MODI_ID = '" + USER_ID + "'";
				sql += ", ECO_MODI_DTT = SYSDATE";
				sql += " WHERE ECO_COMP_CD = '" + COMP_CD + "'";
				sql += " AND ECO_MNGT_YR = '" + MNGT_YR + "'";
				sql += " AND ECO_CNRT_SQ = '" + CNRT_SQ + "'";
				sql += " AND ECO_PROF_SQ = '" + PROF_SQ + "'";
				sql += " AND ECO_OPTN_SQ = '" + OPTN_SQ + "'";

				argStmtExec.executeUpdate(sql);
			}
		} catch (Exception e) {

			throw new FuncException(e.toString(), sql);
		}

		return sql;
	}
%>
