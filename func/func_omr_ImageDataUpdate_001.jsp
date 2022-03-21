<%!
	public String func_omr_ImageDataUpdate_001(Statement argStmtExec, HashMap argHtMethod) throws Exception {

		String sql = "";
		String sql2 = "";
		String sql_disp = "";

		PreparedStatement pstmt = null;

		try {

			String IMAGE_DATA = (String) argHtMethod.get("IMAGE_DATA");
			String FILENAME = (String) argHtMethod.get("FILENAME");
			String REQUEST_DATE = (String) argHtMethod.get("REQUEST_DATE");
			String EXAM_NO = (String) argHtMethod.get("EXAM_NO");

			//
			if(IMAGE_DATA == null) { IMAGE_DATA = ""; }
			if(FILENAME == null) { FILENAME = ""; }
			if(REQUEST_DATE == null) { REQUEST_DATE = ""; }
			if(EXAM_NO == null) { EXAM_NO = ""; }
			//
			//IMAGE_DATA = CTr.Replace(IMAGE_DATA, "'", "''");
			FILENAME = CTr.Replace(FILENAME, "'", "''");
			REQUEST_DATE = CTr.Replace(REQUEST_DATE, "'", "''");
			EXAM_NO = CTr.Replace(EXAM_NO, "'", "''");

			sql = " UPDATE ARUM_TOTAL ";
			//sql += "	SET IMAGE_DATA = " + IMAGE_DATA + " ";
			sql += " SET IMAGE_DATA = ? ";
			sql += "		WHERE FILENAME = '" + FILENAME + "' ";
			sql += "		AND REQUEST_DATE = '" + REQUEST_DATE + "' ";
			sql += "		AND EXAM_NO = '" + EXAM_NO + "' ";

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
