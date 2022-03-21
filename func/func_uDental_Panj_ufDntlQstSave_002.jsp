<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%!
	public String func_uDental_Panj_ufDntlQstSave_002(Statement argStmtExec, HashMap argHtMethod) throws Exception {

		String sql = "";
		String sql2 = "";
		String sql_disp = "";

		try {

			String RECV_YN = (String) argHtMethod.get("RECV_YN");
			String CUST_NO = (String) argHtMethod.get("CUST_NO");

			//
			if(RECV_YN == null) { RECV_YN = ""; }
			if(CUST_NO == null) { CUST_NO = ""; }

			//
			RECV_YN = CTr.Replace(RECV_YN, "'", "''");
			CUST_NO = CTr.Replace(CUST_NO, "'", "''");

			sql = "UPDATE IT_CUSTOMER SET ";
			sql += "  ICR_RECV_YN = '" + RECV_YN + "'";
			sql += " WHERE ICR_CUST_NO = '" + CUST_NO + "'";

			argStmtExec.executeUpdate(sql);

		} catch (Exception e) {

			throw new FuncException(e.toString(), sql);
		}

		return sql;
	}
%>
