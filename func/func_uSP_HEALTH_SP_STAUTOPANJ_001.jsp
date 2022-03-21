<%!
	public String func_uSP_HEALTH_SP_STAUTOPANJ_001(Statement argStmtExec, HashMap argHtMethod) throws Exception {

		String sql = "";
		String sql2 = "";
		String sql_disp = "";

		try {

			String EXAM_DT = (String) argHtMethod.get("EXAM_DT");
			String EXAM_SQ = (String) argHtMethod.get("EXAM_SQ");
			String HOST_NO = (String) argHtMethod.get("HOST_NO");
			String ILLNESS_TX = (String) argHtMethod.get("ILLNESS_TX");
			String PANJ_DT = (String) argHtMethod.get("PANJ_DT");
			String DOCT_CD = (String) argHtMethod.get("DOCT_CD");
			String USER_ID = (String) argHtMethod.get("USER_ID");
			String RSV_STR1 = (String) argHtMethod.get("RSV_STR1");
			String RSV_STR2 = (String) argHtMethod.get("RSV_STR2");
			String RSV_STR3 = (String) argHtMethod.get("RSV_STR3");

			//
			if(EXAM_DT == null) { EXAM_DT = ""; }
			if(EXAM_SQ == null) { EXAM_SQ = ""; }
			if(HOST_NO == null) { HOST_NO = ""; }
			if(ILLNESS_TX == null) { ILLNESS_TX = ""; }
			if(PANJ_DT == null) { PANJ_DT = ""; }
			if(DOCT_CD == null) { DOCT_CD = ""; }
			if(USER_ID == null) { USER_ID = ""; }
			if(RSV_STR1 == null) { RSV_STR1 = ""; }
			if(RSV_STR2 == null) { RSV_STR2 = ""; }
			if(RSV_STR3 == null) { RSV_STR3 = ""; }

			CallStmtExec.setString(1,  EXAM_DT);
			CallStmtExec.setString(2,  EXAM_SQ);
			CallStmtExec.setString(3,  HOST_NO);
			CallStmtExec.setString(4,  ILLNESS_TX);
			CallStmtExec.setString(5,  PANJ_DT);
			CallStmtExec.setString(6,  DOCT_CD);
			CallStmtExec.setString(7,  USER_ID);
			CallStmtExec.setString(8,  RSV_STR1);
			CallStmtExec.setString(9,  RSV_STR2);
			CallStmtExec.setString(10, RSV_STR3);

			CallStmtExec.executeUpdate();

		} catch (Exception e) {

			throw new FuncException(e.toString(), sql);
		}

		return sql;
	}
%>
