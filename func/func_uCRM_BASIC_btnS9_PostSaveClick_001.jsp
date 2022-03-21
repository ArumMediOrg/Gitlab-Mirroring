<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%!
	public String func_uCRM_BASIC_btnS9_PostSaveClick_001(Statement argStmtExec, HashMap argHtMethod) throws Exception {

		String sql = "";
		String sql2 = "";
		String sql_disp = "";

		Connection connect = argStmtExec.getConnection();
		CallableStatement CallStmtExec = null;

		try {

			String EXAM_DT = (String) argHtMethod.get("EXAM_DT");
			String EXAM_SQ = (String) argHtMethod.get("EXAM_SQ");
			String RSVN_NO = (String) argHtMethod.get("RSVN_NO");
			String PREG_ID = (String) argHtMethod.get("PREG_ID");
			String PREG_DT = (String) argHtMethod.get("PREG_DT");
			String PSND_ID = (String) argHtMethod.get("PSND_ID");
			String PSND_DT = (String) argHtMethod.get("PSND_DT");
			String EMAIL_ID = (String) argHtMethod.get("EMAIL_ID");
			String EMAIL_DT = (String) argHtMethod.get("EMAIL_DT");
			String PCHK_ID = (String) argHtMethod.get("PCHK_ID");
			String PCHK_DT = (String) argHtMethod.get("PCHK_DT");
			String RMRK_TX = (String) argHtMethod.get("RMRK_TX");
			String POST_KD = (String) argHtMethod.get("POST_KD");
			String USER_ID = (String) argHtMethod.get("USER_ID");

			//
			if(EXAM_DT == null) { EXAM_DT = ""; }
			if(EXAM_SQ == null) { EXAM_SQ = ""; }
			if(RSVN_NO == null) { RSVN_NO = ""; }
			if(PREG_ID == null) { PREG_ID = ""; }
			if(PREG_DT == null) { PREG_DT = ""; }
			if(PSND_ID == null) { PSND_ID = ""; }
			if(PSND_DT == null) { PSND_DT = ""; }
			if(EMAIL_ID == null) { EMAIL_ID = ""; }
			if(EMAIL_DT == null) { EMAIL_DT = ""; }
			if(PCHK_ID == null) { PCHK_ID = ""; }
			if(PCHK_DT == null) { PCHK_DT = ""; }
			if(RMRK_TX == null) { RMRK_TX = ""; }
			if(POST_KD == null) { POST_KD = ""; }
			if(USER_ID == null) { USER_ID = ""; }

			//


			sql = " insert into CR_POST_MNG ";
			sql += " (  CPM_SEQ,     CPM_EXAM_DT, CPM_EXAM_SQ, CPM_RSVN_NO,  CPM_PREG_ID,  CPM_PREG_DT ";
			sql += " , CPM_PSND_ID, CPM_PSND_DT, CPM_EMAIL_ID, CPM_EMAIL_DT, CPM_PCHK_ID ";
			sql += " , CPM_PCHK_DT, CPM_RMRK_TX, CPM_POST_KD,  CPM_MODI_ID,  CPM_MODI_DTT   ) ";
			sql += " Values ";
			sql += " (  CR_POST_MNG_SEQ.NEXTVAL, ?, ?, ?,  ?,  ? ";
			sql += " , ?, ?, ?, ?, ? ";
			sql += " , ?, ?, ?,  ?,  sysdate   ) ";

			CallStmtExec = connect.prepareCall(sql);

			CallStmtExec.setString(1, EXAM_DT);
			CallStmtExec.setString(2, EXAM_SQ);
			CallStmtExec.setString(3, RSVN_NO);
			CallStmtExec.setString(4, PREG_ID);
			CallStmtExec.setString(5, PREG_DT);
			CallStmtExec.setString(6, PSND_ID);
			CallStmtExec.setString(7, PSND_DT);
			CallStmtExec.setString(8, EMAIL_ID);
			CallStmtExec.setString(9, EMAIL_DT);
			CallStmtExec.setString(10, PCHK_ID);
			CallStmtExec.setString(11, PCHK_DT);
			CallStmtExec.setString(12, RMRK_TX);
			CallStmtExec.setString(13, POST_KD);
			CallStmtExec.setString(14, USER_ID);


			CallStmtExec.executeUpdate();

		} catch (Exception e) {

			throw new FuncException(e.toString(), sql);
		}

		return sql;
	}
%>
