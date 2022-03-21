<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%!
	public String func_uPack_Mark_btnUse_PtClick_003_TRAN003(Statement argStmtExec, HashMap argHtMethod) throws Exception {

		String sql = "";
		String sql2 = "";
		String sql_disp = "";

		try {

			String MODI_ID = (String) argHtMethod.get("MODI_ID");
			String MARK_CD = (String) argHtMethod.get("MARK_CD");
			String MARK_SQ = (String) argHtMethod.get("MARK_SQ");

			//
			if(MODI_ID == null) { MODI_ID = ""; }
			if(MARK_CD == null) { MARK_CD = ""; }
			if(MARK_SQ == null) { MARK_SQ = ""; }

			//
			MODI_ID = CTr.Replace(MODI_ID, "'", "''");
			MARK_CD = CTr.Replace(MARK_CD, "'", "''");
			MARK_SQ = CTr.Replace(MARK_SQ, "'", "''");

			sql = "UPDATE ET_PACK_MARK SET ";
			sql += "  EPM_USE_YN = 'Y'";
			sql += ", EPM_NUSE_ID = ''";
			sql += ", EPM_NUSE_DTT = NULL";
			sql += ", EPM_MODI_ID = '" + MODI_ID + "'";
			sql += ", EPM_MODI_DTT = SYSDATE";
			sql += " WHERE EPM_MARK_KD = '2'";
			sql += " AND EPM_MARK_CD = '" + MARK_CD + "'";
			sql += " AND EPM_MARK_SQ = '" + MARK_SQ + "'";

			argStmtExec.executeUpdate(sql);

		} catch (Exception e) {

			throw new FuncException(e.toString(), sql);
		}

		return sql;
	}
%>
