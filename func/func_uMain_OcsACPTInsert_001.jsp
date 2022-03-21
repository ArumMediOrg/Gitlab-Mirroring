<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%!
	public String func_uMain_OcsACPTInsert_001(Statement argStmtExec, HashMap argHtMethod) throws Exception {

		String sql = "";
		String sql2 = "";
		String sql_disp = "";

		Connection connect = argStmtExec.getConnection();
		CallableStatement CallStmtExec = null;

		try {
			String EXAM_DT = (String) argHtMethod.get("EXAM_DT");
			String EXAM_SQ = (String) argHtMethod.get("EXAM_SQ");
			String OCS_DATA = (String) argHtMethod.get("OCS_DATA");
			String SUSER = (String) argHtMethod.get("SUSER");

			//
			if(EXAM_DT == null) { EXAM_DT = ""; }
			if(EXAM_SQ == null) { EXAM_SQ = ""; }
			if(OCS_DATA == null) { OCS_DATA = ""; }
			if(SUSER == null) { SUSER = ""; }

			//

			sql = " Insert Into ET_EXAM_LOG ";
			sql += " (EEL_EXAM_DT, EEL_EXAM_SQ, EEL_VIEW_EX, EEL_MODI_ID, EEL_MODI_DTT) ";
			sql += " Values ";
			sql += " (?, ?, ?, ?, SYSDATE) ";


			CallStmtExec = connect.prepareCall(sql);

			CallStmtExec.setString(1, EXAM_DT);
			CallStmtExec.setString(2, EXAM_SQ);
			CallStmtExec.setString(3, OCS_DATA);
			CallStmtExec.setString(4, SUSER);

			CallStmtExec.executeUpdate();

		} catch (Exception e) {

			throw new FuncException(e.toString(), sql);
		}

		return sql;
	}
%>
