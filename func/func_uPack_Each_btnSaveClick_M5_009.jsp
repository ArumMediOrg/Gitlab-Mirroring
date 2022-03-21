<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%!
	public String func_uPack_Each_btnSaveClick_M5_009(Statement argStmtExec, HashMap argHtMethod) throws Exception {

		String sql = "";
		String sql2 = "";
		String sql_disp = "";

		try {

			String GUSER = (String) argHtMethod.get("GUSER");
			String EXAM_CD = (String) argHtMethod.get("EXAM_CD");
			String PACK_SQ = (String) argHtMethod.get("PACK_SQ");
			String OPTN_SQ = (String) argHtMethod.get("OPTN_SQ");

			//
			if(GUSER == null) { GUSER = ""; }
			if(EXAM_CD == null) { EXAM_CD = ""; }
			if(PACK_SQ == null) { PACK_SQ = ""; }
			if(OPTN_SQ == null) { OPTN_SQ = ""; }

			//
			GUSER = CTr.Replace(GUSER, "'", "''");
			EXAM_CD = CTr.Replace(EXAM_CD, "'", "''");
			PACK_SQ = CTr.Replace(PACK_SQ, "'", "''");
			OPTN_SQ = CTr.Replace(OPTN_SQ, "'", "''");

			sql = "INSERT INTO ET_PACK_OPTN_LOG SELECT EPO_EXAM_CD, EPO_PACK_SQ, EPO_OPTN_SQ, EPO_OPTN_PR, EPO_OPTN_CNT, EPO_OPTN_LT, '" + GUSER + "', SYSDATE ";
			sql += " FROM ET_PACK_OPTN ";
			sql += " WHERE EPO_EXAM_CD = '" + EXAM_CD + "'";
			sql += " AND EPO_PACK_SQ = '" + PACK_SQ  + "'";
			sql += " AND EPO_OPTN_SQ = '" + OPTN_SQ + "'";

			argStmtExec.executeUpdate(sql);
		} catch (Exception e) {

			throw new FuncException(e.toString(), sql);
		}

		return sql;
	}
%>
