<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%!
	public String func_uPack_Each_btnSaveClick_M3_006(Statement argStmtExec, HashMap argHtMethod) throws Exception {

		String sql = "";
		String sql2 = "";
		String sql_disp = "";

		try {

			String GUSER = (String) argHtMethod.get("GUSER");
			String EXAM_CD = (String) argHtMethod.get("EXAM_CD");
			String PACK_SQ = (String) argHtMethod.get("PACK_SQ");

			//
			if(GUSER == null) { GUSER = ""; }
			if(EXAM_CD == null) { EXAM_CD = ""; }
			if(PACK_SQ == null) { PACK_SQ = ""; }

			//
			GUSER = CTr.Replace(GUSER, "'", "''");
			EXAM_CD = CTr.Replace(EXAM_CD, "'", "''");
			PACK_SQ = CTr.Replace(PACK_SQ, "'", "''");

			sql = "INSERT INTO ET_PACK_LOG SELECT EPK_EXAM_CD, EPK_PACK_SQ, EPK_CALC_CD, EPK_CALC_PR, EPK_SALE_PR, EPK_GRUP_PR, EPK_COUP_PR, EPK_FAMY_PR, EPK_CUPN_PR, EPK_MMBR_PR, EPK_OPTN_PR, EPK_CNCL_CD, EPK_OPTN_YN, EPK_ITEM_LT, EPK_PACK_TX, '" + GUSER + "', SYSDATE ";
			sql += " FROM ET_PACK ";
			sql += " WHERE EPK_EXAM_CD = '" + EXAM_CD + "'";
			sql += " AND EPK_PACK_SQ = '" + PACK_SQ + "'";

			argStmtExec.executeUpdate(sql);

		} catch (Exception e) {

			throw new FuncException(e.toString(), sql);
		}

		return sql;
	}
%>
