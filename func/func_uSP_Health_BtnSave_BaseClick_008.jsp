<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%!
	public String func_uSP_Health_BtnSave_BaseClick_008(Statement argStmtExec, HashMap argHtMethod) throws Exception {

		String sql = "";
		String sql2 = "";
		String sql_disp = "";

		try {

			String NOTE_YN = (String) argHtMethod.get("NOTE_YN");
			String DIVI_NO = (String) argHtMethod.get("DIVI_NO");
			String NTNA_CD = (String) argHtMethod.get("NTNA_CD");
			String USER_ID = (String) argHtMethod.get("USER_ID");
			String CUST_NO = (String) argHtMethod.get("CUST_NO");

			//
			if(NOTE_YN == null) { NOTE_YN = ""; }
			if(DIVI_NO == null) { DIVI_NO = ""; }
			if(NTNA_CD == null) { NTNA_CD = ""; }
			if(USER_ID == null) { USER_ID = ""; }
			if(CUST_NO == null) { CUST_NO = ""; }

			//
			NOTE_YN = CTr.Replace(NOTE_YN, "'", "''");
			DIVI_NO = CTr.Replace(DIVI_NO, "'", "''");
			NTNA_CD = CTr.Replace(NTNA_CD, "'", "''");
			USER_ID = CTr.Replace(USER_ID, "'", "''");
			CUST_NO = CTr.Replace(CUST_NO, "'", "''");

			sql = "UPDATE IT_CUSTOMER SET ";
			sql += "  ICR_NOTE_YN = '" + NOTE_YN + "'";
			sql += ", ICR_DIVI_NO = '" + DIVI_NO + "'";
			sql += ", ICR_NTNA_CD = '" + NTNA_CD + "'";
			sql += ", ICR_MODI_ID = '" + USER_ID + "'";
			sql += ", ICR_MODI_DTT = SYSDATE";
			sql += " WHERE ICR_CUST_NO = '" + CUST_NO + "'";

			argStmtExec.executeUpdate(sql);

		} catch (Exception e) {

			throw new FuncException(e.toString(), sql);
		}

		return sql;
	}
%>
