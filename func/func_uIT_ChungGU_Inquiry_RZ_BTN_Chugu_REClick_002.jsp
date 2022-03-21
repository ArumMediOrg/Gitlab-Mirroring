<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%!
	public String func_uIT_ChungGU_Inquiry_RZ_BTN_Chugu_REClick_002(Statement argStmtExec, HashMap argHtMethod) throws Exception {

		String sql = "";
		String sql2 = "";
		String sql_disp = "";

		try {

			String COMP_CD = (String) argHtMethod.get("COMP_CD");
			String BILL_DT = (String) argHtMethod.get("BILL_DT");
			String BILL_NO = (String) argHtMethod.get("BILL_NO");

			//
			if(COMP_CD == null) { COMP_CD = ""; }
			if(BILL_DT == null) { BILL_DT = ""; }
			if(BILL_NO == null) { BILL_NO = ""; }

			//
			COMP_CD = CTr.Replace(COMP_CD, "'", "''");
			BILL_DT = CTr.Replace(BILL_DT, "'", "''");
			BILL_NO = CTr.Replace(BILL_NO, "'", "''");

			sql = "DELETE BT_BILL_COMP_LIST";
			sql += " WHERE BCL_COMP_CD = '" + COMP_CD + "'";
			sql += " AND BCL_BILL_DT = '" + BILL_DT + "'";
			sql += " AND BCL_BILL_NO = '" + BILL_NO + "'";

			argStmtExec.executeUpdate(sql);

		} catch (Exception e) {

			throw new FuncException(e.toString(), sql);
		}

		return sql;
	}
%>
