<%!
	public String uIT_ITEM_QUESTION_APPLY_UP_Save_003(Statement argStmtExec, HashMap argHtMethod) throws Exception {
	
		String sql;

		String CHKBOXIIQ_USE_YN = (String) argHtMethod.get("CHKBOXIIQ_USE_YN");
		String APLY_DT = (String) argHtMethod.get("APLY_DT");
		String ITEM_CD = (String) argHtMethod.get("ITEM_CD");
		String SORT_NO = (String) argHtMethod.get("SORT_NO");
		String QGTN_CD = (String) argHtMethod.get("QGTN_CD");
		String ITQU_LV1 = (String) argHtMethod.get("ITQU_LV1");
		String ITQU_LV2 = (String) argHtMethod.get("ITQU_LV2");
		String ITQU_SQ = (String) argHtMethod.get("ITQU_SQ");
		String ITQU_TX = (String) argHtMethod.get("ITQU_TX");
		String INPT_ID = (String) argHtMethod.get("INPT_ID");
		String ITQU_MC = (String) argHtMethod.get("ITQU_MC");

		//
		if(CHKBOXIIQ_USE_YN == null) { CHKBOXIIQ_USE_YN = ""; }
		if(APLY_DT == null) { APLY_DT = ""; }
		if(ITEM_CD == null) { ITEM_CD = ""; }
		if(SORT_NO == null) { SORT_NO = ""; }
		if(QGTN_CD == null) { QGTN_CD = ""; }
		if(ITQU_LV1 == null) { ITQU_LV1 = ""; }
		if(ITQU_LV2 == null) { ITQU_LV2 = ""; }
		if(ITQU_SQ == null) { ITQU_SQ = ""; }
		if(ITQU_TX == null) { ITQU_TX = ""; }
		if(INPT_ID == null) { INPT_ID = ""; }
		if(ITQU_MC == null) { ITQU_MC = ""; }

		//
		if(CHKBOXIIQ_USE_YN.equals("Y")) {

			sql = "INSERT INTO IT_ITEM_QUESTION (IIQ_APLY_DT, IIQ_ITEM_CD, IIQ_SORT_NO, IIQ_QGTN_CD, IIQ_ITQU_LV1,IIQ_ITQU_LV2,IIQ_ITQU_SQ,IIQ_ITQU_TX, IIQ_USE_YN,IIQ_INPT_ID,IIQ_INPT_DTT, IIQ_ITQU_MC) VALUES (";
			sql += "  '" + APLY_DT + "'";
			sql += ", '" + ITEM_CD + "'";
			sql += ", '" + SORT_NO + "'";
			sql += ", '" + QGTN_CD + "'";
			sql += ", '" + ITQU_LV1 + "'";
			sql += ", '" + ITQU_LV2 + "'";
			sql += ", '" + ITQU_SQ + "'";
			sql += ", '" + ITQU_TX + "'";
			sql += ", 'Y'";
			sql += ", '" + INPT_ID + "'";
			sql += ", SYSDATE";
			sql += ", '" + ITQU_MC + "'";
			sql += ")";

			argStmtExec.executeUpdate(sql);
		} else {
		
			sql = "INSERT INTO IT_ITEM_QUESTION (IIQ_APLY_DT, IIQ_ITEM_CD, IIQ_SORT_NO, IIQ_QGTN_CD, IIQ_ITQU_LV1,IIQ_ITQU_LV2,IIQ_ITQU_SQ,IIQ_ITQU_TX, IIQ_USE_YN,IIQ_NUSE_ID,IIQ_NUSE_DTT,IIQ_INPT_ID,IIQ_INPT_DTT, IIQ_ITQU_MC) VALUES (";
			sql += "  '" + APLY_DT + "'";
			sql += ", '" + ITEM_CD + "'";
			sql += ", '" + SORT_NO + "'";
			sql += ", '" + QGTN_CD + "'";
			sql += ", '" + ITQU_LV1 + "'";
			sql += ", '" + ITQU_LV2 + "'";
			sql += ", '" + ITQU_SQ + "'";
			sql += ", '" + ITQU_TX + "'";
			sql += ", 'N'";
			sql += ", '" + INPT_ID + "'";
			sql += ", SYSDATE";
			sql += ", '" + INPT_ID + "'";
			sql += ", SYSDATE";
			sql += ", '" + ITQU_MC + "'";
			sql += ")";

			argStmtExec.executeUpdate(sql);
		}

		return sql;
	}
%>