<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%!
	public String func_uCRM_BASIC_btnS5_Email_DtClick_001(Statement argStmtExec, HashMap argHtMethod) throws Exception {

		String sql = "";
		String sql2 = "";
		String sql_disp = "";

		Connection connect = argStmtExec.getConnection();
		CallableStatement CallStmtExec = null;

		try {

			String SEQ = (String) argHtMethod.get("SEQ");
			String EMAIL_DT = (String) argHtMethod.get("EMAIL_DT");
			String USER_ID = (String) argHtMethod.get("USER_ID");
			//

			if(SEQ == null) { SEQ = ""; }
			if(EMAIL_DT == null) { EMAIL_DT = ""; }
			if(USER_ID == null) { USER_ID = ""; }

			//

			sql = " update CR_POST_MNG ";
			sql += " set ";
			sql += " CPM_EMAIL_DT = ? ";
			sql += " ,CPM_EMAIL_ID = ? ";
			sql += " where ";
			sql += " 	CPM_SEQ = ? ";

			CallStmtExec = connect.prepareCall(sql);

			CallStmtExec.setString(1, EMAIL_DT);
			CallStmtExec.setString(2, USER_ID);
			CallStmtExec.setString(3, SEQ);


			CallStmtExec.executeUpdate();


		} catch (Exception e) {

			throw new FuncException(e.toString(), sql);
		}

		return sql;
	}
%>
