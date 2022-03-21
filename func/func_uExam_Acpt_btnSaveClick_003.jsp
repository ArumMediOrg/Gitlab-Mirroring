<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%!
	public String func_uExam_Acpt_btnSaveClick_003(Statement argStmtExec, HashMap argHtMethod) throws Exception {

		String sql = "";
		String sql2 = "";
		String sql_disp = "";

		try {

			String EXAM_DT2 = (String) argHtMethod.get("EXAM_DT2");
			String EXAM_SQ2 = (String) argHtMethod.get("EXAM_SQ2");
			String CUST_NO = (String) argHtMethod.get("CUST_NO");
			String EXAM_DT = (String) argHtMethod.get("EXAM_DT");
			String EXAM_SQ = (String) argHtMethod.get("EXAM_SQ");
			String CHA2_PK = (String) argHtMethod.get("CHA2_PK");

			//
			if(EXAM_DT2 == null) { EXAM_DT2 = ""; }
			if(EXAM_SQ2 == null) { EXAM_SQ2 = ""; }
			if(CUST_NO == null) { CUST_NO = ""; }
			if(EXAM_DT == null) { EXAM_DT = ""; }
			if(EXAM_SQ == null) { EXAM_SQ = ""; }
			if(CHA2_PK == null) { CHA2_PK = ""; }

			//
			EXAM_DT2 = CTr.Replace(EXAM_DT2, "'", "''");
			EXAM_SQ2 = CTr.Replace(EXAM_SQ2, "'", "''");
			CUST_NO = CTr.Replace(CUST_NO, "'", "''");
			EXAM_DT = CTr.Replace(EXAM_DT, "'", "''");
			EXAM_SQ = CTr.Replace(EXAM_SQ, "'", "''");
			CHA2_PK = CTr.Replace(CHA2_PK, "'", "''");

			sql = "UPDATE ST_ITEM_RECHECK SET ";
			sql += "  SIR_EXAM_DT2 = '" + EXAM_DT2 + "'";
			sql += ", SIR_EXAM_SQ2 = '" + EXAM_SQ2 + "'";
			sql += ", SIR_CUST_NO = '" + CUST_NO + "'";
			sql += " WHERE SIR_EXAM_DT = '" + EXAM_DT + "'";
			sql += " AND SIR_EXAM_SQ = '" + EXAM_SQ + "'";
			sql += " AND SIR_EXAM_CHA || SIR_MATT_CD || SIR_ORGA_CD || SIR_MKJJ_CD = '" + CHA2_PK + "'";

			argStmtExec.executeUpdate(sql);

		} catch (Exception e) {

			throw new FuncException(e.toString(), sql);
		}

		return sql;
	}
%>
