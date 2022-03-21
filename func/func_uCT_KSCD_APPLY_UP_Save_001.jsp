<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%!
	public String func_uCT_KSCD_APPLY_UP_Save_001(Statement argStmtExec, HashMap argHtMethod) throws Exception {

		String sql = "";
		String sql2 = "";
		String sql_disp = "";

		try {

			String CHKBOXCCP_USE_YN = (String) argHtMethod.get("CHKBOXCCP_USE_YN");
			String LV1 = (String) argHtMethod.get("LV1");
			String LV2 = (String) argHtMethod.get("LV2");
			String LV3 = (String) argHtMethod.get("LV3");
			String LV4 = (String) argHtMethod.get("LV4");
			String KSCD_CD = (String) argHtMethod.get("KSCD_CD");
			String KNME_NM = (String) argHtMethod.get("KNME_NM");
			String ENME_NM = (String) argHtMethod.get("ENME_NM");
			String SNME_NM = (String) argHtMethod.get("SNME_NM");
			String KCD_CD = (String) argHtMethod.get("KCD_CD");
			String SUKN_CD = (String) argHtMethod.get("SUKN_CD");
			String LEVL_KD = (String) argHtMethod.get("LEVL_KD");
			String USE_YN = (String) argHtMethod.get("USE_YN");
			String INPT_ID = (String) argHtMethod.get("INPT_ID");
			String NUSE_ID = (String) argHtMethod.get("NUSE_ID");

			//
			if(CHKBOXCCP_USE_YN == null) { CHKBOXCCP_USE_YN = ""; }
			if(LV1 == null) { LV1 = ""; }
			if(LV2 == null) { LV2 = ""; }
			if(LV3 == null) { LV3 = ""; }
			if(LV4 == null) { LV4 = ""; }
			if(KSCD_CD == null) { KSCD_CD = ""; }
			if(KNME_NM == null) { KNME_NM = ""; }
			if(ENME_NM == null) { ENME_NM = ""; }
			if(SNME_NM == null) { SNME_NM = ""; }
			if(KCD_CD == null) { KCD_CD = ""; }
			if(SUKN_CD == null) { SUKN_CD = ""; }
			if(LEVL_KD == null) { LEVL_KD = ""; }
			if(USE_YN == null) { USE_YN = ""; }
			if(INPT_ID == null) { INPT_ID = ""; }
			if(NUSE_ID == null) { NUSE_ID = ""; }

			//
			CHKBOXCCP_USE_YN = CTr.Replace(CHKBOXCCP_USE_YN, "'", "''");
			LV1 = CTr.Replace(LV1, "'", "''");
			LV2 = CTr.Replace(LV2, "'", "''");
			LV3 = CTr.Replace(LV3, "'", "''");
			LV4 = CTr.Replace(LV4, "'", "''");
			KSCD_CD = CTr.Replace(KSCD_CD, "'", "''");
			KNME_NM = CTr.Replace(KNME_NM, "'", "''");
			ENME_NM = CTr.Replace(ENME_NM, "'", "''");
			SNME_NM = CTr.Replace(SNME_NM, "'", "''");
			KCD_CD = CTr.Replace(KCD_CD, "'", "''");
			SUKN_CD = CTr.Replace(SUKN_CD, "'", "''");
			LEVL_KD = CTr.Replace(LEVL_KD, "'", "''");
			USE_YN = CTr.Replace(USE_YN, "'", "''");
			INPT_ID = CTr.Replace(INPT_ID, "'", "''");
			NUSE_ID = CTr.Replace(NUSE_ID, "'", "''");

			if(CHKBOXCCP_USE_YN.equals("1")) {
				sql = "INSERT INTO CT_KSCD (CKD_LV1, CKD_LV2, CKD_LV3, CKD_LV4, CKD_KSCD_CD, CKD_KNME_NM, CKD_ENME_NM, CKD_SNME_NM, CKD_KCD_CD, CKD_SUKN_CD, CKD_LEVL_KD, CKD_USE_YN, CKD_INPT_ID, CKD_INPT_DTT) VALUES (";
				sql += "  '" + LV1 + "'";
				sql += ", '" + LV2 + "'";
				sql += ", '" + LV3 + "'";
				sql += ", '" + LV4 + "'";
				sql += ", '" + KSCD_CD + "'";
				sql += ", '" + KNME_NM + "'";
				sql += ", '" + ENME_NM + "'";
				sql += ", '" + SNME_NM + "'";
				sql += ", '" + KCD_CD + "'";
				sql += ", '" + SUKN_CD + "'";
				sql += ", '" + LEVL_KD + "'";
				sql += ", '" + USE_YN + "'";
				sql += ", '" + INPT_ID + "'";
				sql += ", SYSDATE";
				sql += ")";

				argStmtExec.executeUpdate(sql);
			} else {
				sql = "INSERT INTO CT_KSCD (CKD_LV1, CKD_LV2, CKD_LV3, CKD_LV4, CKD_KSCD_CD, CKD_KNME_NM, CKD_ENME_NM, CKD_SNME_NM, CKD_KCD_CD, CKD_SUKN_CD, CKD_LEVL_KD, CKD_USE_YN,CKD_NUSE_ID,CKD_NUSE_DTT,CKD_INPT_ID,CKD_INPT_DTT) VALUES (";
				sql += "  '" + LV1 + "'";
				sql += ", '" + LV2 + "'";
				sql += ", '" + LV3 + "'";
				sql += ", '" + LV4 + "'";
				sql += ", '" + KSCD_CD + "'";
				sql += ", '" + KNME_NM + "'";
				sql += ", '" + ENME_NM + "'";
				sql += ", '" + SNME_NM + "'";
				sql += ", '" + KCD_CD + "'";
				sql += ", '" + SUKN_CD + "'";
				sql += ", '" + LEVL_KD + "'";
				sql += ", '" + USE_YN + "'";
				sql += ", '" + NUSE_ID + "'";
				sql += ", SYSDATE";
				sql += ", '" + INPT_ID + "'";
				sql += ", SYSDATE";
				sql += ")";

				argStmtExec.executeUpdate(sql);
			}
		} catch (Exception e) {

			throw new FuncException(e.toString(), sql);
		}

		return sql;
	}
%>
