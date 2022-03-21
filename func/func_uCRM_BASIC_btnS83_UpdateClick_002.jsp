<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%!
	public String func_uCRM_BASIC_btnS83_UpdateClick_002(Statement argStmtExec, HashMap argHtMethod) throws Exception {

		String sql = "";
		String sql2 = "";
		String sql_disp = "";

		Connection connect = argStmtExec.getConnection();
		CallableStatement CallStmtExec = null;

		try {

			String PLAN_DT = (String) argHtMethod.get("PLAN_DT");
			String EMP_NO = (String) argHtMethod.get("EMP_NO");
			String CHG_EMP_NO = (String) argHtMethod.get("CHG_EMP_NO");
			String USER_ID = (String) argHtMethod.get("USER_ID");

			//
			if(PLAN_DT == null) { PLAN_DT = ""; }
			if(EMP_NO == null) { EMP_NO = ""; }
			if(CHG_EMP_NO == null) { CHG_EMP_NO = ""; }
			if(USER_ID == null) { USER_ID = ""; }

			//


			sql = " update CR_DOCTOR_TIME ";
			sql += " set ";
			sql += "  CDT_EMP_NO   =  ? ";
			sql += " ,CDT_MODI_ID  =  ? ";
			sql += " ,CDT_MODI_DTT =  sysdate ";
			sql += " where ";
			sql += " 	 CDT_PLAN_DT = ? ";
			sql += " and CDT_EMP_NO  = ? ";


			CallStmtExec = connect.prepareCall(sql);

			CallStmtExec.setString(1, CHG_EMP_NO);
			CallStmtExec.setString(2, USER_ID);
			CallStmtExec.setString(3, PLAN_DT);
			CallStmtExec.setString(4, EMP_NO);

			CallStmtExec.executeUpdate();

		} catch (Exception e) {

			throw new FuncException(e.toString(), sql);
		}

		return sql;
	}
%>
