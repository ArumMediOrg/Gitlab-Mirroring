<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%!
	public String func_uExam_Result_btnPanReqClick_001(Statement argStmtExec, HashMap argHtMethod) throws Exception {

		String sql = "";
		String sql2 = "";
		String sql_disp = "";

		Connection connect = argStmtExec.getConnection();
		CallableStatement CallStmtExec = null;

		try {

			String REQ_CD = (String) argHtMethod.get("REQ_CD");
			String EXAM_DT = (String) argHtMethod.get("EXAM_DT");
			String EXAM_SQ = (String) argHtMethod.get("EXAM_SQ");

			//

			if(REQ_CD == null) { REQ_CD = ""; }
			if(EXAM_DT == null) { EXAM_DT = ""; }
			if(EXAM_SQ == null) { EXAM_SQ = ""; }

			//
			sql = " UPDATE ET_EXAM_ACPT ";
			sql += " SET EEA_FSTPAN_REQ = ? ";
			sql += " WHERE EEA_EXAM_DT = ? ";
			sql += " AND EEA_EXAM_SQ = ? ";

			CallStmtExec = connect.prepareCall(sql);

			CallStmtExec.setString(1, REQ_CD);
			CallStmtExec.setString(2, EXAM_DT);
			CallStmtExec.setString(3, EXAM_SQ);
			//CallStmtExec.setString(4, SDELCD);

			CallStmtExec.executeUpdate();

		} catch (Exception e) {

			throw new FuncException(e.toString(), sql);
		}

		return sql;
	}
%>
