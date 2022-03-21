<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%!
	public String func_uItem_Call_ufSaveItem_Call_005(Statement argStmtExec, HashMap argHtMethod) throws Exception {

		String sql = "";
		String sql2 = "";
		String sql_disp = "";

		try {

			String SGUBUN = (String) argHtMethod.get("SGUBUN");
			String SFIELD = (String) argHtMethod.get("SFIELD");
			String SVAL = (String) argHtMethod.get("SVAL");
			String SLEN = (String) argHtMethod.get("SLEN");
			String MODI_ID = (String) argHtMethod.get("MODI_ID");
			String ITEM_CD = (String) argHtMethod.get("ITEM_CD");

			//
			if(SGUBUN == null) { SGUBUN = ""; }
			if(SFIELD == null) { SFIELD = ""; }
			if(SVAL == null) { SVAL = ""; }
			if(SLEN == null) { SLEN = ""; }
			if(MODI_ID == null) { MODI_ID = ""; }
			if(ITEM_CD == null) { ITEM_CD = ""; }

			//
			SGUBUN = CTr.Replace(SGUBUN, "'", "''");
			SFIELD = CTr.Replace(SFIELD, "'", "''");
			SVAL = CTr.Replace(SVAL, "'", "''");
			SLEN = CTr.Replace(SLEN, "'", "''");
			MODI_ID = CTr.Replace(MODI_ID, "'", "''");
			ITEM_CD = CTr.Replace(ITEM_CD, "'", "''");

			sql = "UPDATE IT_ITEM SET ";
			if(SGUBUN.equals("1")) {
				sql += SFIELD + " = '" + SVAL + "'";
			} else if(SGUBUN.equals("2")) {
				sql += SFIELD + " = '" + SVAL + "' || SUBSTR(" + SFIELD + ", 6, " + SLEN + ")";
			} else if(SGUBUN.equals("3")) {
				sql += SFIELD + " = SUBSTR(" + SFIELD + ", 1, 5) || '" + SVAL + "' || SUBSTR(" + SFIELD + ", 8, " + SLEN + ")";
			}

			sql += ", IIM_MODI_ID = '" + MODI_ID + "'";
			sql += ", IIM_MODI_DTT = SYSDATE";
			sql += "  WHERE IIM_ITEM_CD = '" + ITEM_CD + "'";

			argStmtExec.executeUpdate(sql);


		} catch (Exception e) {

			throw new FuncException(e.toString(), sql);
		}

		return sql;
	}
%>
