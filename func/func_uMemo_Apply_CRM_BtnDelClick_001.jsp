<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%!
	public String func_uMemo_Apply_CRM_BtnDelClick_001(Statement argStmtExec, HashMap argHtMethod) throws Exception {

		String sql = "";
		String sql2 = "";
		String sql_disp = "";

		Connection connect = argStmtExec.getConnection();
		CallableStatement CallStmtExec = null;

		try {

			String MEMO_DT = (String) argHtMethod.get("MEMO_DT");
			String CCM_SEQ = (String) argHtMethod.get("CCM_SEQ");
			//

			if(MEMO_DT == null) { MEMO_DT = ""; }
			if(CCM_SEQ == null) { CCM_SEQ = ""; }

			//

			sql = " DELETE FROM CR_CLDR_MEMO ";
			sql += " WHERE CCM_MEMO_DT = ? ";
			sql += " AND CCM_SEQ = ? ";

			CallStmtExec = connect.prepareCall(sql);

			CallStmtExec.setString(1, MEMO_DT);
			CallStmtExec.setString(2, CCM_SEQ);


			CallStmtExec.executeUpdate();


		} catch (Exception e) {

			throw new FuncException(e.toString(), sql);
		}

		return sql;
	}
%>
