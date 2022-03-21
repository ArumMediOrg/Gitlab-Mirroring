<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%!
	public String func_uRsvn_Acpt_btnSaveClick_003(Statement argStmtExec, HashMap argHtMethod) throws Exception {

		String sql = "";
		String sql2 = "";
		String sql_disp = "";

		try {

			String RSVN_NO = (String) argHtMethod.get("RSVN_NO");
			String RSVN_CD = (String) argHtMethod.get("RSVN_CD");
			String WEB_ID = (String) argHtMethod.get("WEB_ID");
			String EXAM_DT = (String) argHtMethod.get("EXAM_DT");
			String EXAM_SQ = (String) argHtMethod.get("EXAM_SQ");
			String EXAM_TM = (String) argHtMethod.get("EXAM_TM");
			String ACPT_CD = (String) argHtMethod.get("ACPT_CD");
			String ACPT_KD = (String) argHtMethod.get("ACPT_KD");
			String PLCE_CD = (String) argHtMethod.get("PLCE_CD");
			String CUST_NO = (String) argHtMethod.get("CUST_NO");
			String MMBR_CD = (String) argHtMethod.get("MMBR_CD");
			String CHART_NO = (String) argHtMethod.get("CHART_NO");
			String PSNL_ID = (String) argHtMethod.get("PSNL_ID");
			String PSNL_NM = (String) argHtMethod.get("PSNL_NM");
			String SEX_CD = (String) argHtMethod.get("SEX_CD");
			String PSNL_AGE = (String) argHtMethod.get("PSNL_AGE");
			String ZIP_CD = (String) argHtMethod.get("ZIP_CD");
			String ZIP_SQ = (String) argHtMethod.get("ZIP_SQ");
			String ZIP_AR = (String) argHtMethod.get("ZIP_AR");
			String DETAIL_AR = (String) argHtMethod.get("DETAIL_AR");
			String BLDG_NO = (String) argHtMethod.get("BLDG_NO");
			String TEL_NO = (String) argHtMethod.get("TEL_NO");
			String MOBL_NO = (String) argHtMethod.get("MOBL_NO");
			String EMAIL_AR = (String) argHtMethod.get("EMAIL_AR");
			String SEND_CD = (String) argHtMethod.get("SEND_CD");
			String SMS_YN = (String) argHtMethod.get("SMS_YN");
			String COMP_CD = (String) argHtMethod.get("COMP_CD");
			String DEPT_CD = (String) argHtMethod.get("DEPT_CD");
			String DEPT_NM = (String) argHtMethod.get("DEPT_NM");
			String DIVI_CD = (String) argHtMethod.get("DIVI_CD");
			String ENTRY_DT = (String) argHtMethod.get("ENTRY_DT");
			String DIVI_NO = (String) argHtMethod.get("DIVI_NO");
			String FAMY_CD = (String) argHtMethod.get("FAMY_CD");
			String FAMY_NM = (String) argHtMethod.get("FAMY_NM");
			String DRUG_YN = (String) argHtMethod.get("DRUG_YN");
			String SALES_ID = (String) argHtMethod.get("SALES_ID");
			String EXAM_CD = (String) argHtMethod.get("EXAM_CD");
			String HTSB_CD = (String) argHtMethod.get("HTSB_CD");
			String HTSB_YN = (String) argHtMethod.get("HTSB_YN");
			String HTPR_CD = (String) argHtMethod.get("HTPR_CD");
			String EXAM_LT = (String) argHtMethod.get("EXAM_LT");
			String EQUIP_TM = (String) argHtMethod.get("EQUIP_TM");
			String EQUIP_LT = (String) argHtMethod.get("EQUIP_LT");
			String INSU_NO = (String) argHtMethod.get("INSU_NO");
			String INSU_CD = (String) argHtMethod.get("INSU_CD");
			String ENTY_CD = (String) argHtMethod.get("ENTY_CD");
			String ASSO_CD = (String) argHtMethod.get("ASSO_CD");
			String CNTR_CD = (String) argHtMethod.get("CNTR_CD");
			String HEPA_YN = (String) argHtMethod.get("HEPA_YN");
			String ORAL_YN = (String) argHtMethod.get("ORAL_YN");
			String STOMA_CD = (String) argHtMethod.get("STOMA_CD");
			String COLON_CD = (String) argHtMethod.get("COLON_CD");
			String LIVER_CD = (String) argHtMethod.get("LIVER_CD");
			String BAST_CD = (String) argHtMethod.get("BAST_CD");
			String UTER_CD = (String) argHtMethod.get("UTER_CD");
			String STOMA_DR = (String) argHtMethod.get("STOMA_DR");
			String COLON_DR = (String) argHtMethod.get("COLON_DR");
			String LIVER_DR = (String) argHtMethod.get("LIVER_DR");
			String BAST_DR = (String) argHtMethod.get("BAST_DR");
			String UTER_DR = (String) argHtMethod.get("UTER_DR");
			String HDMD_YN = (String) argHtMethod.get("HDMD_YN");
			String SPRT_PR = (String) argHtMethod.get("SPRT_PR");
			String COMP_PR = (String) argHtMethod.get("COMP_PR");
			String PSNL_PR = (String) argHtMethod.get("PSNL_PR");
			String HLTH_PR = (String) argHtMethod.get("HLTH_PR");
			String PYER_CD = (String) argHtMethod.get("PYER_CD");
			String CMPY_CD = (String) argHtMethod.get("CMPY_CD");
			String PRPY_CD = (String) argHtMethod.get("PRPY_CD");
			String RECE_NO = (String) argHtMethod.get("RECE_NO");
			String RECE_KD = (String) argHtMethod.get("RECE_KD");
			String NHIC_TX = (String) argHtMethod.get("NHIC_TX");
			String RMK_TX = (String) argHtMethod.get("RMK_TX");
			String INPT_ID = (String) argHtMethod.get("INPT_ID");
			String HCV_YN = (String) argHtMethod.get("HCV_YN");
			String BLOOD_YN = (String) argHtMethod.get("BLOOD_YN");
			String ASPL_YN = (String) argHtMethod.get("ASPL_YN");
			String STOOL_YN = (String) argHtMethod.get("STOOL_YN");
			String SPSB_CD = (String) argHtMethod.get("SPSB_CD");
			String CVSB_CD = (String) argHtMethod.get("CVSB_CD");
			String EMSB_CD = (String) argHtMethod.get("EMSB_CD");
			String ETSB_CD = (String) argHtMethod.get("ETSB_CD");
			String SPSB_YN = (String) argHtMethod.get("SPSB_YN");
			String CVSB_YN = (String) argHtMethod.get("CVSB_YN");
			String EMSB_YN = (String) argHtMethod.get("EMSB_YN");
			String ETSB_YN = (String) argHtMethod.get("ETSB_YN");
			String SPCL_CD = (String) argHtMethod.get("SPCL_CD");
			String SPHT_CD = (String) argHtMethod.get("SPHT_CD");
			String SDMD_YN = (String) argHtMethod.get("SDMD_YN");
			String SPCL_PR = (String) argHtMethod.get("SPCL_PR");
			String CNCL_YN = (String) argHtMethod.get("CNCL_YN");
			String SMPL_YN = (String) argHtMethod.get("SMPL_YN");
			String STOMA_YN = (String) argHtMethod.get("STOMA_YN");
			String COLON_YN = (String) argHtMethod.get("COLON_YN");
			String HLTH_KD = (String) argHtMethod.get("HLTH_KD");
			String SAFE_YN = (String) argHtMethod.get("SAFE_YN");
			String LUNG_CD = (String) argHtMethod.get("LUNG_CD");
			String LUNG_DR = (String) argHtMethod.get("LUNG_DR");
			String UBEH_YN = (String) argHtMethod.get("UBEH_YN");
			String QUEST_KD = (String) argHtMethod.get("QUEST_KD");
			String DRUG_DT = (String) argHtMethod.get("DRUG_DT");
			String LOTT_AR = (String) argHtMethod.get("LOTT_AR");
			String OCS_NO = (String) argHtMethod.get("OCS_NO");
			String OCS_DR = (String) argHtMethod.get("OCS_DR");
			String OCS_DV = (String) argHtMethod.get("OCS_DV");
			String ORDER_LT = (String) argHtMethod.get("ORDER_LT");
			String DISC_RC = (String) argHtMethod.get("DISC_RC");
			String DISC_CD = (String) argHtMethod.get("DISC_CD");
			String DISC_RT = (String) argHtMethod.get("DISC_RT");
			String DISC_PR = (String) argHtMethod.get("DISC_PR");
			String DISC_CPR = (String) argHtMethod.get("DISC_CPR");
			String DISC_TX = (String) argHtMethod.get("DISC_TX");
			String CNTB_RC = (String) argHtMethod.get("CNTB_RC");
			String CNTB_CD = (String) argHtMethod.get("CNTB_CD");
			String CNTB_RT = (String) argHtMethod.get("CNTB_RT");
			String CNTB_PR = (String) argHtMethod.get("CNTB_PR");


			//
			if(RSVN_NO == null) { RSVN_NO = ""; }
			if(RSVN_CD == null) { RSVN_CD = ""; }
			if(WEB_ID == null) { WEB_ID = ""; }
			if(EXAM_DT == null) { EXAM_DT = ""; }
			if(EXAM_SQ == null) { EXAM_SQ = ""; }
			if(EXAM_TM == null) { EXAM_TM = ""; }
			if(ACPT_CD == null) { ACPT_CD = ""; }
			if(ACPT_KD == null) { ACPT_KD = ""; }
			if(PLCE_CD == null) { PLCE_CD = ""; }
			if(CUST_NO == null) { CUST_NO = ""; }
			if(MMBR_CD == null) { MMBR_CD = ""; }
			if(CHART_NO == null) { CHART_NO = ""; }
			if(PSNL_ID == null) { PSNL_ID = ""; }
			if(PSNL_NM == null) { PSNL_NM = ""; }
			if(SEX_CD == null) { SEX_CD = ""; }
			if(PSNL_AGE == null) { PSNL_AGE = ""; }
			if(ZIP_CD == null) { ZIP_CD = ""; }
			if(ZIP_SQ == null) { ZIP_SQ = ""; }
			if(ZIP_AR == null) { ZIP_AR = ""; }
			if(DETAIL_AR == null) { DETAIL_AR = ""; }
			if(BLDG_NO == null) { BLDG_NO = ""; }
			if(TEL_NO == null) { TEL_NO = ""; }
			if(MOBL_NO == null) { MOBL_NO = ""; }
			if(EMAIL_AR == null) { EMAIL_AR = ""; }
			if(SEND_CD == null) { SEND_CD = ""; }
			if(SMS_YN == null) { SMS_YN = ""; }
			if(COMP_CD == null) { COMP_CD = ""; }
			if(DEPT_CD == null) { DEPT_CD = ""; }
			if(DEPT_NM == null) { DEPT_NM = ""; }
			if(DIVI_CD == null) { DIVI_CD = ""; }
			if(ENTRY_DT == null) { ENTRY_DT = ""; }
			if(DIVI_NO == null) { DIVI_NO = ""; }
			if(FAMY_CD == null) { FAMY_CD = ""; }
			if(FAMY_NM == null) { FAMY_NM = ""; }
			if(DRUG_YN == null) { DRUG_YN = ""; }
			if(SALES_ID == null) { SALES_ID = ""; }
			if(EXAM_CD == null) { EXAM_CD = ""; }
			if(HTSB_CD == null) { HTSB_CD = ""; }
			if(HTSB_YN == null) { HTSB_YN = ""; }
			if(HTPR_CD == null) { HTPR_CD = ""; }
			if(EXAM_LT == null) { EXAM_LT = ""; }
			if(EQUIP_TM == null) { EQUIP_TM = ""; }
			if(EQUIP_LT == null) { EQUIP_LT = ""; }
			if(INSU_NO == null) { INSU_NO = ""; }
			if(INSU_CD == null) { INSU_CD = ""; }
			if(ENTY_CD == null) { ENTY_CD = ""; }
			if(ASSO_CD == null) { ASSO_CD = ""; }
			if(CNTR_CD == null) { CNTR_CD = ""; }
			if(HEPA_YN == null) { HEPA_YN = ""; }
			if(ORAL_YN == null) { ORAL_YN = ""; }
			if(STOMA_CD == null) { STOMA_CD = ""; }
			if(COLON_CD == null) { COLON_CD = ""; }
			if(LIVER_CD == null) { LIVER_CD = ""; }
			if(BAST_CD == null) { BAST_CD = ""; }
			if(UTER_CD == null) { UTER_CD = ""; }
			if(STOMA_DR == null) { STOMA_DR = ""; }
			if(COLON_DR == null) { COLON_DR = ""; }
			if(LIVER_DR == null) { LIVER_DR = ""; }
			if(BAST_DR == null) { BAST_DR = ""; }
			if(UTER_DR == null) { UTER_DR = ""; }
			if(HDMD_YN == null) { HDMD_YN = ""; }
			if(SPRT_PR == null) { SPRT_PR = ""; }
			if(COMP_PR == null) { COMP_PR = ""; }
			if(PSNL_PR == null) { PSNL_PR = ""; }
			if(HLTH_PR == null) { HLTH_PR = ""; }
			if(PYER_CD == null) { PYER_CD = ""; }
			if(CMPY_CD == null) { CMPY_CD = ""; }
			if(PRPY_CD == null) { PRPY_CD = ""; }
			if(RECE_NO == null) { RECE_NO = ""; }
			if(RECE_KD == null) { RECE_KD = ""; }
			if(NHIC_TX == null) { NHIC_TX = ""; }
			if(RMK_TX == null) { RMK_TX = ""; }
			if(INPT_ID == null) { INPT_ID = ""; }
			if(HCV_YN == null) { HCV_YN = ""; }
			if(BLOOD_YN == null) { BLOOD_YN = ""; }
			if(ASPL_YN == null) { ASPL_YN = ""; }
			if(STOOL_YN == null) { STOOL_YN = ""; }
			if(SPSB_CD == null) { SPSB_CD = ""; }
			if(CVSB_CD == null) { CVSB_CD = ""; }
			if(EMSB_CD == null) { EMSB_CD = ""; }
			if(ETSB_CD == null) { ETSB_CD = ""; }
			if(SPSB_YN == null) { SPSB_YN = ""; }
			if(CVSB_YN == null) { CVSB_YN = ""; }
			if(EMSB_YN == null) { EMSB_YN = ""; }
			if(ETSB_YN == null) { ETSB_YN = ""; }
			if(SPCL_CD == null) { SPCL_CD = ""; }
			if(SPHT_CD == null) { SPHT_CD = ""; }
			if(SDMD_YN == null) { SDMD_YN = ""; }
			if(SPCL_PR == null) { SPCL_PR = ""; }
			if(CNCL_YN == null) { CNCL_YN = ""; }
			if(SMPL_YN == null) { SMPL_YN = ""; }
			if(STOMA_YN == null) { STOMA_YN = ""; }
			if(COLON_YN == null) { COLON_YN = ""; }
			if(HLTH_KD == null) { HLTH_KD = ""; }
			if(SAFE_YN == null) { SAFE_YN = ""; }
			if(LUNG_CD == null) { LUNG_CD = ""; }
			if(LUNG_DR == null) { LUNG_DR = ""; }
			if(UBEH_YN == null) { UBEH_YN = ""; }
			if(QUEST_KD == null) { QUEST_KD = ""; }
			if(DRUG_DT == null) { DRUG_DT = ""; }
			if(LOTT_AR == null) { LOTT_AR = ""; }
			if(OCS_NO == null) { OCS_NO = ""; }
			if(OCS_DR == null) { OCS_DR = ""; }
			if(OCS_DV == null) { OCS_DV = ""; }
			if(ORDER_LT == null) { ORDER_LT = ""; }
			if(DISC_RC == null) { DISC_RC = ""; }
			if(DISC_CD == null) { DISC_CD = ""; }
			if(DISC_RT == null) { DISC_RT = ""; }
			if(DISC_PR == null) { DISC_PR = ""; }
			if(DISC_CPR == null) { DISC_CPR = ""; }
			if(DISC_TX == null) { DISC_TX = ""; }
			if(CNTB_RC == null) { CNTB_RC = ""; }
			if(CNTB_CD == null) { CNTB_CD = ""; }
			if(CNTB_RT == null) { CNTB_RT = ""; }
			if(CNTB_PR == null) { CNTB_PR = ""; }

			//
			RSVN_NO = CTr.Replace(RSVN_NO, "'", "''");
			RSVN_CD = CTr.Replace(RSVN_CD, "'", "''");
			WEB_ID = CTr.Replace(WEB_ID, "'", "''");
			EXAM_DT = CTr.Replace(EXAM_DT, "'", "''");
			EXAM_SQ = CTr.Replace(EXAM_SQ, "'", "''");
			EXAM_TM = CTr.Replace(EXAM_TM, "'", "''");
			ACPT_CD = CTr.Replace(ACPT_CD, "'", "''");
			ACPT_KD = CTr.Replace(ACPT_KD, "'", "''");
			PLCE_CD = CTr.Replace(PLCE_CD, "'", "''");
			CUST_NO = CTr.Replace(CUST_NO, "'", "''");
			MMBR_CD = CTr.Replace(MMBR_CD, "'", "''");
			CHART_NO = CTr.Replace(CHART_NO, "'", "''");
			PSNL_ID = CTr.Replace(PSNL_ID, "'", "''");
			PSNL_NM = CTr.Replace(PSNL_NM, "'", "''");
			SEX_CD = CTr.Replace(SEX_CD, "'", "''");
			PSNL_AGE = CTr.Replace(PSNL_AGE, "'", "''");
			ZIP_CD = CTr.Replace(ZIP_CD, "'", "''");
			ZIP_SQ = CTr.Replace(ZIP_SQ, "'", "''");
			ZIP_AR = CTr.Replace(ZIP_AR, "'", "''");
			DETAIL_AR = CTr.Replace(DETAIL_AR, "'", "''");
			BLDG_NO = CTr.Replace(BLDG_NO, "'", "''");
			TEL_NO = CTr.Replace(TEL_NO, "'", "''");
			MOBL_NO = CTr.Replace(MOBL_NO, "'", "''");
			EMAIL_AR = CTr.Replace(EMAIL_AR, "'", "''");
			SEND_CD = CTr.Replace(SEND_CD, "'", "''");
			SMS_YN = CTr.Replace(SMS_YN, "'", "''");
			COMP_CD = CTr.Replace(COMP_CD, "'", "''");
			DEPT_CD = CTr.Replace(DEPT_CD, "'", "''");
			DEPT_NM = CTr.Replace(DEPT_NM, "'", "''");
			DIVI_CD = CTr.Replace(DIVI_CD, "'", "''");
			ENTRY_DT = CTr.Replace(ENTRY_DT, "'", "''");
			DIVI_NO = CTr.Replace(DIVI_NO, "'", "''");
			FAMY_CD = CTr.Replace(FAMY_CD, "'", "''");
			FAMY_NM = CTr.Replace(FAMY_NM, "'", "''");
			DRUG_YN = CTr.Replace(DRUG_YN, "'", "''");
			SALES_ID = CTr.Replace(SALES_ID, "'", "''");
			EXAM_CD = CTr.Replace(EXAM_CD, "'", "''");
			HTSB_CD = CTr.Replace(HTSB_CD, "'", "''");
			HTSB_YN = CTr.Replace(HTSB_YN, "'", "''");
			HTPR_CD = CTr.Replace(HTPR_CD, "'", "''");
			EXAM_LT = CTr.Replace(EXAM_LT, "'", "''");
			EQUIP_TM = CTr.Replace(EQUIP_TM, "'", "''");
			EQUIP_LT = CTr.Replace(EQUIP_LT, "'", "''");
			INSU_NO = CTr.Replace(INSU_NO, "'", "''");
			INSU_CD = CTr.Replace(INSU_CD, "'", "''");
			ENTY_CD = CTr.Replace(ENTY_CD, "'", "''");
			ASSO_CD = CTr.Replace(ASSO_CD, "'", "''");
			CNTR_CD = CTr.Replace(CNTR_CD, "'", "''");
			HEPA_YN = CTr.Replace(HEPA_YN, "'", "''");
			ORAL_YN = CTr.Replace(ORAL_YN, "'", "''");
			STOMA_CD = CTr.Replace(STOMA_CD, "'", "''");
			COLON_CD = CTr.Replace(COLON_CD, "'", "''");
			LIVER_CD = CTr.Replace(LIVER_CD, "'", "''");
			BAST_CD = CTr.Replace(BAST_CD, "'", "''");
			UTER_CD = CTr.Replace(UTER_CD, "'", "''");
			STOMA_DR = CTr.Replace(STOMA_DR, "'", "''");
			COLON_DR = CTr.Replace(COLON_DR, "'", "''");
			LIVER_DR = CTr.Replace(LIVER_DR, "'", "''");
			BAST_DR = CTr.Replace(BAST_DR, "'", "''");
			UTER_DR = CTr.Replace(UTER_DR, "'", "''");
			HDMD_YN = CTr.Replace(HDMD_YN, "'", "''");
			SPRT_PR = CTr.Replace(SPRT_PR, "'", "''");
			COMP_PR = CTr.Replace(COMP_PR, "'", "''");
			PSNL_PR = CTr.Replace(PSNL_PR, "'", "''");
			HLTH_PR = CTr.Replace(HLTH_PR, "'", "''");
			PYER_CD = CTr.Replace(PYER_CD, "'", "''");
			CMPY_CD = CTr.Replace(CMPY_CD, "'", "''");
			PRPY_CD = CTr.Replace(PRPY_CD, "'", "''");
			RECE_NO = CTr.Replace(RECE_NO, "'", "''");
			RECE_KD = CTr.Replace(RECE_KD, "'", "''");
			NHIC_TX = CTr.Replace(NHIC_TX, "'", "''");
			RMK_TX = CTr.Replace(RMK_TX, "'", "''");
			INPT_ID = CTr.Replace(INPT_ID, "'", "''");
			HCV_YN = CTr.Replace(HCV_YN, "'", "''");
			BLOOD_YN = CTr.Replace(BLOOD_YN, "'", "''");
			ASPL_YN = CTr.Replace(ASPL_YN, "'", "''");
			STOOL_YN = CTr.Replace(STOOL_YN, "'", "''");
			SPSB_CD = CTr.Replace(SPSB_CD, "'", "''");
			CVSB_CD = CTr.Replace(CVSB_CD, "'", "''");
			EMSB_CD = CTr.Replace(EMSB_CD, "'", "''");
			ETSB_CD = CTr.Replace(ETSB_CD, "'", "''");
			SPSB_YN = CTr.Replace(SPSB_YN, "'", "''");
			CVSB_YN = CTr.Replace(CVSB_YN, "'", "''");
			EMSB_YN = CTr.Replace(EMSB_YN, "'", "''");
			ETSB_YN = CTr.Replace(ETSB_YN, "'", "''");
			SPCL_CD = CTr.Replace(SPCL_CD, "'", "''");
			SPHT_CD = CTr.Replace(SPHT_CD, "'", "''");
			SDMD_YN = CTr.Replace(SDMD_YN, "'", "''");
			SPCL_PR = CTr.Replace(SPCL_PR, "'", "''");
			CNCL_YN = CTr.Replace(CNCL_YN, "'", "''");
			SMPL_YN = CTr.Replace(SMPL_YN, "'", "''");
			STOMA_YN = CTr.Replace(STOMA_YN, "'", "''");
			COLON_YN = CTr.Replace(COLON_YN, "'", "''");
			HLTH_KD = CTr.Replace(HLTH_KD, "'", "''");
			SAFE_YN = CTr.Replace(SAFE_YN, "'", "''");
			LUNG_CD = CTr.Replace(LUNG_CD, "'", "''");
			LUNG_DR = CTr.Replace(LUNG_DR, "'", "''");
			UBEH_YN = CTr.Replace(UBEH_YN, "'", "''");
			QUEST_KD = CTr.Replace(QUEST_KD, "'", "''");
			DRUG_DT = CTr.Replace(DRUG_DT, "'", "''");
			LOTT_AR = CTr.Replace(LOTT_AR, "'", "''");
			OCS_NO = CTr.Replace(OCS_NO, "'", "''");
			OCS_DR = CTr.Replace(OCS_DR, "'", "''");
			OCS_DV = CTr.Replace(OCS_DV, "'", "''");
			ORDER_LT = CTr.Replace(ORDER_LT, "'", "''");
			DISC_RC = CTr.Replace(DISC_RC, "'", "''");
			DISC_CD = CTr.Replace(DISC_CD, "'", "''");
			DISC_RT = CTr.Replace(DISC_RT, "'", "''");
			DISC_PR = CTr.Replace(DISC_PR, "'", "''");
			DISC_CPR = CTr.Replace(DISC_CPR, "'", "''");
			DISC_TX = CTr.Replace(DISC_TX, "'", "''");
			CNTB_RC = CTr.Replace(CNTB_RC, "'", "''");
			CNTB_CD = CTr.Replace(CNTB_CD, "'", "''");
			CNTB_RT = CTr.Replace(CNTB_RT, "'", "''");
			CNTB_PR = CTr.Replace(CNTB_PR, "'", "''");

			sql = "INSERT INTO RT_RSVT (RRT_RSVN_NO, RRT_RSVN_CD, RRT_WEB_ID, RRT_EXAM_DT, RRT_EXAM_SQ, RRT_EXAM_TM, RRT_ACPT_CD, RRT_ACPT_KD, ";
			sql += " RRT_PLCE_CD, RRT_CUST_NO, RRT_MMBR_CD, RRT_CHART_NO, RRT_PSNL_ID, RRT_PSNL_NM, RRT_SEX_CD, RRT_PSNL_AGE, RRT_ZIP_CD, RRT_ZIP_SQ, ";
			sql += " RRT_ZIP_AR, RRT_ROAD_AR, RRT_BLDG_NO, RRT_TEL_NO, RRT_MOBL_NO, RRT_EMAIL_AR, RRT_SEND_CD, RRT_SMS_YN, RRT_COMP_CD, RRT_DEPT_CD, ";
			sql += " RRT_DEPT_NM, RRT_DIVI_CD, RRT_ENTRY_DT, RRT_DIVI_NO, RRT_FAMY_CD, RRT_FAMY_NM, RRT_DRUG_YN, RRT_SALES_ID, RRT_EXAM_CD, RRT_HTSB_CD, ";
			sql += " RRT_HTSB_YN, RRT_HTPR_CD, RRT_EXAM_LT, RRT_EQUIP_TM, RRT_EQUIP_LT, RRT_INSU_NO, RRT_INSU_CD, RRT_ENTY_CD, RRT_ASSO_CD, RRT_CNTR_CD, ";
			sql += " RRT_HEPA_YN, RRT_ORAL_YN, RRT_STOMA_CD, RRT_COLON_CD, RRT_LIVER_CD, RRT_BAST_CD, RRT_UTER_CD, RRT_STOMA_DR, RRT_COLON_DR, RRT_LIVER_DR, ";
			sql += " RRT_BAST_DR, RRT_UTER_DR, RRT_HDMD_YN, RRT_SPRT_PR, RRT_COMP_PR, RRT_PSNL_PR, RRT_HLTH_PR, RRT_PYER_CD, RRT_CMPY_CD, RRT_PRPY_CD, RRT_RECE_NO, ";
			sql += " RRT_RECE_KD, RRT_NHIC_TX, RRT_RSVN_TX, RRT_INPT_ID, RRT_INPT_DTT, RRT_HCV_YN, RRT_BLOOD_YN, RRT_ASPL_YN, RRT_STOOL_YN, RRT_SPSB_CD, RRT_CVSB_CD, ";
			sql += " RRT_EMSB_CD, RRT_ETSB_CD, RRT_SPSB_YN, RRT_CVSB_YN, RRT_EMSB_YN, RRT_ETSB_YN, RRT_SPCL_CD, RRT_SPHT_CD, RRT_SDMD_YN, RRT_SPCL_PR, RRT_CNCL_YN, ";
			sql += " RRT_SMPL_YN, RRT_STOMA_YN, RRT_COLON_YN, RRT_HLTH_KD, RRT_SAFE_YN, RRT_LUNG_CD, RRT_LUNG_DR, RRT_UBEH_YN, RRT_QUEST_KD, RRT_DRUG_DT, ";
			sql += " RRT_LOTT_AR, RRT_OCS_NO, RRT_OCS_DR, RRT_OCS_DV, RRT_ORDER_LT, RRT_DISC_RC, RRT_DISC_CD, RRT_DISC_RT, RRT_DISC_PR, RRT_DISC_CPR, RRT_DISC_TX, ";
			sql += " RRT_CNTB_RC,  RRT_CNTB_CD,  RRT_CNTB_RT,  RRT_CNTB_PR) ";
			sql += " VALUES (";
			sql += "  '" + RSVN_NO + "'";
			sql += ", '" + RSVN_CD + "'";
			sql += ", '" + WEB_ID + "'";
			sql += ", '" + EXAM_DT + "'";
			sql += ", '" + EXAM_SQ + "'";
			sql += ", '" + EXAM_TM + "'";
			sql += ", '" + ACPT_CD + "'";
			sql += ", '" + ACPT_KD + "'";
			sql += ", '" + PLCE_CD + "'";
			sql += ", '" + CUST_NO + "'";
			sql += ", '" + MMBR_CD + "'";
			sql += ", '" + CHART_NO + "'";
			sql += ", '" + PSNL_ID + "'";
			sql += ", '" + PSNL_NM + "'";
			sql += ", '" + SEX_CD + "'";
			sql += ", '" + PSNL_AGE + "'";
			sql += ", '" + ZIP_CD + "'";
			sql += ", '" + ZIP_SQ + "'";
			sql += ", '" + ZIP_AR + "'";
			sql += ", '" + DETAIL_AR + "'";
			sql += ", '" + BLDG_NO + "'";
			sql += ", '" + TEL_NO + "'";
			sql += ", '" + MOBL_NO + "'";
			sql += ", '" + EMAIL_AR + "'";
			sql += ", '" + SEND_CD + "'";
			sql += ", '" + SMS_YN + "'";
			sql += ", '" + COMP_CD + "'";
			sql += ", '" + DEPT_CD + "'";
			sql += ", '" + DEPT_NM + "'";
			sql += ", '" + DIVI_CD + "'";
			sql += ", '" + ENTRY_DT + "'";
			sql += ", '" + DIVI_NO + "'";
			sql += ", '" + FAMY_CD + "'";
			sql += ", '" + FAMY_NM + "'";
			sql += ", '" + DRUG_YN + "'";
			sql += ", '" + SALES_ID + "'";
			sql += ", '" + EXAM_CD + "'";
			sql += ", '" + HTSB_CD + "'";
			sql += ", '" + HTSB_YN + "'";
			sql += ", '" + HTPR_CD + "'";
			sql += ", '" + EXAM_LT + "'";
			sql += ", '" + EQUIP_TM + "'";
			sql += ", '" + EQUIP_LT + "'";
			sql += ", '" + INSU_NO + "'";
			sql += ", '" + INSU_CD + "'";
			sql += ", '" + ENTY_CD + "'";
			sql += ", '" + ASSO_CD + "'";
			sql += ", '" + CNTR_CD + "'";
			sql += ", '" + HEPA_YN + "'";
			sql += ", '" + ORAL_YN + "'";
			sql += ", '" + STOMA_CD + "'";
			sql += ", '" + COLON_CD + "'";
			sql += ", '" + LIVER_CD + "'";
			sql += ", '" + BAST_CD + "'";
			sql += ", '" + UTER_CD + "'";
			sql += ", '" + STOMA_DR + "'";
			sql += ", '" + COLON_DR + "'";
			sql += ", '" + LIVER_DR + "'";
			sql += ", '" + BAST_DR + "'";
			sql += ", '" + UTER_DR + "'";
			sql += ", '" + HDMD_YN + "'";
			sql += ", '" + SPRT_PR + "'";
			sql += ", '" + COMP_PR + "'";
			sql += ", '" + PSNL_PR + "'";
			sql += ", '" + HLTH_PR + "'";
			sql += ", '" + PYER_CD + "'";
			sql += ", '" + CMPY_CD + "'";
			sql += ", '" + PRPY_CD + "'";
			sql += ", '" + RECE_NO + "'";
			sql += ", '" + RECE_KD + "'";
			sql += ", '" + NHIC_TX + "'";
			sql += ", '" + RMK_TX + "'";
			sql += ", '" + INPT_ID + "'";
			sql += ", SYSDATE";
			sql += ", '" + HCV_YN + "'";
			sql += ", '" + BLOOD_YN + "'";
			sql += ", '" + ASPL_YN + "'";
			sql += ", '" + STOOL_YN + "'";
			sql += ", '" + SPSB_CD + "'";
			sql += ", '" + CVSB_CD + "'";
			sql += ", '" + EMSB_CD + "'";
			sql += ", '" + ETSB_CD + "'";
			sql += ", '" + SPSB_YN + "'";
			sql += ", '" + CVSB_YN + "'";
			sql += ", '" + EMSB_YN + "'";
			sql += ", '" + ETSB_YN + "'";
			sql += ", '" + SPCL_CD + "'";
			sql += ", '" + SPHT_CD + "'";
			sql += ", '" + SDMD_YN + "'";
			sql += ", '" + SPCL_PR + "'";
			sql += ", '" + CNCL_YN + "'";
			sql += ", '" + SMPL_YN + "'";
			sql += ", '" + STOMA_YN + "'";
			sql += ", '" + COLON_YN + "'";
			sql += ", '" + HLTH_KD + "'";
			sql += ", '" + SAFE_YN + "'";
			sql += ", '" + LUNG_CD + "'";
			sql += ", '" + LUNG_DR + "'";
			sql += ", '" + UBEH_YN + "'";
			sql += ", '" + QUEST_KD + "'";
			sql += ", '" + DRUG_DT + "'";
			sql += ", '" + LOTT_AR + "'";
			sql += ", '" + OCS_NO + "'";
			sql += ", '" + OCS_DR + "'";
			sql += ", '" + OCS_DV + "'";
			sql += ", '" + ORDER_LT + "'";
			sql += ", '" + DISC_RC + "'";
			sql += ", '" + DISC_CD + "'";
			sql += ", '" + DISC_RT + "'";
			sql += ", '" + DISC_PR + "'";
			sql += ", '" + DISC_CPR + "'";
			sql += ", '" + DISC_TX + "'";
			sql += ", '" + CNTB_RC + "'";
			sql += ", '" + CNTB_CD + "'";
			sql += ", '" + CNTB_RT + "'";
			sql += ", '" + CNTB_PR + "'";
			sql += ")";

			argStmtExec.executeUpdate(sql);

		} catch (Exception e) {

			throw new FuncException(e.toString(), sql);
		}

		return sql;
	}
%>
