<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%!
	public String func_uCRM_BASIC_btnS83_DeleteClick_002(Statement argStmtExec, HashMap argHtMethod) throws Exception {

		String sql = "";
		String sql2 = "";
		String sql_disp = "";

		Connection connect = argStmtExec.getConnection();
		CallableStatement CallStmtExec = null;

		try {

			String PLAN_DT = (String) argHtMethod.get("PLAN_DT");
			String EMP_NO = (String) argHtMethod.get("EMP_NO");

			//
			if(PLAN_DT == null) { PLAN_DT = ""; }
			if(EMP_NO == null) { EMP_NO = ""; }

			//
			sql = "  delete CR_DOCTOR_TIME ";
			sql += " where ";
			sql += " 	CDT_PLAN_DT  = ? ";
			sql += " and CDT_EMP_NO  = ? ";

			CallStmtExec = connect.prepareCall(sql);

			CallStmtExec.setString(1, PLAN_DT);
			CallStmtExec.setString(2, EMP_NO);

			CallStmtExec.executeUpdate();







		} catch (Exception e) {

			throw new FuncException(e.toString(), sql);
		}

		return sql;
	}
%>
