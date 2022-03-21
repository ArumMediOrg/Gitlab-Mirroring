<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%!
	public String func_uPsnl_Memo_btnDeleteClick_001_V002(Statement argStmtExec, HashMap argHtMethod) throws Exception {

		String sql = "";
		String sql2 = "";
		String sql_disp = "";

		try {

			String CUST_NO = (String) argHtMethod.get("CUST_NO");
			String MEMO_SQ = (String) argHtMethod.get("MEMO_SQ");

			//
			if(CUST_NO == null) { CUST_NO = ""; }
			if(MEMO_SQ == null) { MEMO_SQ = ""; }

			//
			CUST_NO = CTr.Replace(CUST_NO, "'", "''");
			MEMO_SQ = CTr.Replace(MEMO_SQ, "'", "''");

			sql = "DELETE ET_PSNL_MEMO";
			sql += " WHERE EPM_CUST_NO = '" + CUST_NO + "'";
			sql += " AND EPM_MEMO_SQ = '" + MEMO_SQ + "'";

			argStmtExec.executeUpdate(sql);

		} catch (Exception e) {

			throw new FuncException(e.toString(), sql);
		}

		return sql;
	}
%>
