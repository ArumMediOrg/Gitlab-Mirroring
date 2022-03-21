<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%!
	public String func_uSchedule_Apply_BtnSaveClick_001(Statement argStmtExec, HashMap argHtMethod) throws Exception {

		String sql = "";
		String sql2 = "";
		String sql_disp = "";

		Connection connect = argStmtExec.getConnection();
		CallableStatement CallStmtExec = null;

		try {

			String SCHED_STEP = (String) argHtMethod.get("SCHED_STEP");
			String PLAN_TX = (String) argHtMethod.get("PLAN_TX");
			String MODI_ID = (String) argHtMethod.get("MODI_ID");
			String EXAM_DT = (String) argHtMethod.get("EXAM_DT");
			String EXAM_SQ = (String) argHtMethod.get("EXAM_SQ");


			//
			if(SCHED_STEP == null) { SCHED_STEP = ""; }
			if(PLAN_TX == null) { PLAN_TX = ""; }
			if(MODI_ID == null) { MODI_ID = ""; }
			if(EXAM_DT == null) { EXAM_DT = ""; }
			if(EXAM_SQ == null) { EXAM_SQ = ""; }


			//

			sql = " Update CR_ADVICE_PLAN ";
			sql += " Set CAP_SCHED_STEP = ?, ";
			sql += " 	CAP_PLAN_TX    = ?, ";
			sql += " 	CAP_MODI_ID    = ?, ";
			sql += " 	CAP_MODI_DTT   = sysdate ";
			sql += " Where CAP_EXAM_DT  = ? ";
			sql += " And CAP_EXAM_SQ  = ? ";

			CallStmtExec = connect.prepareCall(sql);

			CallStmtExec.setString(1, SCHED_STEP);
			CallStmtExec.setString(2, PLAN_TX);
			CallStmtExec.setString(3, MODI_ID);
			CallStmtExec.setString(4, EXAM_DT);
			CallStmtExec.setString(5, EXAM_SQ);

			CallStmtExec.executeUpdate();

		} catch (Exception e) {

			throw new FuncException(e.toString(), sql);
		}

		return sql;
	}
%>
