<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%!
	public String func_uHospital_Set_btn_save2Click_001(Statement argStmtExec, HashMap argHtMethod) throws Exception {

		String sql = "";
		String sql2 = "";
		String sql_disp = "";

		try {

			String PANVIEW = (String) argHtMethod.get("PANVIEW");
			String JILCD = (String) argHtMethod.get("JILCD");
			String JILVIEW = (String) argHtMethod.get("JILVIEW");
			String CODENM = (String) argHtMethod.get("CODENM");
			String PAN_CD = (String) argHtMethod.get("PAN_CD");
			String PAN_SQ = (String) argHtMethod.get("PAN_SQ");

			//
			if(PANVIEW == null) { PANVIEW = ""; }
			if(JILCD == null) { JILCD = ""; }
			if(JILVIEW == null) { JILVIEW = ""; }
			if(CODENM == null) { CODENM = ""; }
			if(PAN_CD == null) { PAN_CD = ""; }
			if(PAN_SQ == null) { PAN_SQ = ""; }

			//
			PANVIEW = CTr.Replace(PANVIEW, "'", "''");
			JILCD = CTr.Replace(JILCD, "'", "''");
			JILVIEW = CTr.Replace(JILVIEW, "'", "''");
			CODENM = CTr.Replace(CODENM, "'", "''");
			PAN_CD = CTr.Replace(PAN_CD, "'", "''");
			PAN_SQ = CTr.Replace(PAN_SQ, "'", "''");

			sql = "UPDATE CT_COMM_FIRVIEW SET ";
			sql += "  CCF_PANVIEW = '" + PANVIEW + "'";
			sql += ", CCF_JILCD = '" + JILCD + "'";
			sql += ", CCF_JILVIEW = '" + JILVIEW + "'";
			sql += " WHERE CCF_CODENM ='" + CODENM + "'";
			sql += " AND CCF_PAN_CD ='" + PAN_CD + "'";
			sql += " AND CCF_PAN_SQ ='" + PAN_SQ + "'";

			argStmtExec.executeUpdate(sql);

		} catch (Exception e) {

			throw new FuncException(e.toString(), sql);
		}

		return sql;
	}
%>
