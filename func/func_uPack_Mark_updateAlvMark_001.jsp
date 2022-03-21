<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%!
	public String func_uPack_Mark_updateAlvMark_001(Statement argStmtExec, HashMap argHtMethod) throws Exception {

		String sql = "";
		String sql2 = "";
		String sql_disp = "";

		Connection connect = argStmtExec.getConnection();
		CallableStatement CallStmtExec = null;

		try {

			String PRNT_SQ = (String) argHtMethod.get("PRNT_SQ");
			String MARK_SQ = (String) argHtMethod.get("MARK_SQ");


			//
			if(PRNT_SQ == null) { PRNT_SQ = ""; }
			if(MARK_SQ == null) { MARK_SQ = ""; }



			sql = " UPDATE ET_PACK_MARK ";
			sql += " SET EPM_PRNT_SQ = ? ";
			sql += " WHERE EPM_MARK_KD = '3' AND ";
			sql += " EPM_MARK_CD = '01' AND ";
			sql += " EPM_MARK_SQ = ? ";

			CallStmtExec = connect.prepareCall(sql);

			CallStmtExec.setString(1, PRNT_SQ);
			CallStmtExec.setString(2, MARK_SQ);


			CallStmtExec.executeUpdate();

		} catch (Exception e) {

			throw new FuncException(e.toString(), sql);
		}

		return sql;
	}
%>
