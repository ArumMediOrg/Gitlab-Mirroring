<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%!
	public String func_uPack_Each_btnSaveClick_M11_015(Statement argStmtExec, HashMap argHtMethod) throws Exception {

		String sql = "";
		String sql2 = "";
		String sql_disp = "";

		try {

			String EXAM_CD = (String) argHtMethod.get("EXAM_CD");
			String PACK_SQ = (String) argHtMethod.get("PACK_SQ");
			String ITEM_CD = (String) argHtMethod.get("ITEM_CD");
			String SORT_SQ = (String) argHtMethod.get("SORT_SQ");
			String ITEM_PR = (String) argHtMethod.get("ITEM_PR");
			String SALE_PR = (String) argHtMethod.get("SALE_PR");
			String GRUP_PR = (String) argHtMethod.get("GRUP_PR");
			String COUP_PR = (String) argHtMethod.get("COUP_PR");
			String FAMY_PR = (String) argHtMethod.get("FAMY_PR");
			String CUPN_PR = (String) argHtMethod.get("CUPN_PR");
			String MMBR_PR = (String) argHtMethod.get("MMBR_PR");
			String INPT_ID = (String) argHtMethod.get("INPT_ID");
			String MODI_ID = (String) argHtMethod.get("MODI_ID");

			//
			if(EXAM_CD == null) { EXAM_CD = ""; }
			if(PACK_SQ == null) { PACK_SQ = ""; }
			if(ITEM_CD == null) { ITEM_CD = ""; }
			if(SORT_SQ == null) { SORT_SQ = ""; }
			if(ITEM_PR == null) { ITEM_PR = ""; }
			if(SALE_PR == null) { SALE_PR = ""; }
			if(GRUP_PR == null) { GRUP_PR = ""; }
			if(COUP_PR == null) { COUP_PR = ""; }
			if(FAMY_PR == null) { FAMY_PR = ""; }
			if(CUPN_PR == null) { CUPN_PR = ""; }
			if(MMBR_PR == null) { MMBR_PR = ""; }
			if(INPT_ID == null) { INPT_ID = ""; }
			if(MODI_ID == null) { MODI_ID = ""; }

			//
			EXAM_CD = CTr.Replace(EXAM_CD, "'", "''");
			PACK_SQ = CTr.Replace(PACK_SQ, "'", "''");
			ITEM_CD = CTr.Replace(ITEM_CD, "'", "''");
			SORT_SQ = CTr.Replace(SORT_SQ, "'", "''");
			ITEM_PR = CTr.Replace(ITEM_PR, "'", "''");
			SALE_PR = CTr.Replace(SALE_PR, "'", "''");
			GRUP_PR = CTr.Replace(GRUP_PR, "'", "''");
			COUP_PR = CTr.Replace(COUP_PR, "'", "''");
			FAMY_PR = CTr.Replace(FAMY_PR, "'", "''");
			CUPN_PR = CTr.Replace(CUPN_PR, "'", "''");
			MMBR_PR = CTr.Replace(MMBR_PR, "'", "''");
			INPT_ID = CTr.Replace(INPT_ID, "'", "''");
			MODI_ID = CTr.Replace(MODI_ID, "'", "''");

			sql = "INSERT INTO ET_PACK_ITEM (EPI_EXAM_CD, EPI_PACK_SQ, EPI_ITEM_CD, EPI_SORT_SQ, EPI_ITEM_PR, EPI_SALE_PR, EPI_GRUP_PR, EPI_COUP_PR, EPI_FAMY_PR, EPI_CUPN_PR, EPI_MMBR_PR, EPI_USE_YN, EPI_NUSE_ID, EPI_NUSE_DTT, EPI_INPT_ID, EPI_INPT_DTT, EPI_MODI_ID, EPI_MODI_DTT) VALUES (";
			sql += "  '" + EXAM_CD + "'";
			sql += ", '" + PACK_SQ + "'";
			sql += ", '" + ITEM_CD + "'";
			sql += ", '" + SORT_SQ + "'";
			sql += ", '" + ITEM_PR + "'";
			sql += ", '" + SALE_PR + "'";
			sql += ", '" + GRUP_PR + "'";
			sql += ", '" + COUP_PR + "'";
			sql += ", '" + FAMY_PR + "'";
			sql += ", '" + CUPN_PR + "'";
			sql += ", '" + MMBR_PR + "'";
			sql += ", 'Y'";
			sql += ", ''";
			sql += ", NULL";
			sql += ", '" + INPT_ID + "'";
			sql += ", SYSDATE";
			sql += ", '" + MODI_ID + "'";
			sql += ", SYSDATE";
			sql += ")";

			argStmtExec.executeUpdate(sql);

		} catch (Exception e) {

			throw new FuncException(e.toString(), sql);
		}

		return sql;
	}
%>
