<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%!
	public String func_uIT_ChungGU_Move_Up_Insert_chungPer_002_TRAN001(Statement argStmtExec, HashMap argHtMethod) throws Exception {

		String sql = "";
		String sql2 = "";
		String sql_disp = "";

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
			String ETC = (String) argHtMethod.get("ETC");

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
			if(ETC == null) { ETC = ""; }

			//
			BUSI_YR = CTr.Replace(BUSI_YR, "'", "''");
			COMP_CD = CTr.Replace(COMP_CD, "'", "''");
			BILL_DT = CTr.Replace(BILL_DT, "'", "''");
			BILL_NO = CTr.Replace(BILL_NO, "'", "''");
			BILL_KD = CTr.Replace(BILL_KD, "'", "''");
			EXAM_CD = CTr.Replace(EXAM_CD, "'", "''");
			BILL_CT = CTr.Replace(BILL_CT, "'", "''");
			BILL_PR = CTr.Replace(BILL_PR, "'", "''");
			CST_DT = CTr.Replace(CST_DT, "'", "''");
			CET_DT = CTr.Replace(CET_DT, "'", "''");
			INPUT_ID = CTr.Replace(INPUT_ID, "'", "''");
			MODI_ID = CTr.Replace(MODI_ID, "'", "''");
			ETC = CTr.Replace(ETC, "'", "''");

			sql = "INSERT INTO BT_BILL_COMP ( BBC_BUSI_YR, BBC_COMP_CD, BBC_BILL_DT, BBC_BILL_NO, BBC_BILL_KD, BBC_EXAM_CD, BBC_BILL_CT, BBC_BILL_PR, BBC_CST_DT, BBC_CET_DT, ";
			sql += " BBC_INPUT_ID, BBC_INPUT_DTT, BBC_MODI_ID, BBC_MODI_DTT, BBC_BILL_ETC ) VALUES (";
			sql += "  '" + BUSI_YR + "'";
			sql += ", '" + COMP_CD + "'";
			sql += ", '" + BILL_DT + "'";
			sql += ", '" + BILL_NO + "'";
			sql += ", '" + BILL_KD + "'";
			sql += ", '" + EXAM_CD + "'";
			sql += ", '" + BILL_CT + "'";
			sql += ", '" + BILL_PR + "'";
			sql += ", '" + CST_DT + "'";
			sql += ", '" + CET_DT + "'";
			sql += ", '" + INPUT_ID + "'";
			sql += ", SYSDATE";
			sql += ", '" + MODI_ID + "'";
			sql += ", SYSDATE";
			sql += ", '" + ETC + "'";
			sql += ")";

			argStmtExec.executeUpdate(sql);

		} catch (Exception e) {

			throw new FuncException(e.toString(), sql);
		}

		return sql;
	}
%>
