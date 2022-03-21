<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%!
	public String func_omr_updateomrbtn_003(Statement argStmtExec, HashMap argHtMethod) throws Exception {

		String sql = "";
		String sql2 = "";
		String sql_disp = "";

		try {

			String RESULT = (String) argHtMethod.get("RESULT");
			String BARCODE = (String) argHtMethod.get("BARCODE");
			String SCANDATE = (String) argHtMethod.get("SCANDATE");
			String FILENAME = (String) argHtMethod.get("FILENAME");

			//
			if(RESULT == null) { RESULT = ""; }
			if(BARCODE == null) { BARCODE = ""; }
			if(SCANDATE == null) { SCANDATE = ""; }
			if(FILENAME == null) { FILENAME = ""; }

			//
			RESULT = CTr.Replace(RESULT, "'", "''");
			BARCODE = CTr.Replace(BARCODE, "'", "''");
			SCANDATE = CTr.Replace(SCANDATE, "'", "''");
			FILENAME = CTr.Replace(FILENAME, "'", "''");

			sql = "UPDATE ARUM_TOTAL SET ";
			sql += "  OMRYN= 'Y'";
			sql += ", INDEXYN = 'N'";
			sql += ", VALUE1 = '" + RESULT + "'";
			sql += ", CHART_NO = '" + BARCODE + "'";
			sql += " WHERE SCANDATE= '" + SCANDATE + "'";
			sql += " AND FILENAME= '" + FILENAME + "'";

			argStmtExec.executeUpdate(sql);

		} catch (Exception e) {

			throw new FuncException(e.toString(), sql);
		}

		return sql;
	}
%>
