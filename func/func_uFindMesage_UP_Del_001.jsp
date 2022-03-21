<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%!
	public String func_uFindMesage_UP_Del_001(Statement argStmtExec, HashMap argHtMethod) throws Exception {

		String sql = "";
		String sql2 = "";
		String sql_disp = "";

		Connection connect = argStmtExec.getConnection();
		CallableStatement CallStmtExec = null;

		try {

			String SEQ = (String) argHtMethod.get("SEQ");
			String MESG_KD = (String) argHtMethod.get("MESG_KD");
			
			//
			if(SEQ == null) { SEQ = ""; }
			if(MESG_KD == null) { MESG_KD = ""; }

			sql = " DELETE FROM IT_SMS_MESSAGE ";
			sql += " WHERE ISM_MESG_KD = ? ";
			sql += " 	AND ISM_Seq = ? ";

			CallStmtExec = connect.prepareCall(sql);

			CallStmtExec.setString(1, MESG_KD);
			CallStmtExec.setString(2, SEQ);
			

			CallStmtExec.executeUpdate();
			

			
		} catch (Exception e) {

			throw new FuncException(e.toString(), sql);
		}

		return sql;
	}
%>
