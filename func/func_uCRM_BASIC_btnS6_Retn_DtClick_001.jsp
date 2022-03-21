<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%!
	public String func_uCRM_BASIC_btnS6_Retn_DtClick_001(Statement argStmtExec, HashMap argHtMethod) throws Exception {

		String sql = "";
		String sql2 = "";
		String sql_disp = "";

		Connection connect = argStmtExec.getConnection();
		CallableStatement CallStmtExec = null;

		try {

			String RSVN_NO = (String) argHtMethod.get("RSVN_NO");
			String RETN_CNT = (String) argHtMethod.get("RETN_CNT");
			String RETN_DT = (String) argHtMethod.get("RETN_DT");
			String USER_ID = (String) argHtMethod.get("USER_ID");

			//

			if(RSVN_NO == null) { RSVN_NO = ""; }
			if(RETN_CNT == null) { RETN_CNT = ""; }
			if(RETN_DT == null) { RETN_DT = ""; }
			if(USER_ID == null) { USER_ID = ""; }

			//

			sql = " update CR_COLON_DRUG ";
			sql += " set ";
			sql += " CCD_RETN_CNT = ? ";
			sql += " ,CCD_RETN_DT  = ? ";
			sql += " ,CCD_RETN_ID  = ? ";
			sql += " ,CCD_MODI_ID  = ? ";
			sql += " ,CCD_MODI_DTT = sysdate ";
			sql += " where ";
			sql += " CCD_RSVN_NO = ? ";

			CallStmtExec = connect.prepareCall(sql);

			CallStmtExec.setString(1, RETN_CNT);
			CallStmtExec.setString(2, RETN_DT);
			CallStmtExec.setString(3, USER_ID);
			CallStmtExec.setString(4, USER_ID);
			CallStmtExec.setString(5, RSVN_NO);

			CallStmtExec.executeUpdate();


		} catch (Exception e) {

			throw new FuncException(e.toString(), sql);
		}

		return sql;
	}
%>
