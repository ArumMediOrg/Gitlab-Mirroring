<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%!
	public String func_EQuestionaire_SaveToNurionAddress_004(Statement argStmtExec, HashMap argHtMethod) throws Exception {

		String sql = "";
		String sql2 = "";
		String sql_disp = "";

		try {

			String SEMAI = (String) argHtMethod.get("SEMAI");
			String SDATE = (String) argHtMethod.get("SDATE");
			String SCTNO = (String) argHtMethod.get("SCTNO");

			//
			if(SEMAI == null) { SEMAI = ""; }
			if(SDATE == null) { SDATE = ""; }
			if(SCTNO == null) { SCTNO = ""; }

			//
			SEMAI = CTr.Replace(SEMAI, "'", "''");
			SDATE = CTr.Replace(SDATE, "'", "''");
			SCTNO = CTr.Replace(SCTNO, "'", "''");

			sql = "UPDATE ET_EXAM_ACPT SET ";
			sql += "  EEA_EMAIL_AR = '" + SEMAI + "'";
			sql += ", EEA_SEND_CD = '03'";
			sql += " WHERE EEA_EXAM_DT = '" + SDATE + "'";
			sql += " AND EEA_CUST_NO ='" + SCTNO + "'";

			argStmtExec.executeUpdate(sql);

		} catch (Exception e) {

			throw new FuncException(e.toString(), sql);
		}

		return sql;
	}
%>
