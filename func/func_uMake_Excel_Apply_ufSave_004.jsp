<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%!
	public String func_uMake_Excel_Apply_ufSave_004(Statement argStmtExec, HashMap argHtMethod) throws Exception {

		String sql = "";
		String sql2 = "";
		String sql_disp = "";

		try {

			String PACK_CD = (String) argHtMethod.get("PACK_CD");
			String ITEM_CD = (String) argHtMethod.get("ITEM_CD");
			String ITEM_NM = (String) argHtMethod.get("ITEM_NM");
			String ITEM_KD = (String) argHtMethod.get("ITEM_KD");
			String ITEM_SQ = (String) argHtMethod.get("ITEM_SQ");
			String COLM_DT = (String) argHtMethod.get("COLM_DT");
			String COLM_SQ = (String) argHtMethod.get("COLM_SQ");
			String TLBE_NM = (String) argHtMethod.get("TLBE_NM");
			String COMM_SP = (String) argHtMethod.get("COMM_SP");
			String INPT_ID = (String) argHtMethod.get("INPT_ID");

			//
			if(PACK_CD == null) { PACK_CD = ""; }
			if(ITEM_CD == null) { ITEM_CD = ""; }
			if(ITEM_NM == null) { ITEM_NM = ""; }
			if(ITEM_KD == null) { ITEM_KD = ""; }
			if(ITEM_SQ == null) { ITEM_SQ = ""; }
			if(COLM_DT == null) { COLM_DT = ""; }
			if(COLM_SQ == null) { COLM_SQ = ""; }
			if(TLBE_NM == null) { TLBE_NM = ""; }
			if(COMM_SP == null) { COMM_SP = ""; }
			if(INPT_ID == null) { INPT_ID = ""; }

			//
			PACK_CD = CTr.Replace(PACK_CD, "'", "''");
			ITEM_CD = CTr.Replace(ITEM_CD, "'", "''");
			ITEM_NM = CTr.Replace(ITEM_NM, "'", "''");
			ITEM_KD = CTr.Replace(ITEM_KD, "'", "''");
			ITEM_SQ = CTr.Replace(ITEM_SQ, "'", "''");
			COLM_DT = CTr.Replace(COLM_DT, "'", "''");
			COLM_SQ = CTr.Replace(COLM_SQ, "'", "''");
			TLBE_NM = CTr.Replace(TLBE_NM, "'", "''");
			COMM_SP = CTr.Replace(COMM_SP, "'", "''");
			INPT_ID = CTr.Replace(INPT_ID, "'", "''");

			sql = "INSERT INTO IT_EXCEL_ITEM ( IEI_PACK_CD , IEI_ITEM_CD , IEI_ITEM_NM , IEI_ITEM_KD , IEI_ITEM_SQ , IEI_COLM_DT , IEI_COLM_SQ , IEI_TLBE_NM , IEI_COMM_SP , IEI_INPT_ID ) VALUES (";
			sql += "  '" + PACK_CD + "'";
			sql += ", '" + ITEM_CD + "'";
			sql += ", '" + ITEM_NM + "'";
			sql += ", '" + ITEM_KD + "'";
			sql += ", '" + ITEM_SQ + "'";
			sql += ", '" + COLM_DT + "'";
			sql += ", '" + COLM_SQ + "'";
			sql += ", '" + TLBE_NM + "'";
			sql += ", '" + COMM_SP + "'";
			sql += ", '" + INPT_ID + "'";
			sql += ")";

			argStmtExec.executeUpdate(sql);

		} catch (Exception e) {

			throw new FuncException(e.toString(), sql);
		}

		return sql;
	}
%>
