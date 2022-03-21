<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%!
	public String func_uCRM_BASIC_btnS83_TimeSaveClick_001(Statement argStmtExec, HashMap argHtMethod) throws Exception {

		String sql = "";
		String sql2 = "";
		String sql_disp = "";

		Connection connect = argStmtExec.getConnection();
		CallableStatement CallStmtExec = null;

		try {

			String PLAN_DT = (String) argHtMethod.get("PLAN_DT");
			String EMP_NO = (String) argHtMethod.get("EMP_NO");
			String PLAN_TM = (String) argHtMethod.get("PLAN_TM");
			String PLAN_CNT = (String) argHtMethod.get("PLAN_CNT");
			String PLAN_TX = (String) argHtMethod.get("PLAN_TX");
			String USER_ID = (String) argHtMethod.get("USER_ID");
			String SMODE = (String) argHtMethod.get("SMODE");

			//
			if(PLAN_DT == null) { PLAN_DT = ""; }
			if(EMP_NO == null) { EMP_NO = ""; }
			if(PLAN_TM == null) { PLAN_TM = ""; }
			if(PLAN_CNT == null) { PLAN_CNT = ""; }
			if(PLAN_TX == null) { PLAN_TX = ""; }
			if(USER_ID == null) { USER_ID = ""; }
			if(SMODE == null) { SMODE = ""; }

			//


			if(SMODE.equals("I")){
				sql = " insert into CR_DOCTOR_TIME  ( ";
				sql += " 	CDT_PLAN_DT ";
				sql += " 	,CDT_EMP_NO ";
				sql += " 	,CDT_PLAN_TM ";
				sql += " 	,CDT_PLAN_CNT ";
				sql += " 	,CDT_PLAN_TX ";
				sql += " 	,CDT_MODI_ID ";
				sql += " 	,CDT_MODI_DTT  ) ";
				sql += " values ( ";
				sql += " 	? ";
				sql += " 	,? ";
				sql += " 	,? ";
				sql += " 	,? ";
				sql += " 	,? ";
				sql += " 	,? ";
				sql += " 	,sysdate   ) ";

				CallStmtExec = connect.prepareCall(sql);

				CallStmtExec.setString(1, PLAN_DT);
				CallStmtExec.setString(2, EMP_NO);
				CallStmtExec.setString(3, PLAN_TM);
				CallStmtExec.setString(4, PLAN_CNT);
				CallStmtExec.setString(5, PLAN_TX);
				CallStmtExec.setString(6, USER_ID);


				CallStmtExec.executeUpdate();
			}
			else {
				sql += " UPDATE CR_DOCTOR_TIME ";
				sql += " 	Set CDT_PLAN_CNT  = ? ";
				sql += " 	,CDT_PLAN_TX   = ? ";
				sql += " 	,CDT_MODI_ID   = ? ";
				sql += " 	,CDT_MODI_DTT  = sysdate ";
				sql += " Where CDT_PLAN_DT = ? ";
				sql += " 	AND CDT_EMP_NO  = ? ";
				sql += " 	AND CDT_PLAN_TM = ? ";

				CallStmtExec = connect.prepareCall(sql);

				CallStmtExec.setString(1, PLAN_CNT);
				CallStmtExec.setString(2, PLAN_TX);
				CallStmtExec.setString(3, USER_ID);
				CallStmtExec.setString(4, PLAN_DT);
				CallStmtExec.setString(5, EMP_NO);
				CallStmtExec.setString(6, PLAN_TM);

				CallStmtExec.executeUpdate();
			}





		} catch (Exception e) {

			throw new FuncException(e.toString(), sql);
		}

		return sql;
	}
%>
