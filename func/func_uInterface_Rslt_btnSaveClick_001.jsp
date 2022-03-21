<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%!
	public String func_uInterface_Rslt_btnSaveClick_001(Statement argStmtExec, HashMap argHtMethod) throws Exception {

		String sql = "";
		String sql2 = "";
		String sql_disp = "";

		try {

			String COLUMN = (String) argHtMethod.get("COLUMN");
			String PACS_RSLT = (String) argHtMethod.get("PACS_RSLT");
			String EXAM_DT = (String) argHtMethod.get("EXAM_DT");
			String EXAM_SQ = (String) argHtMethod.get("EXAM_SQ");
			String ITEM_CD = (String) argHtMethod.get("ITEM_CD");

			//
			if(COLUMN == null) { COLUMN = ""; }
			if(PACS_RSLT == null) { PACS_RSLT = ""; }
			if(EXAM_DT == null) { EXAM_DT = ""; }
			if(EXAM_SQ == null) { EXAM_SQ = ""; }
			if(ITEM_CD == null) { ITEM_CD = ""; }

			//
			COLUMN = CTr.Replace(COLUMN, "'", "''");
			PACS_RSLT = CTr.Replace(PACS_RSLT, "'", "''");
			EXAM_DT = CTr.Replace(EXAM_DT, "'", "''");
			EXAM_SQ = CTr.Replace(EXAM_SQ, "'", "''");
			ITEM_CD = CTr.Replace(ITEM_CD, "'", "''");

			sql = "UPDATE ET_RSLT_ITEM SET ";
			sql += COLUMN + " = '" + PACS_RSLT + "'";
			sql += " WHERE ERI_EXAM_DT = '" + EXAM_DT + "'";
			sql += " AND ERI_EXAM_SQ = '" + EXAM_SQ + "'";
			sql += " AND ERI_ITEM_CD = '" + ITEM_CD + "'";

			argStmtExec.executeUpdate(sql);

		} catch (Exception e) {

			throw new FuncException(e.toString(), sql);
		}

		return sql;
	}
%>
