<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%!
	public String func_uIT_ChungGU_Inquiry_RZ_BTN_Chugu_REClick_003(Statement argStmtExec, HashMap argHtMethod) throws Exception {

		String sql = "";
		String sql2 = "";
		String sql_disp = "";

		Connection connect = argStmtExec.getConnection();
		CallableStatement CallStmtExec = null;

		try {

			String BILL_DT = (String) argHtMethod.get("BILL_DT");
			String COMP_CD = (String) argHtMethod.get("COMP_CD");
			String BILL_NO = (String) argHtMethod.get("BILL_NO");

			//

			if(BILL_DT == null) { BILL_DT = ""; }
			if(COMP_CD == null) { COMP_CD = ""; }
			if(BILL_NO == null) { BILL_NO = ""; }

			//

			sql = " UPDATE BT_BILL_COMP SET BBC_RETURN_KD = '1' ";
			sql += " WHERE BBC_COMP_CD  = ? ";
			sql += " AND BBC_BILL_DT  = ? ";
			sql += " AND BBC_BILL_NO  = ? ";

			CallStmtExec = connect.prepareCall(sql);

			CallStmtExec.setString(1, COMP_CD);
			CallStmtExec.setString(2, BILL_DT);
			CallStmtExec.setString(3, BILL_NO);


			CallStmtExec.executeUpdate();

		} catch (Exception e) {

			throw new FuncException(e.toString(), sql);
		}

		return sql;
	}
%>
