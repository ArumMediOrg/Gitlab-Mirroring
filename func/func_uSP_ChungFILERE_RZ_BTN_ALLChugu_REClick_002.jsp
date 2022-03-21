<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%!
	public String func_uSP_ChungFILERE_RZ_BTN_ALLChugu_REClick_002(Statement argStmtExec, HashMap argHtMethod) throws Exception {

		String sql = "";
		String sql2 = "";
		String sql_disp = "";

		try {

			String SEND_NM = (String) argHtMethod.get("SEND_NM");

			//
			if(SEND_NM == null) { SEND_NM = ""; }

			//
			SEND_NM = CTr.Replace(SEND_NM, "'", "''");

			sql = "UPDATE ST_BASE SET ";
			sql += "  SBE_SEND_YN = 'N'";
			sql += ", SBE_SEND_NM = ''";
			sql += " WHERE SBE_SEND_NM = '" + SEND_NM + "'";

			argStmtExec.executeUpdate(sql);

		} catch (Exception e) {

			throw new FuncException(e.toString(), sql);
		}

		return sql;
	}
%>
