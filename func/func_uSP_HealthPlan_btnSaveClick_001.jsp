<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%!
	public String func_uSP_HealthPlan_btnSaveClick_001(Statement argStmtExec, HashMap argHtMethod) throws Exception {

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
			String SAVE_NM = (String) argHtMethod.get("SAVE_NM");
			String MANA_KD = (String) argHtMethod.get("MANA_KD");
			String TOTAL_RMK = (String) argHtMethod.get("TOTAL_RMK");
			String EXAMFR_DT = (String) argHtMethod.get("EXAMFR_DT");
			String EXAMTO_DT = (String) argHtMethod.get("EXAMTO_DT");
			String CHECKFR_DT = (String) argHtMethod.get("CHECKFR_DT");
			String CHECKTO_DT = (String) argHtMethod.get("CHECKTO_DT");
			String CHECK_NM = (String) argHtMethod.get("CHECK_NM");
			String NOTI_DT = (String) argHtMethod.get("NOTI_DT");
			String DOCT_ID = (String) argHtMethod.get("DOCT_ID");
			String DOCT_NM = (String) argHtMethod.get("DOCT_NM");
			String NUSE_ID = (String) argHtMethod.get("NUSE_ID");
			String NUSE_NM = (String) argHtMethod.get("NUSE_NM");
			String INPT_ID = (String) argHtMethod.get("INPT_ID");
			String DEPT_NM = (String) argHtMethod.get("DEPT_NM");
			String DANG_FAC = (String) argHtMethod.get("DANG_FAC");
			String DEPT_RMK = (String) argHtMethod.get("DEPT_RMK");
			String MODI_ID = (String) argHtMethod.get("MODI_ID");

			//

			if(SGUBN == null) { SGUBN = ""; }
			if(COMP_CD == null) { COMP_CD = ""; }
			if(SAVE_DT == null) { SAVE_DT = ""; }
			if(SAVE_SQ == null) { SAVE_SQ = ""; }
			if(DEPT_SQ == null) { DEPT_SQ = ""; }
			if(SAVE_NM == null) { SAVE_NM = ""; }
			if(MANA_KD == null) { MANA_KD = ""; }
			if(TOTAL_RMK == null) { TOTAL_RMK = ""; }
			if(EXAMFR_DT == null) { EXAMFR_DT = ""; }
			if(EXAMTO_DT == null) { EXAMTO_DT = ""; }
			if(CHECKFR_DT == null) { CHECKFR_DT = ""; }
			if(CHECKTO_DT == null) { CHECKTO_DT = ""; }
			if(CHECK_NM == null) { CHECK_NM = ""; }
			if(NOTI_DT == null) { NOTI_DT = ""; }
			if(DOCT_ID == null) { DOCT_ID = ""; }
			if(DOCT_NM == null) { DOCT_NM = ""; }
			if(NUSE_ID == null) { NUSE_ID = ""; }
			if(NUSE_NM == null) { NUSE_NM = ""; }
			if(INPT_ID == null) { INPT_ID = ""; }
			if(DEPT_NM == null) { DEPT_NM = ""; }
			if(DANG_FAC == null) { DANG_FAC = ""; }
			if(DEPT_RMK == null) { DEPT_RMK = ""; }
			if(MODI_ID == null) { MODI_ID = ""; }

			//

			if (SGUBN.equals("0")){

				sql = " Insert Into SP_PLAN_DATA ";
				sql += " (SPD_COMP_CD,    SPD_SAVE_DT,    SPD_SAVE_SQ,   SPD_DEPT_SQ,  SPD_SAVE_NM, ";
				sql += " SPD_MANA_KD,    SPD_DEPT_NM,   SPD_DANG_FAC,   SPD_DEPT_RMK,   SPD_TOTAL_RMK,  SPD_EXAMFR_DT, SPD_EXAMTO_DT, ";
				sql += " SPD_CHECKFR_DT, SPD_CHECKTO_DT, SPD_CHECK_NM,  SPD_NOTI_DT,  SPD_DOCT_ID, ";
				sql += " SPD_DOCT_NM,    SPD_NUSE_ID,    SPD_NUSE_NM,   SPD_INPT_ID,  SPD_INPT_DTT) ";
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
				sql += " ? , ";
				sql += " ? , ";
				sql += " ? , ";
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
				CallStmtExec.setString(5, SAVE_NM);
				CallStmtExec.setString(6, MANA_KD);
				CallStmtExec.setString(7, DEPT_NM);
				CallStmtExec.setString(8, DANG_FAC);
				CallStmtExec.setString(9, DEPT_RMK);
				CallStmtExec.setString(10, TOTAL_RMK);
				CallStmtExec.setString(11, EXAMFR_DT);
				CallStmtExec.setString(12, EXAMTO_DT);
				CallStmtExec.setString(13, CHECKFR_DT);
				CallStmtExec.setString(14, CHECKTO_DT);
				CallStmtExec.setString(15, CHECK_NM);
				CallStmtExec.setString(16, NOTI_DT);
				CallStmtExec.setString(17, DOCT_ID);
				CallStmtExec.setString(18, DOCT_NM);
				CallStmtExec.setString(19, NUSE_ID);
				CallStmtExec.setString(20, NUSE_NM);
				CallStmtExec.setString(21, INPT_ID);

			} else if (SGUBN.equals("1")){
				sql = " update SP_PLAN_DATA set ";
				sql += " SPD_MANA_KD    = ?, ";
				sql += " SPD_TOTAL_RMK  = ?, ";
				sql += " SPD_EXAMFR_DT  = ?, ";
				sql += " SPD_EXAMTO_DT  = ?, ";
				sql += " SPD_CHECKFR_DT = ?, ";
				sql += " SPD_CHECKTO_DT = ?, ";
				sql += " SPD_CHECK_NM   = ?, ";
				sql += " SPD_NOTI_DT    = ?, ";
				sql += " SPD_DOCT_ID    = ?, ";
				sql += " SPD_DOCT_NM    = ?, ";
				sql += " SPD_NUSE_ID    = ?, ";
				sql += " SPD_NUSE_NM    = ?, ";
				sql += " SPD_MODI_ID    = ?, ";
				sql += " SPD_DEPT_RMK    = ?, ";
				sql += " SPD_MODI_DTT   = sysdate ";
				sql += " Where SPD_COMP_CD = ? ";
				sql += " 	And SPD_SAVE_DT = ? ";
				sql += " 	And SPD_SAVE_SQ = ? ";
				sql += " 	And SPD_DEPT_SQ = ? ";

				CallStmtExec = connect.prepareCall(sql);

				CallStmtExec.setString(1, MANA_KD);
				CallStmtExec.setString(2, TOTAL_RMK);
				CallStmtExec.setString(3, EXAMFR_DT);
				CallStmtExec.setString(4, EXAMTO_DT);
				CallStmtExec.setString(5, CHECKFR_DT);
				CallStmtExec.setString(6, CHECKTO_DT);
				CallStmtExec.setString(7, CHECK_NM);
				CallStmtExec.setString(8, NOTI_DT);
				CallStmtExec.setString(9, DOCT_ID);
				CallStmtExec.setString(10, DOCT_NM);
				CallStmtExec.setString(11, NUSE_ID);
				CallStmtExec.setString(12, NUSE_NM);
				CallStmtExec.setString(13, MODI_ID);
				CallStmtExec.setString(14, DEPT_RMK);
				CallStmtExec.setString(15, COMP_CD);
				CallStmtExec.setString(16, SAVE_DT);
				CallStmtExec.setString(17, SAVE_SQ);
				CallStmtExec.setString(18, DEPT_SQ);

			}

			CallStmtExec.executeUpdate();

		} catch (Exception e) {

			throw new FuncException(e.toString(), sql);
		}

		return sql;
	}
%>
