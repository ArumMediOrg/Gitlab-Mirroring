<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%!
	public String func_uPack_Each_btnUseClick_M4_005(Statement argStmtExec, HashMap argHtMethod) throws Exception {

		String sql = "";
		String sql2 = "";
		String sql_disp = "";

		try {

			String MODI_ID = (String) argHtMethod.get("MODI_ID");
			String EXAM_CD = (String) argHtMethod.get("EXAM_CD");
			String PACK_SQ = (String) argHtMethod.get("PACK_SQ");

			//
			if(MODI_ID == null) { MODI_ID = ""; }
			if(EXAM_CD == null) { EXAM_CD = ""; }
			if(PACK_SQ == null) { PACK_SQ = ""; }

			//
			MODI_ID = CTr.Replace(MODI_ID, "'", "''");
			EXAM_CD = CTr.Replace(EXAM_CD, "'", "''");
			PACK_SQ = CTr.Replace(PACK_SQ, "'", "''");

			sql = "UPDATE ET_PACK_OPTN SET ";
			sql += "  EPO_USE_YN = 'Y'";
			sql += ", EPO_NUSE_ID = ''";
			sql += ", EPO_NUSE_DTT = NULL";
			sql += ", EPO_MODI_ID = '" + MODI_ID + "'";
			sql += ", EPO_MODI_DTT = SYSDATE";
			sql += " WHERE EPO_EXAM_CD = '" + EXAM_CD + "'";
			sql += " AND EPO_PACK_SQ = '" + PACK_SQ + "'";

			argStmtExec.executeUpdate(sql);

		} catch (Exception e) {

			throw new FuncException(e.toString(), sql);
		}

		return sql;
	}
%>
