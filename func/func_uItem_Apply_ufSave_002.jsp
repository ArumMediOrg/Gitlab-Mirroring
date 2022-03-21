<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%!
	public String func_uItem_Apply_ufSave_002(Statement argStmtExec, HashMap argHtMethod) throws Exception {

		String sql = "";
		String sql2 = "";
		String sql_disp = "";

		try {

			String IIP_APLY_DT = (String) argHtMethod.get("IIP_APLY_DT");
			String IIP_ITEM_CD = (String) argHtMethod.get("IIP_ITEM_CD");
			String USER = (String) argHtMethod.get("USER");

			//
			if(IIP_APLY_DT == null) { IIP_APLY_DT = ""; }
			if(IIP_ITEM_CD == null) { IIP_ITEM_CD = ""; }
			if(USER == null) { USER = ""; }

			//
			IIP_APLY_DT = CTr.Replace(IIP_APLY_DT, "'", "''");
			IIP_ITEM_CD = CTr.Replace(IIP_ITEM_CD, "'", "''");
			USER = CTr.Replace(USER, "'", "''");

			sql = "INSERT INTO IT_ITEM_PRICE (IIP_APLY_DT, IIP_ITEM_CD, IIP_USE_YN, IIP_INPT_ID, IIP_INPT_DTT) VALUES (";
			sql += "  '" + IIP_APLY_DT + "'";
			sql += ", '" + IIP_ITEM_CD + "'";
			sql += ", 'Y'";
			sql += ", '" + USER + "'";
			sql += ", SYSDATE";
			sql += ")";

			argStmtExec.executeUpdate(sql);

		} catch (Exception e) {

			throw new FuncException(e.toString(), sql);
		}

		return sql;
	}
%>
