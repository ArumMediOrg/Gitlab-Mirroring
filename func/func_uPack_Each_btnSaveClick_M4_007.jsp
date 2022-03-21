<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%!
	public String func_uPack_Each_btnSaveClick_M4_007(Statement argStmtExec, HashMap argHtMethod) throws Exception {

		String sql = "";
		String sql2 = "";
		String sql_disp = "";

		try {

			String SEX_CD = (String) argHtMethod.get("SEX_CD");
			String PACK_NM = (String) argHtMethod.get("PACK_NM");
			String PACK_SDT = (String) argHtMethod.get("PACK_SDT");
			String PACK_EDT = (String) argHtMethod.get("PACK_EDT");
			String CALC_CD = (String) argHtMethod.get("CALC_CD");
			String CALC_PR = (String) argHtMethod.get("CALC_PR");
			String SALE_PR = (String) argHtMethod.get("SALE_PR");
			String GRUP_PR = (String) argHtMethod.get("GRUP_PR");
			String COUP_PR = (String) argHtMethod.get("COUP_PR");
			String FAMY_PR = (String) argHtMethod.get("FAMY_PR");
			String CUPN_PR = (String) argHtMethod.get("CUPN_PR");
			String MMBR_PR = (String) argHtMethod.get("MMBR_PR");
			String OPTN_PR = (String) argHtMethod.get("OPTN_PR");
			String CNCL_CD = (String) argHtMethod.get("CNCL_CD");
			String OPTN_YN = (String) argHtMethod.get("OPTN_YN");
			String ITEM_LT = (String) argHtMethod.get("ITEM_LT");
			String PACK_TX = (String) argHtMethod.get("PACK_TX");
			String MODI_ID = (String) argHtMethod.get("MODI_ID");
			String TRNS_ID = (String) argHtMethod.get("TRNS_ID");
			String ORGA_CD = (String) argHtMethod.get("ORGA_CD");
			String EXAM_CD = (String) argHtMethod.get("EXAM_CD");
			String PACK_SQ = (String) argHtMethod.get("PACK_SQ");
			String PACK_ENM = (String) argHtMethod.get("PACK_ENM");
			String HOMEPAGE_YN = (String) argHtMethod.get("HOMEPAGE_YN");

			//
			if(SEX_CD == null) { SEX_CD = ""; }
			if(PACK_NM == null) { PACK_NM = ""; }
			if(PACK_SDT == null) { PACK_SDT = ""; }
			if(PACK_EDT == null) { PACK_EDT = ""; }
			if(CALC_CD == null) { CALC_CD = ""; }
			if(CALC_PR == null) { CALC_PR = ""; }
			if(SALE_PR == null) { SALE_PR = ""; }
			if(GRUP_PR == null) { GRUP_PR = ""; }
			if(COUP_PR == null) { COUP_PR = ""; }
			if(FAMY_PR == null) { FAMY_PR = ""; }
			if(CUPN_PR == null) { CUPN_PR = ""; }
			if(MMBR_PR == null) { MMBR_PR = ""; }
			if(OPTN_PR == null) { OPTN_PR = ""; }
			if(CNCL_CD == null) { CNCL_CD = ""; }
			if(OPTN_YN == null) { OPTN_YN = ""; }
			if(ITEM_LT == null) { ITEM_LT = ""; }
			if(PACK_TX == null) { PACK_TX = ""; }
			if(MODI_ID == null) { MODI_ID = ""; }
			if(TRNS_ID == null) { TRNS_ID = ""; }
			if(ORGA_CD == null) { ORGA_CD = ""; }
			if(EXAM_CD == null) { EXAM_CD = ""; }
			if(PACK_SQ == null) { PACK_SQ = ""; }
			if(PACK_ENM == null) { PACK_ENM = ""; }
			if(HOMEPAGE_YN == null) { HOMEPAGE_YN = ""; }

			//
			SEX_CD = CTr.Replace(SEX_CD, "'", "''");
			PACK_NM = CTr.Replace(PACK_NM, "'", "''");
			PACK_SDT = CTr.Replace(PACK_SDT, "'", "''");
			PACK_EDT = CTr.Replace(PACK_EDT, "'", "''");
			CALC_CD = CTr.Replace(CALC_CD, "'", "''");
			CALC_PR = CTr.Replace(CALC_PR, "'", "''");
			SALE_PR = CTr.Replace(SALE_PR, "'", "''");
			GRUP_PR = CTr.Replace(GRUP_PR, "'", "''");
			COUP_PR = CTr.Replace(COUP_PR, "'", "''");
			FAMY_PR = CTr.Replace(FAMY_PR, "'", "''");
			CUPN_PR = CTr.Replace(CUPN_PR, "'", "''");
			MMBR_PR = CTr.Replace(MMBR_PR, "'", "''");
			OPTN_PR = CTr.Replace(OPTN_PR, "'", "''");
			CNCL_CD = CTr.Replace(CNCL_CD, "'", "''");
			OPTN_YN = CTr.Replace(OPTN_YN, "'", "''");
			ITEM_LT = CTr.Replace(ITEM_LT, "'", "''");
			PACK_TX = CTr.Replace(PACK_TX, "'", "''");
			MODI_ID = CTr.Replace(MODI_ID, "'", "''");
			TRNS_ID = CTr.Replace(TRNS_ID, "'", "''");
			ORGA_CD = CTr.Replace(ORGA_CD, "'", "''");
			EXAM_CD = CTr.Replace(EXAM_CD, "'", "''");
			PACK_SQ = CTr.Replace(PACK_SQ, "'", "''");
			PACK_ENM = CTr.Replace(PACK_ENM, "'", "''");
			HOMEPAGE_YN = CTr.Replace(HOMEPAGE_YN, "'", "''");

			sql = "UPDATE ET_PACK SET ";
			sql += "  EPK_SEX_CD = '" + SEX_CD + "'";
			sql += ", EPK_PACK_NM = '" + PACK_NM + "'";
			sql += ", EPK_PACK_SDT = '" + PACK_SDT + "'";
			sql += ", EPK_PACK_EDT = '" + PACK_EDT + "'";
			sql += ", EPK_CALC_CD = '" + CALC_CD + "'";
			sql += ", EPK_CALC_PR = '" + CALC_PR + "'";
			sql += ", EPK_SALE_PR = '" + SALE_PR + "'";
			sql += ", EPK_GRUP_PR = '" + GRUP_PR + "'";
			sql += ", EPK_COUP_PR = '" + COUP_PR + "'";
			sql += ", EPK_FAMY_PR = '" + FAMY_PR + "'";
			sql += ", EPK_CUPN_PR = '" + CUPN_PR + "'";
			sql += ", EPK_MMBR_PR = '" + MMBR_PR + "'";
			sql += ", EPK_OPTN_PR = '" + OPTN_PR + "'";
			sql += ", EPK_CNCL_CD = '" + CNCL_CD + "'";
			sql += ", EPK_OPTN_YN = '" + OPTN_YN + "'";
			sql += ", EPK_ITEM_LT = '" + ITEM_LT + "'";
			sql += ", EPK_PACK_TX = '" + PACK_TX + "'";
			sql += ", EPK_MODI_ID = '" + MODI_ID + "'";
			sql += ", EPK_MODI_DTT = SYSDATE";
			sql += ", EPK_TRNS_ID = '" + TRNS_ID + "'";
			sql += ", EPK_ORGA_CD = '" + ORGA_CD + "'";
			sql += ", EPK_PACK_ENM = '" + PACK_ENM + "'";
			sql += ", EPK_HOMEPAGE_YN = '" + HOMEPAGE_YN + "'";
			sql += " WHERE EPK_EXAM_CD = '" + EXAM_CD + "'";
			sql += " AND EPK_PACK_SQ = '" + PACK_SQ + "'";

			argStmtExec.executeUpdate(sql);

		} catch (Exception e) {

			throw new FuncException(e.toString(), sql);
		}

		return sql;
	}
%>
