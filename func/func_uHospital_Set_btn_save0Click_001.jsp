<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%!
	public String func_uHospital_Set_btn_save0Click_001(Statement argStmtExec, HashMap argHtMethod) throws Exception {

		String sql = "";
		String sql2 = "";
		String sql_disp = "";

		try {

			String HCAR_CD = (String) argHtMethod.get("HCAR_CD");
			String ACPT_KD = (String) argHtMethod.get("ACPT_KD");
			String ATCNR_KD = (String) argHtMethod.get("ATCNR_KD");
			String ORAL_KD = (String) argHtMethod.get("ORAL_KD");
			String OCSAUTO_KD = (String) argHtMethod.get("OCSAUTO_KD");
			String DIS1_PO = (String) argHtMethod.get("DIS1_PO");
			String DRUG_KD = (String) argHtMethod.get("DRUG_KD");
			String RECE_KD = (String) argHtMethod.get("RECE_KD");
			String AUTO_CD = (String) argHtMethod.get("AUTO_CD");
			String CXRY_CD = (String) argHtMethod.get("CXRY_CD");
			String NXRY_CD = (String) argHtMethod.get("NXRY_CD");
			String OCS_KD = (String) argHtMethod.get("OCS_KD");
			String SPNIGHT_LDL1 = (String) argHtMethod.get("SPNIGHT_LDL1");
			String SPNIGHT_LDL = (String) argHtMethod.get("SPNIGHT_LDL");
			String DOCT_KD = (String) argHtMethod.get("DOCT_KD");
			String HABIT_KD = (String) argHtMethod.get("HABIT_KD");
			String AUTH_KD = (String) argHtMethod.get("AUTH_KD");
			String OPTION_CD = (String) argHtMethod.get("OPTION_CD");
			String ATCF_YN = (String) argHtMethod.get("ATCF_YN");
			String MGPR_KD = (String) argHtMethod.get("MGPR_KD");

			//
			if(HCAR_CD == null) { HCAR_CD = ""; }
			if(ACPT_KD == null) { ACPT_KD = ""; }
			if(ATCNR_KD == null) { ATCNR_KD = ""; }
			if(ORAL_KD == null) { ORAL_KD = ""; }
			if(OCSAUTO_KD == null) { OCSAUTO_KD = ""; }
			if(DIS1_PO == null) { DIS1_PO = ""; }
			if(DRUG_KD == null) { DRUG_KD = ""; }
			if(RECE_KD == null) { RECE_KD = ""; }
			if(AUTO_CD == null) { AUTO_CD = ""; }
			if(CXRY_CD == null) { CXRY_CD = ""; }
			if(NXRY_CD == null) { NXRY_CD = ""; }
			if(OCS_KD == null) { OCS_KD = ""; }
			if(SPNIGHT_LDL1 == null) { SPNIGHT_LDL1 = ""; }
			if(SPNIGHT_LDL == null) { SPNIGHT_LDL = ""; }
			if(DOCT_KD == null) { DOCT_KD = ""; }
			if(HABIT_KD == null) { HABIT_KD = ""; }
			if(AUTH_KD == null) { AUTH_KD = ""; }
			if(OPTION_CD == null) { OPTION_CD = ""; }
			if(ATCF_YN == null) { ATCF_YN = ""; }
			if(MGPR_KD == null) { MGPR_KD = ""; }

			//
			HCAR_CD = CTr.Replace(HCAR_CD, "'", "''");
			ACPT_KD = CTr.Replace(ACPT_KD, "'", "''");
			ATCNR_KD = CTr.Replace(ATCNR_KD, "'", "''");
			ORAL_KD = CTr.Replace(ORAL_KD, "'", "''");
			OCSAUTO_KD = CTr.Replace(OCSAUTO_KD, "'", "''");
			DIS1_PO = CTr.Replace(DIS1_PO, "'", "''");
			DRUG_KD = CTr.Replace(DRUG_KD, "'", "''");
			RECE_KD = CTr.Replace(RECE_KD, "'", "''");
			AUTO_CD = CTr.Replace(AUTO_CD, "'", "''");
			CXRY_CD = CTr.Replace(CXRY_CD, "'", "''");
			NXRY_CD = CTr.Replace(NXRY_CD, "'", "''");
			OCS_KD = CTr.Replace(OCS_KD, "'", "''");
			SPNIGHT_LDL1 = CTr.Replace(SPNIGHT_LDL1, "'", "''");
			SPNIGHT_LDL = CTr.Replace(SPNIGHT_LDL, "'", "''");
			DOCT_KD = CTr.Replace(DOCT_KD, "'", "''");
			HABIT_KD = CTr.Replace(HABIT_KD, "'", "''");
			AUTH_KD = CTr.Replace(AUTH_KD, "'", "''");
			OPTION_CD = CTr.Replace(OPTION_CD, "'", "''");
			ATCF_YN = CTr.Replace(ATCF_YN, "'", "''");
			MGPR_KD = CTr.Replace(MGPR_KD, "'", "''");

			sql = "UPDATE IT_HOSPITAL SET ";
			sql += "  IHL_HCAR_CD = '" + HCAR_CD + "'";
			sql += ", IHL_ACPT_KD = '" + ACPT_KD + "'";
			sql += ", IHL_ATCNR_KD = '" + ATCNR_KD + "'";
			sql += ", IHL_ORAL_KD = '" + ORAL_KD + "'";
			sql += ", IHL_OCSAUTO_KD = '" + OCSAUTO_KD + "'";
			sql += ", IHL_DIS1_PO = '" + DIS1_PO + "'";
			sql += ", IHL_DRUG_KD = '" + DRUG_KD + "'";
			sql += ", IHL_RECE_KD = '" + RECE_KD + "'";
			sql += ", IHL_AUTO_CD = '" + AUTO_CD + "'";
			sql += ", IHL_CXRY_CD = '" + CXRY_CD + "'";
			sql += ", IHL_NXRY_CD = '" + NXRY_CD + "'";
			sql += ", IHL_OCS_KD = '" + OCS_KD + "'";
			sql += ", IHL_SPNIGHT_LDL1 = '" + SPNIGHT_LDL1 + "'";
			sql += ", IHL_SPNIGHT_LDL = '" + SPNIGHT_LDL + "'";
			sql += ", IHL_DOCT_KD = '" + DOCT_KD + "'";
			sql += ", IHL_HABIT_KD = '" + HABIT_KD + "'";
			sql += ", IHL_AUTH_KD = '" + AUTH_KD + "'";
			sql += ", IHL_OPTION_CD = '" + OPTION_CD + "'";
			sql += ", IHL_ATCF_YN = '" + ATCF_YN + "'";
			sql += ", IHL_MGPR_KD = '" + MGPR_KD + "' ";


			argStmtExec.executeUpdate(sql);

		} catch (Exception e) {

			throw new FuncException(e.toString(), sql);
		}

		return sql;
	}
%>
