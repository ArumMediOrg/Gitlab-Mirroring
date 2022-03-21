<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%!
	public String func_uIT_ChungGU_2018_UDP_BILL_HNINSERT_001(Statement argStmtExec, HashMap argHtMethod) throws Exception {

		String sql = "";
		String sql2 = "";
		String sql_disp = "";

		try {

			String BUSI_YR = (String) argHtMethod.get("BUSI_YR");
			String BILL_DT = (String) argHtMethod.get("BILL_DT");
			String BILL_NO = (String) argHtMethod.get("BILL_NO");
			String BILL_FL = (String) argHtMethod.get("BILL_FL");
			String BILL_KD = (String) argHtMethod.get("BILL_KD");
			String ACPT_DT = (String) argHtMethod.get("ACPT_DT");
			String USER_ID = (String) argHtMethod.get("USER_ID");

			//
			if(BUSI_YR == null) { BUSI_YR = ""; }
			if(BILL_DT == null) { BILL_DT = ""; }
			if(BILL_NO == null) { BILL_NO = ""; }
			if(BILL_FL == null) { BILL_FL = ""; }
			if(BILL_KD == null) { BILL_KD = ""; }
			if(ACPT_DT == null) { ACPT_DT = ""; }
			if(USER_ID == null) { USER_ID = ""; }

			//
			BUSI_YR = CTr.Replace(BUSI_YR, "'", "''");
			BILL_DT = CTr.Replace(BILL_DT, "'", "''");
			BILL_NO = CTr.Replace(BILL_NO, "'", "''");
			BILL_FL = CTr.Replace(BILL_FL, "'", "''");
			BILL_KD = CTr.Replace(BILL_KD, "'", "''");
			ACPT_DT = CTr.Replace(ACPT_DT, "'", "''");
			USER_ID = CTr.Replace(USER_ID, "'", "''");

			sql = "INSERT INTO BT_BILL_HNHIS ( BBH_BUSI_YR ,BBH_BILL_DT ,BBH_BILL_NO ,BBH_BILL_FL ,BBH_BILL_KD ,BBH_ACPT_DT ,BBH_INPUT_ID ,BBH_INPUT_DTT ,BBH_MODI_DTT ,BBH_MODI_ID ) VALUES (";
			sql += "  '" + BUSI_YR + "'";
			sql += ", '" + BILL_DT + "'";
			sql += ", '" + BILL_NO + "'";
			sql += ", '" + BILL_FL + "'";
			sql += ", '" + BILL_KD + "'";
			sql += ", TO_DATE('" + ACPT_DT + "', 'YYYY-MM-DD')";
			sql += ", '" + USER_ID + "'";
			sql += ", SYSDATE";
			sql += ", SYSDATE";
			sql += ", '" + USER_ID + "'";
			sql += ")";

			argStmtExec.executeUpdate(sql);

		} catch (Exception e) {

			throw new FuncException(e.toString(), sql);
		}

		return sql;
	}
%>
