<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%!
	public String func_uFM_AcptComm_GP_Psnl_Memo_001(Statement argStmtExec, HashMap argHtMethod) throws Exception {

		String sql = "";
		String sql2 = "";
		String sql_disp = "";

		Connection connect = argStmtExec.getConnection();
		CallableStatement CallStmtExec = null;

		try {
			String DATA_KD = (String) argHtMethod.get("DATA_KD");
			String CUST_NO = (String) argHtMethod.get("CUST_NO");
			String MEMO_SQ = (String) argHtMethod.get("MEMO_SQ");
			String CHART_NO = (String) argHtMethod.get("CHART_NO");
			String MEMO_TX = (String) argHtMethod.get("MEMO_TX");
			String INPT_ID = (String) argHtMethod.get("INPT_ID");

			//

			if(DATA_KD == null) { DATA_KD = ""; }
			if(CUST_NO == null) { CUST_NO = ""; }
			if(MEMO_SQ == null) { MEMO_SQ = ""; }
			if(CHART_NO == null) { CHART_NO = ""; }
			if(MEMO_TX == null) { MEMO_TX = ""; }
			if(INPT_ID == null) { INPT_ID = ""; }

			//

			if (DATA_KD.equals("N")) {
				sql = " INSERT INTO ET_PSNL_MEMO (EPM_CUST_NO, EPM_MEMO_SQ, EPM_CHART_NO, EPM_MEMO_TX, EPM_INPT_ID, EPM_INPT_DTT) ";
				sql += " VALUES (?, ?, ?, ?, ?, SYSDATE) ";
  				//sql += " VALUES (:CUST_NO, :MEMO_SQ, :CHART_NO, :MEMO_TX, :INPT_ID, SYSDATE) ";

				CallStmtExec = connect.prepareCall(sql);

				CallStmtExec.setString(1, CUST_NO);
				CallStmtExec.setString(2, MEMO_SQ);
				CallStmtExec.setString(3, CHART_NO);
				CallStmtExec.setString(4, MEMO_TX);
				CallStmtExec.setString(5, INPT_ID);

				CallStmtExec.executeUpdate();
			} else {
				sql = " UPDATE ET_PSNL_MEMO ";
				sql += " 	SET EPM_MEMO_TX = ?, ";
				sql += " 		EPM_INPT_ID = ?, ";
				sql += " 		EPM_INPT_DTT = SYSDATE ";
				sql += " WHERE EPM_CUST_NO = ? ";
				sql += " 	AND EPM_MEMO_SQ = ? ";
				sql += " 	AND NVL(EPM_MEMO_TX, ' ') <> NVL(?, ' ') ";

				CallStmtExec = connect.prepareCall(sql);

				CallStmtExec.setString(1, MEMO_TX);
				CallStmtExec.setString(2, INPT_ID);
				CallStmtExec.setString(3, CUST_NO);
				CallStmtExec.setString(4, MEMO_SQ);
				CallStmtExec.setString(5, MEMO_TX);

				CallStmtExec.executeUpdate();

			}


		} catch (Exception e) {

			throw new FuncException(e.toString(), sql);
		}

		return sql;
	}
%>
