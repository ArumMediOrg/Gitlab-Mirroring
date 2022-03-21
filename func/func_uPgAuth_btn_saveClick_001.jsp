<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%!
	public String func_uPgAuth_btn_saveClick_001(Statement argStmtExec, HashMap argHtMethod) throws Exception {

		String sql = "";
		String sql2 = "";
		String sql_disp = "";

		try {

			String IPPRGGA = (String) argHtMethod.get("IPPRGGA");
			String IPPRGGB = (String) argHtMethod.get("IPPRGGB");
			String IPPRGGC = (String) argHtMethod.get("IPPRGGC");
			String IPPRGGD = (String) argHtMethod.get("IPPRGGD");
			String IPPRGGE = (String) argHtMethod.get("IPPRGGE");
			String IPPRGGF = (String) argHtMethod.get("IPPRGGF");
			String IPPRGGG = (String) argHtMethod.get("IPPRGGG");
			String IPPRGGH = (String) argHtMethod.get("IPPRGGH");
			String IPPRGMID = (String) argHtMethod.get("IPPRGMID");

			//
			if(IPPRGGA == null) { IPPRGGA = ""; }
			if(IPPRGGB == null) { IPPRGGB = ""; }
			if(IPPRGGC == null) { IPPRGGC = ""; }
			if(IPPRGGD == null) { IPPRGGD = ""; }
			if(IPPRGGE == null) { IPPRGGE = ""; }
			if(IPPRGGF == null) { IPPRGGF = ""; }
			if(IPPRGGG == null) { IPPRGGG = ""; }
			if(IPPRGGH == null) { IPPRGGH = ""; }
			if(IPPRGMID == null) { IPPRGMID = ""; }

			//
			IPPRGGA = CTr.Replace(IPPRGGA, "'", "''");
			IPPRGGB = CTr.Replace(IPPRGGB, "'", "''");
			IPPRGGC = CTr.Replace(IPPRGGC, "'", "''");
			IPPRGGD = CTr.Replace(IPPRGGD, "'", "''");
			IPPRGGE = CTr.Replace(IPPRGGE, "'", "''");
			IPPRGGF = CTr.Replace(IPPRGGF, "'", "''");
			IPPRGGG = CTr.Replace(IPPRGGG, "'", "''");
			IPPRGGH = CTr.Replace(IPPRGGH, "'", "''");
			IPPRGMID = CTr.Replace(IPPRGMID, "'", "''");

			sql = "UPDATE IT_AUTH_PRGM SET ";
			sql += "  IAP_GRP1_KD = '" + IPPRGGA + "'";
			sql += ", IAP_GRP2_KD = '" + IPPRGGB + "'";
			sql += ", IAP_GRP3_KD = '" + IPPRGGC + "'";
			sql += ", IAP_GRP4_KD = '" + IPPRGGD + "'";
			sql += ", IAP_GRP5_KD = '" + IPPRGGE + "'";
			sql += ", IAP_GRP6_KD = '" + IPPRGGF + "'";
			sql += ", IAP_GRP7_KD = '" + IPPRGGG + "'";
			sql += ", IAP_GRP8_KD = '" + IPPRGGH + "'";
			sql += " WHERE IAP_PRGM_ID = '" + IPPRGMID + "'";

			argStmtExec.executeUpdate(sql);

		} catch (Exception e) {

			throw new FuncException(e.toString(), sql);
		}

		return sql;
	}
%>
