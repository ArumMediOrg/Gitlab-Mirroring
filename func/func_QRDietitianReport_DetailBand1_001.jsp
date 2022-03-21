<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%!
	public String func_QRDietitianReport_DetailBand1_001(Statement argStmtExec, HashMap argHtMethod) throws Exception {

		String sql = "";
		String sql2 = "";
		String sql_disp = "";

		Connection connect = argStmtExec.getConnection();
		CallableStatement CallStmtExec = null;

		try {

			String TRANC_DT = (String) argHtMethod.get("TRANC_DT");
			String EXAM_DT = (String) argHtMethod.get("EXAM_DT");
			String EXAM_SQ  = (String) argHtMethod.get("EXAM_SQ");

			//
			if(TRANC_DT == null) { TRANC_DT = ""; }
			if(EXAM_DT == null) { EXAM_DT = ""; }
			if(EXAM_SQ == null) { EXAM_SQ = ""; }

			//

			sql = " UPDATE HEALTH_DIETITIAN_PANJUNG ";
			sql += " SET  HDP_TRANC_DT = '" + TRANC_DT + "' ";
			sql += " WHERE HDP_EXAM_DT = '" + EXAM_DT + "' ";
			sql += " AND   HDP_EXAM_SQ = '" + EXAM_SQ + "' ";

			CallStmtExec = connect.prepareCall(sql);

			CallStmtExec.setString(1, TRANC_DT);
			CallStmtExec.setString(2, EXAM_DT);
			CallStmtExec.setString(3, EXAM_SQ);

			CallStmtExec.executeUpdate();

		} catch (Exception e) {

			throw new FuncException(e.toString(), sql);
		}

		return sql;
	}
%>
