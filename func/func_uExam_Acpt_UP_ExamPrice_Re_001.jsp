<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%!
	public String func_uExam_Acpt_UP_ExamPrice_Re_001(Statement argStmtExec, HashMap argHtMethod) throws Exception {

		String sql = "";
		String sql2 = "";
		String sql_disp = "";

		try {

			String COMPR_PR = (String) argHtMethod.get("COMPR_PR");
			String PSNLR_PR = (String) argHtMethod.get("PSNLR_PR");
			String HLTHR_PR = (String) argHtMethod.get("HLTHR_PR");
			String SPCLR_PR = (String) argHtMethod.get("SPCLR_PR");
			String CANR_PR = (String) argHtMethod.get("CANR_PR");
			String ORALR_PR = (String) argHtMethod.get("ORALR_PR");
			String SPRT_PR = (String) argHtMethod.get("SPRT_PR");
			String MODI_ID = (String) argHtMethod.get("MODI_ID");
			String EXAM_DT = (String) argHtMethod.get("EXAM_DT");
			String EXAM_SQ = (String) argHtMethod.get("EXAM_SQ");

			//
			if(COMPR_PR == null) { COMPR_PR = ""; }
			if(PSNLR_PR == null) { PSNLR_PR = ""; }
			if(HLTHR_PR == null) { HLTHR_PR = ""; }
			if(SPCLR_PR == null) { SPCLR_PR = ""; }
			if(CANR_PR == null) { CANR_PR = ""; }
			if(ORALR_PR == null) { ORALR_PR = ""; }
			if(SPRT_PR == null) { SPRT_PR = ""; }
			if(MODI_ID == null) { MODI_ID = ""; }
			if(EXAM_DT == null) { EXAM_DT = ""; }
			if(EXAM_SQ == null) { EXAM_SQ = ""; }

			//
			COMPR_PR = CTr.Replace(COMPR_PR, "'", "''");
			PSNLR_PR = CTr.Replace(PSNLR_PR, "'", "''");
			HLTHR_PR = CTr.Replace(HLTHR_PR, "'", "''");
			SPCLR_PR = CTr.Replace(SPCLR_PR, "'", "''");
			CANR_PR = CTr.Replace(CANR_PR, "'", "''");
			ORALR_PR = CTr.Replace(ORALR_PR, "'", "''");
			SPRT_PR = CTr.Replace(SPRT_PR, "'", "''");
			MODI_ID = CTr.Replace(MODI_ID, "'", "''");
			EXAM_DT = CTr.Replace(EXAM_DT, "'", "''");
			EXAM_SQ = CTr.Replace(EXAM_SQ, "'", "''");

			sql = "UPDATE ET_EXAM_ACPT SET ";
			sql += "  EEA_COMPR_PR = '" + COMPR_PR + "'";
			sql += ", EEA_PSNLR_PR = '" + PSNLR_PR + "'";
			sql += ", EEA_HLTHR_PR = '" + HLTHR_PR + "'";
			sql += ", EEA_SPCLR_PR = '" + SPCLR_PR + "'";
			sql += ", EEA_CANR_PR = '" + CANR_PR + "'";
			sql += ", EEA_ORALR_PR = '" + ORALR_PR + "'";
			sql += ", EEA_SPRT_PR = '" + SPRT_PR + "'";
			sql += ", EEA_MODI_ID = '" + MODI_ID + "'";
			sql += ", EEA_MODI_DTT = SYSDATE";
			sql += " WHERE EEA_EXAM_DT = '" + EXAM_DT + "'";
			sql += " AND EEA_EXAM_SQ = '" + EXAM_SQ + "'";

			argStmtExec.executeUpdate(sql);

		} catch (Exception e) {

			throw new FuncException(e.toString(), sql);
		}

		return sql;
	}
%>
