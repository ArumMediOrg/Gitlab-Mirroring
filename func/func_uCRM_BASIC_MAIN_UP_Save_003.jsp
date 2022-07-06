<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%!
	public String func_uCRM_BASIC_MAIN_UP_Save_003(Statement argStmtExec, HashMap argHtMethod) throws Exception {

		String sql = "";
		String sql2 = "";
		String sql_disp = "";

		Connection connect = argStmtExec.getConnection();
		CallableStatement CallStmtExec = null;

		try {

			String RSVN_DT = (String) argHtMethod.get("RSVN_DT");
			String INPT_ID = (String) argHtMethod.get("INPT_ID");
			String PLAN_TX = (String) argHtMethod.get("PLAN_TX");

			//
			if(RSVN_DT == null) { RSVN_DT = ""; }
			if(INPT_ID == null) { INPT_ID = ""; }
			if(PLAN_TX == null) { PLAN_TX = ""; }

			//

			sql = "  UPDATE CR_ADVICE_PLAN ";
			sql += " SET CAP_PLAN_TX = '" + PLAN_TX + "', ";
			sql += " CAP_MODI_ID = '" + INPT_ID + "', ";
			sql += " CAP_MODI_DTT = SYSDATE ";
			sql += " WHERE CAP_EXAM_DT = '9999-12-31'";
			sql += " AND CAP_EXAM_SQ = '999999'";
			sql += " AND CAP_RSVN_DT = '" + RSVN_DT + "'";


				CallStmtExec = connect.prepareCall(sql);

				CallStmtExec.executeUpdate();

		} catch (Exception e) {

			throw new FuncException(e.toString(), sql);
		}

		return sql;
	}
%>
