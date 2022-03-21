<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%!
	public String func_frameSetCustomExamResult_targetItemSave_001(Statement argStmtExec, HashMap argHtMethod) throws Exception {

		String sql = "";
		String sql2 = "";
		String sql_disp = "";

		try {

			String EMP_NO = (String) argHtMethod.get("EMP_NO");
			String ITEM_CD = (String) argHtMethod.get("ITEM_CD");

			//
			if(EMP_NO == null) { EMP_NO = ""; }
			if(ITEM_CD == null) { ITEM_CD = ""; }

			//
			EMP_NO = CTr.Replace(EMP_NO, "'", "''");
			ITEM_CD = CTr.Replace(ITEM_CD, "'", "''");

			sql = "INSERT INTO ET_CUST_ITEM (ECI_EMP_NO, ECI_ITEM_CD) ";
			sql += " VALUES (";
			sql += "  '" + EMP_NO + "'";
			sql += ", '" + ITEM_CD + "'";
			sql += ")";

			argStmtExec.executeUpdate(sql);

		} catch (Exception e) {

			throw new FuncException(e.toString(), sql);
		}

		return sql;
	}
%>
