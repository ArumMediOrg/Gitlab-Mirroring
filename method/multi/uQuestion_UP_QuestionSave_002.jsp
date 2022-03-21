<%!
	public String uQuestion_UP_QuestionSave_002(Statement argStmtExec, HashMap argHtMethod) throws Exception {
	
		String sql;

		String RECV_YN = (String) argHtMethod.get("RECV_YN");
		String CUST_NO = (String) argHtMethod.get("CUST_NO");

		//
		if(RECV_YN == null) { RECV_YN = ""; }
		if(CUST_NO == null) { CUST_NO = ""; }

		//
		sql = "UPDATE IT_CUSTOMER SET ";
		sql += "  ICR_RECV_YN = '" + RECV_YN + "'";
		sql += " WHERE ICR_CUST_NO = '" + CUST_NO + "'";

		argStmtExec.executeUpdate(sql);

		return sql;
	}
%>