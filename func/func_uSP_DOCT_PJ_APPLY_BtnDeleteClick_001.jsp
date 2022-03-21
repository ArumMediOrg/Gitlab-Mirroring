<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%!
	public String func_uSP_DOCT_PJ_APPLY_BtnDeleteClick_001(Statement argStmtExec, HashMap argHtMethod) throws Exception {

		String sql = "";
		String sql2 = "";
		String sql_disp = "";

		try {

			String BKMK_CD = (String) argHtMethod.get("BKMK_CD");

			//
			if(BKMK_CD == null) { BKMK_CD = ""; }

			//
			BKMK_CD = CTr.Replace(BKMK_CD, "'", "''");

			sql = "DELETE FROM ST_BOOKMARK_PANJ";
			sql += " WHERE SBP_BKMK_CD = '" + BKMK_CD + "'";

			argStmtExec.executeUpdate(sql);

		} catch (Exception e) {

			throw new FuncException(e.toString(), sql);
		}

		return sql;
	}
%>
