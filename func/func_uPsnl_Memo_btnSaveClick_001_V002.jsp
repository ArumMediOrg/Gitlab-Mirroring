<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%!
	public String func_uPsnl_Memo_btnSaveClick_001_V002(Statement argStmtExec, HashMap argHtMethod) throws Exception {

		String sql = "";
		String sql2 = "";
		String sql_disp = "";

		try {

			String CUST_NO = (String) argHtMethod.get("CUST_NO");
			String GCHART_NO = (String) argHtMethod.get("GCHART_NO");
			String MMPSNL_MEMO = (String) argHtMethod.get("MMPSNL_MEMO");
			String GUSER = (String) argHtMethod.get("GUSER");

			//
			if(CUST_NO == null) { CUST_NO = ""; }
			if(GCHART_NO == null) { GCHART_NO = ""; }
			if(MMPSNL_MEMO == null) { MMPSNL_MEMO = ""; }
			if(GUSER == null) { GUSER = ""; }

			//
			CUST_NO = CTr.Replace(CUST_NO, "'", "''");
			GCHART_NO = CTr.Replace(GCHART_NO, "'", "''");
			MMPSNL_MEMO = CTr.Replace(MMPSNL_MEMO, "'", "''");
			GUSER = CTr.Replace(GUSER, "'", "''");

			sql = " INSERT INTO ET_PSNL_MEMO SELECT '" + CUST_NO + "', NVL(MAX(EPM_MEMO_SQ), 0) + 1, '" + GCHART_NO + "', '" + MMPSNL_MEMO + "', '" + GUSER + "', SYSDATE";
			sql += " FROM ET_PSNL_MEMO";
			sql += " WHERE EPM_CUST_NO = '" + CUST_NO + "'";

			argStmtExec.executeUpdate(sql);

		} catch (Exception e) {

			throw new FuncException(e.toString(), sql);
		}

		return sql;
	}
%>
