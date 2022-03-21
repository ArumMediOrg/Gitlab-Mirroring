<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%!
	public String func_uItem_BatchYN_btnSaveClick_011(Statement argStmtExec, HashMap argHtMethod) throws Exception {

		String sql = "";
		String sql2 = "";
		String sql_disp = "";

		Connection connect = argStmtExec.getConnection();
		CallableStatement CallStmtExec = null;

		try {
			String EXAM_DT = (String) argHtMethod.get("EXAM_DT");
			String EXAM_SQ = (String) argHtMethod.get("EXAM_SQ");
			String SLINK_NO = (String) argHtMethod.get("SLINK_NO");

			//

			if(EXAM_DT == null) { EXAM_DT = ""; }
			if(EXAM_SQ == null) { EXAM_SQ = ""; }
			if(SLINK_NO == null) { SLINK_NO = ""; }

			//
			sql = " UPDATE ET_EXAM_ACPT ";
			sql += " SET EEA_EXAM_LT  = EEA_EXAM_LT || ? ";
			sql += " 	,EEA_ADD_LT   = EEA_ADD_LT || ? ";
			sql += " WHERE EEA_EXAM_DT  = ? ";
			sql += " AND EEA_EXAM_SQ  = ? ";
			sql += " AND INSTR(EEA_EXAM_LT, ?) = 0 ";

			CallStmtExec = connect.prepareCall(sql);

			CallStmtExec.setString(1, SLINK_NO);
			CallStmtExec.setString(2, SLINK_NO);
			CallStmtExec.setString(3, EXAM_DT);
			CallStmtExec.setString(4, EXAM_SQ);
			CallStmtExec.setString(5, SLINK_NO);

			CallStmtExec.executeUpdate();

		} catch (Exception e) {

			throw new FuncException(e.toString(), sql);
		}

		return sql;
	}
%>
