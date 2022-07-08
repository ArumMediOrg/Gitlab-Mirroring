<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%!
	public String func_uCRM_BASIC_MAIN_UP_Save_002(Statement argStmtExec, HashMap argHtMethod) throws Exception {

		String sql = "";
		String sql2 = "";
		String sql_disp = "";

		Connection connect = argStmtExec.getConnection();
		CallableStatement CallStmtExec = null;

		try {

			String RSVN_DT = (String) argHtMethod.get("RSVN_DT");
			String INPT_ID = (String) argHtMethod.get("INPT_ID");
			String EXAM_SQ = (String) argHtMethod.get("EXAM_SQ");

			//
			if(RSVN_DT == null) { RSVN_DT = ""; }
			if(INPT_ID == null) { INPT_ID = ""; }
			if(EXAM_SQ == null) { EXAM_SQ = ""; }


			//

			sql = "  INSERT INTO CR_ADVICE_PLAN ";
			sql += " (CAP_EXAM_DT, CAP_EXAM_SQ, CAP_RSVN_DT, CAP_PLAN_TX, CAP_INPT_ID, CAP_INPT_DTT) ";
			sql += " VALUES ";
			sql += " ('9999-12-31', '" + EXAM_SQ + "', '" + RSVN_DT + "', '예약불가', '" + INPT_ID + "', SYSDATE) ";

				CallStmtExec = connect.prepareCall(sql);

				CallStmtExec.executeUpdate();

		} catch (Exception e) {

			throw new FuncException(e.toString(), sql);
		}

		return sql;
	}
%>
