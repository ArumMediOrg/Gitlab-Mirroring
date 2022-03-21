<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%!
	public String func_uCRM_BASIC_CRMMain_Save_006(Statement argStmtExec, HashMap argHtMethod) throws Exception {

		String sql = "";
		String sql2 = "";
		String sql_disp = "";

		Connection connect = argStmtExec.getConnection();
		CallableStatement CallStmtExec = null;

		try {

			String SSQL_ADD1 = (String) argHtMethod.get("SSQL_ADD1");

			//
			if(SSQL_ADD1 == null) { SSQL_ADD1 = ""; }

			//

			sql = " Insert Into ST_ADVICE_LOG \n";
			sql += " (Exam_Dt, Exam_Sq, Flag, Id, Dtt, Ip) \n";
			sql += " VALUES \n";
			sql += SSQL_ADD1;

			CallStmtExec = connect.prepareCall(sql);

			//CallStmtExec.setString(1, SSQL_ADD1);

			CallStmtExec.executeUpdate();

		} catch (Exception e) {

			throw new FuncException(e.toString(), sql);
		}

		return sql;
	}
%>
