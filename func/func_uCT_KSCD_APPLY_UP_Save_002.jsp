<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%!
	public String func_uCT_KSCD_APPLY_UP_Save_002(Statement argStmtExec, HashMap argHtMethod) throws Exception {

		String sql = "";
		String sql2 = "";
		String sql_disp = "";

		try {

			String CHKBOXCCP_USE_YN = (String) argHtMethod.get("CHKBOXCCP_USE_YN");
			String KNME_NM = (String) argHtMethod.get("KNME_NM");
			String ENME_NM = (String) argHtMethod.get("ENME_NM");
			String SNME_NM = (String) argHtMethod.get("SNME_NM");
			String KCD_CD = (String) argHtMethod.get("KCD_CD");
			String SUKN_CD = (String) argHtMethod.get("SUKN_CD");
			String LEVL_KD = (String) argHtMethod.get("LEVL_KD");
			String MODI_ID = (String) argHtMethod.get("MODI_ID");
			String KSCD_CD = (String) argHtMethod.get("KSCD_CD");
			String NUSE_ID = (String) argHtMethod.get("NUSE_ID");

			//
			if(CHKBOXCCP_USE_YN == null) { CHKBOXCCP_USE_YN = ""; }
			if(KNME_NM == null) { KNME_NM = ""; }
			if(ENME_NM == null) { ENME_NM = ""; }
			if(SNME_NM == null) { SNME_NM = ""; }
			if(KCD_CD == null) { KCD_CD = ""; }
			if(SUKN_CD == null) { SUKN_CD = ""; }
			if(LEVL_KD == null) { LEVL_KD = ""; }
			if(MODI_ID == null) { MODI_ID = ""; }
			if(KSCD_CD == null) { KSCD_CD = ""; }
			if(NUSE_ID == null) { NUSE_ID = ""; }

			//
			CHKBOXCCP_USE_YN = CTr.Replace(CHKBOXCCP_USE_YN, "'", "''");
			KNME_NM = CTr.Replace(KNME_NM, "'", "''");
			ENME_NM = CTr.Replace(ENME_NM, "'", "''");
			SNME_NM = CTr.Replace(SNME_NM, "'", "''");
			KCD_CD = CTr.Replace(KCD_CD, "'", "''");
			SUKN_CD = CTr.Replace(SUKN_CD, "'", "''");
			LEVL_KD = CTr.Replace(LEVL_KD, "'", "''");
			MODI_ID = CTr.Replace(MODI_ID, "'", "''");
			KSCD_CD = CTr.Replace(KSCD_CD, "'", "''");
			NUSE_ID = CTr.Replace(NUSE_ID, "'", "''");

			if(CHKBOXCCP_USE_YN.equals("1")) {
				sql = "UPDATE CT_KSCD SET ";
				sql += "  CKD_KNME_NM = '" + KNME_NM + "'";
				sql += ", CKD_ENME_NM = '" + ENME_NM + "'";
				sql += ", CKD_SNME_NM = '" + SNME_NM + "'";
				sql += ", CKD_KCD_CD = '" + KCD_CD + "'";
				sql += ", CKD_SUKN_CD = '" + SUKN_CD + "'";
				sql += ", CKD_LEVL_KD = '" + LEVL_KD + "'";
				sql += ", CKD_MODI_ID = '" + MODI_ID + "'";
				sql += ", CKD_MODI_DTT = SYSDATE";
				sql += ", CKD_USE_YN = 'Y'";
				sql += " WHERE CKD_KSCD_CD = '" + KSCD_CD + "'";

				argStmtExec.executeUpdate(sql);
			} else {
				sql = "UPDATE CT_KSCD SET ";
				sql += "  CKD_KNME_NM = '" + KNME_NM + "'";
				sql += ", CKD_ENME_NM = '" + ENME_NM + "'";
				sql += ", CKD_SNME_NM = '" + SNME_NM + "'";
				sql += ", CKD_KCD_CD = '" + KCD_CD + "'";
				sql += ", CKD_SUKN_CD = '" + SUKN_CD + "'";
				sql += ", CKD_LEVL_KD = '" + LEVL_KD + "'";
				sql += ", CKD_MODI_ID = '" + MODI_ID + "'";
				sql += ", CKD_MODI_DTT = SYSDATE";
				sql += ", CKD_USE_YN = 'N'";
				sql += ", CKD_NUSE_ID = '" + NUSE_ID + "'";
				sql += ", CKD_NUSE_DTT = SYSDATE";
				sql += " WHERE CKD_KSCD_CD = '" + KSCD_CD + "'";

				argStmtExec.executeUpdate(sql);
			}
		} catch (Exception e) {

			throw new FuncException(e.toString(), sql);
		}

		return sql;
	}
%>
