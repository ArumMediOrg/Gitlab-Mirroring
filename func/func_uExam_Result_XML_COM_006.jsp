<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%!
	public String func_uExam_Result_XML_COM_006(Statement argStmtExec, HashMap argHtMethod) throws Exception {

		String sql = "";
		String sql2 = "";
		String sql_disp = "";

		try {

			String CFRM_CD = (String) argHtMethod.get("CFRM_CD");
			String MODI_ID = (String) argHtMethod.get("MODI_ID");
			String EXAM_DT = (String) argHtMethod.get("EXAM_DT");
			String EXAM_SQ = (String) argHtMethod.get("EXAM_SQ");

			//
			if(CFRM_CD == null) { CFRM_CD = ""; }
			if(MODI_ID == null) { MODI_ID = ""; }
			if(EXAM_DT == null) { EXAM_DT = ""; }
			if(EXAM_SQ == null) { EXAM_SQ = ""; }

			//
			CFRM_CD = CTr.Replace(CFRM_CD, "'", "''");
			MODI_ID = CTr.Replace(MODI_ID, "'", "''");
			EXAM_DT = CTr.Replace(EXAM_DT, "'", "''");
			EXAM_SQ = CTr.Replace(EXAM_SQ, "'", "''");

			sql = "UPDATE ET_CANCER_HEADER SET ";
			sql += "  ECH_CFRM_CD = '" + CFRM_CD + "'";
			sql += ", ECH_MODI_ID = '" + MODI_ID + "'";
			sql += ", ECH_MODI_DTT = SYSDATE";
			sql += " WHERE ECH_EXAM_DT = '" + EXAM_DT + "'";
			sql += " AND ECH_EXAM_SQ = '" + EXAM_SQ + "'";

			argStmtExec.executeUpdate(sql);

		} catch (Exception e) {

			throw new FuncException(e.toString(), sql);
		}

		return sql;
	}
%>
