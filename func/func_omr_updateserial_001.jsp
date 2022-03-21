<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%!
	public String func_omr_updateserial_001(Statement argStmtExec, HashMap argHtMethod) throws Exception {

		String sql = "";
		String sql2 = "";
		String sql_disp = "";

		try {

			String SERIAL = (String) argHtMethod.get("SERIAL");
			String SCANDATE = (String) argHtMethod.get("SCANDATE");

			//
			if(SERIAL == null) { SERIAL = ""; }
			if(SCANDATE == null) { SCANDATE = ""; }

			//
			SERIAL = CTr.Replace(SERIAL, "'", "''");
			SCANDATE = CTr.Replace(SCANDATE, "'", "''");

			sql = "UPDATE ARUM_SERIAL SET ";
			sql += "  SERIAL = '" + SERIAL + "'";
			sql += " WHERE SCANDATE = '" + SCANDATE + "'";

			argStmtExec.executeUpdate(sql);

		} catch (Exception e) {

			throw new FuncException(e.toString(), sql);
		}

		return sql;
	}
%>
