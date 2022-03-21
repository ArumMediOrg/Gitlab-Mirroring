<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%!
	public String func_uRT_RSVT_EQUIP_LIMIT_ALL_APPLY_UP_Save_001(Statement argStmtExec, HashMap argHtMethod) throws Exception {

		String sql = "";
		String sql2 = "";
		String sql_disp = "";

		try {

			String ITEM_LT = (String) argHtMethod.get("ITEM_LT");
			String EQUI_CD = (String) argHtMethod.get("EQUI_CD");

			//
			if(ITEM_LT == null) { ITEM_LT = ""; }
			if(EQUI_CD == null) { EQUI_CD = ""; }

			//
			ITEM_LT = CTr.Replace(ITEM_LT, "'", "''");
			EQUI_CD = CTr.Replace(EQUI_CD, "'", "''");

			sql = "UPDATE RT_RSVT_EQUIP SET ";
			sql += "  RRE_ITEM_LT = '" + ITEM_LT + "'";
			sql += " WHERE RRE_EQUI_CD = '" + EQUI_CD + "'";

			argStmtExec.executeUpdate(sql);

		} catch (Exception e) {

			throw new FuncException(e.toString(), sql);
		}

		return sql;
	}
%>
