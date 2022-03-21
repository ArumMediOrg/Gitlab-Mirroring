<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%!
	public String func_uSP_ChungFILERE_RZ_BTN_ALLChugu_REClick_001(Statement argStmtExec, HashMap argHtMethod) throws Exception {

		String sql = "";
		String sql2 = "";
		String sql_disp = "";

		try {

			String CHUNG_DT = (String) argHtMethod.get("CHUNG_DT");
			String BILL_FL = (String) argHtMethod.get("BILL_FL");
			String CHUNG_NO = (String) argHtMethod.get("CHUNG_NO");

			//
			if(CHUNG_DT == null) { CHUNG_DT = ""; }
			if(BILL_FL == null) { BILL_FL = ""; }
			if(CHUNG_NO == null) { CHUNG_NO = ""; }

			//
			CHUNG_DT = CTr.Replace(CHUNG_DT, "'", "''");
			BILL_FL = CTr.Replace(BILL_FL, "'", "''");
			CHUNG_NO = CTr.Replace(CHUNG_NO, "'", "''");

			sql = "UPDATE ST_BILLHN_PR SET ";
			sql += "  SBP_CHUNG_NO = ''";
			sql += ", SBP_RETURN_KD = '1'";
			sql += ", SBP_BILLE_DT = SYSDATE";
			sql += " WHERE SBP_CHUNG_DT = '" + CHUNG_DT + "'";
			sql += " AND SBP_BILL_FL = '" + BILL_FL + "'";
			sql += " AND SBP_CHUNG_NO = '" + CHUNG_NO + "'";

			argStmtExec.executeUpdate(sql);

		} catch (Exception e) {

			throw new FuncException(e.toString(), sql);
		}

		return sql;
	}
%>
