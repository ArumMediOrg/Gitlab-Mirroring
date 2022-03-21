<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%!
	public String func_uSP_ChungFILERE_RzBmNhAcnoClick_001(Statement argStmtExec, HashMap argHtMethod) throws Exception {

		String sql = "";
		String sql2 = "";
		String sql_disp = "";

		try {

			String ACPT_NO = (String) argHtMethod.get("ACPT_NO");
			String BUSI_YR = (String) argHtMethod.get("BUSI_YR");
			String BILL_DT = (String) argHtMethod.get("BILL_DT");
			String BILL_NO = (String) argHtMethod.get("BILL_NO");
			String RZRBCHUNGFILE = (String) argHtMethod.get("RZRBCHUNGFILE");
			String BILL_FL = (String) argHtMethod.get("BILL_FL");

			//
			if(ACPT_NO == null) { ACPT_NO = ""; }
			if(BUSI_YR == null) { BUSI_YR = ""; }
			if(BILL_DT == null) { BILL_DT = ""; }
			if(BILL_NO == null) { BILL_NO = ""; }
			if(RZRBCHUNGFILE == null) { RZRBCHUNGFILE = ""; }
			if(BILL_FL == null) { BILL_FL = ""; }

			//
			ACPT_NO = CTr.Replace(ACPT_NO, "'", "''");
			BUSI_YR = CTr.Replace(BUSI_YR, "'", "''");
			BILL_DT = CTr.Replace(BILL_DT, "'", "''");
			BILL_NO = CTr.Replace(BILL_NO, "'", "''");
			RZRBCHUNGFILE = CTr.Replace(RZRBCHUNGFILE, "'", "''");
			BILL_FL = CTr.Replace(BILL_FL, "'", "''");

			sql = "UPDATE BT_BILL_HNHIS SET ";
			sql += "  BBH_ACPT_NO = '" + ACPT_NO + "'";
			sql += " WHERE BBH_BUSI_YR = '" + BUSI_YR + "'";
			sql += " AND BBH_BILL_DT = '" + BILL_DT + "'";
			sql += " AND BBH_BILL_NO = '" + BILL_NO + "'";
			sql += " AND BBH_BILL_FL = '" + BILL_FL + "'";

			argStmtExec.executeUpdate(sql);

		} catch (Exception e) {

			throw new FuncException(e.toString(), sql);
		}

		return sql;
	}
%>
