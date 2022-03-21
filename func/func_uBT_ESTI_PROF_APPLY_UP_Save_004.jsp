<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%!
	public String func_uBT_ESTI_PROF_APPLY_UP_Save_004(Statement argStmtExec, HashMap argHtMethod) throws Exception {

		String sql = "";
		String sql2 = "";
		String sql_disp = "";

		try {

			String MNGT_YR = (String) argHtMethod.get("MNGT_YR");
			String ESTI_CD = (String) argHtMethod.get("ESTI_CD");
			String PROF_SQ = (String) argHtMethod.get("PROF_SQ");
			String ITEM_CD = (String) argHtMethod.get("ITEM_CD");
			String SORT_SQ = (String) argHtMethod.get("SORT_SQ");
			String ITEM_PR = (String) argHtMethod.get("ITEM_PR");
			String ESTI_PR = (String) argHtMethod.get("ESTI_PR");
			String INPT_ID = (String) argHtMethod.get("INPT_ID");

			//
			if(MNGT_YR == null) { MNGT_YR = ""; }
			if(ESTI_CD == null) { ESTI_CD = ""; }
			if(PROF_SQ == null) { PROF_SQ = ""; }
			if(ITEM_CD == null) { ITEM_CD = ""; }
			if(SORT_SQ == null) { SORT_SQ = ""; }
			if(ITEM_PR == null) { ITEM_PR = ""; }
			if(ESTI_PR == null) { ESTI_PR = ""; }
			if(INPT_ID == null) { INPT_ID = ""; }

			//
			MNGT_YR = CTr.Replace(MNGT_YR, "'", "''");
			ESTI_CD = CTr.Replace(ESTI_CD, "'", "''");
			PROF_SQ = CTr.Replace(PROF_SQ, "'", "''");
			ITEM_CD = CTr.Replace(ITEM_CD, "'", "''");
			SORT_SQ = CTr.Replace(SORT_SQ, "'", "''");
			ITEM_PR = CTr.Replace(ITEM_PR, "'", "''");
			ESTI_PR = CTr.Replace(ESTI_PR, "'", "''");
			INPT_ID = CTr.Replace(INPT_ID, "'", "''");

			sql = "INSERT INTO BT_ESTI_PROF_ITEM (BEI_MNGT_YR,BEI_ESTI_CD,BEI_PROF_SQ,BEI_ITEM_CD,BEI_SORT_SQ ,BEI_ITEM_PR,BEI_ESTI_PR,BEI_INPT_ID,BEI_INPT_DTT) VALUES (";
			sql += "'" + MNGT_YR + "'";
			sql += ",'" + ESTI_CD + "'";
			sql += ",'" + PROF_SQ + "'";
			sql += ",'" + ITEM_CD + "'";
			sql += ",'" + SORT_SQ + "'";
			sql += ",REPLACE('" + ITEM_PR + "',',','')";
			sql += ",REPLACE('" + ESTI_PR + "',',','')";
			sql += ",'" + INPT_ID + "'";
			sql += ",SYSDATE)";

			argStmtExec.executeUpdate(sql);
		} catch (Exception e) {

			throw new FuncException(e.toString(), sql);
		}

		return sql;
	}
%>
