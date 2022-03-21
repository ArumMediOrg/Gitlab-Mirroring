<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%!
	public String func_uFindMesage_UP_Save_001(Statement argStmtExec, HashMap argHtMethod) throws Exception {

		String sql = "";
		String sql2 = "";
		String sql_disp = "";

		Connection connect = argStmtExec.getConnection();
		CallableStatement CallStmtExec = null;

		try {

			String SMODE = (String) argHtMethod.get("SMODE");
			String MESG_KD = (String) argHtMethod.get("MESG_KD");
			String SEQ = (String) argHtMethod.get("SEQ");
			String MESG_TX = (String) argHtMethod.get("MESG_TX");
			String MSGE_GRNM = (String) argHtMethod.get("MSGE_GRNM");
			String USER_ID = (String) argHtMethod.get("USER_ID");

			//
			if(SMODE == null) { SMODE = ""; }
			if(MESG_KD == null) { MESG_KD = ""; }
			if(SEQ == null) { SEQ = ""; }
			if(MESG_TX == null) { MESG_TX = ""; }
			if(MSGE_GRNM == null) { MSGE_GRNM = ""; }
			if(USER_ID == null) { USER_ID = ""; }

			//

			if (SMODE.equals("I")){
				sql = " INSERT INTO IT_SMS_MESSAGE ";
				sql += " 	(ISM_MESG_KD, ISM_SEQ, ISM_MESG_TX, ISM_MSGE_GRNM, ISM_INPT_ID, ISM_INPT_DTT) ";
				sql += " VALUES ";
				sql += " 	(?, ?, ?, ?, ?, SYSDATE) ";

				CallStmtExec = connect.prepareCall(sql);

				CallStmtExec.setString(1, MESG_KD);
				CallStmtExec.setString(2, SEQ);
				CallStmtExec.setString(3, MESG_TX);
				CallStmtExec.setString(4, MSGE_GRNM);
				CallStmtExec.setString(5, USER_ID);
				

				CallStmtExec.executeUpdate();
			} else {
				sql = " UPDATE IT_SMS_MESSAGE ";
				sql += " SET ISM_MESG_TX  = ? ";
				sql += " 	,ISM_MSGE_GRNM  = ? ";
				sql += " 	,ISM_MODI_ID  = ? ";
				sql += " 	,ISM_MODI_DTT = SYSDATE ";
				sql += " WHERE ISM_MESG_KD = ? ";
				sql += " 	AND ISM_SEQ     = ? ";

				CallStmtExec = connect.prepareCall(sql);

				CallStmtExec.setString(1, MESG_TX);
				CallStmtExec.setString(2, MSGE_GRNM);
				CallStmtExec.setString(3, USER_ID);
				CallStmtExec.setString(4, MESG_KD);
				CallStmtExec.setString(5, SEQ);
				
				CallStmtExec.executeUpdate();
			}

			
		} catch (Exception e) {

			throw new FuncException(e.toString(), sql);
		}

		return sql;
	}
%>
