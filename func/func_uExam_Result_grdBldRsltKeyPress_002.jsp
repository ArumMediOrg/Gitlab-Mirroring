<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%!
	public String func_uExam_Result_grdBldRsltKeyPress_002(Statement argStmtExec, HashMap argHtMethod) throws Exception {

		String sql = "";
		String sql2 = "";
		String sql_disp = "";

		try {

			String EXAM_DT = (String) argHtMethod.get("EXAM_DT");
			String EXAM_SQ = (String) argHtMethod.get("EXAM_SQ");
			String ITEM_CD = (String) argHtMethod.get("ITEM_CD");
			String RSLT_VL2 = (String) argHtMethod.get("RSLT_VL2");

			//
			if(EXAM_DT == null) { EXAM_DT = ""; }
			if(EXAM_SQ == null) { EXAM_SQ = ""; }
			if(ITEM_CD == null) { ITEM_CD = ""; }
			if(RSLT_VL2 == null) { RSLT_VL2 = ""; }

			//
			EXAM_DT = CTr.Replace(EXAM_DT, "'", "''");
			EXAM_SQ = CTr.Replace(EXAM_SQ, "'", "''");
			ITEM_CD = CTr.Replace(ITEM_CD, "'", "''");
			RSLT_VL2 = CTr.Replace(RSLT_VL2, "'", "''");

			sql =  " UPDATE ET_RSLT_ITEM ";
			sql += " SET ERI_RSLT_VL2  = '" + RSLT_VL2 + "' ";
			sql += " WHERE ERI_EXAM_DT = '" + EXAM_DT + "' ";
			sql += " AND ERI_EXAM_SQ = '" + EXAM_SQ + "' ";
			sql += " AND ERI_ITEM_CD = '" + ITEM_CD + "' ";

			argStmtExec.executeUpdate(sql);

		} catch (Exception e) {
			throw new FuncException(e.toString(), sql);
		}

		return sql;
	}
%>
