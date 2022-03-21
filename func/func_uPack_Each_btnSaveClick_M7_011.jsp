<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%!
	public String func_uPack_Each_btnSaveClick_M7_011(Statement argStmtExec, HashMap argHtMethod) throws Exception {

		String sql = "";
		String sql2 = "";
		String sql_disp = "";

		try {

			String OPTN_NM = (String) argHtMethod.get("OPTN_NM");
			String OPTN_PR = (String) argHtMethod.get("OPTN_PR");
			String OPTN_CNT = (String) argHtMethod.get("OPTN_CNT");
			String OPTN_LT = (String) argHtMethod.get("OPTN_LT");
			String CALC_CD = (String) argHtMethod.get("CALC_CD");
			String USE_YN = (String) argHtMethod.get("USE_YN");
			String MODI_ID = (String) argHtMethod.get("MODI_ID");
			String EXAM_CD = (String) argHtMethod.get("EXAM_CD");
			String PACK_SQ = (String) argHtMethod.get("PACK_SQ");
			String OPTN_SQ = (String) argHtMethod.get("OPTN_SQ");
			String SOPTN_NM = (String) argHtMethod.get("SOPTN_NM");

			//
			if(OPTN_NM == null) { OPTN_NM = ""; }
			if(OPTN_PR == null) { OPTN_PR = ""; }
			if(OPTN_CNT == null) { OPTN_CNT = ""; }
			if(OPTN_LT == null) { OPTN_LT = ""; }
			if(CALC_CD == null) { CALC_CD = ""; }
			if(USE_YN == null) { USE_YN = ""; }
			if(MODI_ID == null) { MODI_ID = ""; }
			if(EXAM_CD == null) { EXAM_CD = ""; }
			if(PACK_SQ == null) { PACK_SQ = ""; }
			if(OPTN_SQ == null) { OPTN_SQ = ""; }
			if(SOPTN_NM == null) { SOPTN_NM = ""; }

			//
			OPTN_NM = CTr.Replace(OPTN_NM, "'", "''");
			OPTN_PR = CTr.Replace(OPTN_PR, "'", "''");
			OPTN_CNT = CTr.Replace(OPTN_CNT, "'", "''");
			OPTN_LT = CTr.Replace(OPTN_LT, "'", "''");
			CALC_CD = CTr.Replace(CALC_CD, "'", "''");
			USE_YN = CTr.Replace(USE_YN, "'", "''");
			MODI_ID = CTr.Replace(MODI_ID, "'", "''");
			EXAM_CD = CTr.Replace(EXAM_CD, "'", "''");
			PACK_SQ = CTr.Replace(PACK_SQ, "'", "''");
			OPTN_SQ = CTr.Replace(OPTN_SQ, "'", "''");
			SOPTN_NM = CTr.Replace(SOPTN_NM, "'", "''");

			sql = "UPDATE ET_PACK_OPTN SET ";
			sql += " EPO_OPTN_NM = '" + OPTN_NM + "'";
			sql += ", EPO_OPTN_PR = '" + OPTN_PR + "'";
			sql += ", EPO_OPTN_CNT = '" + OPTN_CNT + "'";
			sql += ", EPO_OPTN_LT = '" + OPTN_LT + "'";
			sql += ", EPO_CALC_CD = '" + CALC_CD + "'";
			sql += ", EPO_USE_YN = '" + USE_YN + "'";
			sql += ", EPO_MODI_ID = '" + MODI_ID + "'";
			sql += ", EPO_MODI_DTT = SYSDATE";
			sql += " WHERE EPO_EXAM_CD = '" + EXAM_CD + "'";
			sql += " AND EPO_PACK_SQ = '" + PACK_SQ + "'";
			sql += " AND EPO_OPTN_SQ = '" + OPTN_SQ + "'";
			sql += " AND (NVL(EPO_OPTN_NM, 'X') <> '" + SOPTN_NM + "' OR EPO_OPTN_PR <> '" + OPTN_PR + "' OR EPO_OPTN_CNT <> '" + OPTN_CNT + "' OR EPO_OPTN_LT <> '" + OPTN_LT + "' OR EPO_CALC_CD <> '" + CALC_CD + "' OR EPO_USE_YN <> '" + USE_YN + "')";

			argStmtExec.executeUpdate(sql);
		} catch (Exception e) {

			throw new FuncException(e.toString(), sql);
		}

		return sql;
	}
%>
