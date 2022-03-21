<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%!
	public String func_uPsnl_Memo_btnSaveClick_002(Statement argStmtExec, HashMap argHtMethod) throws Exception {

		String sql = "";
		String sql2 = "";
		String sql_disp = "";

		try {

			String MEMO_TX = (String) argHtMethod.get("MEMO_TX");
			String CUST_NO = (String) argHtMethod.get("CUST_NO");
			String MEMO_SQ = (String) argHtMethod.get("MEMO_SQ");

			//
			if(MEMO_TX == null) { MEMO_TX = ""; }
			if(CUST_NO == null) { CUST_NO = ""; }
			if(MEMO_SQ == null) { MEMO_SQ = ""; }

			//
			MEMO_TX = CTr.Replace(MEMO_TX, "'", "''");
			CUST_NO = CTr.Replace(CUST_NO, "'", "''");
			MEMO_SQ = CTr.Replace(MEMO_SQ, "'", "''");

			sql = "UPDATE ET_PSNL_MEMO SET ";
			sql += "  EPM_MEMO_TX = '" + MEMO_TX + "'";
			sql += " WHERE EPM_CUST_NO = '" + CUST_NO + "'";
			sql += " AND EPM_MEMO_SQ = '" + MEMO_SQ + "'";

			argStmtExec.executeUpdate(sql);

		} catch (Exception e) {

			throw new FuncException(e.toString(), sql);
		}

		return sql;
	}
%>
