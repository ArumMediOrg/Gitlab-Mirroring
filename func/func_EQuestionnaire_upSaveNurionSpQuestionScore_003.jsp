<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%!
	public String func_EQuestionnaire_upSaveNurionSpQuestionScore_003(Statement argStmtExec, HashMap argHtMethod) throws Exception {

		String sql = "";
		String sql2 = "";
		String sql_disp = "";

		Connection connect = argStmtExec.getConnection();
		CallableStatement CallStmtExec = null;

		try {

			String SDATE = (String) argHtMethod.get("SDATE");
			String SEXNO = (String) argHtMethod.get("SEXNO");
			String SCODE = (String) argHtMethod.get("SCODE");
			String SRE = (String) argHtMethod.get("SRE");
			String SCHAR = (String) argHtMethod.get("SCHAR");
			String SUSER = (String) argHtMethod.get("SUSER");

			//
			if(SDATE == null) { SDATE = ""; }
			if(SEXNO == null) { SEXNO = ""; }
			if(SCODE == null) { SCODE = ""; }
			if(SRE == null) { SRE = ""; }
			if(SCHAR == null) { SCHAR = ""; }
			if(SUSER == null) { SUSER = ""; }

			//
			sql = " UPDATE ET_RSLT_ITEM ";
			sql += " SET ERI_RSLT_VL = ? ";
			sql += " 	, ERI_CHAR_CD = ? ";
			sql += " 	, ERI_MODI_ID = ? ";
			sql += " 	, ERI_MODI_DTT = SYSDATE ";
			sql += " WHERE ERI_EXAM_DT = ? ";
			sql += " AND ERI_EXAM_SQ = ? ";
			sql += " AND ERI_ITEM_CD = ? ";

			CallStmtExec = connect.prepareCall(sql);

			CallStmtExec.setString(1, SRE);
			CallStmtExec.setString(2, SCHAR);
			CallStmtExec.setString(3, SUSER);
			CallStmtExec.setString(4, SDATE);
			CallStmtExec.setString(5, SEXNO);
			CallStmtExec.setString(6, SCODE);

			CallStmtExec.executeUpdate();

		} catch (Exception e) {

			throw new FuncException(e.toString(), sql);
		}

		return sql;
	}
%>
