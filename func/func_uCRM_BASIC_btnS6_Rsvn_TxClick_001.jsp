<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%!
	public String func_uCRM_BASIC_btnS6_Rsvn_TxClick_001(Statement argStmtExec, HashMap argHtMethod) throws Exception {

		String sql = "";
		String sql2 = "";
		String sql_disp = "";

		Connection connect = argStmtExec.getConnection();
		CallableStatement CallStmtExec = null;

		try {

			String RSVN_TX = (String) argHtMethod.get("RSVN_TX");
			String RSVN_NO = (String) argHtMethod.get("RSVN_NO");

			//
			if(RSVN_TX == null) { RSVN_TX = ""; }
			if(RSVN_NO == null) { RSVN_NO = ""; }

			//

			sql = " update RT_RSVT ";
			sql += " set ";
			sql += " RRT_RSVN_TX = ? ";
			sql += " where ";
			sql += " RRT_RSVN_NO = ? ";

			CallStmtExec = connect.prepareCall(sql);

			CallStmtExec.setString(1, RSVN_TX);
			CallStmtExec.setString(2, RSVN_NO);

			CallStmtExec.executeUpdate();


		} catch (Exception e) {

			throw new FuncException(e.toString(), sql);
		}

		return sql;
	}
%>
