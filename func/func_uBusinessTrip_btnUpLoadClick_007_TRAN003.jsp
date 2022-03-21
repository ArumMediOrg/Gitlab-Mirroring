<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%!
	public String func_uBusinessTrip_btnUpLoadClick_007_TRAN003(Statement argStmtExec, HashMap argHtMethod) throws Exception {

		String sql = "";
		String sql2 = "";
		String sql_disp = "";

		try {

			String EXAM_SQ = (String) argHtMethod.get("EXAM_SQ");
			String RSVN_NO = (String) argHtMethod.get("RSVN_NO");

			//
			if(EXAM_SQ == null) { EXAM_SQ = ""; }
			if(RSVN_NO == null) { RSVN_NO = ""; }

			//
			EXAM_SQ = CTr.Replace(EXAM_SQ, "'", "''");
			RSVN_NO = CTr.Replace(RSVN_NO, "'", "''");

			sql = "UPDATE RT_RSVT SET ";
			sql += "  RRT_EXAM_SQ = '" + EXAM_SQ + "'";
			sql += " WHERE RRT_RSVN_NO = '" + RSVN_NO + "'";

			argStmtExec.executeUpdate(sql);

		} catch (Exception e) {

			throw new FuncException(e.toString(), sql);
		}

		return sql;
	}
%>
