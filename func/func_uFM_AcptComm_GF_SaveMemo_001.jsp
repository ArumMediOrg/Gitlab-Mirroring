<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%!
	public String func_uFM_AcptComm_GF_SaveMemo_001(Statement argStmtExec, HashMap argHtMethod) throws Exception {

		String sql = "";
		String sql2 = "";
		String sql_disp = "";

		try {

			String SAVE_KD = (String) argHtMethod.get("SAVE_KD");
			String MEMO_DT = (String) argHtMethod.get("MEMO_DT");
			String MEMO_TX = (String) argHtMethod.get("MEMO_TX");
			String USER_ID = (String) argHtMethod.get("USER_ID");
			String RSVT_TX = (String) argHtMethod.get("RSVT_TX");
			String ACPT_TX = (String) argHtMethod.get("ACPT_TX");

			//
			if(SAVE_KD == null) { SAVE_KD = ""; }
			if(MEMO_DT == null) { MEMO_DT = ""; }
			if(MEMO_TX == null) { MEMO_TX = ""; }
			if(USER_ID == null) { USER_ID = ""; }
			if(RSVT_TX == null) { RSVT_TX = ""; }
			if(ACPT_TX == null) { ACPT_TX = ""; }

			//
			SAVE_KD = CTr.Replace(SAVE_KD, "'", "''");
			MEMO_DT = CTr.Replace(MEMO_DT, "'", "''");
			MEMO_TX = CTr.Replace(MEMO_TX, "'", "''");
			USER_ID = CTr.Replace(USER_ID, "'", "''");
			RSVT_TX = CTr.Replace(RSVT_TX, "'", "''");
			ACPT_TX = CTr.Replace(ACPT_TX, "'", "''");

			if(SAVE_KD.equals("I")) {

				sql = "INSERT INTO ET_CLDR_MEMO (ECM_MEMO_DT, ECM_MEMO_SQ, ECM_MEMO_LT, ECM_MEMO_TX, ECM_INPT_ID, ECM_INPT_DTT, ECM_MODI_ID, ECM_MODI_DTT, ECM_RSVT_TX, ECM_ACPT_TX) VALUES (";
				sql += "  '" + MEMO_DT + "'";
				sql += ", 0";
				sql += ", '예약/접수메모'";
				sql += ", '" + MEMO_TX + "'";
				sql += ", '" + USER_ID + "'";
				sql += ", SYSDATE";
				sql += ", ''";
				sql += ", NULL";
				sql += ", '" + RSVT_TX + "'";
				sql += ", '" + ACPT_TX + "'";
				sql += ")";

				argStmtExec.executeUpdate(sql);
			} else {
			
				sql = "UPDATE ET_CLDR_MEMO SET ";
				sql += "  ECM_MEMO_TX = '" + MEMO_TX + "'";
				sql += ", ECM_MODI_ID = '" + USER_ID + "'";
				sql += ", ECM_MODI_DTT = SYSDATE";
				sql += ", ECM_RSVT_TX = '" + RSVT_TX + "'";
				sql += ", ECM_ACPT_TX = '" + ACPT_TX + "'";
				sql += " WHERE ECM_MEMO_DT = '" + MEMO_DT + "'";
				sql += " AND ECM_MEMO_SQ = 0";

				argStmtExec.executeUpdate(sql);
     	}

		} catch (Exception e) {

			throw new FuncException(e.toString(), sql);
		}

		return sql;
	}
%>
