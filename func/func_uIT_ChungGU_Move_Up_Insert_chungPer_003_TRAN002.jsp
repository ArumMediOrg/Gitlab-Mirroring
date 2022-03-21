<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%!
	public String func_uIT_ChungGU_Move_Up_Insert_chungPer_003_TRAN002(Statement argStmtExec, HashMap argHtMethod) throws Exception {

		String sql = "";
		String sql2 = "";
		String sql_disp = "";

		Connection connect = argStmtExec.getConnection();
		CallableStatement CallStmtExec = null;

		try {

			String BUSI_YR = (String) argHtMethod.get("BUSI_YR");
			String COMP_CD = (String) argHtMethod.get("COMP_CD");
			String BILL_NO = (String) argHtMethod.get("BILL_NO");
			String BILL_DT = (String) argHtMethod.get("BILL_DT");
			String BILL_SQ = (String) argHtMethod.get("BILL_SQ");
			String EXAM_DT = (String) argHtMethod.get("EXAM_DT");
			String EXAM_SQ = (String) argHtMethod.get("EXAM_SQ");
			String BILL_KD = (String) argHtMethod.get("BILL_KD");
			String BILLCOM_PR = (String) argHtMethod.get("BILLCOM_PR");
			String INPUT_ID = (String) argHtMethod.get("INPUT_ID");
			String EMSB_PR = (String) argHtMethod.get("EMSB_PR");
			String CVSB_PR = (String) argHtMethod.get("CVSB_PR");
			String ETSB_PR = (String) argHtMethod.get("ETSB_PR");

			//
			if(BUSI_YR == null) { BUSI_YR = ""; }
			if(COMP_CD == null) { COMP_CD = ""; }
			if(BILL_NO == null) { BILL_NO = ""; }
			if(BILL_DT == null) { BILL_DT = ""; }
			if(BILL_SQ == null) { BILL_SQ = ""; }
			if(EXAM_DT == null) { EXAM_DT = ""; }
			if(EXAM_SQ == null) { EXAM_SQ = ""; }
			if(BILL_KD == null) { BILL_KD = ""; }
			if(BILLCOM_PR == null) { BILLCOM_PR = ""; }
			if(INPUT_ID == null) { INPUT_ID = ""; }
			if(EMSB_PR == null) { EMSB_PR = ""; }
			if(CVSB_PR == null) { CVSB_PR = ""; }
			if(ETSB_PR == null) { ETSB_PR = ""; }

			sql += " INSERT INTO BT_BILL_COMP_LIST ";
			sql += " ( ";
			sql += " 	BCL_BUSI_YR, ";
			sql += " 	BCL_COMP_CD, ";
			sql += " 	BCL_BILL_NO, ";
			sql += " 	BCL_BILL_DT, ";
			sql += " 	BCL_BILL_SQ, ";
			sql += " 	BCL_EXAM_DT, ";
			sql += " 	BCL_EXAM_SQ, ";
			sql += " 	BCL_BILL_KD, ";
			sql += " 	BCL_BILLCOM_PR, ";
			sql += " 	BCL_INPUT_DTT, ";
			sql += " 	BCL_INPUT_ID, ";
			sql += " 	BCL_EMSB_PR, ";
			sql += " 	BCL_CVSB_PR, ";
			sql += " 	BCL_ETSB_PR ";
			sql += " ) ";
			sql += " VALUES ";
			sql += " ( ";
			sql += " 	?, ";
			sql += " 	?, ";
			sql += " 	?, ";
			sql += " 	?, ";
			sql += " 	?, ";
			sql += " 	?, ";
			sql += " 	?, ";
			sql += " 	?, ";
			sql += " 	?, ";
			sql += " 	SYSDATE, ";
			sql += " 	?, ";
			sql += " 	?, ";
			sql += " 	?, ";
			sql += " 	? ";
			sql += " ) ";

			CallStmtExec = connect.prepareCall(sql);

			CallStmtExec.setString(1, BUSI_YR);
			CallStmtExec.setString(2, COMP_CD);
			CallStmtExec.setString(3, BILL_NO);
			CallStmtExec.setString(4, BILL_DT);
			CallStmtExec.setString(5, BILL_SQ);
			CallStmtExec.setString(6, EXAM_DT);
			CallStmtExec.setString(7, EXAM_SQ);
			CallStmtExec.setString(8, BILL_KD);
			CallStmtExec.setString(9, BILLCOM_PR);
			CallStmtExec.setString(10, INPUT_ID);
			CallStmtExec.setString(11, EMSB_PR);
			CallStmtExec.setString(12, CVSB_PR);
			CallStmtExec.setString(13, ETSB_PR);

			CallStmtExec.executeUpdate();

		} catch (Exception e) {

			throw new FuncException(e.toString(), sql);
		}

		return sql;
	}
%>
