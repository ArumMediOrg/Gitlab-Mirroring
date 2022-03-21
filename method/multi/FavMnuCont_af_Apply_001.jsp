<%!
	public String FavMnuCont_af_Apply_001(Statement argStmtExec, HashMap argHtMethod) throws Exception {
	
		String sql;

		String EMP_NO = (String) argHtMethod.get("EMP_NO");

		//
		if(EMP_NO == null) { EMP_NO = ""; }

		//
		sql = "DELETE BT_BOOKMARK";
		sql += " WHERE BBK_EMP_NO = '" + EMP_NO + "'";

		argStmtExec.executeUpdate(sql);

		return sql;
	}
%>