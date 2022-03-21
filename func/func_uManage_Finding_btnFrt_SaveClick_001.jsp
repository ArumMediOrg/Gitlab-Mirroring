<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%!
	public String func_uManage_Finding_btnFrt_SaveClick_001(Statement argStmtExec, HashMap argHtMethod) throws Exception {

		String sql = "";
		String sql2 = "";
		String sql_disp = "";

		try {

			String PANVIEW = (String) argHtMethod.get("PANVIEW");
			String AUTO_YN = (String) argHtMethod.get("AUTO_YN");
			String LCODE = (String) argHtMethod.get("LCODE");
			String CODE = (String) argHtMethod.get("CODE");
			String PAN_CD = (String) argHtMethod.get("PAN_CD");
			String PAN_SQ = (String) argHtMethod.get("PAN_SQ");

			//
			if(PANVIEW == null) { PANVIEW = ""; }
			if(AUTO_YN == null) { AUTO_YN = ""; }
			if(LCODE == null) { LCODE = ""; }
			if(CODE == null) { CODE = ""; }
			if(PAN_CD == null) { PAN_CD = ""; }
			if(PAN_SQ == null) { PAN_SQ = ""; }

			//
			PANVIEW = CTr.Replace(PANVIEW, "'", "''");
			AUTO_YN = CTr.Replace(AUTO_YN, "'", "''");
			LCODE = CTr.Replace(LCODE, "'", "''");
			CODE = CTr.Replace(CODE, "'", "''");
			PAN_CD = CTr.Replace(PAN_CD, "'", "''");
			PAN_SQ = CTr.Replace(PAN_SQ, "'", "''");

			sql = "UPDATE CT_COMM_FIRVIEW SET ";
			sql += "  CCF_PANVIEW = '" + PANVIEW + "'";
			sql += ", CCF_AUTO_YN = '" + AUTO_YN + "'";
			sql += " WHERE CCF_LCODE = '" + LCODE + "'";
			sql += " AND CCF_CODE = '" + CODE + "'";
			sql += " AND CCF_PAN_CD = '" + PAN_CD + "'";
			sql += " AND CCF_PAN_SQ = '" + PAN_SQ + "'";

			argStmtExec.executeUpdate(sql);

		} catch (Exception e) {

			throw new FuncException(e.toString(), sql);
		}

		return sql;
	}
%>
