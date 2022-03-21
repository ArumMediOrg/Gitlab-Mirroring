<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%!
	public String func_uTotal_Finding_Prntdt_Insert_001(Statement argStmtExec, HashMap argHtMethod) throws Exception {

		String sql = "";
		String sql2 = "";
		String sql_disp = "";

		Connection connect = argStmtExec.getConnection();
		CallableStatement CallStmtExec = null;

		try {

			String EXAM_DT = (String) argHtMethod.get("EXAM_DT");
			String EXAM_SQ = (String) argHtMethod.get("EXAM_SQ");
			String PRNT_ID = (String) argHtMethod.get("PRNT_ID");

			//
			if(EXAM_DT == null) { EXAM_DT = ""; }
			if(EXAM_SQ == null) { EXAM_SQ = ""; }
			if(PRNT_ID == null) { PRNT_ID = ""; }

			sql = " INSERT INTO ST_SYTH_VIEW ";
			sql += " (SSV_EXAM_DT, SSV_EXAM_SQ, SSV_PACK_CD, ";
			sql += " SSV_PRNT_DT, SSV_PRNT_ID, SSV_INPT_ID, SSV_INPT_DTT) ";
			sql += " VALUES( ";
			sql += " ?, ";
			sql += " ?, ";
			sql += " '00', ";
			sql += " TO_CHAR(SYSDATE,'YYYY-MM-DD'), ";
			sql += " ?, ";
			sql += " 'admin', ";
			sql += " SYSDATE ";
			sql += " ) ";


			CallStmtExec = connect.prepareCall(sql);

			CallStmtExec.setString(1, EXAM_DT);
			CallStmtExec.setString(2, EXAM_SQ);
			CallStmtExec.setString(3, PRNT_ID);


			CallStmtExec.executeUpdate();

		} catch (Exception e) {

			throw new FuncException(e.toString(), sql);
		}

		return sql;
	}
%>
