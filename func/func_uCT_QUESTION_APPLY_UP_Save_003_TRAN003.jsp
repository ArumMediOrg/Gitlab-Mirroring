<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%!
	public String func_uCT_QUESTION_APPLY_UP_Save_003_TRAN003(Statement argStmtExec, HashMap argHtMethod) throws Exception {

		String sql = "";
		String sql2 = "";
		String sql_disp = "";

		try {

			String EXEM_CD1 = (String) argHtMethod.get("EXEM_CD1");
			String QSKD_CD1 = (String) argHtMethod.get("QSKD_CD1");
			String QSTN_SQ1 = (String) argHtMethod.get("QSTN_SQ1");
			String MODI_ID = (String) argHtMethod.get("MODI_ID");
			String EXEM_CD2 = (String) argHtMethod.get("EXEM_CD2");
			String QSKD_CD2 = (String) argHtMethod.get("QSKD_CD2");
			String QSTN_SQ2 = (String) argHtMethod.get("QSTN_SQ2");

			//
			if(EXEM_CD1 == null) { EXEM_CD1 = ""; }
			if(QSKD_CD1 == null) { QSKD_CD1 = ""; }
			if(QSTN_SQ1 == null) { QSTN_SQ1 = ""; }
			if(MODI_ID == null) { MODI_ID = ""; }
			if(EXEM_CD2 == null) { EXEM_CD2 = ""; }
			if(QSKD_CD2 == null) { QSKD_CD2 = ""; }
			if(QSTN_SQ2 == null) { QSTN_SQ2 = ""; }

			//
			EXEM_CD1 = CTr.Replace(EXEM_CD1, "'", "''");
			QSKD_CD1 = CTr.Replace(QSKD_CD1, "'", "''");
			QSTN_SQ1 = CTr.Replace(QSTN_SQ1, "'", "''");
			MODI_ID = CTr.Replace(MODI_ID, "'", "''");
			EXEM_CD2 = CTr.Replace(EXEM_CD2, "'", "''");
			QSKD_CD2 = CTr.Replace(QSKD_CD2, "'", "''");
			QSTN_SQ2 = CTr.Replace(QSTN_SQ2, "'", "''");

			sql = "UPDATE CT_QUESTION SET ";
			sql += "  CQN_EXEM_CD = '" + EXEM_CD1 + "'";
			sql += ", CQN_QSKD_CD = '" + QSKD_CD1 + "'";
			sql += ", CQN_QSTN_SQ = '" + QSTN_SQ1 + "'";
			sql += ", CQN_MODI_ID = '" + MODI_ID + "'";
			sql += ", CQN_MODI_DTT = SYSDATE";
			sql += " WHERE CQN_EXEM_CD = '" + EXEM_CD2 + "'";
			sql += " AND CQN_QSKD_CD = '" + QSKD_CD2 + "'";
			sql += " AND CQN_QSTN_SQ = '" + QSTN_SQ2 + "'";

			argStmtExec.executeUpdate(sql);

		} catch (Exception e) {

			throw new FuncException(e.toString(), sql);
		}

		return sql;
	}
%>
