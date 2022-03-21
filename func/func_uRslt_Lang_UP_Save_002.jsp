<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%!
	public String func_uRslt_Lang_UP_Save_002(Statement argStmtExec, HashMap argHtMethod) throws Exception {

		String sql = "";
		String sql2 = "";
		String sql_disp = "";

		try {

			String SMODE = (String) argHtMethod.get("SMODE");
			String SNO = (String) argHtMethod.get("SNO");
			String KNME = (String) argHtMethod.get("KNME");
			String ENME = (String) argHtMethod.get("ENME");
			String CNME = (String) argHtMethod.get("CNME");
			String RNME = (String) argHtMethod.get("RNME");
			String JNME = (String) argHtMethod.get("JNME");
			String USER = (String) argHtMethod.get("USER");

			//
			if(SMODE == null) { SMODE = ""; }
			if(SNO == null) { SNO = ""; }
			if(KNME == null) { KNME = ""; }
			if(ENME == null) { ENME = ""; }
			if(CNME == null) { CNME = ""; }
			if(RNME == null) { RNME = ""; }
			if(JNME == null) { JNME = ""; }
			if(USER == null) { USER = ""; }

			//
			SMODE = CTr.Replace(SMODE, "'", "''");
			SNO = CTr.Replace(SNO, "'", "''");
			KNME = CTr.Replace(KNME, "'", "''");
			ENME = CTr.Replace(ENME, "'", "''");
			CNME = CTr.Replace(CNME, "'", "''");
			RNME = CTr.Replace(RNME, "'", "''");
			JNME = CTr.Replace(JNME, "'", "''");
			USER = CTr.Replace(USER, "'", "''");

			if(SMODE.equals("I")) {

				sql = "INSERT INTO CT_RSLT_LANG (CRL_SEQ, CRL_KNME, CRL_ENME, CRL_CNME, CRL_RNME, CRL_JNME, CRL_INPT_ID, CRL_INPT_DTT) VALUES (";
				sql += "  '" + SNO + "'";
				sql += ", '" + KNME + "'";
				sql += ", '" + ENME + "'";
				sql += ", '" + CNME + "'";
				sql += ", '" + RNME + "'";
				sql += ", '" + JNME + "'";
				sql += ", '" + USER + "'";
				sql += ", SYSDATE";
				sql += ")";

				argStmtExec.executeUpdate(sql);
			} else {
			
				sql = "UPDATE CT_RSLT_LANG SET ";
				sql += "  CRL_KNME = '" + KNME + "'";
				sql += ", CRL_ENME = '" + ENME + "'";
				sql += ", CRL_CNME = '" + CNME + "'";
				sql += ", CRL_RNME = '" + RNME + "'";
				sql += ", CRL_JNME = '" + JNME + "'";
				sql += ", CRL_MODI_ID = '" + USER + "'";
				sql += ", CRL_MODI_DTT = SYSDATE";
				sql += " WHERE CRL_SEQ = '" + SNO + "'";

				argStmtExec.executeUpdate(sql);
			}

		} catch (Exception e) {

			throw new FuncException(e.toString(), sql);
		}

		return sql;
	}
%>
