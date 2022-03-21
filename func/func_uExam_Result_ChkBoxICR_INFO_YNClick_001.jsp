<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%!
	public String func_uExam_Result_ChkBoxICR_INFO_YNClick_001(Statement argStmtExec, HashMap argHtMethod) throws Exception {

		String sql = "";
		String sql2 = "";
		String sql_disp = "";

		try {

			String INFO_YN = (String) argHtMethod.get("INFO_YN");
			String CUST_NO = (String) argHtMethod.get("CUST_NO");

			//
			if(INFO_YN == null) { INFO_YN = ""; }
			if(CUST_NO == null) { CUST_NO = ""; }

			//
			INFO_YN = CTr.Replace(INFO_YN, "'", "''");
			CUST_NO = CTr.Replace(CUST_NO, "'", "''");

			sql = "UPDATE IT_CUSTOMER SET ";
			sql += "  ICR_INFO_YN = '" + INFO_YN + "'";
			sql += " WHERE ICR_CUST_NO = '" + CUST_NO + "'";

			argStmtExec.executeUpdate(sql);

		} catch (Exception e) {

			throw new FuncException(e.toString(), sql);
		}

		return sql;
	}
%>
