<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%!
	public String func_uMake_Excel_Apply_ufSave_002(Statement argStmtExec, HashMap argHtMethod) throws Exception {

		String sql = "";
		String sql2 = "";
		String sql_disp = "";

		try {

			String PACK_CD = (String) argHtMethod.get("PACK_CD");
			String INPT_ID = (String) argHtMethod.get("INPT_ID");

			//
			if(PACK_CD == null) { PACK_CD = ""; }
			if(INPT_ID == null) { INPT_ID = ""; }

			//
			PACK_CD = CTr.Replace(PACK_CD, "'", "''");
			INPT_ID = CTr.Replace(INPT_ID, "'", "''");

			sql = "INSERT INTO IT_EXCEL_PACK ( IEP_PACK_CD, IEP_INPT_ID, IEP_INPT_DTT ) ";
			sql += " VALUES (";
			sql += "  '" + PACK_CD + "'";
			sql += ", '" + INPT_ID + "'";
			sql += ", SYSDATE ";
			sql += ")";

			argStmtExec.executeUpdate(sql);

		} catch (Exception e) {

			throw new FuncException(e.toString(), sql);
		}

		return sql;
	}
%>
