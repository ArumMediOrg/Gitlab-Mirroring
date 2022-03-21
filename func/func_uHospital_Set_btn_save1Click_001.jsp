<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%!
	public String func_uHospital_Set_btn_save1Click_001(Statement argStmtExec, HashMap argHtMethod) throws Exception {

		String sql = "";
		String sql2 = "";
		String sql_disp = "";

		try {

			String HBSAG_KD = (String) argHtMethod.get("HBSAG_KD");
			String HBS_KD = (String) argHtMethod.get("HBS_KD");
			String XRAY_KD = (String) argHtMethod.get("XRAY_KD");
			String EGRF_KD = (String) argHtMethod.get("EGRF_KD");
			String BONE_KD = (String) argHtMethod.get("BONE_KD");
			String UGI_KD = (String) argHtMethod.get("UGI_KD");
			String BOENT_KD = (String) argHtMethod.get("BOENT_KD");
			String ENEMA_KD = (String) argHtMethod.get("ENEMA_KD");
			String EIA_KD = (String) argHtMethod.get("EIA_KD");
			String SVP_KD = (String) argHtMethod.get("SVP_KD");
			String HCVAB_KD = (String) argHtMethod.get("HCVAB_KD");
			String AFTP_KD = (String) argHtMethod.get("AFTP_KD");
			String MMGP_KD = (String) argHtMethod.get("MMGP_KD");
			String STDAG_NO = (String) argHtMethod.get("STDAG_NO");
			String STDAB_NO = (String) argHtMethod.get("STDAB_NO");
			String ACPT_KD = (String) argHtMethod.get("ACPT_KD");
			String ORAL_KD = (String) argHtMethod.get("ORAL_KD");
			String ATCNR_KD = (String) argHtMethod.get("ATCNR_KD");
			String HEPA_NO = (String) argHtMethod.get("HEPA_NO");
			String SVP_NO = (String) argHtMethod.get("SVP_NO");
			String HIV_NO = (String) argHtMethod.get("HIV_NO");
			String PRCARE_EMAT = (String) argHtMethod.get("PRCARE_EMAT");
			String BLOODCK_KD = (String) argHtMethod.get("BLOODCK_KD");
			String FOCP_KD = (String) argHtMethod.get("FOCP_KD");
			String CONT_KD = (String) argHtMethod.get("CONT_KD");

			//
			if(HBSAG_KD == null) { HBSAG_KD = ""; }
			if(HBS_KD == null) { HBS_KD = ""; }
			if(XRAY_KD == null) { XRAY_KD = ""; }
			if(EGRF_KD == null) { EGRF_KD = ""; }
			if(BONE_KD == null) { BONE_KD = ""; }
			if(UGI_KD == null) { UGI_KD = ""; }
			if(BOENT_KD == null) { BOENT_KD = ""; }
			if(ENEMA_KD == null) { ENEMA_KD = ""; }
			if(EIA_KD == null) { EIA_KD = ""; }
			if(SVP_KD == null) { SVP_KD = ""; }
			if(HCVAB_KD == null) { HCVAB_KD = ""; }
			if(AFTP_KD == null) { AFTP_KD = ""; }
			if(MMGP_KD == null) { MMGP_KD = ""; }
			if(STDAG_NO == null) { STDAG_NO = ""; }
			if(STDAB_NO == null) { STDAB_NO = ""; }
			if(ACPT_KD == null) { ACPT_KD = ""; }
			if(ORAL_KD == null) { ORAL_KD = ""; }
			if(ATCNR_KD == null) { ATCNR_KD = ""; }
			if(HEPA_NO == null) { HEPA_NO = ""; }
			if(SVP_NO == null) { SVP_NO = ""; }
			if(HIV_NO == null) { HIV_NO = ""; }
			if(PRCARE_EMAT == null) { PRCARE_EMAT = ""; }
			if(BLOODCK_KD == null) { BLOODCK_KD = ""; }
			if(FOCP_KD == null) { FOCP_KD = ""; }
			if(CONT_KD == null) { CONT_KD = ""; }

			//
			HBSAG_KD = CTr.Replace(HBSAG_KD, "'", "''");
			HBS_KD = CTr.Replace(HBS_KD, "'", "''");
			XRAY_KD = CTr.Replace(XRAY_KD, "'", "''");
			EGRF_KD = CTr.Replace(EGRF_KD, "'", "''");
			BONE_KD = CTr.Replace(BONE_KD, "'", "''");
			UGI_KD = CTr.Replace(UGI_KD, "'", "''");
			BOENT_KD = CTr.Replace(BOENT_KD, "'", "''");
			ENEMA_KD = CTr.Replace(ENEMA_KD, "'", "''");
			EIA_KD = CTr.Replace(EIA_KD, "'", "''");
			SVP_KD = CTr.Replace(SVP_KD, "'", "''");
			HCVAB_KD = CTr.Replace(HCVAB_KD, "'", "''");
			AFTP_KD = CTr.Replace(AFTP_KD, "'", "''");
			MMGP_KD = CTr.Replace(MMGP_KD, "'", "''");
			STDAG_NO = CTr.Replace(STDAG_NO, "'", "''");
			STDAB_NO = CTr.Replace(STDAB_NO, "'", "''");
			ACPT_KD = CTr.Replace(ACPT_KD, "'", "''");
			ORAL_KD = CTr.Replace(ORAL_KD, "'", "''");
			ATCNR_KD = CTr.Replace(ATCNR_KD, "'", "''");
			HEPA_NO = CTr.Replace(HEPA_NO, "'", "''");
			SVP_NO = CTr.Replace(SVP_NO, "'", "''");
			HIV_NO = CTr.Replace(HIV_NO, "'", "''");
			PRCARE_EMAT = CTr.Replace(PRCARE_EMAT, "'", "''");
			BLOODCK_KD = CTr.Replace(BLOODCK_KD, "'", "''");
			FOCP_KD = CTr.Replace(FOCP_KD, "'", "''");
			CONT_KD = CTr.Replace(CONT_KD, "'", "''");

			sql = "UPDATE IT_HOSPITAL SET ";
			sql += "  IHL_HBSAG_KD = '" + HBSAG_KD + "'";
			sql += ", IHL_HBS_KD = '" + HBS_KD + "'";
			sql += ", IHL_XRAY_KD = '" + XRAY_KD + "'";
			sql += ", IHL_EGRF_KD = '" + EGRF_KD + "'";
			sql += ", IHL_BONE_KD = '" + BONE_KD + "'";
			sql += ", IHL_UGI_KD = '" + UGI_KD + "'";
			sql += ", IHL_BOENT_KD = '" + BOENT_KD + "'";
			sql += ", IHL_ENEMA_KD = '" + ENEMA_KD + "'";
			sql += ", IHL_EIA_KD = '" + EIA_KD + "'";
			sql += ", IHL_SVP_KD = '" + SVP_KD + "'";
			sql += ", IHL_HCVAB_KD = '" + HCVAB_KD + "'";
			sql += ", IHL_AFTP_KD = '" + AFTP_KD + "'";
			sql += ", IHL_MMGP_KD = '" + MMGP_KD + "'";
			sql += ", IHL_STDAG_NO = '" + STDAG_NO + "'";
			sql += ", IHL_STDAB_NO = '" + STDAB_NO + "'";
			sql += ", IHL_ACPT_KD = '" + ACPT_KD + "'";
			sql += ", IHL_ORAL_KD = '" + ORAL_KD + "'";
			sql += ", IHL_ATCNR_KD = '" + ATCNR_KD + "'";
			sql += ", IHL_HEPA_NO = '" + HEPA_NO + "'";
			sql += ", IHL_SVP_NO = '" + SVP_NO + "'";
			sql += ", IHL_HIV_NO = '" + HIV_NO + "'";
			sql += ", IHL_PRCARE_EMAT ='" + PRCARE_EMAT + "'";
			sql += ", IHL_BLOODCK_KD = '" + BLOODCK_KD + "'";
			sql += ", IHL_FOCP_KD = '" + FOCP_KD + "'";
			sql += ", IHL_CONT_KD = '" + CONT_KD + "'";

			argStmtExec.executeUpdate(sql);

		} catch (Exception e) {

			throw new FuncException(e.toString(), sql);
		}

		return sql;
	}
%>
