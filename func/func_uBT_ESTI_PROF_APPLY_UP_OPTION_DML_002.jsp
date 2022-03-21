<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%!
	public String func_uBT_ESTI_PROF_APPLY_UP_OPTION_DML_002(Statement argStmtExec, HashMap argHtMethod) throws Exception {

		String sql = "";
		String sql2 = "";
		String sql_disp = "";

		try {

			String MNGT_YR = (String) argHtMethod.get("MNGT_YR");
			String ESTI_CD = (String) argHtMethod.get("ESTI_CD");
			String PROF_SQ = (String) argHtMethod.get("PROF_SQ");
			String OPTN_SQ = (String) argHtMethod.get("OPTN_SQ");
			String ITEM_CD = (String) argHtMethod.get("ITEM_CD");
			String SORT_SQ = (String) argHtMethod.get("SORT_SQ");
			String ITEM_PR = (String) argHtMethod.get("ITEM_PR");
			String INPT_ID = (String) argHtMethod.get("INPT_ID");

			//
			if(MNGT_YR == null) { MNGT_YR = ""; }
			if(ESTI_CD == null) { ESTI_CD = ""; }
			if(PROF_SQ == null) { PROF_SQ = ""; }
			if(OPTN_SQ == null) { OPTN_SQ = ""; }
			if(ITEM_CD == null) { ITEM_CD = ""; }
			if(SORT_SQ == null) { SORT_SQ = ""; }
			if(ITEM_PR == null) { ITEM_PR = ""; }
			if(INPT_ID == null) { INPT_ID = ""; }

			//
			MNGT_YR = CTr.Replace(MNGT_YR, "'", "''");
			ESTI_CD = CTr.Replace(ESTI_CD, "'", "''");
			PROF_SQ = CTr.Replace(PROF_SQ, "'", "''");
			OPTN_SQ = CTr.Replace(OPTN_SQ, "'", "''");
			ITEM_CD = CTr.Replace(ITEM_CD, "'", "''");
			SORT_SQ = CTr.Replace(SORT_SQ, "'", "''");
			ITEM_PR = CTr.Replace(ITEM_PR, "'", "''");
			INPT_ID = CTr.Replace(INPT_ID, "'", "''");

			sql = "INSERT INTO BT_ESTI_OPTN_ITEM (BEM_MNGT_YR,BEM_ESTI_CD,BEM_PROF_SQ,BEM_OPTN_SQ,BEM_ITEM_CD ,BEM_SORT_SQ,BEM_ITEM_PR,BEM_INPT_ID,BEM_INPT_DTT) VALUES (";
			sql += "  '" + MNGT_YR + "'";
			sql += ", '" + ESTI_CD + "'";
			sql += ", '" + PROF_SQ + "'";
			sql += ", '" + OPTN_SQ + "'";
			sql += ", '" + ITEM_CD + "'";
			sql += ", '" + SORT_SQ + "'";
			sql += ", '" + ITEM_PR + "'";
			sql += ", '" + INPT_ID + "'";
			sql += ", SYSDATE";
			sql += ")";

			argStmtExec.executeUpdate(sql);

		} catch (Exception e) {

			throw new FuncException(e.toString(), sql);
		}

		return sql;
	}
%>
