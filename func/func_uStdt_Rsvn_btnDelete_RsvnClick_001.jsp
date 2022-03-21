<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%!
	public String func_uStdt_Rsvn_btnDelete_RsvnClick_001(Statement argStmtExec, HashMap argHtMethod) throws Exception {

		String sql = "";
		String sql2 = "";
		String sql_disp = "";

		Connection connect = argStmtExec.getConnection();
		CallableStatement CallStmtExec = null;

		try {

			String PRSVN_NO = (String) argHtMethod.get("PRSVN_NO");
			//
			if(PRSVN_NO == null) { PRSVN_NO = ""; }


			sql = " Delete From REVER ";
			sql += " Where RSVN_NO = ? ";


			CallStmtExec = connect.prepareCall(sql);

			CallStmtExec.setString(1,  PRSVN_NO);

			CallStmtExec.executeUpdate();


		} catch (Exception e) {

			throw new FuncException(e.toString(), sql);
		}

		return sql;
	}
%>
