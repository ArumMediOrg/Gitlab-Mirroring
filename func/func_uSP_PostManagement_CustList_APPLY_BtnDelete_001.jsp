<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%!
	public String func_uSP_PostManagement_CustList_APPLY_BtnDelete_001(Statement argStmtExec, HashMap argHtMethod) throws Exception {

		String sql = "";
		String sql2 = "";
		String sql_disp = "";

		try {

			String ADVI_DT = (String) argHtMethod.get("ADVI_DT");
			String CUST_NO = (String) argHtMethod.get("CUST_NO");
			String ADVI_SQ = (String) argHtMethod.get("ADVI_SQ");

			//
			if(ADVI_DT == null) { ADVI_DT = ""; }
			if(CUST_NO == null) { CUST_NO = ""; }
			if(ADVI_SQ == null) { ADVI_SQ = ""; }

			//
			ADVI_DT = CTr.Replace(ADVI_DT, "'", "''");
			CUST_NO = CTr.Replace(CUST_NO, "'", "''");
			ADVI_SQ = CTr.Replace(ADVI_SQ, "'", "''");

			sql = "DELETE FROM ST_ADVICE";
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
