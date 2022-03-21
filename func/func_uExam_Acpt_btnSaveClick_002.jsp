<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%!
	public String func_uExam_Acpt_btnSaveClick_002(Statement argStmtExec, HashMap argHtMethod) throws Exception {

		String sql = "";
		String sql2 = "";
		String sql_disp = "";

		try {

			String AGREE_CD = (String) argHtMethod.get("AGREE_CD");
			String SEND_CD = (String) argHtMethod.get("SEND_CD");
			String RSVN_NO = (String) argHtMethod.get("RSVN_NO");

			//
			if(AGREE_CD == null) { AGREE_CD = ""; }
			if(SEND_CD == null) { SEND_CD = ""; }
			if(RSVN_NO == null) { RSVN_NO = ""; }

			//
			AGREE_CD = CTr.Replace(AGREE_CD, "'", "''");
			SEND_CD = CTr.Replace(SEND_CD, "'", "''");
			RSVN_NO = CTr.Replace(RSVN_NO, "'", "''");

			sql = "UPDATE UB_RSVT SET ";
			sql += "  UB_AGREE_CD = '" + AGREE_CD + "'";
			sql += ", UB_SEND_CD = '" + SEND_CD + "'";
			sql += " WHERE UB_RSVN_NO = '" + RSVN_NO + "'";

			argStmtExec.executeUpdate(sql);

		} catch (Exception e) {

			throw new FuncException(e.toString(), sql);
		}

		return sql;
	}
%>
