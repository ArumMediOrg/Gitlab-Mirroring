<%!
	public String uPack_Mark_btnSave_PtClick_004_TRAN003(Statement argStmtExec, HashMap argHtMethod) throws Exception {
	
		String sql;

		String MARK_CD = (String) argHtMethod.get("MARK_CD");
		String MARK_SQ = (String) argHtMethod.get("MARK_SQ");

		//
		if(MARK_CD == null) { MARK_CD = ""; }
		if(MARK_SQ == null) { MARK_SQ = ""; }

		sql = "DELETE ET_PACK_MARK_ITEM";
		sql += " WHERE EMI_MARK_KD = '2'";
		sql += " AND EMI_MARK_CD = '" + MARK_CD + "'";
		sql += " AND EMI_MARK_SQ = '" + MARK_SQ + "'";
		
		argStmtExec.executeUpdate(sql);

		return sql;
	}
%>