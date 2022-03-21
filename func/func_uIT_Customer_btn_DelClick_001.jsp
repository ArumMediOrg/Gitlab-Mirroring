<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%!
	public String func_uIT_Customer_btn_DelClick_001(Statement argStmtExec, HashMap argHtMethod) throws Exception {

		String sql = "";
		String sql2 = "";
		String sql_disp = "";

		try {

			String ICR_CUST_NO = (String) argHtMethod.get("ICR_CUST_NO");

			//
			if(ICR_CUST_NO == null) { ICR_CUST_NO = ""; }

			//
			ICR_CUST_NO = CTr.Replace(ICR_CUST_NO, "'", "''");

			sql = "UPDATE IT_CUSTOMER SET ";
			sql += "  ICR_USE_YN = 'N'";
			sql += " WHERE ICR_CUST_NO = '" + ICR_CUST_NO + "'";

			argStmtExec.executeUpdate(sql);

		} catch (Exception e) {

			throw new FuncException(e.toString(), sql);
		}

		return sql;
	}
%>
