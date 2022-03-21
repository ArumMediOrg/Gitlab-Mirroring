<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%!
	public String func_omr_updateobesity_001(Statement argStmtExec, HashMap argHtMethod) throws Exception {

		String sql = "";
		String sql2 = "";
		String sql_disp = "";

		try {

			String BIMAN = (String) argHtMethod.get("BIMAN");
			String EXAM_NO = (String) argHtMethod.get("EXAM_NO");
			String SDATE = (String) argHtMethod.get("SDATE");

			//
			if(BIMAN == null) { BIMAN = ""; }
			if(EXAM_NO == null) { EXAM_NO = ""; }
			if(SDATE == null) { SDATE = ""; }

			//
			BIMAN = CTr.Replace(BIMAN, "'", "''");
			EXAM_NO = CTr.Replace(EXAM_NO, "'", "''");
			SDATE = CTr.Replace(SDATE, "'", "''");

			sql = "UPDATE ET_RSLT_ITEM SET ";
			sql += "  ERI_RSLT_VL = '" + BIMAN + "'";
			sql += " WHERE ERI_EXAM_SQ = '" + EXAM_NO + "'";
			sql += " AND ERI_EXAM_DT = '" + SDATE + "'";
			sql += " AND ERI_ITEM_CD = 'A0007'";

			argStmtExec.executeUpdate(sql);

		} catch (Exception e) {

			throw new FuncException(e.toString(), sql);
		}

		return sql;
	}
%>
