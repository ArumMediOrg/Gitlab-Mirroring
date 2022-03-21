<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%!
	public String func_uCode_Mngt_btnSaveClick_002(Statement argStmtExec, HashMap argHtMethod) throws Exception {

		String sql = "";
		String sql2 = "";
		String sql_disp = "";

		try {

			String FULL_NM = (String) argHtMethod.get("FULL_NM");
			String SHRT_NM = (String) argHtMethod.get("SHRT_NM");
			String VALUE = (String) argHtMethod.get("VALUE");
			String REL = (String) argHtMethod.get("REL");
			String RMK = (String) argHtMethod.get("RMK");
			String USE_YN = (String) argHtMethod.get("USE_YN");
			String MODI_ID = (String) argHtMethod.get("MODI_ID");
			String STRLARGE = (String) argHtMethod.get("STRLARGE");
			String STRSMALL = (String) argHtMethod.get("STRSMALL");

			//
			if(FULL_NM == null) { FULL_NM = ""; }
			if(SHRT_NM == null) { SHRT_NM = ""; }
			if(VALUE == null) { VALUE = ""; }
			if(REL == null) { REL = ""; }
			if(RMK == null) { RMK = ""; }
			if(USE_YN == null) { USE_YN = ""; }
			if(MODI_ID == null) { MODI_ID = ""; }
			if(STRLARGE == null) { STRLARGE = ""; }
			if(STRSMALL == null) { STRSMALL = ""; }

			//
			FULL_NM = CTr.Replace(FULL_NM, "'", "''");
			SHRT_NM = CTr.Replace(SHRT_NM, "'", "''");
			VALUE = CTr.Replace(VALUE, "'", "''");
			REL = CTr.Replace(REL, "'", "''");
			RMK = CTr.Replace(RMK, "'", "''");
			USE_YN = CTr.Replace(USE_YN, "'", "''");
			MODI_ID = CTr.Replace(MODI_ID, "'", "''");
			STRLARGE = CTr.Replace(STRLARGE, "'", "''");
			STRSMALL = CTr.Replace(STRSMALL, "'", "''");

			sql = "UPDATE CT_COMMON SET ";
			sql += "  CCN_FULL_NM = '" + FULL_NM + "'";
			sql += ", CCN_SHRT_NM = '" + SHRT_NM + "'";
			sql += ", CCN_VALUE = '" + VALUE + "'";
			sql += ", CCN_REL = '" + REL + "'";
			sql += ", CCN_RMK = '" + RMK + "'";
			sql += ", CCN_USE_YN = '" + USE_YN + "'";
			sql += ", CCN_MODI_ID = '" + MODI_ID + "'";
			sql += ", CCN_MODI_DTT = SYSDATE";
			sql += " WHERE CCN_LARGE = '" + STRLARGE + "'";
			sql += " AND CCN_SMALL = '" + STRSMALL + "'";

			argStmtExec.executeUpdate(sql);

		} catch (Exception e) {

			throw new FuncException(e.toString(), sql);
		}

		return sql;
	}
%>
