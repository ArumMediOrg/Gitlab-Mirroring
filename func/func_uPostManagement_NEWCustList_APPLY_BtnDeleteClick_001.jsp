<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%!
	public String func_uPostManagement_NEWCustList_APPLY_BtnDeleteClick_001(Statement argStmtExec, HashMap argHtMethod) throws Exception {

		String sql = "";
		String sql2 = "";
		String sql_disp = "";

		try {

			String MODI_ID = (String) argHtMethod.get("MODI_ID");
			String ADVI_DT = (String) argHtMethod.get("ADVI_DT");
			String CUST_NO = (String) argHtMethod.get("CUST_NO");
			String ADVI_SQ = (String) argHtMethod.get("ADVI_SQ");

			//
			if(MODI_ID == null) { MODI_ID = ""; }
			if(ADVI_DT == null) { ADVI_DT = ""; }
			if(CUST_NO == null) { CUST_NO = ""; }
			if(ADVI_SQ == null) { ADVI_SQ = ""; }

			//
			MODI_ID = CTr.Replace(MODI_ID, "'", "''");
			ADVI_DT = CTr.Replace(ADVI_DT, "'", "''");
			CUST_NO = CTr.Replace(CUST_NO, "'", "''");
			ADVI_SQ = CTr.Replace(ADVI_SQ, "'", "''");

			sql = "UPDATE ST_ADVICE SET ";
			sql += "  SAE_USE_YN = 'N'";
			sql += ", SAE_MODI_ID = '" + MODI_ID + "'";
			sql += ", SAE_MODI_DTT = SYSDATE";
			sql += " WHERE SAE_ADVI_DT = '" + ADVI_DT + "'";
			sql += " AND SAE_CUST_NO = '" + CUST_NO + "'";
			sql += " AND SAE_ADVI_SQ = '" + ADVI_SQ + "'";

			argStmtExec.executeUpdate(sql);

		} catch (Exception e) {

			throw new FuncException(e.toString(), sql);
		}

		return sql;
	}
%>
