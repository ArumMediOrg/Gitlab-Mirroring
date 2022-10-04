<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%!
	public String func_uDevc_Rslt_ufSaveDevDoctEmp_001(Statement argStmtExec, HashMap argHtMethod) throws Exception {

		String sql = "";
		String sql2 = "";
		String sql_disp = "";

		try {

			String EXAM_DT = (String) argHtMethod.get("EXAM_DT");
			String EXAM_SQ = (String) argHtMethod.get("EXAM_SQ");
			String ITEM_CD = (String) argHtMethod.get("ITEM_CD");
			String DOCT_EMP = (String) argHtMethod.get("DOCT_EMP");

			//
			if(EXAM_DT == null) { EXAM_DT = ""; }
			if(EXAM_SQ == null) { EXAM_SQ = ""; }
			if(ITEM_CD == null) { ITEM_CD = ""; }
			if(DOCT_EMP == null) { DOCT_EMP = ""; }

			//
			EXAM_DT = CTr.Replace(EXAM_DT, "'", "''");
			EXAM_SQ = CTr.Replace(EXAM_SQ, "'", "''");
			ITEM_CD = CTr.Replace(ITEM_CD, "'", "''");
			DOCT_EMP = CTr.Replace(DOCT_EMP, "'", "''");

			sql = " UPDATE ET_RSLT_ITEM ";
			sql += " SET ERI_DOCT_EMP = '" + DOCT_EMP + "' ";
			sql += " WHERE ";
			sql += " ERI_EXAM_DT = '" + EXAM_DT + "' ";
			sql += " AND ERI_EXAM_SQ = '" + EXAM_SQ + "' ";
			sql += " AND ERI_ITEM_CD = '" + ITEM_CD + "' ";

			argStmtExec.executeUpdate(sql);

		} catch (Exception e) {
			throw new FuncException(e.toString(), sql);
		}

		return sql;
	}
%>
