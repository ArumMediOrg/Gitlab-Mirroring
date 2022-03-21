<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%!
	public String func_uCOMP_CNRT_PROF_TRNS_UP_Save_006(Statement argStmtExec, HashMap argHtMethod) throws Exception {

		String sql = "";
		String sql2 = "";
		String sql_disp = "";

		try {

			String COMP_CD = (String) argHtMethod.get("COMP_CD");
			String MNGT_YR = (String) argHtMethod.get("MNGT_YR");
			String CNRT_SQ = (String) argHtMethod.get("CNRT_SQ");
			String PROF_SQ = (String) argHtMethod.get("PROF_SQ");
			String ITEM_CD = (String) argHtMethod.get("ITEM_CD");
			String SORT_SQ = (String) argHtMethod.get("SORT_SQ");
			String ITEM_PR = (String) argHtMethod.get("ITEM_PR");
			String CNRT_PR = (String) argHtMethod.get("CNRT_PR");
			String USER_ID = (String) argHtMethod.get("USER_ID");

			//
			if(COMP_CD == null) { COMP_CD = ""; }
			if(MNGT_YR == null) { MNGT_YR = ""; }
			if(CNRT_SQ == null) { CNRT_SQ = ""; }
			if(PROF_SQ == null) { PROF_SQ = ""; }
			if(ITEM_CD == null) { ITEM_CD = ""; }
			if(SORT_SQ == null) { SORT_SQ = ""; }
			if(ITEM_PR == null) { ITEM_PR = ""; }
			if(CNRT_PR == null) { CNRT_PR = ""; }
			if(USER_ID == null) { USER_ID = ""; }

			//
			COMP_CD = CTr.Replace(COMP_CD, "'", "''");
			MNGT_YR = CTr.Replace(MNGT_YR, "'", "''");
			CNRT_SQ = CTr.Replace(CNRT_SQ, "'", "''");
			PROF_SQ = CTr.Replace(PROF_SQ, "'", "''");
			ITEM_CD = CTr.Replace(ITEM_CD, "'", "''");
			SORT_SQ = CTr.Replace(SORT_SQ, "'", "''");
			ITEM_PR = CTr.Replace(ITEM_PR, "'", "''");
			CNRT_PR = CTr.Replace(CNRT_PR, "'", "''");
			USER_ID = CTr.Replace(USER_ID, "'", "''");

			sql = "INSERT INTO ET_COMP_CNRT_PROF_ITEM (ECI_COMP_CD, ECI_MNGT_YR, ECI_CNRT_SQ, ECI_PROF_SQ, ECI_ITEM_CD, ECI_SORT_SQ, ECI_ITEM_PR, ECI_CNRT_PR, ECI_INPT_ID, ECI_INPT_DTT) VALUES (";
			sql += "  '" + COMP_CD + "'";
			sql += ", '" + MNGT_YR + "'";
			sql += ", '" + CNRT_SQ + "'";
			sql += ", '" + PROF_SQ + "'";
			sql += ", '" + ITEM_CD + "'";
			sql += ", '" + SORT_SQ + "'";
			sql += ", '" + ITEM_PR + "'";
			sql += ", '" + CNRT_PR + "'";
			sql += ", '" + USER_ID + "'";
			sql += ", SYSDATE";
			sql += ")";

			argStmtExec.executeUpdate(sql);

		} catch (Exception e) {

			throw new FuncException(e.toString(), sql);
		}

		return sql;
	}
%>
