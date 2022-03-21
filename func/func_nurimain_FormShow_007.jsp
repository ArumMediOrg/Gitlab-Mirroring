<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%!
	public String func_nurimain_FormShow_007(Statement argStmtExec, HashMap argHtMethod) throws Exception {

		String sql = "";
		String sql2 = "";
		String sql_disp = "";

		try {

			String SEND_TEL = (String) argHtMethod.get("SEND_TEL");

			//
			if(SEND_TEL == null) { SEND_TEL = ""; }

			//
			SEND_TEL = CTr.Replace(SEND_TEL, "'", "''");

			sql = "UPDATE CR_SMS_AUTO_SET SET ";
			sql += "  CSA_SEND_TEL = '" + SEND_TEL + "'";

			argStmtExec.executeUpdate(sql);

		} catch (Exception e) {

			throw new FuncException(e.toString(), sql);
		}

		return sql;
	}
%>
