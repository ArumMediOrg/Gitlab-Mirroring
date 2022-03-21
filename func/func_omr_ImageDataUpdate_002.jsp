<%!
	public String func_omr_ImageDataUpdate_002(Statement argStmtExec, HashMap argHtMethod) throws Exception {

		String sql = "";
		String sql2 = "";
		String sql_disp = "";

		PreparedStatement pstmt = null;

		try {

			String IMAGE_DATA = (String) argHtMethod.get("IMAGE_DATA");
			String FILENAME = (String) argHtMethod.get("FILENAME");
			String SCANDATE = (String) argHtMethod.get("SCANDATE");

			//
			if(IMAGE_DATA == null) { IMAGE_DATA = ""; }
			if(FILENAME == null) { FILENAME = ""; }
			if(SCANDATE == null) { SCANDATE = ""; }
			//
			//IMAGE_DATA = CTr.Replace(IMAGE_DATA, "'", "''");
			FILENAME = CTr.Replace(FILENAME, "'", "''");
			SCANDATE = CTr.Replace(SCANDATE, "'", "''");

			sql = " UPDATE ARUM_TOTAL ";
			sql += " SET IMAGE_DATA = ? ";
			sql += "   , OMRYN = 'Y' ";
			sql += "   , VALUYN = 'Y' ";
			sql += "   , SENDYN = 'Y' ";
			sql += "   , IndexYN = 'N' ";
			sql += " 	WHERE FILENAME = '" + FILENAME + "' ";
			sql += " 	AND SCANDATE = '" + SCANDATE + "' ";

			pstmt = connect.prepareStatement(sql);

			pstmt.setBytes(1, IMAGE_DATA.getBytes());

			//argStmtExec.executeUpdate(sql);
			pstmt.executeUpdate();

		} catch (Exception e) {

			throw new FuncException(e.toString(), sql);
		}

		return sql;
	}
%>
