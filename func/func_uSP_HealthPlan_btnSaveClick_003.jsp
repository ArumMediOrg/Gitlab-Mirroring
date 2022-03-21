<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%!
	public String func_uSP_HealthPlan_btnSaveClick_003(Statement argStmtExec, HashMap argHtMethod) throws Exception {

		String sql = "";
		String sql2 = "";
		String sql_disp = "";

		Connection connect = argStmtExec.getConnection();
		CallableStatement CallStmtExec = null;

		try {

			String SGUBN = (String) argHtMethod.get("SGUBN");
			String COMP_CD = (String) argHtMethod.get("COMP_CD");
			String SAVE_DT = (String) argHtMethod.get("SAVE_DT");
			String SAVE_SQ = (String) argHtMethod.get("SAVE_SQ");
			String DEPT_SQ = (String) argHtMethod.get("DEPT_SQ");
			String FAC_SQ = (String) argHtMethod.get("FAC_SQ");
			String FAC_NM = (String) argHtMethod.get("FAC_NM");
			String CHECK_RSLT = (String) argHtMethod.get("CHECK_RSLT");
			String EXPO_STND = (String) argHtMethod.get("EXPO_STND");
			String INPT_ID = (String) argHtMethod.get("INPT_ID");
			String MODI_ID = (String) argHtMethod.get("MODI_ID");

			//

			if(SGUBN == null) { SGUBN = ""; }
			if(COMP_CD == null) { COMP_CD = ""; }
			if(SAVE_DT == null) { SAVE_DT = ""; }
			if(SAVE_SQ == null) { SAVE_SQ = ""; }
			if(DEPT_SQ == null) { DEPT_SQ = ""; }
			if(FAC_SQ == null) { FAC_SQ = ""; }
			if(FAC_NM == null) { FAC_NM = ""; }
			if(CHECK_RSLT == null) { CHECK_RSLT = ""; }
			if(EXPO_STND == null) { EXPO_STND = ""; }
			if(INPT_ID == null) { INPT_ID = ""; }
			if(MODI_ID == null) { MODI_ID = ""; }

			//

			if (SGUBN.equals("0")){

				sql = " Insert Into SP_PLAN_FAC_DATA ";
				sql += " (SPF_COMP_CD, SPF_SAVE_DT, SPF_SAVE_SQ,    SPF_DEPT_SQ, ";
				sql += " SPF_FAC_SQ,  SPF_FAC_NM,  SPF_CHECK_RSLT, SPF_EXPO_STND, ";
				sql += " SPF_INPT_ID, SPF_INPT_DTT) ";
				sql += " Values( ";
				sql += " ? , ";
				sql += " ? , ";
				sql += " ? , ";
				sql += " ? , ";
				sql += " ? , ";
				sql += " ? , ";
				sql += " ? , ";
				sql += " ? , ";
				sql += " ? , ";
				sql += " sysdate) ";

				CallStmtExec = connect.prepareCall(sql);

				CallStmtExec.setString(1, COMP_CD);
				CallStmtExec.setString(2, SAVE_DT);
				CallStmtExec.setString(3, SAVE_SQ);
				CallStmtExec.setString(4, DEPT_SQ);
				CallStmtExec.setString(5, FAC_SQ);
				CallStmtExec.setString(6, FAC_NM);
				CallStmtExec.setString(7, CHECK_RSLT);
				CallStmtExec.setString(8, EXPO_STND);
				CallStmtExec.setString(9, INPT_ID);

			} else if (SGUBN.equals("1")){

				sql += " Update SP_PLAN_FAC_DATA Set ";
				sql += " SPF_CHECK_RSLT = ?, ";
				sql += " SPF_EXPO_STND  = ?, ";
				sql += " SPF_MODI_ID    = ?, ";
				sql += " SPF_MODI_DTT   = sysdate ";
				sql += " Where SPF_COMP_CD = ? ";
				sql += " 	And SPF_SAVE_DT = ? ";
				sql += " 	And SPF_SAVE_SQ = ? ";
				sql += " 	And SPF_DEPT_SQ = ? ";
				sql += " 	And SPF_FAC_SQ  = ? ";

				CallStmtExec = connect.prepareCall(sql);

				CallStmtExec.setString(1, CHECK_RSLT);
				CallStmtExec.setString(2, EXPO_STND);
				CallStmtExec.setString(3, MODI_ID);
				CallStmtExec.setString(4, COMP_CD);
				CallStmtExec.setString(5, SAVE_DT);
				CallStmtExec.setString(6, SAVE_SQ);
				CallStmtExec.setString(7, DEPT_SQ);
				CallStmtExec.setString(8, FAC_SQ);
			}

			CallStmtExec.executeUpdate();

		} catch (Exception e) {

			throw new FuncException(e.toString(), sql);
		}

		return sql;
	}
%>
