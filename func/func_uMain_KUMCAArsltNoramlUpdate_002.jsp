<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%!
	public String func_uMain_KUMCAArsltNoramlUpdate_002(Statement argStmtExec, HashMap argHtMethod) throws Exception {

		String sql = "";
		String sql2 = "";
		String sql_disp = "";

		try {

			String RSLT_VL = (String) argHtMethod.get("RSLT_VL");
			String CHAR_CD = (String) argHtMethod.get("CHAR_CD");
			String PACS_RSLT = (String) argHtMethod.get("PACS_RSLT");
			String PRCH_VL = (String) argHtMethod.get("PRCH_VL");
			String PRNM_VL = (String) argHtMethod.get("PRNM_VL");
			String RSLT_KD = (String) argHtMethod.get("RSLT_KD");
			String MODI_ID = (String) argHtMethod.get("MODI_ID");
			String OLD_PACS_RSLT = (String) argHtMethod.get("OLD_PACS_RSLT");
			String PACS_FLAG = (String) argHtMethod.get("PACS_FLAG");
			String EXAM_DT = (String) argHtMethod.get("EXAM_DT");
			String EXAM_SQ = (String) argHtMethod.get("EXAM_SQ");
			String OSRL_CD = (String) argHtMethod.get("OSRL_CD");
			String ITEM_CD = (String) argHtMethod.get("ITEM_CD");

			//
			if(RSLT_VL == null) { RSLT_VL = ""; }
			if(CHAR_CD == null) { CHAR_CD = ""; }
			if(PACS_RSLT == null) { PACS_RSLT = ""; }
			if(PRCH_VL == null) { PRCH_VL = ""; }
			if(PRNM_VL == null) { PRNM_VL = ""; }
			if(RSLT_KD == null) { RSLT_KD = ""; }
			if(MODI_ID == null) { MODI_ID = ""; }
			if(OLD_PACS_RSLT == null) { OLD_PACS_RSLT = ""; }
			if(PACS_FLAG == null) { PACS_FLAG = ""; }
			if(EXAM_DT == null) { EXAM_DT = ""; }
			if(EXAM_SQ == null) { EXAM_SQ = ""; }
			if(OSRL_CD == null) { OSRL_CD = ""; }
			if(ITEM_CD == null) { ITEM_CD = ""; }

			//
			RSLT_VL = CTr.Replace(RSLT_VL, "'", "''");
			CHAR_CD = CTr.Replace(CHAR_CD, "'", "''");
			PACS_RSLT = CTr.Replace(PACS_RSLT, "'", "''");
			PRCH_VL = CTr.Replace(PRCH_VL, "'", "''");
			PRNM_VL = CTr.Replace(PRNM_VL, "'", "''");
			RSLT_KD = CTr.Replace(RSLT_KD, "'", "''");
			MODI_ID = CTr.Replace(MODI_ID, "'", "''");
			OLD_PACS_RSLT = CTr.Replace(OLD_PACS_RSLT, "'", "''");
			PACS_FLAG = CTr.Replace(PACS_FLAG, "'", "''");
			EXAM_DT = CTr.Replace(EXAM_DT, "'", "''");
			EXAM_SQ = CTr.Replace(EXAM_SQ, "'", "''");
			OSRL_CD = CTr.Replace(OSRL_CD, "'", "''");
			ITEM_CD = CTr.Replace(ITEM_CD, "'", "''");

			sql = "UPDATE ET_RSLT_ITEM SET ";
			sql += "  ERI_RSLT_VL = '" + RSLT_VL + "'";
			sql += ", ERI_CHAR_CD = '" + CHAR_CD + "'";
			sql += ", ERI_PACS_RSLT = '" + PACS_RSLT + "'";
			sql += ", ERI_PRCH_VL = '" + PRCH_VL + "'";
			sql += ", ERI_PRNM_VL = '" + PRNM_VL + "'";
			sql += ", ERI_RSLT_KD = '" + RSLT_KD + "'";
			sql += ", ERI_MODI_ID = '" + MODI_ID + "'";
			sql += ", ERI_PACS_OLD = '" + OLD_PACS_RSLT + "'";
			sql += ", ERI_PACS_CHK = '" + PACS_FLAG + "'";
			sql += ", ERI_MODI_DTT = SYSDATE";
			sql += " WHERE ERI_EXAM_DT = '" + EXAM_DT + "'";
			sql += " AND ERI_EXAM_SQ = '" + EXAM_SQ + "'";
			sql += " AND (ERI_OSRL_CD = '" + OSRL_CD + "')";
			sql += " AND ERI_ITEM_CD = '" + ITEM_CD + "'";

			argStmtExec.executeUpdate(sql);

		} catch (Exception e) {

			throw new FuncException(e.toString(), sql);
		}

		return sql;
	}
%>
