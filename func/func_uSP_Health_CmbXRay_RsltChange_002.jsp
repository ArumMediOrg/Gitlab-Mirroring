<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%!
	public String func_uSP_Health_CmbXRay_RsltChange_002(Statement argStmtExec, HashMap argHtMethod) throws Exception {

		String sql = "";
		String sql2 = "";
		String sql_disp = "";

		try {

			String SPRT_CD = (String) argHtMethod.get("SPRT_CD");
			String USER_ID = (String) argHtMethod.get("USER_ID");
			String EXAM_DT = (String) argHtMethod.get("EXAM_DT");
			String EXAM_SQ = (String) argHtMethod.get("EXAM_SQ");

			//
			if(SPRT_CD == null) { SPRT_CD = ""; }
			if(USER_ID == null) { USER_ID = ""; }
			if(EXAM_DT == null) { EXAM_DT = ""; }
			if(EXAM_SQ == null) { EXAM_SQ = ""; }

			//
			SPRT_CD = CTr.Replace(SPRT_CD, "'", "''");
			USER_ID = CTr.Replace(USER_ID, "'", "''");
			EXAM_DT = CTr.Replace(EXAM_DT, "'", "''");
			EXAM_SQ = CTr.Replace(EXAM_SQ, "'", "''");

			sql = " UPDATE ST_BASE SET";
			sql += "  SBE_SP_XRAY_CD = '" + SPRT_CD + "'";
			sql += ", SBE_MODI_ID = '" + USER_ID + "'";
			sql += ", SBE_MODI_DTT = SYSDATE";
			sql += "  WHERE SBE_EXAM_DT = '" + EXAM_DT + "'";
			sql += "  AND SBE_EXAM_SQ = '" + EXAM_SQ + "'";

			argStmtExec.executeUpdate(sql);

		} catch (Exception e) {

			throw new FuncException(e.toString(), sql);
		}

		return sql;
	}
%>
