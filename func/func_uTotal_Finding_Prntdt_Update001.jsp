<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%!
	public String func_uTotal_Finding_Prntdt_Update001(Statement argStmtExec, HashMap argHtMethod) throws Exception {

		String sql = "";
		String sql2 = "";
		String sql_disp = "";

		Connection connect = argStmtExec.getConnection();
		CallableStatement CallStmtExec = null;

		try {

			String EXAM_DT = (String) argHtMethod.get("EXAM_DT");
			String EXAM_SQ = (String) argHtMethod.get("EXAM_SQ");
			String PRNT_DT = (String) argHtMethod.get("PRNT_DT");
			String PRNT_ID = (String) argHtMethod.get("PRNT_ID");

			//
			if(EXAM_DT == null) { EXAM_DT = ""; }
			if(EXAM_SQ == null) { EXAM_SQ = ""; }
			if(PRNT_DT == null) { PRNT_DT = ""; }
			if(PRNT_ID == null) { PRNT_ID = ""; }


			sql = " Update ST_SYTH_VIEW ";
			sql += " Set SSV_PRNT_DT = ? ";
			sql += "   , SSV_PRNT_ID = ? ";
			sql += " Where SSV_EXAM_DT = ? ";
			sql += " And SSV_EXAM_SQ = ? ";

			CallStmtExec = connect.prepareCall(sql);

			CallStmtExec.setString(1, PRNT_DT);
			CallStmtExec.setString(2, PRNT_ID);
			CallStmtExec.setString(3, EXAM_DT);
			CallStmtExec.setString(4, EXAM_SQ);


			CallStmtExec.executeUpdate();

		} catch (Exception e) {

			throw new FuncException(e.toString(), sql);
		}

		return sql;
	}
%>
