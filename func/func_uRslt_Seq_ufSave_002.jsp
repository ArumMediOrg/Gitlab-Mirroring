<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%!
	public String func_uRslt_Seq_ufSave_002(Statement argStmtExec, HashMap argHtMethod) throws Exception {

		String sql = "";
		String sql2 = "";
		String sql_disp = "";

		try {

			String EXAM_KD = (String) argHtMethod.get("EXAM_KD");
			String SORT_SQ = (String) argHtMethod.get("SORT_SQ");
			String ITEM_CD = (String) argHtMethod.get("ITEM_CD");
			String INPT_ID = (String) argHtMethod.get("INPT_ID");

			//
			if(EXAM_KD == null) { EXAM_KD = ""; }
			if(SORT_SQ == null) { SORT_SQ = ""; }
			if(ITEM_CD == null) { ITEM_CD = ""; }
			if(INPT_ID == null) { INPT_ID = ""; }

			//
			EXAM_KD = CTr.Replace(EXAM_KD, "'", "''");
			SORT_SQ = CTr.Replace(SORT_SQ, "'", "''");
			ITEM_CD = CTr.Replace(ITEM_CD, "'", "''");
			INPT_ID = CTr.Replace(INPT_ID, "'", "''");

			sql = "INSERT INTO IT_HTSB_SEQ ( IHS_EXAM_KD, IHS_SORT_SQ, IHS_ITEM_CD, IHS_INPT_ID, IHS_INPT_DTT ) VALUES (";
			sql += "  '" + EXAM_KD + "'";
			sql += ", '" + SORT_SQ + "'";
			sql += ", '" + ITEM_CD + "'";
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
