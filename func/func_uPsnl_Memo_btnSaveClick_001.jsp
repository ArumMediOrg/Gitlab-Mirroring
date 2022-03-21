<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%!
	public String func_uPsnl_Memo_btnSaveClick_001(Statement argStmtExec, HashMap argHtMethod) throws Exception {

		String sql = "";
		String sql2 = "";
		String sql_disp = "";

		try {

			String MEMO_SQ = (String) argHtMethod.get("MEMO_SQ");
			String CUST_NO = (String) argHtMethod.get("CUST_NO");
			String GCHART_NO = (String) argHtMethod.get("GCHART_NO");
			String MEMO_TX = (String) argHtMethod.get("MEMO_TX");
			String GUSER = (String) argHtMethod.get("GUSER");

			//
			if(MEMO_SQ == null) { MEMO_SQ = ""; }
			if(CUST_NO == null) { CUST_NO = ""; }
			if(GCHART_NO == null) { GCHART_NO = ""; }
			if(MEMO_TX == null) { MEMO_TX = ""; }
			if(GUSER == null) { GUSER = ""; }

			//
			MEMO_SQ = CTr.Replace(MEMO_SQ, "'", "''");
			CUST_NO = CTr.Replace(CUST_NO, "'", "''");
			GCHART_NO = CTr.Replace(GCHART_NO, "'", "''");
			MEMO_TX = CTr.Replace(MEMO_TX, "'", "''");
			GUSER = CTr.Replace(GUSER, "'", "''");

			if(MEMO_SQ.equals("")) {

				sql = " INSERT INTO ET_PSNL_MEMO";
				sql += " SELECT '" + CUST_NO + "', NVL(MAX(EPM_MEMO_SQ), 0) + 1, '" + GCHART_NO + "', TRIM('" + MEMO_TX + "'), '" + GUSER + "', SYSDATE";
				sql += " FROM ET_PSNL_MEMO";
				sql += " WHERE EPM_CUST_NO = '" + CUST_NO + "'";

				argStmtExec.executeUpdate(sql);
			} else {
			
				sql = "UPDATE ET_PSNL_MEMO SET ";
				sql += "  EPM_MEMO_TX = TRIM('" + MEMO_TX + "')";
				sql += " WHERE EPM_CUST_NO = '" + CUST_NO + "'";
				sql += " AND EPM_MEMO_SQ = '" + MEMO_SQ + "'";

				argStmtExec.executeUpdate(sql);
			}
		} catch (Exception e) {

			throw new FuncException(e.toString(), sql);
		}

		return sql;
	}
%>
