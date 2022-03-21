<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%!
	public String func_uPack_Mark_btnUse_VwClick_001_TRAN001(Statement argStmtExec, HashMap argHtMethod) throws Exception {

		String sql = "";
		String sql2 = "";
		String sql_disp = "";

		try {

			String NUSE_ID = (String) argHtMethod.get("NUSE_ID");
			String MODI_ID = (String) argHtMethod.get("MODI_ID");
			String MARK_CD = (String) argHtMethod.get("MARK_CD");
			String MARK_SQ = (String) argHtMethod.get("MARK_SQ");

			//
			if(NUSE_ID == null) { NUSE_ID = ""; }
			if(MODI_ID == null) { MODI_ID = ""; }
			if(MARK_CD == null) { MARK_CD = ""; }
			if(MARK_SQ == null) { MARK_SQ = ""; }

			//
			NUSE_ID = CTr.Replace(NUSE_ID, "'", "''");
			MODI_ID = CTr.Replace(MODI_ID, "'", "''");
			MARK_CD = CTr.Replace(MARK_CD, "'", "''");
			MARK_SQ = CTr.Replace(MARK_SQ, "'", "''");

			sql = "UPDATE ET_PACK_MARK SET ";
			sql += "  EPM_USE_YN = 'N'";
			sql += ", EPM_NUSE_ID = '" + NUSE_ID + "'";
			sql += ", EPM_NUSE_DTT = SYSDATE";
			sql += ", EPM_MODI_ID = '" + MODI_ID + "'";
			sql += ", EPM_MODI_DTT = SYSDATE";
			sql += " WHERE EPM_MARK_KD = '1'";
			sql += " AND EPM_MARK_CD = '" + MARK_CD + "'";
			sql += " AND EPM_MARK_SQ = '" + MARK_SQ + "'";

			argStmtExec.executeUpdate(sql);

		} catch (Exception e) {

			throw new FuncException(e.toString(), sql);
		}

		return sql;
	}
%>
