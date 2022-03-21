<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%!
	public String func_uHEALTH_TOTAL_SCREENING_SET_btnSave2Click_004(Statement argStmtExec, HashMap argHtMethod) throws Exception {

		String sql = "";
		String sql2 = "";
		String sql_disp = "";

		try {

			String PANJ_CD = (String) argHtMethod.get("PANJ_CD");
			String ITEM_CD = (String) argHtMethod.get("ITEM_CD");
			String MRSLT_LOW = (String) argHtMethod.get("MRSLT_LOW");
			String MRSLT_HIGH = (String) argHtMethod.get("MRSLT_HIGH");
			String WRSLT_LOW = (String) argHtMethod.get("WRSLT_LOW");
			String WRSLT_HIGH = (String) argHtMethod.get("WRSLT_HIGH");
			String CHAR_VAL = (String) argHtMethod.get("CHAR_VAL");

			//
			if(PANJ_CD == null) { PANJ_CD = ""; }
			if(ITEM_CD == null) { ITEM_CD = ""; }
			if(MRSLT_LOW == null) { MRSLT_LOW = ""; }
			if(MRSLT_HIGH == null) { MRSLT_HIGH = ""; }
			if(WRSLT_LOW == null) { WRSLT_LOW = ""; }
			if(WRSLT_HIGH == null) { WRSLT_HIGH = ""; }
			if(CHAR_VAL == null) { CHAR_VAL = ""; }

			//
			PANJ_CD = CTr.Replace(PANJ_CD, "'", "''");
			ITEM_CD = CTr.Replace(ITEM_CD, "'", "''");
			MRSLT_LOW = CTr.Replace(MRSLT_LOW, "'", "''");
			MRSLT_HIGH = CTr.Replace(MRSLT_HIGH, "'", "''");
			WRSLT_LOW = CTr.Replace(WRSLT_LOW, "'", "''");
			WRSLT_HIGH = CTr.Replace(WRSLT_HIGH, "'", "''");
			CHAR_VAL = CTr.Replace(CHAR_VAL, "'", "''");

			sql = "INSERT INTO HT_AUTO_PANITEM ( HAI_PANJ_CD, HAI_ITEM_CD, HAI_MRSLT_LOW, HAI_MRSLT_HIGH, HAI_WRSLT_LOW, HAI_WRSLT_HIGH, HAI_CHAR_VAL ) VALUES (";
			sql += "  '" + PANJ_CD + "'";
			sql += ", '" + ITEM_CD + "'";
			sql += ", '" + MRSLT_LOW + "'";
			sql += ", '" + MRSLT_HIGH + "'";
			sql += ", '" + WRSLT_LOW + "'";
			sql += ", '" + WRSLT_HIGH + "'";
			sql += ", '" + CHAR_VAL + "'";
			sql += ")";

			argStmtExec.executeUpdate(sql);

		} catch (Exception e) {

			throw new FuncException(e.toString(), sql);
		}

		return sql;
	}
%>
