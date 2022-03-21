<%!
	public String uRslt_Seq_btnSaveClick_001_TRAN001(Statement argStmtExec, HashMap argHtMethod) throws Exception {
	
		String sql;

		String EXAM_KD = (String) argHtMethod.get("EXAM_KD");

		//
		if(EXAM_KD == null) { EXAM_KD = ""; }

		//
		sql = "DELETE FROM IT_HTSB_SEQ";
		sql += " WHERE IHS_EXAM_KD = '" + EXAM_KD + "'";

		argStmtExec.executeUpdate(sql);

		return sql;
	}
%>