<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%!
	public String func_uVT1000Apply_M_ufSave_002(Statement argStmtExec, HashMap argHtMethod) throws Exception {

		String sql = "";
		String sql2 = "";
		String sql_disp = "";

		try {

			String RSLT_CD = (String) argHtMethod.get("RSLT_CD");
			String DEV_CD = (String) argHtMethod.get("DEV_CD");
			String FIND_CD = (String) argHtMethod.get("FIND_CD");
			String DISE_CD = (String) argHtMethod.get("DISE_CD");
			String ORDR_SQ = (String) argHtMethod.get("ORDR_SQ");
			String TITL_NM = (String) argHtMethod.get("TITL_NM");
			String CONT_EX = (String) argHtMethod.get("CONT_EX");
			String POST_CD = (String) argHtMethod.get("POST_CD");
			String ACTN_CD = (String) argHtMethod.get("ACTN_CD");
			String USE_YN = (String) argHtMethod.get("USE_YN");
			String INPT_ID = (String) argHtMethod.get("INPT_ID");
			String MARK_ADD_TX = (String) argHtMethod.get("MARK_ADD_TX");
			String DEV_ADD_TX = (String) argHtMethod.get("DEV_ADD_TX");
			String AFTE_MON = (String) argHtMethod.get("AFTE_MON");

			//
			if(RSLT_CD == null) { RSLT_CD = ""; }
			if(DEV_CD == null) { DEV_CD = ""; }
			if(FIND_CD == null) { FIND_CD = ""; }
			if(DISE_CD == null) { DISE_CD = ""; }
			if(ORDR_SQ == null) { ORDR_SQ = ""; }
			if(TITL_NM == null) { TITL_NM = ""; }
			if(CONT_EX == null) { CONT_EX = ""; }
			if(POST_CD == null) { POST_CD = ""; }
			if(ACTN_CD == null) { ACTN_CD = ""; }
			if(USE_YN == null) { USE_YN = ""; }
			if(INPT_ID == null) { INPT_ID = ""; }
			if(MARK_ADD_TX == null) { MARK_ADD_TX = ""; }
			if(DEV_ADD_TX == null) { DEV_ADD_TX = ""; }
			if(AFTE_MON == null) { AFTE_MON = ""; }

			//
			RSLT_CD = CTr.Replace(RSLT_CD, "'", "''");
			DEV_CD = CTr.Replace(DEV_CD, "'", "''");
			FIND_CD = CTr.Replace(FIND_CD, "'", "''");
			DISE_CD = CTr.Replace(DISE_CD, "'", "''");
			ORDR_SQ = CTr.Replace(ORDR_SQ, "'", "''");
			TITL_NM = CTr.Replace(TITL_NM, "'", "''");
			CONT_EX = CTr.Replace(CONT_EX, "'", "''");
			POST_CD = CTr.Replace(POST_CD, "'", "''");
			ACTN_CD = CTr.Replace(ACTN_CD, "'", "''");
			USE_YN = CTr.Replace(USE_YN, "'", "''");
			INPT_ID = CTr.Replace(INPT_ID, "'", "''");
			MARK_ADD_TX = CTr.Replace(MARK_ADD_TX, "'", "''");
			DEV_ADD_TX = CTr.Replace(DEV_ADD_TX, "'", "''");
			AFTE_MON = CTr.Replace(AFTE_MON, "'", "''");

			sql = "INSERT INTO IT_DEV_RSLT (IDR_RSLT_CD, IDR_DEV_CD, IDR_FIND_CD, IDR_DISE_CD, IDR_ORDR_SQ ,IDR_TITL_NM, IDR_CONT_EX, IDR_POST_CD, IDR_ACTN_CD, IDR_USE_YN, IDR_INPT_ID, IDR_INPT_DTT, IDR_MARK_ADD_TX, IDR_DEV_ADD_TX, IDR_AFTE_MON) VALUES(";
			sql += " '" + RSLT_CD + "'";
			sql += ", '" + DEV_CD + "'";
			sql += ", '" + FIND_CD + "'";
			sql += ", '" + DISE_CD + "'";
			sql += ", '" + ORDR_SQ + "'";
			sql += ", '" + TITL_NM + "'";
			sql += ", '" + CONT_EX + "'";
			sql += ", '" + POST_CD + "'";
			sql += ", '" + ACTN_CD + "'";
			sql += ", '" + USE_YN + "'";
			sql += ", '" + INPT_ID + "'";
			sql += ", SYSDATE";
			sql += ", '" + MARK_ADD_TX + "'";
			sql += ", '" + DEV_ADD_TX + "'";
			sql += ", '" + AFTE_MON + "'";
			sql += "  )";
			sql += "";

			argStmtExec.executeUpdate(sql);

		} catch (Exception e) {

			throw new FuncException(e.toString(), sql);
		}

		return sql;
	}
%>
