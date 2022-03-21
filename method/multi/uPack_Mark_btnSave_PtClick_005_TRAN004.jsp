<%!
	public String uPack_Mark_btnSave_PtClick_005_TRAN004(Statement argStmtExec, HashMap argHtMethod) throws Exception {
	
		String sql;

		String SPRNT_CD = (String) argHtMethod.get("SPRNT_CD");
		String SMAX_SQ = (String) argHtMethod.get("SMAX_SQ");
		String SITEM_CD = (String) argHtMethod.get("SITEM_CD");
		String STRSEQ = (String) argHtMethod.get("STRSEQ");
		String SRSLT_UP = (String) argHtMethod.get("SRSLT_UP");
		String SRSLT_DN = (String) argHtMethod.get("SRSLT_DN");

		//
		if(SPRNT_CD == null) { SPRNT_CD = ""; }
		if(SMAX_SQ == null) { SMAX_SQ = ""; }
		if(SITEM_CD == null) { SITEM_CD = ""; }
		if(STRSEQ == null) { STRSEQ = ""; }
		if(SRSLT_UP == null) { SRSLT_UP = ""; }
		if(SRSLT_DN == null) { SRSLT_DN = ""; }

		sql = "INSERT INTO ET_PACK_MARK_ITEM VALUES (";
		sql += "  '2'";
		sql += ", '" + SPRNT_CD + "'";
		sql += ", '" + SMAX_SQ + "'";
		sql += ", '" + SITEM_CD + "'";
		sql += ", '" + STRSEQ + "'";
		sql += ", '" + SRSLT_UP + "'";
		sql += ", '" + SRSLT_DN + "'";
		sql += ", 'Y'";
		sql += ")";
		
		argStmtExec.executeUpdate(sql);

		return sql;
	}
%>