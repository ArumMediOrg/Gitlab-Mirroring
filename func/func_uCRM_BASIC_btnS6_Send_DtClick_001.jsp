<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%!
	public String func_uCRM_BASIC_btnS6_Send_DtClick_001(Statement argStmtExec, HashMap argHtMethod) throws Exception {

		String sql = "";
		String sql2 = "";
		String sql_disp = "";

		Connection connect = argStmtExec.getConnection();
		CallableStatement CallStmtExec = null;

		try {

			String SMODE = (String) argHtMethod.get("SMODE");
			String RSVN_NO = (String) argHtMethod.get("RSVN_NO");
			String SEND_CNT = (String) argHtMethod.get("SEND_CNT");
			String SEND_DT = (String) argHtMethod.get("SEND_DT");
			String USER_ID = (String) argHtMethod.get("USER_ID");

			//

			if(SMODE == null) { SMODE = ""; }
			if(RSVN_NO == null) { RSVN_NO = ""; }
			if(SEND_CNT == null) { SEND_CNT = ""; }
			if(SEND_DT == null) { SEND_DT = ""; }
			if(USER_ID == null) { USER_ID = ""; }

			//

			if (SMODE.equals("I")) {
				sql = " insert into CR_COLON_DRUG  ( ";
				sql += "  CCD_RSVN_NO ";
				sql += " ,CCD_SEND_CNT ";
				sql += " ,CCD_SEND_DT ";
				sql += " ,CCD_SEND_ID ";
				sql += " ,CCD_MODI_ID ";
				sql += " ,CCD_MODI_DTT  ) ";
				sql += " values (  ";
				sql += "  ? ";
				sql += " ,? ";
				sql += " ,?  ";
				sql += " ,?  ";
				sql += " ,?  ";
				sql += " ,sysdate   ) ";

				CallStmtExec = connect.prepareCall(sql);

				CallStmtExec.setString(1, RSVN_NO);
				CallStmtExec.setString(2, SEND_CNT);
				CallStmtExec.setString(3, SEND_DT);
				CallStmtExec.setString(4, USER_ID);
				CallStmtExec.setString(5, USER_ID);

				CallStmtExec.executeUpdate();

			} else {
				sql = " update CR_COLON_DRUG ";
				sql += " set ";
				sql += "  CCD_SEND_CNT = ? ";
				sql += " ,CCD_SEND_DT  = ? ";
				sql += " ,CCD_SEND_ID  = ? ";
				sql += " ,CCD_MODI_ID  = ? ";
				sql += " ,CCD_MODI_DTT = sysdate ";
				sql += " where CCD_RSVN_NO = ? ";


				CallStmtExec = connect.prepareCall(sql);

				CallStmtExec.setString(1, SEND_CNT);
				CallStmtExec.setString(2, SEND_DT);
				CallStmtExec.setString(3, USER_ID);
				CallStmtExec.setString(4, USER_ID);
				CallStmtExec.setString(5, RSVN_NO);

				CallStmtExec.executeUpdate();
			}

		} catch (Exception e) {

			throw new FuncException(e.toString(), sql);
		}

		return sql;
	}
%>
