<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%!
	public String func_uPack_Each_btnSaveClick_M9_013(Statement argStmtExec, HashMap argHtMethod) throws Exception {

		String sql = "";
		String sql2 = "";
		String sql_disp = "";

		try {

			String EXAM_CD = (String) argHtMethod.get("EXAM_CD");
			String PACK_SQ = (String) argHtMethod.get("PACK_SQ");

			//
			if(EXAM_CD == null) { EXAM_CD = ""; }
			if(PACK_SQ == null) { PACK_SQ = ""; }

			//
			EXAM_CD = CTr.Replace(EXAM_CD, "'", "''");
			PACK_SQ = CTr.Replace(PACK_SQ, "'", "''");

			sql = "DELETE ET_PACK_OPTN";
			sql += " WHERE EPO_EXAM_CD = '" + EXAM_CD + "'";
			sql += " AND EPO_PACK_SQ = '" + PACK_SQ + "'";

			argStmtExec.executeUpdate(sql);

		} catch (Exception e) {

			throw new FuncException(e.toString(), sql);
		}

		return sql;
	}
%>
