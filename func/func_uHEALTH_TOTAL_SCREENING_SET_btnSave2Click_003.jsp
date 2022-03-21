<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%!
	public String func_uHEALTH_TOTAL_SCREENING_SET_btnSave2Click_003(Statement argStmtExec, HashMap argHtMethod) throws Exception {

		String sql = "";
		String sql2 = "";
		String sql_disp = "";

		try {

			String PANJ_CD = (String) argHtMethod.get("PANJ_CD");

			//
			if(PANJ_CD == null) { PANJ_CD = ""; }

			//
			PANJ_CD = CTr.Replace(PANJ_CD, "'", "''");

			sql = "DELETE HT_AUTO_PANITEM";
			sql += " WHERE HAI_PANJ_CD = '" + PANJ_CD + "'";

			argStmtExec.executeUpdate(sql);

		} catch (Exception e) {

			throw new FuncException(e.toString(), sql);
		}

		return sql;
	}
%>
