<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%!
	public String func_uIT_ITEM_QUESTION_APPLY_UP_Save_001(Statement argStmtExec, HashMap argHtMethod) throws Exception {

		String sql = "";
		String sql2 = "";
		String sql_disp = "";

		try {

			String GUSER = (String) argHtMethod.get("GUSER");
			String APLY_DT = (String) argHtMethod.get("APLY_DT");
			String ITEM_CD = (String) argHtMethod.get("ITEM_CD");

			//
			if(GUSER == null) { GUSER = ""; }
			if(APLY_DT == null) { APLY_DT = ""; }
			if(ITEM_CD == null) { ITEM_CD = ""; }

			//
			GUSER = CTr.Replace(GUSER, "'", "''");
			APLY_DT = CTr.Replace(APLY_DT, "'", "''");
			ITEM_CD = CTr.Replace(ITEM_CD, "'", "''");

			sql = "INSERT INTO IT_ITEM_QUESTION_LOG";
			sql += " SELECT '" + GUSER + "', SYSDATE, IIQ_APLY_DT, IIQ_ITEM_CD, IIQ_SORT_NO, IIQ_QGTN_CD, IIQ_ITQU_LV1, IIQ_ITQU_LV2, IIQ_ITQU_SQ, IIQ_ITQU_TX, IIQ_USE_YN, IIQ_NUSE_ID, IIQ_NUSE_DTT, IIQ_INPT_ID, IIQ_INPT_DTT, IIQ_ITQU_MC";
			sql += " FROM IT_ITEM_QUESTION";
			sql += " WHERE IIQ_APLY_DT = '" + APLY_DT + "'";
			sql += " AND IIQ_ITEM_CD = '" + ITEM_CD + "'";

			argStmtExec.executeUpdate(sql);

		} catch (Exception e) {

			throw new FuncException(e.toString(), sql);
		}

		return sql;
	}
%>
