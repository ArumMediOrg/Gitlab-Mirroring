<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%!
	public String func_uItem_Rltn_upSaveRltnItem_001(Statement argStmtExec, HashMap argHtMethod) throws Exception {

		String sql = "";
		String sql2 = "";
		String sql_disp = "";

		try {

			String IIN_ITEM_CD = (String) argHtMethod.get("IIN_ITEM_CD");
			String IIN_RLTN_CD = (String) argHtMethod.get("IIN_RLTN_CD");
			String IIN_INPT_ID = (String) argHtMethod.get("IIN_INPT_ID");

			//
			if(IIN_ITEM_CD == null) { IIN_ITEM_CD = ""; }
			if(IIN_RLTN_CD == null) { IIN_RLTN_CD = ""; }
			if(IIN_INPT_ID == null) { IIN_INPT_ID = ""; }

			//
			IIN_ITEM_CD = CTr.Replace(IIN_ITEM_CD, "'", "''");
			IIN_RLTN_CD = CTr.Replace(IIN_RLTN_CD, "'", "''");
			IIN_INPT_ID = CTr.Replace(IIN_INPT_ID, "'", "''");

			sql = "INSERT INTO IT_ITEM_RLTN ( IIN_ITEM_CD, IIN_RLTN_CD, IIN_INPUT_ID, IIN_INPUT_DTT ) VALUES (";
			sql += "  '" + IIN_ITEM_CD + "'";
			sql += ", '" + IIN_RLTN_CD + "'";
			sql += ", '" + IIN_INPT_ID + "'";
			sql += ", SYSDATE";
			sql += ")";

			argStmtExec.executeUpdate(sql);

		} catch (Exception e) {

			throw new FuncException(e.toString(), sql);
		}

		return sql;
	}
%>
