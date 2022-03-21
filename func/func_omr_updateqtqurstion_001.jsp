<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%!
	public String func_omr_updateqtqurstion_001(Statement argStmtExec, HashMap argHtMethod) throws Exception {

		String sql = "";
		String sql2 = "";
		String sql_disp = "";

		try {

			String SRESULT = (String) argHtMethod.get("SRESULT");
			String EXAM_NO = (String) argHtMethod.get("EXAM_NO");
			String SDATE = (String) argHtMethod.get("SDATE");
			String SCOLUMN = (String) argHtMethod.get("SCOLUMN");

			//
			if(SRESULT == null) { SRESULT = ""; }
			if(EXAM_NO == null) { EXAM_NO = ""; }
			if(SDATE == null) { SDATE = ""; }
			if(SCOLUMN == null) { SCOLUMN = ""; }

			//
			SRESULT = CTr.Replace(SRESULT, "'", "''");
			EXAM_NO = CTr.Replace(EXAM_NO, "'", "''");
			SDATE = CTr.Replace(SDATE, "'", "''");
			SCOLUMN = CTr.Replace(SCOLUMN, "'", "''");

			sql = "UPDATE QT_QUESTION SET ";
			sql += "  QQN_RESULT = '" + SRESULT + "'";
			sql += ", QQN_MODI_ID = 'OMR'";
			sql += ", QQN_MODI_DTT = SYSDATE";
			sql += " WHERE QQN_EXAM_SQ = '" + EXAM_NO + "'";
			sql += " AND QQN_EXAM_DT = '" + SDATE + "'";
			sql += " AND QQN_QSTN_CD = '" + SCOLUMN + "'";

			argStmtExec.executeUpdate(sql);

		} catch (Exception e) {

			throw new FuncException(e.toString(), sql);
		}

		return sql;
	}
%>
