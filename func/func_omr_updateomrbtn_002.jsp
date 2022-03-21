<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%!
	public String func_omr_updateomrbtn_002(Statement argStmtExec, HashMap argHtMethod) throws Exception {

		String sql = "";
		String sql2 = "";
		String sql_disp = "";

		try {

			String BARCODE = (String) argHtMethod.get("BARCODE");
			String SCANDATE = (String) argHtMethod.get("SCANDATE");
			String FILENAME = (String) argHtMethod.get("FILENAME");

			//
			if(BARCODE == null) { BARCODE = ""; }
			if(SCANDATE == null) { SCANDATE = ""; }
			if(FILENAME == null) { FILENAME = ""; }

			//
			BARCODE = CTr.Replace(BARCODE, "'", "''");
			SCANDATE = CTr.Replace(SCANDATE, "'", "''");
			FILENAME = CTr.Replace(FILENAME, "'", "''");

			sql = "UPDATE ARUM_TOTAL SET ";
			sql += "  OMRYN= 'Y'";
			sql += ", VALUYN ='Y'";
			sql += ", SENDYN = 'Y'";
			sql += ", INDEXYN = 'N'";
			sql += ", CHART_NO = '" + BARCODE + "'";
			sql += " WHERE SCANDATE = '" + SCANDATE + "'";
			sql += " AND FILENAME = '" + FILENAME + "'";

			argStmtExec.executeUpdate(sql);

		} catch (Exception e) {

			throw new FuncException(e.toString(), sql);
		}

		return sql;
	}
%>
