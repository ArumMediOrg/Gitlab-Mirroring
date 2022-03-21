<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%!
	public String func_uCRM_BASIC_btnS9_DietSaveClick_001(Statement argStmtExec, HashMap argHtMethod) throws Exception {

		String sql = "";
		String sql2 = "";
		String sql_disp = "";

		Connection connect = argStmtExec.getConnection();
		CallableStatement CallStmtExec = null;

		try {

			String EXAM_DT = (String) argHtMethod.get("EXAM_DT");
			String EXAM_SQ = (String) argHtMethod.get("EXAM_SQ");
			String ADVI_DT = (String) argHtMethod.get("ADVI_DT");
			String ADVI_YN = (String) argHtMethod.get("ADVI_YN");
			String USER_ID = (String) argHtMethod.get("USER_ID");

			//
			if(EXAM_DT == null) { EXAM_DT = ""; }
			if(EXAM_SQ == null) { EXAM_SQ = ""; }
			if(ADVI_DT == null) { ADVI_DT = ""; }
			if(ADVI_YN == null) { ADVI_YN = ""; }
			if(USER_ID == null) { USER_ID = ""; }

			//


			sql = " INSERT INTO HEALTH_DIETITIAN_PANJUNG ";
			sql += " (  HDP_EXAM_DT, HDP_EXAM_SQ, HDP_ADVI_DT, HDP_ADVI_YN, HDP_INPT_ID,  HDP_INPT_DTT    ) ";
			sql += " Values ";
			sql += " ( ?, ?, ?, ?, ?,  SYSDATE) ";


			CallStmtExec = connect.prepareCall(sql);

			CallStmtExec.setString(1, EXAM_DT);
			CallStmtExec.setString(2, EXAM_SQ);
			CallStmtExec.setString(3, ADVI_DT);
			CallStmtExec.setString(4, ADVI_YN);
			CallStmtExec.setString(5, USER_ID);


			CallStmtExec.executeUpdate();

		} catch (Exception e) {

			throw new FuncException(e.toString(), sql);
		}

		return sql;
	}
%>
