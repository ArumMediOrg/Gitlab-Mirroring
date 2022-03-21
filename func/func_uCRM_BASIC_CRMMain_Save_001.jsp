<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%!
	public String func_uCRM_BASIC_CRMMain_Save_001(Statement argStmtExec, HashMap argHtMethod) throws Exception {

		String sql = "";
		String sql2 = "";
		String sql_disp = "";

		try {
			String SSQL_ADD = (String) argHtMethod.get("SSQL_ADD");
			String SRSVN_NO = (String) argHtMethod.get("SRSVN_NO");

			//
			if(SSQL_ADD == null) { SSQL_ADD = ""; }
			if(SRSVN_NO == null) { SRSVN_NO = ""; }

			//
			SSQL_ADD = CTr.Replace(SSQL_ADD, "'", "''");
			SRSVN_NO = CTr.Replace(SRSVN_NO, "'", "''");

			sql += " Update RT_RSVT Set ";
			sql += SSQL_ADD;
			sql += " Where RRT_RSVN_NO = '" + SRSVN_NO + "' ";


			argStmtExec.executeUpdate(sql);

		} catch (Exception e) {

			throw new FuncException(e.toString(), sql);
		}

		return sql;
	}
%>
