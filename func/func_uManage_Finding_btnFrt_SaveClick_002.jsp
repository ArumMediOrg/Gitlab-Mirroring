<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%!
	public String func_uManage_Finding_btnFrt_SaveClick_002(Statement argStmtExec, HashMap argHtMethod) throws Exception {

		String sql = "";
		String sql2 = "";
		String sql_disp = "";

		try {

			String CODENM = (String) argHtMethod.get("CODENM");
			String PAN_CD = (String) argHtMethod.get("PAN_CD");
			String PAN_SQ = (String) argHtMethod.get("PAN_SQ");
			String PANVIEW = (String) argHtMethod.get("PANVIEW");
			String CODE = (String) argHtMethod.get("CODE");
			String LCODE = (String) argHtMethod.get("LCODE");
			String AUTO_YN = (String) argHtMethod.get("AUTO_YN");

			//
			if(CODENM == null) { CODENM = ""; }
			if(PAN_CD == null) { PAN_CD = ""; }
			if(PAN_SQ == null) { PAN_SQ = ""; }
			if(PANVIEW == null) { PANVIEW = ""; }
			if(CODE == null) { CODE = ""; }
			if(LCODE == null) { LCODE = ""; }
			if(AUTO_YN == null) { AUTO_YN = ""; }

			//
			CODENM = CTr.Replace(CODENM, "'", "''");
			PAN_CD = CTr.Replace(PAN_CD, "'", "''");
			PAN_SQ = CTr.Replace(PAN_SQ, "'", "''");
			PANVIEW = CTr.Replace(PANVIEW, "'", "''");
			CODE = CTr.Replace(CODE, "'", "''");
			LCODE = CTr.Replace(LCODE, "'", "''");
			AUTO_YN = CTr.Replace(AUTO_YN, "'", "''");

			sql = "INSERT INTO CT_COMM_FIRVIEW ( CCF_CODENM ,CCF_PAN_CD ,CCF_PAN_SQ ,CCF_PANVIEW ,CCF_CODE ,CCF_LCODE ,CCF_AUTO_YN ) VALUES (";
			sql += "  '" + CODENM + "'";
			sql += ", '" + PAN_CD + "'";
			sql += ", '" + PAN_SQ + "'";
			sql += ", '" + PANVIEW + "'";
			sql += ", '" + CODE + "'";
			sql += ", '" + LCODE + "'";
			sql += ", '" + AUTO_YN + "'";
			sql += ")";

			argStmtExec.executeUpdate(sql);

		} catch (Exception e) {

			throw new FuncException(e.toString(), sql);
		}

		return sql;
	}
%>
