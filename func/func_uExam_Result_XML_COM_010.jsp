<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%!
	public String func_uExam_Result_XML_COM_010(Statement argStmtExec, HashMap argHtMethod) throws Exception {

		String sql = "";
		String sql2 = "";
		String sql_disp = "";

		try {
			String QTRT_CD = (String) argHtMethod.get("QTRT_CD");
			String EXAM_DT = (String) argHtMethod.get("EXAM_DT");
			String EXAM_SQ = (String) argHtMethod.get("EXAM_SQ");

			//
			if(QTRT_CD == null) { QTRT_CD = ""; }
			if(EXAM_DT == null) { EXAM_DT = ""; }
			if(EXAM_SQ == null) { EXAM_SQ = ""; }

			//
			QTRT_CD = CTr.Replace(QTRT_CD, "'", "''");
			EXAM_DT = CTr.Replace(EXAM_DT, "'", "''");
			EXAM_SQ = CTr.Replace(EXAM_SQ, "'", "''");
			
			sql = " UPDATE ET_EXAM_ACPT ";
			sql += " SET EEA_QTRT_CD = '" + QTRT_CD + "' ";
			sql += " WHERE EEA_EXAM_DT = '" + EXAM_DT + "' ";
			sql += " AND EEA_EXAM_SQ = '" + EXAM_SQ + "'   ";
			

			argStmtExec.executeUpdate(sql);

		} catch (Exception e) {

			throw new FuncException(e.toString(), sql);
		}

		return sql;
	}
%>
