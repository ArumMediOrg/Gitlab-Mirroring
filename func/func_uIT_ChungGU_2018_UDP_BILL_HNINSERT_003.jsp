<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%!
	public String func_uIT_ChungGU_2018_UDP_BILL_HNINSERT_003(Statement argStmtExec, HashMap argHtMethod) throws Exception {

		String sql = "";
		String sql2 = "";
		String sql_disp = "";

		try {

			String BUSI_YR = (String) argHtMethod.get("BUSI_YR");
			String BILL_DT = (String) argHtMethod.get("BILL_DT");
			String BILL_NO = (String) argHtMethod.get("BILL_NO");
			String BILL_FL = (String) argHtMethod.get("BILL_FL");
			String BILL_HC = (String) argHtMethod.get("BILL_HC");
			String FBILL_CT = (String) argHtMethod.get("FBILL_CT");
			String FBILL_PR = (String) argHtMethod.get("FBILL_PR");
			String INPUT_ID = (String) argHtMethod.get("INPUT_ID");
			String MODI_ID = (String) argHtMethod.get("MODI_ID");

			//
			if(BUSI_YR == null) { BUSI_YR = ""; }
			if(BILL_DT == null) { BILL_DT = ""; }
			if(BILL_NO == null) { BILL_NO = ""; }
			if(BILL_FL == null) { BILL_FL = ""; }
			if(BILL_HC == null) { BILL_HC = ""; }
			if(FBILL_CT == null) { FBILL_CT = ""; }
			if(FBILL_PR == null) { FBILL_PR = ""; }
			if(INPUT_ID == null) { INPUT_ID = ""; }
			if(MODI_ID == null) { MODI_ID = ""; }

			//
			BUSI_YR = CTr.Replace(BUSI_YR, "'", "''");
			BILL_DT = CTr.Replace(BILL_DT, "'", "''");
			BILL_NO = CTr.Replace(BILL_NO, "'", "''");
			BILL_FL = CTr.Replace(BILL_FL, "'", "''");
			BILL_HC = CTr.Replace(BILL_HC, "'", "''");
			FBILL_CT = CTr.Replace(FBILL_CT, "'", "''");
			FBILL_PR = CTr.Replace(FBILL_PR, "'", "''");
			INPUT_ID = CTr.Replace(INPUT_ID, "'", "''");
			MODI_ID = CTr.Replace(MODI_ID, "'", "''");

			sql = "INSERT INTO BT_BILL_DNHIS ( BBD_BUSI_YR ,BBD_BILL_DT ,BBD_BILL_NO ,BBD_BILL_FL ,BBD_BILL_HC ,BBD_FBILL_CT ,BBD_FBILL_PR ,BBD_INPUT_DTT ,BBD_INPUT_ID ,BBD_MODI_DTT ,BBD_MODI_ID ) VALUES (";
			sql += "  '" + BUSI_YR + "'";
			sql += ", '" + BILL_DT + "'";
			sql += ", '" + BILL_NO + "'";
			sql += ", '" + BILL_FL + "'";
			sql += ", '" + BILL_HC + "'";
			sql += ", '" + FBILL_CT + "'";
			sql += ", '" + FBILL_PR + "'";
			sql += ", SYSDATE";
			sql += ", '" + INPUT_ID + "'";
			sql += ", SYSDATE";
			sql += ", '" + MODI_ID + "'";
			sql += ")";

			argStmtExec.executeUpdate(sql);

		} catch (Exception e) {

			throw new FuncException(e.toString(), sql);
		}

		return sql;
	}
%>
