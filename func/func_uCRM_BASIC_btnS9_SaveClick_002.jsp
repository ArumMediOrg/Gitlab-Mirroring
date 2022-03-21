<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%!
	public String func_uCRM_BASIC_btnS9_SaveClick_002(Statement argStmtExec, HashMap argHtMethod) throws Exception {

		String sql = "";
		String sql2 = "";
		String sql_disp = "";

		Connection connect = argStmtExec.getConnection();
		CallableStatement CallStmtExec = null;

		try {

			String SMODE = (String) argHtMethod.get("SMODE");
			String EXAM_DT = (String) argHtMethod.get("EXAM_DT");
			String EXAM_SQ = (String) argHtMethod.get("EXAM_SQ");
			String RSVN_DT = (String) argHtMethod.get("RSVN_DT");
			String RSVN_TM = (String) argHtMethod.get("RSVN_TM");
			String SCHED_STEP = (String) argHtMethod.get("SCHED_STEP");
			String DOCTOR = (String) argHtMethod.get("DOCTOR");
			String PLAN_TX = (String) argHtMethod.get("PLAN_TX");
			String USER_ID = (String) argHtMethod.get("USER_ID");

			//
			if(SMODE == null) { SMODE = ""; }
			if(EXAM_DT == null) { EXAM_DT = ""; }
			if(EXAM_SQ == null) { EXAM_SQ = ""; }
			if(RSVN_DT == null) { RSVN_DT = ""; }
			if(RSVN_TM == null) { RSVN_TM = ""; }
			if(SCHED_STEP == null) { SCHED_STEP = ""; }
			if(DOCTOR == null) { DOCTOR = ""; }
			if(PLAN_TX == null) { PLAN_TX = ""; }
			if(USER_ID == null) { USER_ID = ""; }

			//

			if (SMODE.equals("I")){
				sql = " insert into CR_ADVICE_PLAN ";
				sql += " (  CAP_EXAM_DT, CAP_EXAM_SQ, CAP_RSVN_DT, CAP_RSVN_TM, CAP_SCHED_STEP ";
				sql += " , CAP_DOCTOR,  CAP_PLAN_TX, CAP_INPT_ID, CAP_INPT_DTT  ) ";
				sql += " Values ";
				sql += " (  ?, ?, ?, ?, ? ";
				sql += " , ?,  ?, ?, sysdate   ) ";

				CallStmtExec = connect.prepareCall(sql);

				CallStmtExec.setString(1, EXAM_DT);
				CallStmtExec.setString(2, EXAM_SQ);
				CallStmtExec.setString(3, RSVN_DT);
				CallStmtExec.setString(4, RSVN_TM);
				CallStmtExec.setString(5, SCHED_STEP);
				CallStmtExec.setString(6, DOCTOR);
				CallStmtExec.setString(7, PLAN_TX);
				CallStmtExec.setString(8, USER_ID);


				CallStmtExec.executeUpdate();
			} else {
				sql = " update CR_ADVICE_PLAN ";
				sql += " set CAP_RSVN_DT    = ? ";
				sql += " ,CAP_RSVN_TM    = ? ";
				sql += " ,CAP_SCHED_STEP = ? ";
				sql += " ,CAP_DOCTOR     = ? ";
				sql += " ,CAP_PLAN_TX    = ? ";
				sql += " ,CAP_MODI_ID    = ? ";
				sql += " ,CAP_MODI_DTT   = sysdate ";
				sql += " where ";
				sql += " CAP_EXAM_DT = ? ";
				sql += " and CAP_EXAM_SQ = ? ";

				CallStmtExec = connect.prepareCall(sql);

				CallStmtExec.setString(1, RSVN_DT);
				CallStmtExec.setString(2, RSVN_TM);
				CallStmtExec.setString(3, SCHED_STEP);
				CallStmtExec.setString(4, DOCTOR);
				CallStmtExec.setString(5, PLAN_TX);
				CallStmtExec.setString(6, USER_ID);
				CallStmtExec.setString(7, EXAM_DT);
				CallStmtExec.setString(8, EXAM_SQ);

				CallStmtExec.executeUpdate();
			}

		} catch (Exception e) {

			throw new FuncException(e.toString(), sql);
		}

		return sql;
	}
%>
