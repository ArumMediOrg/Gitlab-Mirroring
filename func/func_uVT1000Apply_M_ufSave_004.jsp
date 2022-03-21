<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%!
	public String func_uVT1000Apply_M_ufSave_004(Statement argStmtExec, HashMap argHtMethod) throws Exception {

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
			String USE_YN = (String) argHtMethod.get("USE_YN");
			String MODI_ID = (String) argHtMethod.get("MODI_ID");
			String NUSE_ID = (String) argHtMethod.get("NUSE_ID");
			String RGIDR_USE_YN = (String) argHtMethod.get("RGIDR_USE_YN");
			String MARK_ADD_TX = (String) argHtMethod.get("MARK_ADD_TX");
			String DEV_ADD_TX = (String) argHtMethod.get("DEV_ADD_TX");
			String POST_CD = (String) argHtMethod.get("POST_CD");
			String ACTN_CD = (String) argHtMethod.get("ACTN_CD");
			String AFTE_MON = (String) argHtMethod.get("AFTE_MON");
			String RSLT_CD2 = (String) argHtMethod.get("RSLT_CD2");

			//
			if(RSLT_CD == null) { RSLT_CD = ""; }
			if(DEV_CD == null) { DEV_CD = ""; }
			if(FIND_CD == null) { FIND_CD = ""; }
			if(DISE_CD == null) { DISE_CD = ""; }
			if(ORDR_SQ == null) { ORDR_SQ = ""; }
			if(TITL_NM == null) { TITL_NM = ""; }
			if(CONT_EX == null) { CONT_EX = ""; }
			if(USE_YN == null) { USE_YN = ""; }
			if(MODI_ID == null) { MODI_ID = ""; }
			if(NUSE_ID == null) { NUSE_ID = ""; }
			if(RGIDR_USE_YN == null) { RGIDR_USE_YN = ""; }
			if(MARK_ADD_TX == null) { MARK_ADD_TX = ""; }
			if(DEV_ADD_TX == null) { DEV_ADD_TX = ""; }
			if(POST_CD == null) { POST_CD = ""; }
			if(ACTN_CD == null) { ACTN_CD = ""; }
			if(AFTE_MON == null) { AFTE_MON = ""; }
			if(RSLT_CD2 == null) { RSLT_CD2 = ""; }

			//
			RSLT_CD = CTr.Replace(RSLT_CD, "'", "''");
			DEV_CD = CTr.Replace(DEV_CD, "'", "''");
			FIND_CD = CTr.Replace(FIND_CD, "'", "''");
			DISE_CD = CTr.Replace(DISE_CD, "'", "''");
			ORDR_SQ = CTr.Replace(ORDR_SQ, "'", "''");
			TITL_NM = CTr.Replace(TITL_NM, "'", "''");
			CONT_EX = CTr.Replace(CONT_EX, "'", "''");
			USE_YN = CTr.Replace(USE_YN, "'", "''");
			MODI_ID = CTr.Replace(MODI_ID, "'", "''");
			NUSE_ID = CTr.Replace(NUSE_ID, "'", "''");
			RGIDR_USE_YN = CTr.Replace(RGIDR_USE_YN, "'", "''");
			MARK_ADD_TX = CTr.Replace(MARK_ADD_TX, "'", "''");
			DEV_ADD_TX = CTr.Replace(DEV_ADD_TX, "'", "''");
			POST_CD = CTr.Replace(POST_CD, "'", "''");
			ACTN_CD = CTr.Replace(ACTN_CD, "'", "''");
			AFTE_MON = CTr.Replace(AFTE_MON, "'", "''");
			RSLT_CD2 = CTr.Replace(RSLT_CD2, "'", "''");

			sql = "UPDATE IT_DEV_RSLT SET ";
			sql += "  IDR_RSLT_CD = '" + RSLT_CD + "'";
			sql += ", IDR_DEV_CD = '" + DEV_CD + "'";
			sql += ", IDR_FIND_CD = '" + FIND_CD + "'";
			sql += ", IDR_DISE_CD = '" + DISE_CD + "'";
			sql += ", IDR_ORDR_SQ = '" + ORDR_SQ + "'";
			sql += ", IDR_TITL_NM = '" + TITL_NM + "'";
			sql += ", IDR_CONT_EX = '" + CONT_EX + "'";
			sql += ", IDR_USE_YN = '" + USE_YN + "'";
			sql += ", IDR_MODI_ID = '" + MODI_ID + "'";
			sql += ", IDR_MODI_DTT = SYSDATE";
			sql += ", IDR_NUSE_ID = '" + NUSE_ID + "'";

			if(RGIDR_USE_YN.equals("1")) {
				sql += ", IDR_NUSE_DTT = SYSDATE";
			} else {
				sql += ", IDR_NUSE_DTT = NULL";
			}

			sql += ", IDR_MARK_ADD_TX = '" + MARK_ADD_TX + "'";
			sql += ", IDR_DEV_ADD_TX = '" + DEV_ADD_TX + "'";
			sql += ", IDR_POST_CD = '" + POST_CD + "'";
			sql += ", IDR_ACTN_CD = '" + ACTN_CD + "'";
			sql += ", IDR_AFTE_MON = '" + AFTE_MON + "'";
			sql += " WHERE IDR_RSLT_CD = '" + RSLT_CD2 + "'";

			argStmtExec.executeUpdate(sql);

		} catch (Exception e) {

			throw new FuncException(e.toString(), sql);
		}

		return sql;
	}
%>
