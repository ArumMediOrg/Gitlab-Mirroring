<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%!
	public String func_uSP_Health_CmbXRay_RsltChange_001(Statement argStmtExec, HashMap argHtMethod) throws Exception {

		String sql = "";
		String sql2 = "";
		String sql_disp = "";

		try {

			String SPRT_CD = (String) argHtMethod.get("SPRT_CD");
			String USER_ID = (String) argHtMethod.get("USER_ID");
			String EXAM_DT = (String) argHtMethod.get("EXAM_DT");
			String EXAM_SQ = (String) argHtMethod.get("EXAM_SQ");
			String ITEM_CD = (String) argHtMethod.get("ITEM_CD");

			//
			if(SPRT_CD == null) { SPRT_CD = ""; }
			if(USER_ID == null) { USER_ID = ""; }
			if(EXAM_DT == null) { EXAM_DT = ""; }
			if(EXAM_SQ == null) { EXAM_SQ = ""; }
			if(ITEM_CD == null) { ITEM_CD = ""; }

			//
			SPRT_CD = CTr.Replace(SPRT_CD, "'", "''");
			USER_ID = CTr.Replace(USER_ID, "'", "''");
			EXAM_DT = CTr.Replace(EXAM_DT, "'", "''");
			EXAM_SQ = CTr.Replace(EXAM_SQ, "'", "''");
			ITEM_CD = CTr.Replace(ITEM_CD, "'", "''");

			sql = "UPDATE ET_RSLT_ITEM SET ";
			sql += "  ERI_SPRT_CD = '" + SPRT_CD + "'";
			sql += ", ERI_MODI_ID = '" + USER_ID + "'";
			sql += ", ERI_MODI_DTT = SYSDATE";
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
