<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%!
	public String func_uShare_Memo_miProcNoClick_001(Statement argStmtExec, HashMap argHtMethod) throws Exception {

		String sql = "";
		String sql2 = "";
		String sql_disp = "";

		try {

			String PROC_ID = (String) argHtMethod.get("PROC_ID");
			String PROC_DT = (String) argHtMethod.get("PROC_DT");
			String RGST_DT = (String) argHtMethod.get("RGST_DT");
			String RGST_SQ = (String) argHtMethod.get("RGST_SQ");

			//
			if(PROC_ID == null) { PROC_ID = ""; }
			if(PROC_DT == null) { PROC_DT = ""; }
			if(RGST_DT == null) { RGST_DT = ""; }
			if(RGST_SQ == null) { RGST_SQ = ""; }

			//
			PROC_ID = CTr.Replace(PROC_ID, "'", "''");
			PROC_DT = CTr.Replace(PROC_DT, "'", "''");
			RGST_DT = CTr.Replace(RGST_DT, "'", "''");
			RGST_SQ = CTr.Replace(RGST_SQ, "'", "''");

			sql = "UPDATE IT_SHARE_MEMO SET ";
			sql += "  ISM_PROC_ID = '" + PROC_ID + "'";
			sql += ", ISM_PROC_DT = '" + PROC_DT + "'";
			sql += " WHERE ISM_RGST_DT = '" + RGST_DT + "'";
			sql += " AND ISM_RGST_SQ = '" + RGST_SQ + "'";

			argStmtExec.executeUpdate(sql);

		} catch (Exception e) {

			throw new FuncException(e.toString(), sql);
		}

		return sql;
	}
%>
