<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%!
	public String func_EQuestionaire_SaveToNurion_004(Statement argStmtExec, HashMap argHtMethod) throws Exception {

		String sql = "";
		String sql2 = "";
		String sql_disp = "";

		try {

			String SDATE = (String) argHtMethod.get("SDATE");
			String SEXNO = (String) argHtMethod.get("SEXNO");
			String SCTNO = (String) argHtMethod.get("SCTNO");
			String SQTCD = (String) argHtMethod.get("SQTCD");
			String SASCD = (String) argHtMethod.get("SASCD");
			String SQTCP = (String) argHtMethod.get("SQTCP");
			String SRSLT = (String) argHtMethod.get("SRSLT");
			String SSCOR = (String) argHtMethod.get("SSCOR");
			String SSCYN = (String) argHtMethod.get("SSCYN");
			String ICNT = (String) argHtMethod.get("ICNT");

			//
			if(SDATE == null) { SDATE = ""; }
			if(SEXNO == null) { SEXNO = ""; }
			if(SCTNO == null) { SCTNO = ""; }
			if(SQTCD == null) { SQTCD = ""; }
			if(SASCD == null) { SASCD = ""; }
			if(SQTCP == null) { SQTCP = ""; }
			if(SRSLT == null) { SRSLT = ""; }
			if(SSCOR == null) { SSCOR = ""; }
			if(SSCYN == null) { SSCYN = ""; }
			if(ICNT == null) { ICNT = ""; }

			//
			SDATE = CTr.Replace(SDATE, "'", "''");
			SEXNO = CTr.Replace(SEXNO, "'", "''");
			SCTNO = CTr.Replace(SCTNO, "'", "''");
			SQTCD = CTr.Replace(SQTCD, "'", "''");
			SASCD = CTr.Replace(SASCD, "'", "''");
			SQTCP = CTr.Replace(SQTCP, "'", "''");
			SRSLT = CTr.Replace(SRSLT, "'", "''");
			SSCOR = CTr.Replace(SSCOR, "'", "''");
			SSCYN = CTr.Replace(SSCYN, "'", "''");
			ICNT = CTr.Replace(ICNT, "'", "''");

			if (ICNT.equals("0")) {
				sql = "INSERT INTO QT_QUESTION (QQN_EXAM_DT ,QQN_EXAM_SQ ,QQN_CUST_NO, QQN_QSTN_CD, QQN_ANSR_CD, QQN_QSTN_CP ,QQN_RESULT, QQN_SCORE, QQN_SCORE_YN, QQN_USE_YN, QQN_INPT_ID, QQN_INPT_DTT) VALUES (";
				sql += "  '" + SDATE + "'";
				sql += ", '" + SEXNO + "'";
				sql += ", '" + SCTNO + "'";
				sql += ", '" + SQTCD + "'";
				sql += ", '" + SASCD + "'";
				sql += ", '" + SQTCP + "'";
				sql += ", '" + SRSLT + "'";
				sql += ", '" + SSCOR + "'";
				sql += ", '" + SSCYN + "'";
				sql += ", 'Y'";
				sql += ", 'WEQ'";
				sql += ", SYSDATE";
				sql += ")";
			} else if (ICNT.equals("1")) {
				sql = " UPDATE QT_QUESTION SET             ";
				sql += " QQN_ANSR_CD = '" + SASCD + "' , ";
				sql += " QQN_QSTN_CP = '" + SQTCP + "' , ";
				sql += " QQN_RESULT  = '" + SRSLT + "' ,   ";
				sql += " QQN_SCORE   = '" + SSCOR + "' ,    ";
				sql += " QQN_SCORE_YN = '" + SSCYN + "' ,";
				sql += " QQN_MODI_ID  = 'WEQ',           ";
				sql += " QQN_MODI_DTT = sysdate          ";
				sql += " WHERE QQN_EXAM_DT = '" + SDATE + "' ";
				sql += " AND   QQN_EXAM_SQ = '" + SEXNO + "'  ";
				sql += " AND   QQN_CUST_NO = '" + SCTNO + "' ";
				sql += " AND   QQN_QSTN_CD = '" + SQTCD + "' ";
				sql += " AND   QQN_INPT_ID <> 'OMR'       ";
				sql += " AND   QQN_INPT_ID <> 'lctech'";
			}
			

			argStmtExec.executeUpdate(sql);

		} catch (Exception e) {

			throw new FuncException(e.toString(), sql);
		}

		return sql;
	}
%>
