<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%!
	public String func_nurimain_FormShow_008(Statement argStmtExec, HashMap argHtMethod) throws Exception {

		String sql = "";
		String sql2 = "";
		String sql_disp = "";

		try {

			String SEND_TEL = (String) argHtMethod.get("SEND_TEL");

			//
			if(SEND_TEL == null) { SEND_TEL = ""; }

			//
			SEND_TEL = CTr.Replace(SEND_TEL, "'", "''");

			sql = "UPDATE IT_AUTH_PRGM SET ";
			sql += "  IAP_USE_YN = 'Y'";
			sql += " WHERE IAP_PRGM_ID = 'PGZ113'";
			sql += " AND IAP_USE_YN <> 'Y'";

			argStmtExec.executeUpdate(sql);

		} catch (Exception e) {

			throw new FuncException(e.toString(), sql);
		}

		return sql;
	}
%>
