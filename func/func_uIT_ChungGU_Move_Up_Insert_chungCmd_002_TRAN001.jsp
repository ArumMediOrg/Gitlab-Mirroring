<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%!
	public String func_uIT_ChungGU_Move_Up_Insert_chungCmd_002_TRAN001(Statement argStmtExec, HashMap argHtMethod) throws Exception {

		String sql = "";
		String sql2 = "";
		String sql_disp = "";

		Connection connect = argStmtExec.getConnection();
		CallableStatement CallStmtExec = null;

		try {

			String BUSI_YR = (String) argHtMethod.get("BUSI_YR");
			String COMP_CD = (String) argHtMethod.get("COMP_CD");
			String BILL_DT = (String) argHtMethod.get("BILL_DT");
			String BILL_NO = (String) argHtMethod.get("BILL_NO");
			String BILL_KD = (String) argHtMethod.get("BILL_KD");
			String EXAM_CD = (String) argHtMethod.get("EXAM_CD");
			String BILL_CT = (String) argHtMethod.get("BILL_CT");
			String BILL_PR = (String) argHtMethod.get("BILL_PR");
			String CST_DT = (String) argHtMethod.get("CST_DT");
			String CET_DT = (String) argHtMethod.get("CET_DT");
			String INPUT_ID = (String) argHtMethod.get("INPUT_ID");
			String MODI_ID = (String) argHtMethod.get("MODI_ID");
			String BILL_FL = (String) argHtMethod.get("BILL_FL");
			String ETC = (String) argHtMethod.get("ETC");
			String ETC_NM = (String) argHtMethod.get("ETC_NM");

			//
			if(BUSI_YR == null) { BUSI_YR = ""; }
			if(COMP_CD == null) { COMP_CD = ""; }
			if(BILL_DT == null) { BILL_DT = ""; }
			if(BILL_NO == null) { BILL_NO = ""; }
			if(BILL_KD == null) { BILL_KD = ""; }
			if(EXAM_CD == null) { EXAM_CD = ""; }
			if(BILL_CT == null) { BILL_CT = ""; }
			if(BILL_PR == null) { BILL_PR = ""; }
			if(CST_DT == null) { CST_DT = ""; }
			if(CET_DT == null) { CET_DT = ""; }
			if(INPUT_ID == null) { INPUT_ID = ""; }
			if(MODI_ID == null) { MODI_ID = ""; }
			if(BILL_FL == null) { BILL_FL = ""; }
			if(ETC == null) { ETC = ""; }
			if(ETC_NM == null) { ETC_NM = ""; }



			sql = "INSERT INTO BT_BILL_COMP ( BBC_BUSI_YR, BBC_COMP_CD, BBC_BILL_DT, BBC_BILL_NO, BBC_BILL_KD, BBC_EXAM_CD, BBC_BILL_CT, BBC_BILL_PR, ";
			sql += " BBC_CST_DT, BBC_CET_DT, BBC_BILL_FL, BBC_INPUT_ID, BBC_INPUT_DTT, BBC_MODI_ID, BBC_MODI_DTT, BBC_BILL_ETC, BBC_BILL_ETC_NM ) ";
			sql += " VALUES (";
			sql += " ? ";
			sql += ",? ";
			sql += ",? ";
			sql += ",? ";
			sql += ",? ";
			sql += ",? ";
			sql += ",? ";
			sql += ",? ";
			sql += ",? ";
			sql += ",? ";
			sql += ",? ";
			sql += ",? ";
			sql += ", SYSDATE";
			sql += ",? ";
			sql += ", SYSDATE";
			sql += ", ?";
			sql += ", ?";
			sql += ")";

			CallStmtExec = connect.prepareCall(sql);

			CallStmtExec.setString(1, BUSI_YR);
			CallStmtExec.setString(2, COMP_CD);
			CallStmtExec.setString(3, BILL_DT);
			CallStmtExec.setString(4, BILL_NO);
			CallStmtExec.setString(5, BILL_KD);
			CallStmtExec.setString(6, EXAM_CD);
			CallStmtExec.setString(7, BILL_CT);
			CallStmtExec.setString(8, BILL_PR);
			CallStmtExec.setString(9, CST_DT);
			CallStmtExec.setString(10, CET_DT);
			CallStmtExec.setString(11, BILL_FL);
			CallStmtExec.setString(12, INPUT_ID);
			CallStmtExec.setString(13, MODI_ID);
			CallStmtExec.setString(14, ETC);
			CallStmtExec.setString(15, ETC_NM);

			CallStmtExec.executeUpdate();

		} catch (Exception e) {

			throw new FuncException(e.toString(), sql);
		}

		return sql;
	}
%>
