<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%!
	public String func_EQuestionnaire_InsertToArumTotal_001(Statement argStmtExec, HashMap argHtMethod) throws Exception {

		String sql = "";
		String sql2 = "";
		String sql_disp = "";

		Connection connect = argStmtExec.getConnection();
		CallableStatement CallStmtExec = null;

		try {

			String SDATE = (String) argHtMethod.get("SDATE");
			String SEXNO = (String) argHtMethod.get("SEXNO");
			String SCTNO = (String) argHtMethod.get("SCTNO");
			String SPTNO = (String) argHtMethod.get("SPTNO");
			String SPTNM = (String) argHtMethod.get("SPTNM");
			String SAGE = (String) argHtMethod.get("SAGE");
			String SSEX = (String) argHtMethod.get("SSEX");
			String SFILENM = (String) argHtMethod.get("SFILENM");
			String SFORMNM = (String) argHtMethod.get("SFORMNM");
			String IMAGE_T = (String) argHtMethod.get("IMAGE");

			//
			if(SDATE == null) { SDATE = ""; }
			if(SEXNO == null) { SEXNO = ""; }
			if(SCTNO == null) { SCTNO = ""; }
			if(SPTNO == null) { SPTNO = ""; }
			if(SPTNM == null) { SPTNM = ""; }
			if(SAGE == null) { SAGE = ""; }
			if(SSEX == null) { SSEX = ""; }
			if(SFILENM == null) { SFILENM = ""; }
			if(SFORMNM == null) { SFORMNM = ""; }
			if(IMAGE_T == null) { IMAGE_T = ""; }

			//

			SDATE = CTr.Replace(SDATE, "'", "''");
			SEXNO = CTr.Replace(SEXNO, "'", "''");
			SCTNO = CTr.Replace(SCTNO, "'", "''");
			SPTNO = CTr.Replace(SPTNO, "'", "''");
			SPTNM = CTr.Replace(SPTNM, "'", "''");
			SAGE = CTr.Replace(SAGE, "'", "''");
			SSEX = CTr.Replace(SSEX, "'", "''");
			SFILENM = CTr.Replace(SFILENM, "'", "''");
			SFORMNM = CTr.Replace(SFORMNM, "'", "''");
			//IMAGE = CTr.Replace(IMAGE, "'", "''");

			sql = " Insert Into ARUM_TOTAL ";
			sql += " (REQUEST_DATE, SCANDATE, EXAM_NO, CUST_NO,  CHART_NO, ";
			sql += " EXAM_NAME,    AGE,      GENDER,  FILENAME, FORMNAME, IMAGE_DATA, LOGINID  ) ";
			sql += " Values( ";
			sql += " ?, ";
			sql += " ?, ";
			sql += " ?, ";
			sql += " ?, ";
			sql += " ?, ";
			sql += " ?, ";
			sql += " ?, ";
			sql += " ?, ";
			sql += " ?, ";
			sql += " ?, ";
			sql += " ?, ";
			sql += " 'WEQ') ";

			CallStmtExec = connect.prepareCall(sql);

			CallStmtExec.setString(1, SDATE);
			CallStmtExec.setString(2, SDATE);
			CallStmtExec.setString(3, SEXNO);
			CallStmtExec.setString(4, SCTNO);
			CallStmtExec.setString(5, SPTNO);
			CallStmtExec.setString(6, SPTNM);
			CallStmtExec.setString(7, SAGE);
			CallStmtExec.setString(8, SSEX);
			CallStmtExec.setString(9, SFILENM);
			CallStmtExec.setString(10, SFORMNM);
			CallStmtExec.setBytes(11, IMAGE_T.getBytes());

			CallStmtExec.executeUpdate();

		} catch (Exception e) {

			throw new FuncException(e.toString(), sql);
		}

		return sql;
	}
%>
