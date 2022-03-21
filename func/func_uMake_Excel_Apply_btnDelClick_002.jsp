<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%!
	public String func_uMake_Excel_Apply_btnDelClick_002(Statement argStmtExec, HashMap argHtMethod) throws Exception {

		String sql = "";
		String sql2 = "";
		String sql_disp = "";

		try {

			String PACK_CD = (String) argHtMethod.get("PACK_CD");

			//
			if(PACK_CD == null) { PACK_CD = ""; }

			//
			PACK_CD = CTr.Replace(PACK_CD, "'", "''");

			sql = "DELETE FROM IT_EXCEL_ITEM";
			sql += " WHERE IEI_PACK_CD = '" + PACK_CD + "'";

			argStmtExec.executeUpdate(sql);

		} catch (Exception e) {

			throw new FuncException(e.toString(), sql);
		}

		return sql;
	}
%>
