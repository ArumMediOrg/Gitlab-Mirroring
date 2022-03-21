<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%!
	public String func_EQuestionnaire_upSaveQuestionnaireLogData_001(Statement argStmtExec, HashMap argHtMethod) throws Exception {

		String sql = "";
		String sql2 = "";
		String sql_disp = "";

		Connection connect = argStmtExec.getConnection();
		CallableStatement CallStmtExec = null;

		try {

			String SHOSP = (String) argHtMethod.get("SHOSP");
			String SPLCE = (String) argHtMethod.get("SPLCE");
			String SPROC = (String) argHtMethod.get("SPROC");
			String SMOBL = (String) argHtMethod.get("SMOBL");
			String SRVNO = (String) argHtMethod.get("SRVNO");
			String SDATE = (String) argHtMethod.get("SDATE");
			String SEXNO = (String) argHtMethod.get("SEXNO");
			String SPSNM = (String) argHtMethod.get("SPSNM");
			String SURL = (String) argHtMethod.get("SURL");
			String SRESP = (String) argHtMethod.get("SRESP");
			String SUSER = (String) argHtMethod.get("SUSER");

			//

			if(SHOSP == null) { SHOSP = ""; }
			if(SPLCE == null) { SPLCE = ""; }
			if(SPROC == null) { SPROC = ""; }
			if(SMOBL == null) { SMOBL = ""; }
			if(SRVNO == null) { SRVNO = ""; }
			if(SDATE == null) { SDATE = ""; }
			if(SEXNO == null) { SEXNO = ""; }
			if(SPSNM == null) { SPSNM = ""; }
			if(SURL == null) { SURL = ""; }
			if(SRESP == null) { SRESP = ""; }
			if(SUSER == null) { SUSER = ""; }

			//

			sql += " Insert Into QT_QUESTIONAPI_LOG ";
			sql += " (QQL_HOSP_SQ,  QQL_PLCE_CD, QQL_PROC_KD, QQL_MOBL_NO, ";
			sql += " QQL_RSVN_NO,  QQL_EXAM_DT, QQL_EXAM_SQ, QQL_PSNL_NM, ";
			sql += " QQL_SEND_URL, QQL_RESP_TX, QQL_INPT_ID, QQL_INPT_DTT) ";
			sql += " Values ";
			sql += " (?, ";
			sql += "  ?, ";
			sql += "  ?, ";
			sql += "  ?, ";
			sql += "  ?, ";
			sql += "  ?, ";
			sql += "  ?, ";
			sql += "  ?, ";
			sql += "  ?, ";
			sql += "  ?, ";
			sql += "  ?, ";
			sql += "  sysdate) ";


			CallStmtExec = connect.prepareCall(sql);

			CallStmtExec.setString(1, SHOSP);
			CallStmtExec.setString(2, SPLCE);
			CallStmtExec.setString(3, SPROC);
			CallStmtExec.setString(4, SMOBL);
			CallStmtExec.setString(5, SRVNO);
			CallStmtExec.setString(6, SDATE);
			CallStmtExec.setString(7, SEXNO);
			CallStmtExec.setString(8, SPSNM);
			CallStmtExec.setString(9, SURL);
			CallStmtExec.setString(10, SRESP);
			CallStmtExec.setString(11, SUSER);

			CallStmtExec.executeUpdate();

		} catch (Exception e) {

			throw new FuncException(e.toString(), sql);
		}

		return sql;
	}
%>
