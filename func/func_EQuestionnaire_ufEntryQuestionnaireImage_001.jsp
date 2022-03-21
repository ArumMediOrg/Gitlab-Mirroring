<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%!
	public String func_EQuestionnaire_ufEntryQuestionnaireImage_001(Statement argStmtExec, HashMap argHtMethod) throws Exception {

		String sql = "";
		String sql2 = "";
		String sql_disp = "";

		try {

			String SDATE = (String) argHtMethod.get("SDATE");
			String SEXNO = (String) argHtMethod.get("SEXNO");

			//
			if(SDATE == null) { SDATE = ""; }
			if(SEXNO == null) { SEXNO = ""; }

			//
			SDATE = CTr.Replace(SDATE, "'", "''");
			SEXNO = CTr.Replace(SEXNO, "'", "''");

			sql = " Delete from ARUM_TOTAL ";
			sql += " Where REQUEST_DATE = '" + SDATE + "' ";
			sql += " And EXAM_NO      = '" + SEXNO + "' ";
			sql += " And LOGINID = 'WEQ' ";

			argStmtExec.executeUpdate(sql);

		} catch (Exception e) {

			throw new FuncException(e.toString(), sql);
		}

		return sql;
	}
%>
