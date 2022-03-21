<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%!
	public String func_uMemo_Apply_CRM_UP_Save_001(Statement argStmtExec, HashMap argHtMethod) throws Exception {

		String sql = "";
		String sql2 = "";
		String sql_disp = "";

		Connection connect = argStmtExec.getConnection();
		CallableStatement CallStmtExec = null;

		try {

			String SMODE = (String) argHtMethod.get("SMODE");
			String CCM_SEQ = (String) argHtMethod.get("CCM_SEQ");
			String MEMO_DT = (String) argHtMethod.get("MEMO_DT");
			String MEMO_KD = (String) argHtMethod.get("MEMO_KD");
			String MEMO_LT = (String) argHtMethod.get("MEMO_LT");
			String MEMO_TX = (String) argHtMethod.get("MEMO_TX");
			String FONT_ST = (String) argHtMethod.get("FONT_ST");
			String USER_ID = (String) argHtMethod.get("USER_ID");
			//

			if(SMODE == null) { SMODE = ""; }
			if(CCM_SEQ == null) { CCM_SEQ = ""; }
			if(MEMO_DT == null) { MEMO_DT = ""; }
			if(MEMO_KD == null) { MEMO_KD = ""; }
			if(MEMO_LT == null) { MEMO_LT = ""; }
			if(MEMO_TX == null) { MEMO_TX = ""; }
			if(FONT_ST == null) { FONT_ST = ""; }
			if(USER_ID == null) { USER_ID = ""; }

			//

			if (SMODE.equals("I")) {
				sql = " INSERT INTO CR_CLDR_MEMO ";
				sql += " (CCM_SEQ, CCM_MEMO_DT,CCM_MEMO_KD,CCM_MEMO_LT,CCM_MEMO_TX,CCM_FONT_ST,CCM_INPT_ID,CCM_INPT_DTT) ";
				sql += " VALUES ";
				sql += " (CR_CLDR_MEMO_SEQ.NEXTVAL, ? ,? ,? ,? ,? ,? , sysdate ) ";

				CallStmtExec = connect.prepareCall(sql);

				CallStmtExec.setString(1, MEMO_DT);
				CallStmtExec.setString(2, MEMO_KD);
				CallStmtExec.setString(3, MEMO_LT);
				CallStmtExec.setString(4, MEMO_TX);
				CallStmtExec.setString(5, FONT_ST);
				CallStmtExec.setString(6, USER_ID);

				CallStmtExec.executeUpdate();
			} else {
				sql = " UPDATE CR_CLDR_MEMO ";
				sql += " SET CCM_MEMO_LT   = ? ";
				sql += " 	,CCM_MEMO_TX   = ? ";
				sql += " 	,CCM_FONT_ST   = ? ";
				sql += " 	,CCM_MODI_ID   = ? ";
				sql += " 	,CCM_MODI_DTT = sysdate ";
				sql += " WHERE CCM_SEQ =    ? ";

				CallStmtExec = connect.prepareCall(sql);

				CallStmtExec.setString(1, MEMO_LT);
				CallStmtExec.setString(2, MEMO_TX);
				CallStmtExec.setString(3, FONT_ST);
				CallStmtExec.setString(4, USER_ID);
				CallStmtExec.setString(5, CCM_SEQ);

				CallStmtExec.executeUpdate();
			}

		} catch (Exception e) {

			throw new FuncException(e.toString(), sql);
		}

		return sql;
	}
%>
