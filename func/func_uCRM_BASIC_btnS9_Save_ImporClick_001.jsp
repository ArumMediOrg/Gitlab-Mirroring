<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%!
	public String func_uCRM_BASIC_btnS9_Save_ImporClick_001(Statement argStmtExec, HashMap argHtMethod) throws Exception {

		String sql = "";
		String sql2 = "";
		String sql_disp = "";

		Connection connect = argStmtExec.getConnection();
		CallableStatement CallStmtExec = null;

		try {

			String CUST_TX = (String) argHtMethod.get("CUST_TX");
			String USER_ID = (String) argHtMethod.get("USER_ID");
			String CUST_NO = (String) argHtMethod.get("CUST_NO");

			//

			if(CUST_TX == null) { CUST_TX = ""; }
			if(USER_ID == null) { USER_ID = ""; }
			if(CUST_NO == null) { CUST_NO = ""; }

			//

			sql = " update IT_CUSTOMER ";
			sql += " set ";
			sql += " ICR_CUST_TX    =  ? ";
			sql += " ,ICR_MODI_ID   =  ? ";
			sql += " ,ICR_MODI_DTT  =  sysdate ";
			sql += " where ICR_CUST_NO = ? ";

			CallStmtExec = connect.prepareCall(sql);

			CallStmtExec.setString(1, CUST_TX);
			CallStmtExec.setString(2, USER_ID);
			CallStmtExec.setString(3, CUST_NO);

			CallStmtExec.executeUpdate();


		} catch (Exception e) {

			throw new FuncException(e.toString(), sql);
		}

		return sql;
	}
%>
