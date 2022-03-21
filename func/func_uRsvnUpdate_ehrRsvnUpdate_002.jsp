<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%!
	public String func_uRsvnUpdate_ehrRsvnUpdate_002(Statement argStmtExec, HashMap argHtMethod) throws Exception {

		String sql = "";
		String sql2 = "";
		String sql_disp = "";

		Connection connect = argStmtExec.getConnection();
		CallableStatement CallStmtExec = null;

		try {

			String OCS_NO = (String) argHtMethod.get("OCS_NO");
			String RSVN_NO = (String) argHtMethod.get("RSVN_NO");

			//

			if(OCS_NO == null) { OCS_NO = ""; }
			if(RSVN_NO == null) { RSVN_NO = ""; }

			//

			sql = " UPDATE RT_RSVT ";
			sql += " SET RRT_OCS_NO = ? ";
			sql += " WHERE RRT_RSVN_NO = ? ";

			CallStmtExec = connect.prepareCall(sql);

			CallStmtExec.setString(1, OCS_NO);
			CallStmtExec.setString(2, RSVN_NO);

			CallStmtExec.executeUpdate();

		} catch (Exception e) {

			throw new FuncException(e.toString(), sql);
		}

		return sql;
	}
%>
