<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%!
	public String func_uItem_BatchYN_btnSaveClick_007(Statement argStmtExec, HashMap argHtMethod) throws Exception {

		String sql = "";
		String sql2 = "";
		String sql_disp = "";

		Connection connect = argStmtExec.getConnection();
		CallableStatement CallStmtExec = null;

		try {
			String EXAM_DT = (String) argHtMethod.get("EXAM_DT");
			String EXAM_SQ = (String) argHtMethod.get("EXAM_SQ");
			String ITEM_CD = (String) argHtMethod.get("ITEM_CD");
			String CNCL_YN = (String) argHtMethod.get("CNCL_YN");
			String USER_ID = (String) argHtMethod.get("USER_ID");


			//

			if(EXAM_DT == null) { EXAM_DT = ""; }
			if(EXAM_SQ == null) { EXAM_SQ = ""; }
			if(ITEM_CD == null) { ITEM_CD = ""; }
			if(CNCL_YN == null) { CNCL_YN = ""; }
			if(USER_ID == null) { USER_ID = ""; }

			//
			sql = " UPDATE ET_RSLT_ITEM ";
			sql += " 	SET ERI_CNCL_YN  = ? ";
			sql += " 	,ERI_MODI_ID  = ? ";
			sql += " 	,ERI_MODI_DTT = SYSDATE ";
			sql += " WHERE ERI_EXAM_DT  = ? ";
			sql += " 	AND ERI_EXAM_SQ  = ? ";
			sql += " 	AND ERI_ITEM_CD  = ? ";

			CallStmtExec = connect.prepareCall(sql);

			CallStmtExec.setString(1, CNCL_YN);
			CallStmtExec.setString(2, USER_ID);
			CallStmtExec.setString(3, EXAM_DT);
			CallStmtExec.setString(4, EXAM_SQ);
			CallStmtExec.setString(5, ITEM_CD);

			CallStmtExec.executeUpdate();

		} catch (Exception e) {

			throw new FuncException(e.toString(), sql);
		}

		return sql;
	}
%>
