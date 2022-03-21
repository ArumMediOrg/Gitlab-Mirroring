<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%!
	public String func_omr_SpResultUpdate_001(Statement argStmtExec, HashMap argHtMethod) throws Exception {

		String sql = "";
		String sql2 = "";
		String sql_disp = "";

		try {

			String RSLT_VL = (String) argHtMethod.get("RSLT_VL");
			String EXAM_SQ = (String) argHtMethod.get("EXAM_SQ");
			String EXAM_DT = (String) argHtMethod.get("EXAM_DT");
			String ITEM_CD = (String) argHtMethod.get("ITEM_CD");

			//
			if(RSLT_VL == null) { RSLT_VL = ""; }
			if(EXAM_SQ == null) { EXAM_SQ = ""; }
			if(EXAM_DT == null) { EXAM_DT = ""; }
			if(ITEM_CD == null) { ITEM_CD = ""; }

			//
			RSLT_VL = CTr.Replace(RSLT_VL, "'", "''");
			EXAM_SQ = CTr.Replace(EXAM_SQ, "'", "''");
			EXAM_DT = CTr.Replace(EXAM_DT, "'", "''");
			ITEM_CD = CTr.Replace(ITEM_CD, "'", "''");

			sql = "UPDATE ET_RSLT_ITEM SET ";
			sql += "  ERI_RSLT_VL = '" + RSLT_VL + "'";
			sql += " WHERE ERI_EXAM_SQ = '" + EXAM_SQ + "'";
			sql += " AND ERI_EXAM_DT = '" + EXAM_DT + "'";
			sql += " AND ERI_ITEM_CD = '" + ITEM_CD + "'";

			argStmtExec.executeUpdate(sql);

		} catch (Exception e) {

			throw new FuncException(e.toString(), sql);
		}

		return sql;
	}
%>
