<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%!
	public String func_uStdt_Pnjn_UP_OralRslt_Save_001(Statement argStmtExec, HashMap argHtMethod) throws Exception {

		String sql = "";
		String sql2 = "";
		String sql_disp = "";

		try {

			String HERT_CD = (String) argHtMethod.get("HERT_CD");
			String RSLT_CD = (String) argHtMethod.get("RSLT_CD");
			String RSLT_VL = (String) argHtMethod.get("RSLT_VL");
			String PRCH_VL = (String) argHtMethod.get("PRCH_VL");
			String PRNM_VL = (String) argHtMethod.get("PRNM_VL");
			String RSLT_KD = (String) argHtMethod.get("RSLT_KD");
			String VLDT_LH = (String) argHtMethod.get("VLDT_LH");
			String STSB_PJ = (String) argHtMethod.get("STSB_PJ");
			String USER_ID = (String) argHtMethod.get("USER_ID");
			String EXAM_DT = (String) argHtMethod.get("EXAM_DT");
			String EXAM_SQ = (String) argHtMethod.get("EXAM_SQ");
			String ITEM_CD = (String) argHtMethod.get("ITEM_CD");

			//
			if(HERT_CD == null) { HERT_CD = ""; }
			if(RSLT_CD == null) { RSLT_CD = ""; }
			if(RSLT_VL == null) { RSLT_VL = ""; }
			if(PRCH_VL == null) { PRCH_VL = ""; }
			if(PRNM_VL == null) { PRNM_VL = ""; }
			if(RSLT_KD == null) { RSLT_KD = ""; }
			if(VLDT_LH == null) { VLDT_LH = ""; }
			if(STSB_PJ == null) { STSB_PJ = ""; }
			if(USER_ID == null) { USER_ID = ""; }
			if(EXAM_DT == null) { EXAM_DT = ""; }
			if(EXAM_SQ == null) { EXAM_SQ = ""; }
			if(ITEM_CD == null) { ITEM_CD = ""; }

			//
			HERT_CD = CTr.Replace(HERT_CD, "'", "''");
			RSLT_CD = CTr.Replace(RSLT_CD, "'", "''");
			RSLT_VL = CTr.Replace(RSLT_VL, "'", "''");
			PRCH_VL = CTr.Replace(PRCH_VL, "'", "''");
			PRNM_VL = CTr.Replace(PRNM_VL, "'", "''");
			RSLT_KD = CTr.Replace(RSLT_KD, "'", "''");
			VLDT_LH = CTr.Replace(VLDT_LH, "'", "''");
			STSB_PJ = CTr.Replace(STSB_PJ, "'", "''");
			USER_ID = CTr.Replace(USER_ID, "'", "''");
			EXAM_DT = CTr.Replace(EXAM_DT, "'", "''");
			EXAM_SQ = CTr.Replace(EXAM_SQ, "'", "''");
			ITEM_CD = CTr.Replace(ITEM_CD, "'", "''");

			sql = "UPDATE ET_RSLT_ITEM SET ";
			sql += "  ERI_HERT_CD = '" + HERT_CD + "'";
			sql += ", ERI_RSLT_CD = '" + RSLT_CD + "'";
			sql += ", ERI_RSLT_VL = '" + RSLT_VL + "'";
			sql += ", ERI_PRCH_VL = '" + PRCH_VL + "'";
			sql += ", ERI_PRNM_VL = '" + PRNM_VL + "'";
			sql += ", ERI_RSLT_KD = '" + RSLT_KD + "'";
			sql += ", ERI_VLDT_LH = '" + VLDT_LH + "'";
			sql += ", ERI_STSB_PANJ = '" + STSB_PJ + "'";
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
