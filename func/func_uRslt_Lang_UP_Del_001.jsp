<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%!
	public String func_uRslt_Lang_UP_Del_001(Statement argStmtExec, HashMap argHtMethod) throws Exception {

		String sql = "";
		String sql2 = "";
		String sql_disp = "";

		try {

			String SNO = (String) argHtMethod.get("SNO");

			//
			if(SNO == null) { SNO = ""; }

			//
			SNO = CTr.Replace(SNO, "'", "''");

			sql = "DELETE FROM CT_RSLT_LANG";
			sql += " WHERE CRL_SEQ = '" + SNO + "'";

			argStmtExec.executeUpdate(sql);

		} catch (Exception e) {

			throw new FuncException(e.toString(), sql);
		}

		return sql;
	}
%>
