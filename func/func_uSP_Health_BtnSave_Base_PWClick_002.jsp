<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%!
	public String func_uSP_Health_BtnSave_Base_PWClick_002(Statement argStmtExec, HashMap argHtMethod) throws Exception {

		String sql = "";
		String sql2 = "";
		String sql_disp = "";

		try {

			String EXAM_DT = (String) argHtMethod.get("EXAM_DT");
			String EXAM_SQ = (String) argHtMethod.get("EXAM_SQ");
			String EXAM_CHA = (String) argHtMethod.get("EXAM_CHA");
			String GOJU_SQ = (String) argHtMethod.get("GOJU_SQ");
			String GOJU_CD = (String) argHtMethod.get("GOJU_CD");
			String YEAR_VAL = (String) argHtMethod.get("YEAR_VAL");
			String FROM_DT = (String) argHtMethod.get("FROM_DT");
			String TO_DT = (String) argHtMethod.get("TO_DT");
			String ETC_TX = (String) argHtMethod.get("ETC_TX");
			String INPT_ID = (String) argHtMethod.get("INPT_ID");

			//
			if(EXAM_DT == null) { EXAM_DT = ""; }
			if(EXAM_SQ == null) { EXAM_SQ = ""; }
			if(EXAM_CHA == null) { EXAM_CHA = ""; }
			if(GOJU_SQ == null) { GOJU_SQ = ""; }
			if(GOJU_CD == null) { GOJU_CD = ""; }
			if(YEAR_VAL == null) { YEAR_VAL = ""; }
			if(FROM_DT == null) { FROM_DT = ""; }
			if(TO_DT == null) { TO_DT = ""; }
			if(ETC_TX == null) { ETC_TX = ""; }
			if(INPT_ID == null) { INPT_ID = ""; }

			//
			EXAM_DT = CTr.Replace(EXAM_DT, "'", "''");
			EXAM_SQ = CTr.Replace(EXAM_SQ, "'", "''");
			EXAM_CHA = CTr.Replace(EXAM_CHA, "'", "''");
			GOJU_SQ = CTr.Replace(GOJU_SQ, "'", "''");
			GOJU_CD = CTr.Replace(GOJU_CD, "'", "''");
			YEAR_VAL = CTr.Replace(YEAR_VAL, "'", "''");
			FROM_DT = CTr.Replace(FROM_DT, "'", "''");
			TO_DT = CTr.Replace(TO_DT, "'", "''");
			ETC_TX = CTr.Replace(ETC_TX, "'", "''");
			INPT_ID = CTr.Replace(INPT_ID, "'", "''");

			sql = "INSERT INTO ST_PASTJOB (SPB_EXAM_DT, SPB_EXAM_SQ, SPB_EXAM_CHA, SPB_GOJU_SQ, SPB_GOJU_CD, SPB_YEAR_VAL ,SPB_FROM_DT, SPB_TO_DT, SPB_ETC_TX, SPB_INPT_ID, SPB_INPT_DTT) VALUES (";
			sql += "  '" + EXAM_DT + "'";
			sql += ", '" + EXAM_SQ + "'";
			sql += ", '" + EXAM_CHA + "'";
			sql += ", '" + GOJU_SQ + "'";
			sql += ", '" + GOJU_CD + "'";
			sql += ", '" + YEAR_VAL + "'";
			sql += ", '" + FROM_DT + "'";
			sql += ", '" + TO_DT + "'";
			sql += ", '" + ETC_TX + "'";
			sql += ", '" + INPT_ID + "'";
			sql += ", SYSDATE";
			sql += ")";

			argStmtExec.executeUpdate(sql);

		} catch (Exception e) {

			throw new FuncException(e.toString(), sql);
		}

		return sql;
	}
%>
