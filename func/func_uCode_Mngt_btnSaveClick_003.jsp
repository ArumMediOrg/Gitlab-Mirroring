<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%!
	public String func_uCode_Mngt_btnSaveClick_003(Statement argStmtExec, HashMap argHtMethod) throws Exception {

		String sql = "";
		String sql2 = "";
		String sql_disp = "";

		try {

			String STRLARGE = (String) argHtMethod.get("STRLARGE");
			String STRSMALL = (String) argHtMethod.get("STRSMALL");
			String EDCD_FULL_NM = (String) argHtMethod.get("EDCD_FULL_NM");
			String EDCD_SHRT_NM = (String) argHtMethod.get("EDCD_SHRT_NM");
			String EDCD_VALUE = (String) argHtMethod.get("EDCD_VALUE");
			String EDCD_REL = (String) argHtMethod.get("EDCD_REL");
			String EDCD_RMK = (String) argHtMethod.get("EDCD_RMK");
			String STRUSE = (String) argHtMethod.get("STRUSE");
			String GUSER1 = (String) argHtMethod.get("GUSER1");
			String GUSER2 = (String) argHtMethod.get("GUSER2");

			//
			if(STRLARGE == null) { STRLARGE = ""; }
			if(STRSMALL == null) { STRSMALL = ""; }
			if(EDCD_FULL_NM == null) { EDCD_FULL_NM = ""; }
			if(EDCD_SHRT_NM == null) { EDCD_SHRT_NM = ""; }
			if(EDCD_VALUE == null) { EDCD_VALUE = ""; }
			if(EDCD_REL == null) { EDCD_REL = ""; }
			if(EDCD_RMK == null) { EDCD_RMK = ""; }
			if(STRUSE == null) { STRUSE = ""; }
			if(GUSER1 == null) { GUSER1 = ""; }
			if(GUSER2 == null) { GUSER2 = ""; }

			//
			STRLARGE = CTr.Replace(STRLARGE, "'", "''");
			STRSMALL = CTr.Replace(STRSMALL, "'", "''");
			EDCD_FULL_NM = CTr.Replace(EDCD_FULL_NM, "'", "''");
			EDCD_SHRT_NM = CTr.Replace(EDCD_SHRT_NM, "'", "''");
			EDCD_VALUE = CTr.Replace(EDCD_VALUE, "'", "''");
			EDCD_REL = CTr.Replace(EDCD_REL, "'", "''");
			EDCD_RMK = CTr.Replace(EDCD_RMK, "'", "''");
			STRUSE = CTr.Replace(STRUSE, "'", "''");
			GUSER1 = CTr.Replace(GUSER1, "'", "''");
			GUSER2 = CTr.Replace(GUSER2, "'", "''");

			sql = "INSERT INTO CT_COMMON VALUES (";
			sql += "  '" + STRLARGE + "'";
			sql += ", '" + STRSMALL + "'";
			sql += ", '5'";
			sql += ", '" + EDCD_FULL_NM + "'";
			sql += ", '" + EDCD_SHRT_NM + "'";
			sql += ", '" + EDCD_VALUE + "'";
			sql += ", '" + EDCD_REL + "'";
			sql += ", '" + EDCD_RMK + "'";
			sql += ", '" + STRUSE + "'";
			sql += ", ''";
			sql += ", NULL";
			sql += ", '" + GUSER1 + "'";
			sql += ", SYSDATE";
			sql += ", '" + GUSER2 + "'";
			sql += ", SYSDATE";
			sql += ")";

			argStmtExec.executeUpdate(sql);

		} catch (Exception e) {

			throw new FuncException(e.toString(), sql);
		}

		return sql;
	}
%>
