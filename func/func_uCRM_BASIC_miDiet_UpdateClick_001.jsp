<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%!
	public String func_uCRM_BASIC_miDiet_UpdateClick_001(Statement argStmtExec, HashMap argHtMethod) throws Exception {

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


			sql = " UPDATE HEALTH_DIETITIAN_PANJUNG ";
			sql += " Set HDP_ADVI_DT = ? ";
			sql += " 	,HDP_ADVI_YN = ? ";
			sql += " 	,HDP_MODI_ID = ? ";
			sql += " 	,HDP_MODI_DTT = SYSDATE ";
			sql += " Where HDP_EXAM_DT = ? ";
			sql += " AND HDP_EXAM_SQ = ? ";


			CallStmtExec = connect.prepareCall(sql);

			CallStmtExec.setString(1, ADVI_DT);
			CallStmtExec.setString(2, ADVI_YN);
			CallStmtExec.setString(3, USER_ID);
			CallStmtExec.setString(4, EXAM_DT);
			CallStmtExec.setString(5, EXAM_SQ);


			CallStmtExec.executeUpdate();

		} catch (Exception e) {

			throw new FuncException(e.toString(), sql);
		}

		return sql;
	}
%>
