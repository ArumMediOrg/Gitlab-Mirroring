<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%!
	public String func_uPack_Each_btnUseClick_M1_002(Statement argStmtExec, HashMap argHtMethod) throws Exception {

		String sql = "";
		String sql2 = "";
		String sql_disp = "";

		try {

			String NUSE_ID = (String) argHtMethod.get("NUSE_ID");
			String MODI_ID = (String) argHtMethod.get("MODI_ID");
			String EXAM_CD = (String) argHtMethod.get("EXAM_CD");
			String PACK_SQ = (String) argHtMethod.get("PACK_SQ");

			//
			if(NUSE_ID == null) { NUSE_ID = ""; }
			if(MODI_ID == null) { MODI_ID = ""; }
			if(EXAM_CD == null) { EXAM_CD = ""; }
			if(PACK_SQ == null) { PACK_SQ = ""; }

			//
			NUSE_ID = CTr.Replace(NUSE_ID, "'", "''");
			MODI_ID = CTr.Replace(MODI_ID, "'", "''");
			EXAM_CD = CTr.Replace(EXAM_CD, "'", "''");
			PACK_SQ = CTr.Replace(PACK_SQ, "'", "''");

			sql = "UPDATE ET_PACK SET ";
			sql += "  EPK_USE_YN = 'N'";
			sql += ", EPK_NUSE_ID = '" + NUSE_ID + "'";
			sql += ", EPK_NUSE_DTT = SYSDATE";
			sql += ", EPK_TRNS_ID = ''";
			sql += ", EPK_MODI_ID = '" + MODI_ID + "'";
			sql += ", EPK_MODI_DTT = SYSDATE";
			sql += " WHERE EPK_EXAM_CD = '" + EXAM_CD + "'";
			sql += " AND EPK_PACK_SQ = '" + PACK_SQ + "'";

			argStmtExec.executeUpdate(sql);

		} catch (Exception e) {

			throw new FuncException(e.toString(), sql);
		}

		return sql;
	}
%>
