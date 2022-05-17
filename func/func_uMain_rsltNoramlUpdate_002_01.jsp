<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%!
	public String func_uMain_rsltNoramlUpdate_002_01(Statement argStmtExec, HashMap argHtMethod) throws Exception {

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
			String EXAM_DT = (String) argHtMethod.get("EXAM_DT");
			String EXAM_SQ = (String) argHtMethod.get("EXAM_SQ");
			String OCS_CD = (String) argHtMethod.get("OCS_CD");
			String OSRL_CD = (String) argHtMethod.get("OSRL_CD");
			String ITEM_CD = (String) argHtMethod.get("ITEM_CD");
			String OSSB_CD = (String) argHtMethod.get("OSSB_CD");
			String RSLT_EX = (String) argHtMethod.get("RSLT_EX");
			String CODE_GBN = (String) argHtMethod.get("CODE_GBN");
			String OCS_VL = (String) argHtMethod.get("OCS_VL");

			//
			if(RSLT_VL == null) { RSLT_VL = ""; }
			if(CHAR_CD == null) { CHAR_CD = ""; }
			if(PACS_RSLT == null) { PACS_RSLT = ""; }
			if(PRCH_VL == null) { PRCH_VL = ""; }
			if(PRNM_VL == null) { PRNM_VL = ""; }
			if(RSLT_KD == null) { RSLT_KD = ""; }
			if(MODI_ID == null) { MODI_ID = ""; }
			if(EXAM_DT == null) { EXAM_DT = ""; }
			if(EXAM_SQ == null) { EXAM_SQ = ""; }
			if(OCS_CD == null) { OCS_CD = ""; }
			if(OSRL_CD  == null) { OSRL_CD  = ""; }
			if(ITEM_CD == null) { ITEM_CD = ""; }
			if(OSSB_CD == null) { OSSB_CD = ""; }
			if(RSLT_EX == null) { RSLT_EX = ""; }
			if(CODE_GBN == null) { CODE_GBN = ""; }
			if(OCS_VL == null) { OCS_VL = ""; }

			//
			RSLT_VL = CTr.Replace(RSLT_VL, "'", "''");
			CHAR_CD = CTr.Replace(CHAR_CD, "'", "''");
			PACS_RSLT = CTr.Replace(PACS_RSLT, "'", "''");
			PRCH_VL = CTr.Replace(PRCH_VL, "'", "''");
			PRNM_VL = CTr.Replace(PRNM_VL, "'", "''");
			RSLT_KD = CTr.Replace(RSLT_KD, "'", "''");
			MODI_ID = CTr.Replace(MODI_ID, "'", "''");
			EXAM_DT = CTr.Replace(EXAM_DT, "'", "''");
			EXAM_SQ = CTr.Replace(EXAM_SQ, "'", "''");
			OCS_CD = CTr.Replace(OCS_CD, "'", "''");
			OSRL_CD  = CTr.Replace(OSRL_CD , "'", "''");
			ITEM_CD = CTr.Replace(ITEM_CD, "'", "''");
			OSSB_CD = CTr.Replace(OSSB_CD, "'", "''");
			RSLT_EX = CTr.Replace(RSLT_EX, "'", "''");
			CODE_GBN = CTr.Replace(CODE_GBN, "'", "''");
			OCS_VL = CTr.Replace(OCS_VL, "'", "''");

			sql = "UPDATE ET_RSLT_ITEM  ";
			sql += "   SET ERI_RSLT_VL = CASE WHEN NVL(ERI_RSLT_VL,' ') = ' ' THEN '" + RSLT_VL + "' ELSE ERI_RSLT_VL END ";
			sql += " , ERI_CHAR_CD   = '" + CHAR_CD + "' ";
			sql += " , ERI_PACS_RSLT = '" + PACS_RSLT + "' ";
			sql += " , ERI_PRCH_VL   = '" + PRCH_VL + "' ";
			sql += " , ERI_PRNM_VL   = '" + PRNM_VL + "' ";
			sql += " , ERI_RSLT_KD   = '" + RSLT_KD + "' ";
			sql += " , ERI_MODI_ID   = '" + MODI_ID + "' ";
			sql += " , ERI_MODI_DTT = SYSDATE ";
			sql += " , ERI_OCS_VL   = '" + OCS_VL + "'  ";

			if(!RSLT_EX.equals("")) {
			sql += " ,  ERI_RSLT_EX = '" + RSLT_EX + "' ";
			}

			sql += " WHERE ERI_EXAM_DT = '" + EXAM_DT + "' ";
			sql += " AND ERI_EXAM_SQ = '" + EXAM_SQ + "' ";

			if(CODE_GBN.equals("ITEM_CD")) {
				sql += " AND (ERI_ITEM_CD = '" + OSRL_CD + "') ";
			} else {
				sql += " AND (NVL(ERI_OSRL_CD,'XXX') = '" + OSRL_CD +"') ";
			}


			argStmtExec.executeUpdate(sql);

		} catch (Exception e) {

			throw new FuncException(e.toString(), sql);
		}

		return sql;
	}
%>
