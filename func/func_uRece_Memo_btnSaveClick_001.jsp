<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%!
	public String func_uRece_Memo_btnSaveClick_001(Statement argStmtExec, HashMap argHtMethod) throws Exception {

		String sql = "";
		String sql2 = "";
		String sql_disp = "";

		Connection connect = argStmtExec.getConnection();
		CallableStatement CallStmtExec = null;

		try {

			String RECE_MEMO = (String) argHtMethod.get("RECE_MEMO");
			String RECE_NO = (String) argHtMethod.get("RECE_NO");
			String RECE_SQ = (String) argHtMethod.get("RECE_SQ");

			//
			if(RECE_MEMO == null) { RECE_MEMO = ""; }
			if(RECE_NO == null) { RECE_NO = ""; }
			if(RECE_SQ == null) { RECE_SQ = ""; }

			sql = " Update RT_RECE_MEDICHK Set RRM_MEMO = ? ";
			sql += " Where RRM_RECE_NO = ? ";
			sql += " And RRM_RECE_SEQ = ? ";

			CallStmtExec = connect.prepareCall(sql);

			CallStmtExec.setString(1, RECE_MEMO);
			CallStmtExec.setString(2, RECE_NO);
			CallStmtExec.setString(3, RECE_SQ);


			CallStmtExec.executeUpdate();

		} catch (Exception e) {

			throw new FuncException(e.toString(), sql);
		}

		return sql;
	}
%>
