<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%!
	public String func_uPack_Mark_btnUse_MkClick_002_TRAN002(Statement argStmtExec, HashMap argHtMethod) throws Exception {

		String sql = "";
		String sql2 = "";
		String sql_disp = "";

		try {

			String MARK_CD = (String) argHtMethod.get("MARK_CD");
			String MARK_SQ = (String) argHtMethod.get("MARK_SQ");

			//
			if(MARK_CD == null) { MARK_CD = ""; }
			if(MARK_SQ == null) { MARK_SQ = ""; }

			//
			MARK_CD = CTr.Replace(MARK_CD, "'", "''");
			MARK_SQ = CTr.Replace(MARK_SQ, "'", "''");

			sql = "UPDATE ET_PACK_MARK_ITEM SET ";
			sql += "  EMI_USE_YN = 'N'";
			sql += " WHERE EMI_MARK_KD = '3'";
			sql += " AND EMI_MARK_CD = '" + MARK_CD + "'";
			sql += " AND EMI_MARK_SQ = '" + MARK_SQ + "'";

			argStmtExec.executeUpdate(sql);

		} catch (Exception e) {

			throw new FuncException(e.toString(), sql);
		}

		return sql;
	}
%>
