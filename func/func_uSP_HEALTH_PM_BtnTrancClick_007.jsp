<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%!
	public String func_uSP_HEALTH_PM_BtnTrancClick_007(Statement argStmtExec, HashMap argHtMethod) throws Exception {

		String sql = "";
		String sql2 = "";
		String sql_disp = "";

		Connection connect = argStmtExec.getConnection();
		CallableStatement CallStmtExec = null;

		try {

			String TOBO_DT = (String) argHtMethod.get("TOBO_DT");
			String EXAM_DT = (String) argHtMethod.get("EXAM_DT");
			String EXAM_SQ = (String) argHtMethod.get("EXAM_SQ");
			String SSQLADD = (String) argHtMethod.get("SSQLADD");

			//
			if(TOBO_DT == null) { TOBO_DT = ""; }
			if(EXAM_DT == null) { EXAM_DT = ""; }
			if(EXAM_SQ == null) { EXAM_SQ = ""; }
			if(SSQLADD == null) { SSQLADD = ""; }

			//


			sql = " UPDATE DT_CCDT_PANJ ";
			sql += " SET DCP_TRANC_DT = ? ";
			sql += " WHERE dcp_exam_dt = ? ";
			sql += " AND  dcp_exam_sq = ? ";

			if(!SSQLADD.equals("")){
				sql += SSQLADD;
			}


			CallStmtExec = connect.prepareCall(sql);

			CallStmtExec.setString(1, TOBO_DT);
			CallStmtExec.setString(2, EXAM_DT);
			CallStmtExec.setString(3, EXAM_SQ);

			CallStmtExec.executeUpdate();

		} catch (Exception e) {

			throw new FuncException(e.toString(), sql);
		}

		return sql;
	}
%>
