<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%!
	public String func_uCRM_BASIC_btnS5_Acpt_TxClick_001(Statement argStmtExec, HashMap argHtMethod) throws Exception {

		String sql = "";
		String sql2 = "";
		String sql_disp = "";

		Connection connect = argStmtExec.getConnection();
		CallableStatement CallStmtExec = null;

		try {

			String SEQ = (String) argHtMethod.get("SEQ");
			String RMRK_TX = (String) argHtMethod.get("RMRK_TX");
			//

			if(SEQ == null) { SEQ = ""; }
			if(RMRK_TX == null) { RMRK_TX = ""; }

			//

			sql = " update CR_POST_MNG ";
			sql += " set ";
			sql += " CPM_RMRK_TX = ? ";
			sql += " where ";
			sql += " 	CPM_SEQ = ? ";

			CallStmtExec = connect.prepareCall(sql);

			CallStmtExec.setString(1, RMRK_TX);
			CallStmtExec.setString(2, SEQ);



			CallStmtExec.executeUpdate();


		} catch (Exception e) {

			throw new FuncException(e.toString(), sql);
		}

		return sql;
	}
%>
