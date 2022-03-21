<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%!
	public String func_frameSetCustomExamResult_targetItemSave_002(Statement argStmtExec, HashMap argHtMethod) throws Exception {

		String sql = "";
		String sql2 = "";
		String sql_disp = "";

		try {

			String EMP_NO = (String) argHtMethod.get("EMP_NO");

			//
			if(EMP_NO == null) { EMP_NO = ""; }

			//
			EMP_NO = CTr.Replace(EMP_NO, "'", "''");

			sql = "DELETE ET_CUST_ITEM";
			sql += " WHERE ECI_EMP_NO = '" + EMP_NO + "'";

			argStmtExec.executeUpdate(sql);

		} catch (Exception e) {

			throw new FuncException(e.toString(), sql);
		}

		return sql;
	}
%>
