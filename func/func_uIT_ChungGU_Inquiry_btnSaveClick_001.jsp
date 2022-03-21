<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%!
	public String func_uIT_ChungGU_Inquiry_btnSaveClick_001(Statement argStmtExec, HashMap argHtMethod) throws Exception {

		String sql = "";
		String sql2 = "";
		String sql_disp = "";

		Connection connect = argStmtExec.getConnection();
		CallableStatement CallStmtExec = null;

		try {

			String BOOK_DT = (String) argHtMethod.get("BOOK_DT");
			String BILL_TX = (String) argHtMethod.get("BILL_TX");
			String BILL_DT = (String) argHtMethod.get("BILL_DT");
			String BILL_NO = (String) argHtMethod.get("BILL_NO");

			//
			if(BOOK_DT == null) { BOOK_DT = ""; }
			if(BILL_TX == null) { BILL_TX = ""; }
			if(BILL_DT == null) { BILL_DT = ""; }
			if(BILL_NO == null) { BILL_NO = ""; }

			//

			sql = " update BT_BILL_COMP ";
			sql += " set ";
			sql += " BBC_BOOK_DT = ? ";
			sql += " ,BBC_BILL_TX =  ? ";
			sql += " where ";
			sql += " 	BBC_BILL_DT = ? ";
			sql += " and BBC_BILL_NO = ? ";

			CallStmtExec = connect.prepareCall(sql);

			CallStmtExec.setString(1, BOOK_DT);
			CallStmtExec.setString(2, BILL_TX);
			CallStmtExec.setString(3, BILL_DT);
			CallStmtExec.setString(4, BILL_NO);


			CallStmtExec.executeUpdate();

		} catch (Exception e) {

			throw new FuncException(e.toString(), sql);
		}

		return sql;
	}
%>
