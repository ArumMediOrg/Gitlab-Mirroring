<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%!
	public String func_Uspchungfile2020_UDP_INT_CHUNGPER_004(Statement argStmtExec, HashMap argHtMethod) throws Exception {

		String sql = "";
		String sql2 = "";
		String sql_disp = "";

		try {

			String SEND_NM = (String) argHtMethod.get("SEND_NM");
			String EXAM_DT = (String) argHtMethod.get("EXAM_DT");
			String EXAM_SQ = (String) argHtMethod.get("EXAM_SQ");

			//
			if(SEND_NM == null) { SEND_NM = ""; }
			if(EXAM_DT == null) { EXAM_DT = ""; }
			if(EXAM_SQ == null) { EXAM_SQ = ""; }

			//
			SEND_NM = CTr.Replace(SEND_NM, "'", "''");
			EXAM_DT = CTr.Replace(EXAM_DT, "'", "''");
			EXAM_SQ = CTr.Replace(EXAM_SQ, "'", "''");

			sql = "UPDATE ST_BASE SET ";
			sql += "  SBE_SEND_YN = 'Y'";
			sql += ", SBE_SEND_NM = '" + SEND_NM + "'";
			sql += " WHERE SBE_EXAM_DT = '" + EXAM_DT + "'";
			sql += " AND SBE_EXAM_SQ = '" + EXAM_SQ + "'";

			argStmtExec.executeUpdate(sql);

		} catch (Exception e) {

			throw new FuncException(e.toString(), sql);
		}

		return sql;
	}
%>
