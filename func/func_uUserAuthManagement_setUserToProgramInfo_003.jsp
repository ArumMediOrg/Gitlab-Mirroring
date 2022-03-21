<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%!
	public String func_uUserAuthManagement_setUserToProgramInfo_003(Statement argStmtExec, HashMap argHtMethod) throws Exception {

		String sql = "";
		String sql2 = "";
		String sql_disp = "";

		try {

			String AGROUPKEY = (String) argHtMethod.get("AGROUPKEY");
			String AUSERKEY = (String) argHtMethod.get("AUSERKEY");

			//
			if(AGROUPKEY == null) { AGROUPKEY = ""; }
			if(AUSERKEY == null) { AUSERKEY = ""; }

			//
			AGROUPKEY = CTr.Replace(AGROUPKEY, "'", "''");
			AUSERKEY = CTr.Replace(AUSERKEY, "'", "''");

			sql = "UPDATE IT_AUTH_USER SET ";
			sql += "  IAU_AUTH_GP = '" + AGROUPKEY + "'";
			sql += " WHERE IAU_EMP_NO = '" + AUSERKEY + "'";

			argStmtExec.executeUpdate(sql);

		} catch (Exception e) {

			throw new FuncException(e.toString(), sql);
		}

		return sql;
	}
%>
