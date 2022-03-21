<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%!
	public String func_uCRM_BASIC_btnS8_Advi_AcptClick_001(Statement argStmtExec, HashMap argHtMethod) throws Exception {

		String sql = "";
		String sql2 = "";
		String sql_disp = "";

		Connection connect = argStmtExec.getConnection();
		CallableStatement CallStmtExec = null;

		try {

			String EXAM_DT = (String) argHtMethod.get("EXAM_DT");
			String EXAM_SQ = (String) argHtMethod.get("EXAM_SQ");
			String OCS_ACPTNO = (String) argHtMethod.get("OCS_ACPTNO");
			String USER_ID = (String) argHtMethod.get("USER_ID");

			//
			if(EXAM_DT == null) { EXAM_DT = "";}
			if(EXAM_SQ == null) { EXAM_SQ = "";}
			if(OCS_ACPTNO == null) { OCS_ACPTNO = "";}
			if(USER_ID == null) { USER_ID = "";}

			//

			sql = " update CR_ADVICE_PLAN ";
			sql += " set ";
			sql += "  CAP_OCS_ACPTNO =  ? ";
			sql += " ,CAP_MODI_ID    =  ? ";
			sql += " ,CAP_MODI_DTT   =  sysdate ";
			sql += " where CAP_EXAM_DT = ? ";
			sql += " and CAP_EXAM_SQ = ? ";

			CallStmtExec = connect.prepareCall(sql);

			CallStmtExec.setString(1, OCS_ACPTNO);
			CallStmtExec.setString(2, USER_ID);
			CallStmtExec.setString(3, EXAM_DT);
			CallStmtExec.setString(4, EXAM_SQ);


			CallStmtExec.executeUpdate();


		} catch (Exception e) {

			throw new FuncException(e.toString(), sql);
		}

		return sql;
	}
%>
