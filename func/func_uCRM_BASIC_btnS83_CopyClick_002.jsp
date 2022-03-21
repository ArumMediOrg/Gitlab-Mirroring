<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%!
	public String func_uCRM_BASIC_btnS83_CopyClick_002(Statement argStmtExec, HashMap argHtMethod) throws Exception {

		String sql = "";
		String sql2 = "";
		String sql_disp = "";

		Connection connect = argStmtExec.getConnection();
		CallableStatement CallStmtExec = null;

		try {

			String NEW_PLAN_DT = (String) argHtMethod.get("NEW_PLAN_DT");
			String PLAN_DT = (String) argHtMethod.get("PLAN_DT");
			String EMP_NO = (String) argHtMethod.get("EMP_NO");
			String USER_ID = (String) argHtMethod.get("USER_ID");

			//
			if(NEW_PLAN_DT == null) { NEW_PLAN_DT = ""; }
			if(PLAN_DT == null) { PLAN_DT = ""; }
			if(EMP_NO == null) { EMP_NO = ""; }
			if(USER_ID == null) { USER_ID = ""; }

			//


			sql = " insert into CR_DOCTOR_TIME  ( ";
			sql += " CDT_PLAN_DT ";
			sql += " ,CDT_EMP_NO ";
			sql += " ,CDT_PLAN_TM ";
			sql += " ,CDT_PLAN_CNT ";
			sql += " ,CDT_PLAN_TX ";
			sql += " ,CDT_MODI_ID ";
			sql += " ,CDT_MODI_DTT  ) ";
			sql += " select ";
			sql += " 		? ";
			sql += " 		,CDT_EMP_NO ";
			sql += " 		,CDT_PLAN_TM ";
			sql += " 		,CDT_PLAN_CNT ";
			sql += " 		,'' ";
			sql += " 		,? ";
			sql += " 		,sysdate ";
			sql += " from CR_DOCTOR_TIME ";
			sql += " where ";
			sql += "  	 CDT_PLAN_DT = ? ";
			sql += " and CDT_EMP_NO  = ? ";

			CallStmtExec = connect.prepareCall(sql);

			CallStmtExec.setString(1, NEW_PLAN_DT);
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
