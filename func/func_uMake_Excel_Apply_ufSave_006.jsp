<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%!
	public String func_uMake_Excel_Apply_ufSave_006(Statement argStmtExec, HashMap argHtMethod) throws Exception {

		String sql = "";
		String sql2 = "";
		String sql_disp = "";

		Connection connect = argStmtExec.getConnection();
		CallableStatement CallStmtExec = null;

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

			sql = " INSERT INTO IT_EXCEL_ITEM_LOG ";
			sql += " 	( IEI_PACK_CD ";
			sql += " 	, IEI_ITEM_CD ";
			sql += " 	, IEI_ITEM_NM ";
			sql += " 	, IEI_ITEM_KD ";
			sql += " 	, IEI_ITEM_SQ ";
			sql += " 	, IEI_INPT_ID ";
			sql += " 	, IEI_INPT_DTT ) ";
			sql += " VALUES ";
			sql += " 	( ? ";
			sql += " 	, ? ";
			sql += " 	, ? ";
			sql += " 	, ? ";
			sql += " 	, ? ";
			sql += " 	, ? ";
			sql += " 	, SYSDATE ) ";

			CallStmtExec = connect.prepareCall(sql);

			CallStmtExec.setString(1, PACK_CD);
			CallStmtExec.setString(2, ITEM_CD);
			CallStmtExec.setString(3, ITEM_NM);
			CallStmtExec.setString(4, ITEM_KD);
			CallStmtExec.setString(5, ITEM_SQ);
			CallStmtExec.setString(6, INPT_ID);

			CallStmtExec.executeUpdate();

		} catch (Exception e) {

			throw new FuncException(e.toString(), sql);
		}

		return sql;
	}
%>
