<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%!
	public String func_uIT_Customer_Update_001(Statement argStmtExec, HashMap argHtMethod) throws Exception {

		String sql = "";
		String sql2 = "";
		String sql_disp = "";

		Connection connect = argStmtExec.getConnection();
		CallableStatement CallStmtExec = null;

		try {

			String MMBR_CD = (String) argHtMethod.get("MMBR_CD");
			String CUST_NO = (String) argHtMethod.get("CUST_NO");

			//
			if(MMBR_CD == null) { MMBR_CD = ""; }
			if(CUST_NO == null) { CUST_NO = ""; }

			sql = " Update IT_CUSTOMER ";
			sql += " Set ICR_MMBR_CD = ? ";
			sql += " Where ICR_CUST_NO = ? ";

			CallStmtExec = connect.prepareCall(sql);

			CallStmtExec.setString(1, MMBR_CD);
			CallStmtExec.setString(2, CUST_NO);

			CallStmtExec.executeUpdate();

		} catch (Exception e) {

			throw new FuncException(e.toString(), sql);
		}

		return sql;
	}
%>
