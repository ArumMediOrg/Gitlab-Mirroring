<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%!
	public String func_uExam_Result_upSetFrstGenSort_002(Statement argStmtExec, HashMap argHtMethod) throws Exception {

		String sql = "";
		String sql2 = "";
		String sql_disp = "";

		try {

			String EXAM_DT = (String) argHtMethod.get("EXAM_DT");
			String EXAM_SQ = (String) argHtMethod.get("EXAM_SQ");

			//
			if(EXAM_DT == null) { EXAM_DT = ""; }
			if(EXAM_SQ == null) { EXAM_SQ = ""; }

			//
			EXAM_DT = CTr.Replace(EXAM_DT, "'", "''");
			EXAM_SQ = CTr.Replace(EXAM_SQ, "'", "''");

			sql = "UPDATE ET_RSLT_ITEM A SET ";
			sql += "  A.ERI_SORT_SQ = NVL((SELECT B.IHS_SORT_SQ FROM IT_HTSB_SEQ B";
			sql += " WHERE B.IHS_ITEM_CD = A.ERI_ITEM_CD), A.ERI_SORT_SQ + 1000)";
			sql += " WHERE A.ERI_EXAM_DT = '" + EXAM_DT + "'";
			sql += " AND A.ERI_EXAM_SQ = '" + EXAM_SQ + "'";

			argStmtExec.executeUpdate(sql);

		} catch (Exception e) {

			throw new FuncException(e.toString(), sql);
		}

		return sql;
	}
%>
