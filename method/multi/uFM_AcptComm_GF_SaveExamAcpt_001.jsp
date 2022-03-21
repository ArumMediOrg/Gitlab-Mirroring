<%!
	public String uFM_AcptComm_GF_SaveExamAcpt_001(Statement argStmtExec, HashMap argHtMethod) throws Exception {
	
		String sql;

		String SAVE_KD = (String) argHtMethod.get("SAVE_KD");
		String EXAM_DT = (String) argHtMethod.get("EXAM_DT");
		String EXAM_SQ = (String) argHtMethod.get("EXAM_SQ");
		String RSVN_NO = (String) argHtMethod.get("RSVN_NO");
		String ACPT_CD = (String) argHtMethod.get("ACPT_CD");
		String ACPT_KD = (String) argHtMethod.get("ACPT_KD");
		String PLCE_CD = (String) argHtMethod.get("PLCE_CD");
		String CUST_NO = (String) argHtMethod.get("CUST_NO");
		String MMBR_CD = (String) argHtMethod.get("MMBR_CD");
		String CHART_NO = (String) argHtMethod.get("CHART_NO");
		String PSNL_NM = (String) argHtMethod.get("PSNL_NM");
		String SEX_CD = (String) argHtMethod.get("SEX_CD");
		String PSNL_AGE = (String) argHtMethod.get("PSNL_AGE");
		String ZIP_CD = (String) argHtMethod.get("ZIP_CD");
		String ZIP_SQ = (String) argHtMethod.get("ZIP_SQ");
		String ZIP_AR = (String) argHtMethod.get("ZIP_AR");
		String ROAD_AR = (String) argHtMethod.get("ROAD_AR");
		String BLDG_NO = (String) argHtMethod.get("BLDG_NO");
		String TEL_NO = (String) argHtMethod.get("TEL_NO");
		String MOBL_NO = (String) argHtMethod.get("MOBL_NO");
		String EMAIL_AR = (String) argHtMethod.get("EMAIL_AR");
		String SEND_CD = (String) argHtMethod.get("SEND_CD");
		String SMS_YN = (String) argHtMethod.get("SMS_YN");
		String COMP_CD = (String) argHtMethod.get("COMP_CD");
		String COTK_CD = (String) argHtMethod.get("COTK_CD");
		String NOTE_YN = (String) argHtMethod.get("NOTE_YN");
		String DEPT_CD = (String) argHtMethod.get("DEPT_CD");
		String DEPT_NM = (String) argHtMethod.get("DEPT_NM");
		String DIVI_CD = (String) argHtMethod.get("DIVI_CD");
		String ENTRY_DT = (String) argHtMethod.get("ENTRY_DT");
		String DIVI_NO = (String) argHtMethod.get("DIVI_NO");
		String DIVI_CS = (String) argHtMethod.get("DIVI_CS");
		String CLSS_KD = (String) argHtMethod.get("CLSS_KD");
		String FAMY_CD = (String) argHtMethod.get("FAMY_CD");
		String FAMY_NM = (String) argHtMethod.get("FAMY_NM");
		String RFID_NO = (String) argHtMethod.get("RFID_NO");
		String FOOD_YN = (String) argHtMethod.get("FOOD_YN");
		String SALES_ID = (String) argHtMethod.get("SALES_ID");
		String EXAM_CD = (String) argHtMethod.get("EXAM_CD");
		String HTSB_CD = (String) argHtMethod.get("HTSB_CD");
		String SPSB_CD = (String) argHtMethod.get("SPSB_CD");
		String CVSB_CD = (String) argHtMethod.get("CVSB_CD");
		String EMSB_CD = (String) argHtMethod.get("EMSB_CD");
		String ETSB_CD = (String) argHtMethod.get("ETSB_CD");
		String HTSB_YN = (String) argHtMethod.get("HTSB_YN");
		String SPSB_YN = (String) argHtMethod.get("SPSB_YN");
		String CVSB_YN = (String) argHtMethod.get("CVSB_YN");
		String EMSB_YN = (String) argHtMethod.get("EMSB_YN");
		String ETSB_YN = (String) argHtMethod.get("ETSB_YN");
		String HTPR_CD = (String) argHtMethod.get("HTPR_CD");
		String SPPR_CD = (String) argHtMethod.get("SPPR_CD");
		String CVPR_CD = (String) argHtMethod.get("CVPR_CD");
		String EMPR_CD = (String) argHtMethod.get("EMPR_CD");
		String ETPR_CD = (String) argHtMethod.get("ETPR_CD");
		String CNCL_CD = (String) argHtMethod.get("CNCL_CD");
		String MNGT_YR = (String) argHtMethod.get("MNGT_YR");
		String MNGT_HTYR = (String) argHtMethod.get("MNGT_HTYR");
		String MNGT_SPYM = (String) argHtMethod.get("MNGT_SPYM");
		String EXAM_LT = (String) argHtMethod.get("EXAM_LT");
		String HTSB_LT = (String) argHtMethod.get("HTSB_LT");
		String SPSB_LT = (String) argHtMethod.get("SPSB_LT");
		String CVSB_LT = (String) argHtMethod.get("CVSB_LT");
		String EMSB_LT = (String) argHtMethod.get("EMSB_LT");
		String ETSB_LT = (String) argHtMethod.get("ETSB_LT");
		String ADD_LT = (String) argHtMethod.get("ADD_LT");
		String SPCL_LT = (String) argHtMethod.get("SPCL_LT");
		String ORDER_LT = (String) argHtMethod.get("ORDER_LT");
		String SPCL_CD = (String) argHtMethod.get("SPCL_CD");
		String SPHT_CD = (String) argHtMethod.get("SPHT_CD");
		String INSU_NO = (String) argHtMethod.get("INSU_NO");
		String INSU_CD = (String) argHtMethod.get("INSU_CD");
		String ENTY_CD = (String) argHtMethod.get("ENTY_CD");
		String ASSO_CD = (String) argHtMethod.get("ASSO_CD");
		String CNTR_CD = (String) argHtMethod.get("CNTR_CD");
		String ARMY_CD = (String) argHtMethod.get("ARMY_CD");
		String HEPA_YN = (String) argHtMethod.get("HEPA_YN");
		String ORAL_YN = (String) argHtMethod.get("ORAL_YN");
		String CANAD_YN = (String) argHtMethod.get("CANAD_YN");
		String HOLIDAY_YN = (String) argHtMethod.get("HOLIDAY_YN");
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
		String SDMD_YN = (String) argHtMethod.get("SDMD_YN");
		String SPRT_PR = (String) argHtMethod.get("SPRT_PR");
		String COMP_PR = (String) argHtMethod.get("COMP_PR");
		String PSNL_PR = (String) argHtMethod.get("PSNL_PR");
		String HLTH_PR = (String) argHtMethod.get("HLTH_PR");
		String SPCL_PR = (String) argHtMethod.get("SPCL_PR");
		String CAN_PR = (String) argHtMethod.get("CAN_PR");
		String ORAL_PR = (String) argHtMethod.get("ORAL_PR");
		String COMPR_PR = (String) argHtMethod.get("COMPR_PR");
		String PSNLR_PR = (String) argHtMethod.get("PSNLR_PR");
		String HLTHR_PR = (String) argHtMethod.get("HLTHR_PR");
		String SPCLR_PR = (String) argHtMethod.get("SPCLR_PR");
		String CANR_PR = (String) argHtMethod.get("CANR_PR");
		String ORALR_PR = (String) argHtMethod.get("ORALR_PR");
		String PYER_CD = (String) argHtMethod.get("PYER_CD");
		String CMPY_CD = (String) argHtMethod.get("CMPY_CD");
		String PRPY_CD = (String) argHtMethod.get("PRPY_CD");
		String RECE_NO = (String) argHtMethod.get("RECE_NO");
		String RECE_KD = (String) argHtMethod.get("RECE_KD");
		String RSLT_CD = (String) argHtMethod.get("RSLT_CD");
		String BLRT_CD = (String) argHtMethod.get("BLRT_CD");
		String DEFER_KD = (String) argHtMethod.get("DEFER_KD");
		String ORDER_YN = (String) argHtMethod.get("ORDER_YN");
		String NHIC_TX = (String) argHtMethod.get("NHIC_TX");
		String ACPT_TX = (String) argHtMethod.get("ACPT_TX");
		String INPT_ID = (String) argHtMethod.get("INPT_ID");
		String MODI_ID = (String) argHtMethod.get("MODI_ID");
		String CANAD_KD = (String) argHtMethod.get("CANAD_KD");
		String SND_YN = (String) argHtMethod.get("SND_YN");
		String COMP_CD2 = (String) argHtMethod.get("COMP_CD2");
		String LIFE_YN = (String) argHtMethod.get("LIFE_YN");
		String TOTAL_YN = (String) argHtMethod.get("TOTAL_YN");
		String HCV_YN = (String) argHtMethod.get("HCV_YN");
		String EXEC_ID = (String) argHtMethod.get("EXEC_ID");
		String CANPR_KD = (String) argHtMethod.get("CANPR_KD");
		String HLTH_KD = (String) argHtMethod.get("HLTH_KD");
		String SAFE_YN = (String) argHtMethod.get("SAFE_YN");
		String ADD_DT = (String) argHtMethod.get("ADD_DT");
		String LUNG_CD = (String) argHtMethod.get("LUNG_CD");
		String LUNG_DR = (String) argHtMethod.get("LUNG_DR");
		String LUNG_KD = (String) argHtMethod.get("LUNG_KD");
		String UBEH_YN = (String) argHtMethod.get("UBEH_YN");

		//
		if(SAVE_KD == null) { SAVE_KD = ""; }
		if(EXAM_DT == null) { EXAM_DT = ""; }
		if(EXAM_SQ == null) { EXAM_SQ = ""; }
		if(RSVN_NO == null) { RSVN_NO = ""; }
		if(ACPT_CD == null) { ACPT_CD = ""; }
		if(ACPT_KD == null) { ACPT_KD = ""; }
		if(PLCE_CD == null) { PLCE_CD = ""; }
		if(CUST_NO == null) { CUST_NO = ""; }
		if(MMBR_CD == null) { MMBR_CD = ""; }
		if(CHART_NO == null) { CHART_NO = ""; }
		if(PSNL_NM == null) { PSNL_NM = ""; }
		if(SEX_CD == null) { SEX_CD = ""; }
		if(PSNL_AGE == null) { PSNL_AGE = ""; }
		if(ZIP_CD == null) { ZIP_CD = ""; }
		if(ZIP_SQ == null) { ZIP_SQ = ""; }
		if(ZIP_AR == null) { ZIP_AR = ""; }
		if(ROAD_AR == null) { ROAD_AR = ""; }
		if(BLDG_NO == null) { BLDG_NO = ""; }
		if(TEL_NO == null) { TEL_NO = ""; }
		if(MOBL_NO == null) { MOBL_NO = ""; }
		if(EMAIL_AR == null) { EMAIL_AR = ""; }
		if(SEND_CD == null) { SEND_CD = ""; }
		if(SMS_YN == null) { SMS_YN = ""; }
		if(COMP_CD == null) { COMP_CD = ""; }
		if(COTK_CD == null) { COTK_CD = ""; }
		if(NOTE_YN == null) { NOTE_YN = ""; }
		if(DEPT_CD == null) { DEPT_CD = ""; }
		if(DEPT_NM == null) { DEPT_NM = ""; }
		if(DIVI_CD == null) { DIVI_CD = ""; }
		if(ENTRY_DT == null) { ENTRY_DT = ""; }
		if(DIVI_NO == null) { DIVI_NO = ""; }
		if(DIVI_CS == null) { DIVI_CS = ""; }
		if(CLSS_KD == null) { CLSS_KD = ""; }
		if(FAMY_CD == null) { FAMY_CD = ""; }
		if(FAMY_NM == null) { FAMY_NM = ""; }
		if(RFID_NO == null) { RFID_NO = ""; }
		if(FOOD_YN == null) { FOOD_YN = ""; }
		if(SALES_ID == null) { SALES_ID = ""; }
		if(EXAM_CD == null) { EXAM_CD = ""; }
		if(HTSB_CD == null) { HTSB_CD = ""; }
		if(SPSB_CD == null) { SPSB_CD = ""; }
		if(CVSB_CD == null) { CVSB_CD = ""; }
		if(EMSB_CD == null) { EMSB_CD = ""; }
		if(ETSB_CD == null) { ETSB_CD = ""; }
		if(HTSB_YN == null) { HTSB_YN = ""; }
		if(SPSB_YN == null) { SPSB_YN = ""; }
		if(CVSB_YN == null) { CVSB_YN = ""; }
		if(EMSB_YN == null) { EMSB_YN = ""; }
		if(ETSB_YN == null) { ETSB_YN = ""; }
		if(HTPR_CD == null) { HTPR_CD = ""; }
		if(SPPR_CD == null) { SPPR_CD = ""; }
		if(CVPR_CD == null) { CVPR_CD = ""; }
		if(EMPR_CD == null) { EMPR_CD = ""; }
		if(ETPR_CD == null) { ETPR_CD = ""; }
		if(CNCL_CD == null) { CNCL_CD = ""; }
		if(MNGT_YR == null) { MNGT_YR = ""; }
		if(MNGT_HTYR == null) { MNGT_HTYR = ""; }
		if(MNGT_SPYM == null) { MNGT_SPYM = ""; }
		if(EXAM_LT == null) { EXAM_LT = ""; }
		if(HTSB_LT == null) { HTSB_LT = ""; }
		if(SPSB_LT == null) { SPSB_LT = ""; }
		if(CVSB_LT == null) { CVSB_LT = ""; }
		if(EMSB_LT == null) { EMSB_LT = ""; }
		if(ETSB_LT == null) { ETSB_LT = ""; }
		if(ADD_LT == null) { ADD_LT = ""; }
		if(SPCL_LT == null) { SPCL_LT = ""; }
		if(ORDER_LT == null) { ORDER_LT = ""; }
		if(SPCL_CD == null) { SPCL_CD = ""; }
		if(SPHT_CD == null) { SPHT_CD = ""; }
		if(INSU_NO == null) { INSU_NO = ""; }
		if(INSU_CD == null) { INSU_CD = ""; }
		if(ENTY_CD == null) { ENTY_CD = ""; }
		if(ASSO_CD == null) { ASSO_CD = ""; }
		if(CNTR_CD == null) { CNTR_CD = ""; }
		if(ARMY_CD == null) { ARMY_CD = ""; }
		if(HEPA_YN == null) { HEPA_YN = ""; }
		if(ORAL_YN == null) { ORAL_YN = ""; }
		if(CANAD_YN == null) { CANAD_YN = ""; }
		if(HOLIDAY_YN == null) { HOLIDAY_YN = ""; }
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
		if(SDMD_YN == null) { SDMD_YN = ""; }
		if(SPRT_PR == null) { SPRT_PR = ""; }
		if(COMP_PR == null) { COMP_PR = ""; }
		if(PSNL_PR == null) { PSNL_PR = ""; }
		if(HLTH_PR == null) { HLTH_PR = ""; }
		if(SPCL_PR == null) { SPCL_PR = ""; }
		if(CAN_PR == null) { CAN_PR = ""; }
		if(ORAL_PR == null) { ORAL_PR = ""; }
		if(COMPR_PR == null) { COMPR_PR = ""; }
		if(PSNLR_PR == null) { PSNLR_PR = ""; }
		if(HLTHR_PR == null) { HLTHR_PR = ""; }
		if(SPCLR_PR == null) { SPCLR_PR = ""; }
		if(CANR_PR == null) { CANR_PR = ""; }
		if(ORALR_PR == null) { ORALR_PR = ""; }
		if(PYER_CD == null) { PYER_CD = ""; }
		if(CMPY_CD == null) { CMPY_CD = ""; }
		if(PRPY_CD == null) { PRPY_CD = ""; }
		if(RECE_NO == null) { RECE_NO = ""; }
		if(RECE_KD == null) { RECE_KD = ""; }
		if(RSLT_CD == null) { RSLT_CD = ""; }
		if(BLRT_CD == null) { BLRT_CD = ""; }
		if(DEFER_KD == null) { DEFER_KD = ""; }
		if(ORDER_YN == null) { ORDER_YN = ""; }
		if(NHIC_TX == null) { NHIC_TX = ""; }
		if(ACPT_TX == null) { ACPT_TX = ""; }
		if(INPT_ID == null) { INPT_ID = ""; }
		if(MODI_ID == null) { MODI_ID = ""; }
		if(CANAD_KD == null) { CANAD_KD = ""; }
		if(SND_YN == null) { SND_YN = ""; }
		if(COMP_CD2 == null) { COMP_CD2 = ""; }
		if(LIFE_YN == null) { LIFE_YN = ""; }
		if(TOTAL_YN == null) { TOTAL_YN = ""; }
		if(HCV_YN == null) { HCV_YN = ""; }
		if(EXEC_ID == null) { EXEC_ID = ""; }
		if(CANPR_KD == null) { CANPR_KD = ""; }
		if(HLTH_KD == null) { HLTH_KD = ""; }
		if(SAFE_YN == null) { SAFE_YN = ""; }
		if(ADD_DT == null) { ADD_DT = ""; }
		if(LUNG_CD == null) { LUNG_CD = ""; }
		if(LUNG_DR == null) { LUNG_DR = ""; }
		if(LUNG_KD == null) { LUNG_KD = ""; }
		if(UBEH_YN == null) { UBEH_YN = ""; }

		//
		if(SAVE_KD.equals("I")) {

			sql = "INSERT INTO ET_EXAM_ACPT (EEA_EXAM_DT, EEA_EXAM_SQ, EEA_ACPT_TM, EEA_RSVN_NO, EEA_ACPT_CD, EEA_ACPT_KD, EEA_PLCE_CD, EEA_CUST_NO, EEA_MMBR_CD, EEA_CHART_NO, EEA_PSNL_NM, EEA_SEX_CD, EEA_PSNL_AGE, EEA_ZIP_CD, EEA_ZIP_SQ, EEA_ZIP_AR, EEA_ROAD_AR, EEA_BLDG_NO, EEA_TEL_NO, EEA_MOBL_NO, EEA_EMAIL_AR, EEA_SEND_CD, EEA_SEND_DT, EEA_SMS_YN, EEA_COMP_CD, EEA_COTK_CD, EEA_NOTE_YN, EEA_DEPT_CD, EEA_DEPT_NM, EEA_DIVI_CD, EEA_ENTRY_DT, EEA_DIVI_NO, EEA_DIVI_CS, EEA_CLSS_KD, EEA_FAMY_CD, EEA_FAMY_NM, EEA_RFID_NO, EEA_FOOD_YN, EEA_SALES_ID, EEA_EXAM_CD, EEA_HTSB_CD, EEA_SPSB_CD, EEA_CVSB_CD, EEA_EMSB_CD, EEA_ETSB_CD, EEA_HTSB_YN, EEA_SPSB_YN, EEA_CVSB_YN, EEA_EMSB_YN, EEA_ETSB_YN, EEA_HTPR_CD, EEA_SPPR_CD, EEA_CVPR_CD, EEA_EMPR_CD, EEA_ETPR_CD, EEA_CNCL_CD, EEA_MNGT_YR, EEA_MNGT_HTYR, EEA_MNGT_SPYM, EEA_EXAM_LT, EEA_HTSB_LT, EEA_SPSB_LT, EEA_CVSB_LT, EEA_EMSB_LT, EEA_ETSB_LT, EEA_ADD_LT, EEA_SPCL_LT, EEA_ORDER_LT, EEA_SPCL_CD, EEA_SPHT_CD, EEA_INSU_NO, EEA_INSU_CD, EEA_ENTY_CD, EEA_ASSO_CD, EEA_CNTR_CD, EEA_ARMY_CD, EEA_HEPA_YN, EEA_ORAL_YN, EEA_CANAD_YN, EEA_HOLIDAY_YN, EEA_STOMA_CD, EEA_COLON_CD, EEA_LIVER_CD, EEA_BAST_CD, EEA_UTER_CD, EEA_STOMA_DR, EEA_COLON_DR, EEA_LIVER_DR, EEA_BAST_DR, EEA_UTER_DR, EEA_CNCR_DT, EEA_HDMD_YN, EEA_SDMD_YN, EEA_SPRT_PR, EEA_COMP_PR, EEA_PSNL_PR, EEA_HLTH_PR, EEA_SPCL_PR, EEA_CAN_PR, EEA_ORAL_PR, EEA_COMPR_PR, EEA_PSNLR_PR, EEA_HLTHR_PR, EEA_SPCLR_PR, EEA_CANR_PR, EEA_ORALR_PR, EEA_PYER_CD, EEA_CMPY_CD, EEA_PRPY_CD, EEA_RECE_NO, EEA_RECE_KD, EEA_RSLT_CD, EEA_BLRT_CD, EEA_DEFER_KD, EEA_ORDER_YN, EEA_NHIC_TX, EEA_ACPT_TX, EEA_INPT_ID, EEA_INPT_DTT, EEA_MODI_ID, EEA_MODI_DTT, EEA_CANAD_KD, EEA_2ND_YN, EEA_COMP_CD2, EEA_LIFE_YN, EEA_TOTAL_YN, EEA_HCV_YN, EEA_LABEL_DT, EEA_EXEC_ID, EEA_CANPR_KD, EEA_HLTH_KD, EEA_SAFE_YN, EEA_ADD_DT, EEA_LUNG_CD, EEA_LUNG_DR, EEA_LUNG_KD, EEA_UBEH_YN) VALUES (";
			sql += "  '" + EXAM_DT + "'";
			sql += ", '" + EXAM_SQ + "'";
			sql += ", TO_CHAR(SYSDATE, 'hh24:mi:ss')";
			sql += ", '" + RSVN_NO + "'";
			sql += ", '" + ACPT_CD + "'";
			sql += ", '" + ACPT_KD + "'";
			sql += ", '" + PLCE_CD + "'";
			sql += ", '" + CUST_NO + "'";
			sql += ", '" + MMBR_CD + "'";
			sql += ", '" + CHART_NO + "'";
			sql += ", '" + PSNL_NM + "'";
			sql += ", '" + SEX_CD + "'";
			sql += ", '" + PSNL_AGE + "'";
			sql += ", '" + ZIP_CD + "'";
			sql += ", '" + ZIP_SQ + "'";
			sql += ", '" + ZIP_AR + "'";
			sql += ", '" + ROAD_AR + "'";
			sql += ", '" + BLDG_NO + "'";
			sql += ", '" + TEL_NO + "'";
			sql += ", '" + MOBL_NO + "'";
			sql += ", '" + EMAIL_AR + "'";
			sql += ", '" + SEND_CD + "'";
			sql += ", NULL";
			sql += ", '" + SMS_YN + "'";
			sql += ", '" + COMP_CD + "'";
			sql += ", '" + COTK_CD + "'";
			sql += ", '" + NOTE_YN + "'";
			sql += ", '" + DEPT_CD + "'";
			sql += ", '" + DEPT_NM + "'";
			sql += ", '" + DIVI_CD + "'";
			sql += ", '" + ENTRY_DT + "'";
			sql += ", '" + DIVI_NO + "'";
			sql += ", '" + DIVI_CS + "'";
			sql += ", '" + CLSS_KD + "'";
			sql += ", '" + FAMY_CD + "'";
			sql += ", '" + FAMY_NM + "'";
			sql += ", '" + RFID_NO + "'";
			sql += ", '" + FOOD_YN + "'";
			sql += ", '" + SALES_ID + "'";
			sql += ", '" + EXAM_CD + "'";
			sql += ", '" + HTSB_CD + "'";
			sql += ", '" + SPSB_CD + "'";
			sql += ", '" + CVSB_CD + "'";
			sql += ", '" + EMSB_CD + "'";
			sql += ", '" + ETSB_CD + "'";
			sql += ", '" + HTSB_YN + "'";
			sql += ", '" + SPSB_YN + "'";
			sql += ", '" + CVSB_YN + "'";
			sql += ", '" + EMSB_YN + "'";
			sql += ", '" + ETSB_YN + "'";
			sql += ", '" + HTPR_CD + "'";
			sql += ", '" + SPPR_CD + "'";
			sql += ", '" + CVPR_CD + "'";
			sql += ", '" + EMPR_CD + "'";
			sql += ", '" + ETPR_CD + "'";
			sql += ", '" + CNCL_CD + "'";
			sql += ", '" + MNGT_YR + "'";
			sql += ", '" + MNGT_HTYR + "'";
			sql += ", '" + MNGT_SPYM + "'";
			sql += ", '" + EXAM_LT + "'";
			sql += ", '" + HTSB_LT + "'";
			sql += ", '" + SPSB_LT + "'";
			sql += ", '" + CVSB_LT + "'";
			sql += ", '" + EMSB_LT + "'";
			sql += ", '" + ETSB_LT + "'";
			sql += ", '" + ADD_LT + "'";
			sql += ", '" + SPCL_LT + "'";
			sql += ", '" + ORDER_LT + "'";
			sql += ", '" + SPCL_CD + "'";
			sql += ", '" + SPHT_CD + "'";
			sql += ", '" + INSU_NO + "'";
			sql += ", '" + INSU_CD + "'";
			sql += ", '" + ENTY_CD + "'";
			sql += ", '" + ASSO_CD + "'";
			sql += ", '" + CNTR_CD + "'";
			sql += ", '" + ARMY_CD + "'";
			sql += ", '" + HEPA_YN + "'";
			sql += ", '" + ORAL_YN + "'";
			sql += ", '" + CANAD_YN + "'";
			sql += ", '" + HOLIDAY_YN + "'";
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
			sql += ", NULL";
			sql += ", '" + HDMD_YN + "'";
			sql += ", '" + SDMD_YN + "'";
			sql += ", '" + SPRT_PR + "'";
			sql += ", '" + COMP_PR + "'";
			sql += ", '" + PSNL_PR + "'";
			sql += ", '" + HLTH_PR + "'";
			sql += ", '" + SPCL_PR + "'";
			sql += ", '" + CAN_PR + "'";
			sql += ", '" + ORAL_PR + "'";
			sql += ", '" + COMPR_PR + "'";
			sql += ", '" + PSNLR_PR + "'";
			sql += ", '" + HLTHR_PR + "'";
			sql += ", '" + SPCLR_PR + "'";
			sql += ", '" + CANR_PR + "'";
			sql += ", '" + ORALR_PR + "'";
			sql += ", '" + PYER_CD + "'";
			sql += ", '" + CMPY_CD + "'";
			sql += ", '" + PRPY_CD + "'";
			sql += ", '" + RECE_NO + "'";
			sql += ", '" + RECE_KD + "'";
			sql += ", '" + RSLT_CD + "'";
			sql += ", '" + BLRT_CD + "'";
			sql += ", '" + DEFER_KD + "'";
			sql += ", '" + ORDER_YN + "'";
			sql += ", '" + NHIC_TX + "'";
			sql += ", '" + ACPT_TX + "'";
			sql += ", '" + INPT_ID + "'";
			sql += ", SYSDATE";
			sql += ", '" + MODI_ID + "'";
			sql += ", SYSDATE";
			sql += ", '" + CANAD_KD + "'";
			sql += ", '" + SND_YN + "'";
			sql += ", '" + COMP_CD2 + "'";
			sql += ", '" + LIFE_YN + "'";
			sql += ", '" + TOTAL_YN + "'";
			sql += ", '" + HCV_YN + "'";
			sql += ", NULL";
			sql += ", '" + EXEC_ID + "'";
			sql += ", '" + CANPR_KD + "'";
			sql += ", '" + HLTH_KD + "'";
			sql += ", '" + SAFE_YN + "'";
			sql += ", '" + ADD_DT + "'";
			sql += ", '" + LUNG_CD + "'";
			sql += ", '" + LUNG_DR + "'";
			sql += ", '" + LUNG_KD + "'";
			sql += ", '" + UBEH_YN + "'";
			sql += ")";

			argStmtExec.executeUpdate(sql);
		} else {
		
			sql = "UPDATE ET_EXAM_ACPT SET ";
			sql += "  EEA_ACPT_CD = '" + ACPT_CD + "'";
			sql += ", EEA_ACPT_KD = '" + ACPT_KD + "'";
			sql += ", EEA_PLCE_CD = '" + PLCE_CD + "'";
			sql += ", EEA_CUST_NO = '" + CUST_NO + "'";
			sql += ", EEA_MMBR_CD = '" + MMBR_CD + "'";
			sql += ", EEA_CHART_NO = '" + CHART_NO + "'";
			sql += ", EEA_PSNL_NM = '" + PSNL_NM + "'";
			sql += ", EEA_SEX_CD = '" + SEX_CD + "'";
			sql += ", EEA_PSNL_AGE = '" + PSNL_AGE + "'";
			sql += ", EEA_ZIP_CD = '" + ZIP_CD + "'";
			sql += ", EEA_ZIP_SQ = '" + ZIP_SQ + "'";
			sql += ", EEA_ZIP_AR = '" + ZIP_AR + "'";
			sql += ", EEA_ROAD_AR = '" + ROAD_AR + "'";
			sql += ", EEA_BLDG_NO = '" + BLDG_NO + "'";
			sql += ", EEA_TEL_NO = '" + TEL_NO + "'";
			sql += ", EEA_MOBL_NO = '" + MOBL_NO + "'";
			sql += ", EEA_EMAIL_AR = '" + EMAIL_AR + "'";
			sql += ", EEA_SEND_CD = '" + SEND_CD + "'";
			sql += ", EEA_SMS_YN = '" + SMS_YN + "'";
			sql += ", EEA_COMP_CD = '" + COMP_CD + "'";
			sql += ", EEA_COTK_CD = '" + COTK_CD + "'";
			sql += ", EEA_NOTE_YN = '" + NOTE_YN + "'";
			sql += ", EEA_DEPT_CD = '" + DEPT_CD + "'";
			sql += ", EEA_DEPT_NM = '" + DEPT_NM + "'";
			sql += ", EEA_DIVI_CD = '" + DIVI_CD + "'";
			sql += ", EEA_ENTRY_DT = '" + ENTRY_DT + "'";
			sql += ", EEA_DIVI_NO = '" + DIVI_NO + "'";
			sql += ", EEA_DIVI_CS = '" + DIVI_CS + "'";
			sql += ", EEA_CLSS_KD = '" + CLSS_KD + "'";
			sql += ", EEA_FAMY_CD = '" + FAMY_CD + "'";
			sql += ", EEA_FAMY_NM = '" + FAMY_NM + "'";
			sql += ", EEA_RFID_NO = '" + RFID_NO + "'";
			sql += ", EEA_FOOD_YN = '" + FOOD_YN + "'";
			sql += ", EEA_SALES_ID = '" + SALES_ID + "'";
			sql += ", EEA_EXAM_CD = '" + EXAM_CD + "'";
			sql += ", EEA_HTSB_CD = '" + HTSB_CD + "'";
			sql += ", EEA_SPSB_CD = '" + SPSB_CD + "'";
			sql += ", EEA_CVSB_CD = '" + CVSB_CD + "'";
			sql += ", EEA_EMSB_CD = '" + EMSB_CD + "'";
			sql += ", EEA_ETSB_CD = '" + ETSB_CD + "'";
			sql += ", EEA_HTSB_YN = '" + HTSB_YN + "'";
			sql += ", EEA_SPSB_YN = '" + SPSB_YN + "'";
			sql += ", EEA_CVSB_YN = '" + CVSB_YN + "'";
			sql += ", EEA_EMSB_YN = '" + EMSB_YN + "'";
			sql += ", EEA_ETSB_YN = '" + ETSB_YN + "'";
			sql += ", EEA_HTPR_CD = '" + HTPR_CD + "'";
			sql += ", EEA_SPPR_CD = '" + SPPR_CD + "'";
			sql += ", EEA_CVPR_CD = '" + CVPR_CD + "'";
			sql += ", EEA_EMPR_CD = '" + EMPR_CD + "'";
			sql += ", EEA_ETPR_CD = '" + ETPR_CD + "'";
			sql += ", EEA_CNCL_CD = '" + CNCL_CD + "'";
			sql += ", EEA_MNGT_YR = '" + MNGT_YR + "'";
			sql += ", EEA_MNGT_HTYR = '" + MNGT_HTYR + "'";
			sql += ", EEA_MNGT_SPYM = '" + MNGT_SPYM + "'";
			sql += ", EEA_EXAM_LT = '" + EXAM_LT + "'";
			sql += ", EEA_HTSB_LT = '" + HTSB_LT + "'";
			sql += ", EEA_SPSB_LT = '" + SPSB_LT + "'";
			sql += ", EEA_CVSB_LT = '" + CVSB_LT + "'";
			sql += ", EEA_EMSB_LT = '" + EMSB_LT + "'";
			sql += ", EEA_ETSB_LT = '" + ETSB_LT + "'";
			sql += ", EEA_ADD_LT = '" + ADD_LT + "'";
			sql += ", EEA_SPCL_LT = '" + SPCL_LT + "'";
			sql += ", EEA_ORDER_LT = '" + ORDER_LT + "'";
			sql += ", EEA_SPCL_CD = '" + SPCL_CD + "'";
			sql += ", EEA_SPHT_CD = '" + SPHT_CD + "'";
			sql += ", EEA_INSU_NO = '" + INSU_NO + "'";
			sql += ", EEA_INSU_CD = '" + INSU_CD + "'";
			sql += ", EEA_ENTY_CD = '" + ENTY_CD + "'";
			sql += ", EEA_ASSO_CD = '" + ASSO_CD + "'";
			sql += ", EEA_CNTR_CD = '" + CNTR_CD + "'";
			sql += ", EEA_ARMY_CD = '" + ARMY_CD + "'";
			sql += ", EEA_HEPA_YN = '" + HEPA_YN + "'";
			sql += ", EEA_ORAL_YN = '" + ORAL_YN + "'";
			sql += ", EEA_CANAD_YN = '" + CANAD_YN + "'";
			sql += ", EEA_HOLIDAY_YN = '" + HOLIDAY_YN + "'";
			sql += ", EEA_STOMA_CD = '" + STOMA_CD + "'";
			sql += ", EEA_COLON_CD = '" + COLON_CD + "'";
			sql += ", EEA_LIVER_CD = '" + LIVER_CD + "'";
			sql += ", EEA_BAST_CD = '" + BAST_CD + "'";
			sql += ", EEA_UTER_CD = '" + UTER_CD + "'";
			sql += ", EEA_STOMA_DR = '" + STOMA_DR + "'";
			sql += ", EEA_COLON_DR = '" + COLON_DR + "'";
			sql += ", EEA_LIVER_DR = '" + LIVER_DR + "'";
			sql += ", EEA_BAST_DR = '" + BAST_DR + "'";
			sql += ", EEA_UTER_DR = '" + UTER_DR + "'";
			sql += ", EEA_HDMD_YN = '" + HDMD_YN + "'";
			sql += ", EEA_SDMD_YN = '" + SDMD_YN + "'";
			sql += ", EEA_SPRT_PR = '" + SPRT_PR + "'";
			sql += ", EEA_COMP_PR = '" + COMP_PR + "'";
			sql += ", EEA_PSNL_PR = '" + PSNL_PR + "'";
			sql += ", EEA_HLTH_PR = '" + HLTH_PR + "'";
			sql += ", EEA_SPCL_PR = '" + SPCL_PR + "'";
			sql += ", EEA_CAN_PR = '" + CAN_PR + "'";
			sql += ", EEA_ORAL_PR = '" + ORAL_PR + "'";
			sql += ", EEA_COMPR_PR = '" + COMPR_PR + "'";
			sql += ", EEA_PSNLR_PR = '" + PSNLR_PR + "'";
			sql += ", EEA_HLTHR_PR = '" + HLTHR_PR + "'";
			sql += ", EEA_SPCLR_PR = '" + SPCLR_PR + "'";
			sql += ", EEA_CANR_PR = '" + CANR_PR + "'";
			sql += ", EEA_ORALR_PR = '" + ORALR_PR + "'";
			sql += ", EEA_PYER_CD = '" + PYER_CD + "'";
			sql += ", EEA_CMPY_CD = '" + CMPY_CD + "'";
			sql += ", EEA_PRPY_CD = '" + PRPY_CD + "'";
			sql += ", EEA_RECE_NO = '" + RECE_NO + "'";
			sql += ", EEA_RECE_KD = '" + RECE_KD + "'";
			sql += ", EEA_ORDER_YN = '" + ORDER_YN + "'";
			sql += ", EEA_NHIC_TX = '" + NHIC_TX + "'";
			sql += ", EEA_ACPT_TX = '" + ACPT_TX + "'";
			sql += ", EEA_MODI_ID = '" + MODI_ID + "'";
			sql += ", EEA_MODI_DTT = SYSDATE";
			sql += ", EEA_CANAD_KD = '" + CANAD_KD + "'";
			sql += ", EEA_2ND_YN = '" + SND_YN + "'";
			sql += ", EEA_COMP_CD2 = '" + COMP_CD2 + "'";
			sql += ", EEA_LIFE_YN = '" + LIFE_YN + "'";
			sql += ", EEA_TOTAL_YN = '" + TOTAL_YN + "'";
			sql += ", EEA_HCV_YN = '" + HCV_YN + "'";
			sql += ", EEA_EXEC_ID = '" + EXEC_ID + "'";
			sql += ", EEA_CANPR_KD = '" + CANPR_KD + "'";
			sql += ", EEA_HLTH_KD = '" + HLTH_KD + "'";
			sql += ", EEA_SAFE_YN = '" + SAFE_YN + "'";
			sql += ", EEA_ADD_DT = '" + ADD_DT + "'";
			sql += ", EEA_LUNG_CD = '" + LUNG_CD + "'";
			sql += ", EEA_LUNG_DR = '" + LUNG_DR + "'";
			sql += ", EEA_LUNG_KD = '" + LUNG_KD + "'";
			sql += " WHERE EEA_EXAM_DT = '" + EXAM_DT + "'";
			sql += " AND EEA_EXAM_SQ = '" + EXAM_SQ + "'";

			argStmtExec.executeUpdate(sql);
		}

		return sql;
	}
%>