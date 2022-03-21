<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%!
	public String func_uExam_Result_grdBldRsltKeyPress_001(Statement argStmtExec, HashMap argHtMethod) throws Exception {

		String sql = "";
		String sql2 = "";
		String sql_disp = "";

		try {

			String MODI_ID = (String) argHtMethod.get("MODI_ID");
			String EXAM_DT = (String) argHtMethod.get("EXAM_DT");
			String EXAM_SQ = (String) argHtMethod.get("EXAM_SQ");
			String ITEM_CD = (String) argHtMethod.get("ITEM_CD");

			//
			if(MODI_ID == null) { MODI_ID = ""; }
			if(EXAM_DT == null) { EXAM_DT = ""; }
			if(EXAM_SQ == null) { EXAM_SQ = ""; }
			if(ITEM_CD == null) { ITEM_CD = ""; }

			//
			MODI_ID = CTr.Replace(MODI_ID, "'", "''");
			EXAM_DT = CTr.Replace(EXAM_DT, "'", "''");
			EXAM_SQ = CTr.Replace(EXAM_SQ, "'", "''");
			ITEM_CD = CTr.Replace(ITEM_CD, "'", "''");

			sql = "UPDATE ET_RSLT_ITEM SET ";
			sql += "  ERI_RSLT_VL = ''";
			sql += ", ERI_PRCH_VL = ''";
			sql += ", ERI_PRNM_VL = ''";
			sql += ", ERI_VLDT_LH = ''";
			sql += ", ERI_VLSV_YN = ''";
			sql += ", ERI_RSLT_LOW = ''";
			sql += ", ERI_RSLT_HIGH = ''";
			sql += ", ERI_CHAR_VAL = ''";
			sql += ", ERI_LOW_KD = ''";
			sql += ", ERI_HIGH_KD = ''";
			sql += ", ERI_RSLT_UNIT = ''";
			sql += ", ERI_RSZR_KD = ''";
			sql += ", ERI_CHAR_CD = ''";
			sql += ", ERI_HERT_CD = ''";
			sql += ", ERI_SPRT_CD = ''";
			sql += ", ERI_CFRM_YN = ''";
			sql += ", ERI_ALSB_PANJ = ''";
			sql += ", ERI_HTSB_PANJ = ''";
			sql += ", ERI_WOSB_PANJ = ''";
			sql += ", ERI_SPSB_PANJ = ''";
			sql += ", ERI_EMSB_PANJ = ''";
			sql += ", ERI_STSB_PANJ = ''";
			sql += ", ERI_STEP_CD = '1'";
			sql += ", ERI_INPUT_DTT = ''";
			sql += ", ERI_MODI_DTT = SYSDATE";
			sql += ", ERI_MODI_ID = '" + MODI_ID + "'";
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
