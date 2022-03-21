<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%!
	public String func_uCRM_BASIC_miPost_DelClick_001(Statement argStmtExec, HashMap argHtMethod) throws Exception {

		String sql = "";
		String sql2 = "";
		String sql_disp = "";

		Connection connect = argStmtExec.getConnection();
		CallableStatement CallStmtExec = null;

		try {

			String SEQ = (String) argHtMethod.get("SEQ");

			//
			if(SEQ == null) { SEQ = ""; }

			//

			sql = " DELETE CR_POST_MNG ";
			sql += " WHERE CPM_SEQ = ? ";

			CallStmtExec = connect.prepareCall(sql);

			CallStmtExec.setString(1, SEQ);


			CallStmtExec.executeUpdate();

		} catch (Exception e) {

			throw new FuncException(e.toString(), sql);
		}

		return sql;
	}
%>
