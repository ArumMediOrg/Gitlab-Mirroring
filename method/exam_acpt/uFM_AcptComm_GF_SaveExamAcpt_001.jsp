<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.HashMap"%>
<%@ include file="/inc_prg/common.jsp"%>
<%@ include file="/func/func_uFM_AcptComm_GF_SaveExamAcpt_001.jsp"%>
<%
	// 전달자료
	HashMap<String, Object> htData = null;
	HashMap<String, String> htMethod = null;

	// DB객체
	Statement stmtExec = null;

	//
	String G_INFO = "";

	try {
%>
<%@ include file="/inc_prg/connect.jsp"%>
<%
		// 전달자료
		htData = (HashMap<String, Object>)request.getAttribute("htData");
		htMethod = (HashMap<String, String>)request.getAttribute("htMethod_1");

		String SAVE_KD = htMethod.get("SAVE_KD");
		String EXAM_DT = htMethod.get("EXAM_DT");
		String EXAM_SQ = htMethod.get("EXAM_SQ");
		String RSVN_NO = htMethod.get("RSVN_NO");
		String ACPT_CD = htMethod.get("ACPT_CD");
		String ACPT_KD = htMethod.get("ACPT_KD");
		String PLCE_CD = htMethod.get("PLCE_CD");
		String CUST_NO = htMethod.get("CUST_NO");
		String MMBR_CD = htMethod.get("MMBR_CD");
		String CHART_NO = htMethod.get("CHART_NO");
		String PSNL_NM = htMethod.get("PSNL_NM");
		String SEX_CD = htMethod.get("SEX_CD");
		String PSNL_AGE = htMethod.get("PSNL_AGE");
		String ZIP_CD = htMethod.get("ZIP_CD");
		String ZIP_SQ = htMethod.get("ZIP_SQ");
		String ZIP_AR = htMethod.get("ZIP_AR");
		String ROAD_AR = htMethod.get("ROAD_AR");
		String BLDG_NO = htMethod.get("BLDG_NO");
		String TEL_NO = htMethod.get("TEL_NO");
		String MOBL_NO = htMethod.get("MOBL_NO");
		String EMAIL_AR = htMethod.get("EMAIL_AR");
		String SEND_CD = htMethod.get("SEND_CD");
		String SMS_YN = htMethod.get("SMS_YN");
		String COMP_CD = htMethod.get("COMP_CD");
		String COTK_CD = htMethod.get("COTK_CD");
		String NOTE_YN = htMethod.get("NOTE_YN");
		String DEPT_CD = htMethod.get("DEPT_CD");
		String DEPT_NM = htMethod.get("DEPT_NM");
		String DIVI_CD = htMethod.get("DIVI_CD");
		String ENTRY_DT = htMethod.get("ENTRY_DT");
		String DIVI_NO = htMethod.get("DIVI_NO");
		String DIVI_CS = htMethod.get("DIVI_CS");
		String CLSS_KD = htMethod.get("CLSS_KD");
		String FAMY_CD = htMethod.get("FAMY_CD");
		String FAMY_NM = htMethod.get("FAMY_NM");
		String RFID_NO = htMethod.get("RFID_NO");
		String FOOD_YN = htMethod.get("FOOD_YN");
		String SALES_ID = htMethod.get("SALES_ID");
		String EXAM_CD = htMethod.get("EXAM_CD");
		String HTSB_CD = htMethod.get("HTSB_CD");
		String SPSB_CD = htMethod.get("SPSB_CD");
		String CVSB_CD = htMethod.get("CVSB_CD");
		String EMSB_CD = htMethod.get("EMSB_CD");
		String ETSB_CD = htMethod.get("ETSB_CD");
		String HTSB_YN = htMethod.get("HTSB_YN");
		String SPSB_YN = htMethod.get("SPSB_YN");
		String CVSB_YN = htMethod.get("CVSB_YN");
		String EMSB_YN = htMethod.get("EMSB_YN");
		String ETSB_YN = htMethod.get("ETSB_YN");
		String HTPR_CD = htMethod.get("HTPR_CD");
		String SPPR_CD = htMethod.get("SPPR_CD");
		String CVPR_CD = htMethod.get("CVPR_CD");
		String EMPR_CD = htMethod.get("EMPR_CD");
		String ETPR_CD = htMethod.get("ETPR_CD");
		String CNCL_CD = htMethod.get("CNCL_CD");
		String MNGT_YR = htMethod.get("MNGT_YR");
		String MNGT_HTYR = htMethod.get("MNGT_HTYR");
		String MNGT_SPYM = htMethod.get("MNGT_SPYM");
		String EXAM_LT = htMethod.get("EXAM_LT");
		String HTSB_LT = htMethod.get("HTSB_LT");
		String SPSB_LT = htMethod.get("SPSB_LT");
		String CVSB_LT = htMethod.get("CVSB_LT");
		String EMSB_LT = htMethod.get("EMSB_LT");
		String ETSB_LT = htMethod.get("ETSB_LT");
		String ADD_LT = htMethod.get("ADD_LT");
		String SPCL_LT = htMethod.get("SPCL_LT");
		String ORDER_LT = htMethod.get("ORDER_LT");
		String SPCL_CD = htMethod.get("SPCL_CD");
		String SPHT_CD = htMethod.get("SPHT_CD");
		String INSU_NO = htMethod.get("INSU_NO");
		String INSU_CD = htMethod.get("INSU_CD");
		String ENTY_CD = htMethod.get("ENTY_CD");
		String ASSO_CD = htMethod.get("ASSO_CD");
		String CNTR_CD = htMethod.get("CNTR_CD");
		String ARMY_CD = htMethod.get("ARMY_CD");
		String HEPA_YN = htMethod.get("HEPA_YN");
		String ORAL_YN = htMethod.get("ORAL_YN");
		String CANAD_YN = htMethod.get("CANAD_YN");
		String HOLIDAY_YN = htMethod.get("HOLIDAY_YN");
		String STOMA_CD = htMethod.get("STOMA_CD");
		String COLON_CD = htMethod.get("COLON_CD");
		String LIVER_CD = htMethod.get("LIVER_CD");
		String BAST_CD = htMethod.get("BAST_CD");
		String UTER_CD = htMethod.get("UTER_CD");
		String STOMA_DR = htMethod.get("STOMA_DR");
		String COLON_DR = htMethod.get("COLON_DR");
		String LIVER_DR = htMethod.get("LIVER_DR");
		String BAST_DR = htMethod.get("BAST_DR");
		String UTER_DR = htMethod.get("UTER_DR");
		String HDMD_YN = htMethod.get("HDMD_YN");
		String SDMD_YN = htMethod.get("SDMD_YN");
		String SPRT_PR = htMethod.get("SPRT_PR");
		String COMP_PR = htMethod.get("COMP_PR");
		String PSNL_PR = htMethod.get("PSNL_PR");
		String HLTH_PR = htMethod.get("HLTH_PR");
		String SPCL_PR = htMethod.get("SPCL_PR");
		String CAN_PR = htMethod.get("CAN_PR");
		String ORAL_PR = htMethod.get("ORAL_PR");
		String COMPR_PR = htMethod.get("COMPR_PR");
		String PSNLR_PR = htMethod.get("PSNLR_PR");
		String HLTHR_PR = htMethod.get("HLTHR_PR");
		String SPCLR_PR = htMethod.get("SPCLR_PR");
		String CANR_PR = htMethod.get("CANR_PR");
		String ORALR_PR = htMethod.get("ORALR_PR");
		String PYER_CD = htMethod.get("PYER_CD");
		String CMPY_CD = htMethod.get("CMPY_CD");
		String PRPY_CD = htMethod.get("PRPY_CD");
		String RECE_NO = htMethod.get("RECE_NO");
		String RECE_KD = htMethod.get("RECE_KD");
		String RSLT_CD = htMethod.get("RSLT_CD");
		String BLRT_CD = htMethod.get("BLRT_CD");
		String DEFER_KD = htMethod.get("DEFER_KD");
		String ORDER_YN = htMethod.get("ORDER_YN");
		String NHIC_TX = htMethod.get("NHIC_TX");
		String ACPT_TX = htMethod.get("ACPT_TX");
		String INPT_ID = htMethod.get("INPT_ID");
		String MODI_ID = htMethod.get("MODI_ID");
		String CANAD_KD = htMethod.get("CANAD_KD");
		String SND_YN = htMethod.get("SND_YN");
		String COMP_CD2 = htMethod.get("COMP_CD2");
		String LIFE_YN = htMethod.get("LIFE_YN");
		String TOTAL_YN = htMethod.get("TOTAL_YN");
		String HCV_YN = htMethod.get("HCV_YN");
		String EXEC_ID = htMethod.get("EXEC_ID");
		String CANPR_KD = htMethod.get("CANPR_KD");
		String HLTH_KD = htMethod.get("HLTH_KD");
		String SAFE_YN = htMethod.get("SAFE_YN");
		String ADD_DT = htMethod.get("ADD_DT");
		String LUNG_CD = htMethod.get("LUNG_CD");
		String LUNG_DR = htMethod.get("LUNG_DR");
		String LUNG_KD = htMethod.get("LUNG_KD");
		String UBEH_YN = htMethod.get("UBEH_YN");
		String DISC_RC = htMethod.get("DISC_RC");
		String DISC_CD = htMethod.get("DISC_CD");
		String DISC_RT = htMethod.get("DISC_RT");
		String DISC_PR = htMethod.get("DISC_PR");
		String DISC_CPR = htMethod.get("DISC_CPR");
		String DISC_TX = htMethod.get("DISC_TX");
		String CUPN_NO = htMethod.get("CUPN_NO");
		String OCS_DR = htMethod.get("OCS_DR");
		String CNTB_RC = htMethod.get("CNTB_RC");
		String CNTB_CD = htMethod.get("CNTB_CD");
		String CNTB_RT = htMethod.get("CNTB_RT");
		String CNTB_PR = htMethod.get("CNTB_PR");

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
		if(DISC_RC == null) { DISC_RC = ""; }
		if(DISC_CD == null) { DISC_CD = ""; }
		if(DISC_RT == null) { DISC_RT = ""; }
		if(DISC_PR == null) { DISC_PR = ""; }
		if(DISC_CPR == null) { DISC_CPR = ""; }
		if(DISC_TX == null) { DISC_TX = ""; }
		if(CUPN_NO == null) { CUPN_NO = ""; }
		if(OCS_DR == null) { OCS_DR = ""; }
		if(CNTB_RC == null) { CNTB_RC = ""; }
		if(CNTB_CD == null) { CNTB_CD = ""; }
		if(CNTB_RT == null) { CNTB_RT = ""; }
		if(CNTB_PR == null) { CNTB_PR = ""; }

		// DB객체
		stmtExec = connect.createStatement();

		sql = func_uFM_AcptComm_GF_SaveExamAcpt_001(stmtExec, htMethod);

			//
			G_INFO += "<!-- \n";
			G_INFO += "서비스명 : uFM_AcptComm_GF_SaveExamAcpt_001 \n";
			G_INFO += "설명 : 접수 정보 저장 \n";
			G_INFO += "\n\n";

			G_INFO += "전달인자 : \n";
			G_INFO += " SAVE_KD : " + SAVE_KD + " \n";
			G_INFO += " EXAM_DT : " + EXAM_DT + " \n";
			G_INFO += " EXAM_SQ : " + EXAM_SQ + " \n";
			G_INFO += " RSVN_NO : " + RSVN_NO + " \n";
			G_INFO += " ACPT_CD : " + ACPT_CD + " \n";
			G_INFO += " ACPT_KD : " + ACPT_KD + " \n";
			G_INFO += " PLCE_CD : " + PLCE_CD + " \n";
			G_INFO += " CUST_NO : " + CUST_NO + " \n";
			G_INFO += " MMBR_CD : " + MMBR_CD + " \n";
			G_INFO += " CHART_NO : " + CHART_NO + " \n";
			G_INFO += " PSNL_NM : " + PSNL_NM + " \n";
			G_INFO += " SEX_CD : " + SEX_CD + " \n";
			G_INFO += " PSNL_AGE : " + PSNL_AGE + " \n";
			G_INFO += " ZIP_CD : " + ZIP_CD + " \n";
			G_INFO += " ZIP_SQ : " + ZIP_SQ + " \n";
			G_INFO += " ZIP_AR : " + ZIP_AR + " \n";
			G_INFO += " ROAD_AR : " + ROAD_AR + " \n";
			G_INFO += " BLDG_NO : " + BLDG_NO + " \n";
			G_INFO += " TEL_NO : " + TEL_NO + " \n";
			G_INFO += " MOBL_NO : " + MOBL_NO + " \n";
			G_INFO += " EMAIL_AR : " + EMAIL_AR + " \n";
			G_INFO += " SEND_CD : " + SEND_CD + " \n";
			G_INFO += " SMS_YN : " + SMS_YN + " \n";
			G_INFO += " COMP_CD : " + COMP_CD + " \n";
			G_INFO += " COTK_CD : " + COTK_CD + " \n";
			G_INFO += " NOTE_YN : " + NOTE_YN + " \n";
			G_INFO += " DEPT_CD : " + DEPT_CD + " \n";
			G_INFO += " DEPT_NM : " + DEPT_NM + " \n";
			G_INFO += " DIVI_CD : " + DIVI_CD + " \n";
			G_INFO += " ENTRY_DT : " + ENTRY_DT + " \n";
			G_INFO += " DIVI_NO : " + DIVI_NO + " \n";
			G_INFO += " DIVI_CS : " + DIVI_CS + " \n";
			G_INFO += " CLSS_KD : " + CLSS_KD + " \n";
			G_INFO += " FAMY_CD : " + FAMY_CD + " \n";
			G_INFO += " FAMY_NM : " + FAMY_NM + " \n";
			G_INFO += " RFID_NO : " + RFID_NO + " \n";
			G_INFO += " FOOD_YN : " + FOOD_YN + " \n";
			G_INFO += " SALES_ID : " + SALES_ID + " \n";
			G_INFO += " EXAM_CD : " + EXAM_CD + " \n";
			G_INFO += " HTSB_CD : " + HTSB_CD + " \n";
			G_INFO += " SPSB_CD : " + SPSB_CD + " \n";
			G_INFO += " CVSB_CD : " + CVSB_CD + " \n";
			G_INFO += " EMSB_CD : " + EMSB_CD + " \n";
			G_INFO += " ETSB_CD : " + ETSB_CD + " \n";
			G_INFO += " HTSB_YN : " + HTSB_YN + " \n";
			G_INFO += " SPSB_YN : " + SPSB_YN + " \n";
			G_INFO += " CVSB_YN : " + CVSB_YN + " \n";
			G_INFO += " EMSB_YN : " + EMSB_YN + " \n";
			G_INFO += " ETSB_YN : " + ETSB_YN + " \n";
			G_INFO += " HTPR_CD : " + HTPR_CD + " \n";
			G_INFO += " SPPR_CD : " + SPPR_CD + " \n";
			G_INFO += " CVPR_CD : " + CVPR_CD + " \n";
			G_INFO += " EMPR_CD : " + EMPR_CD + " \n";
			G_INFO += " ETPR_CD : " + ETPR_CD + " \n";
			G_INFO += " CNCL_CD : " + CNCL_CD + " \n";
			G_INFO += " MNGT_YR : " + MNGT_YR + " \n";
			G_INFO += " MNGT_HTYR : " + MNGT_HTYR + " \n";
			G_INFO += " MNGT_SPYM : " + MNGT_SPYM + " \n";
			G_INFO += " EXAM_LT : " + EXAM_LT + " \n";
			G_INFO += " HTSB_LT : " + HTSB_LT + " \n";
			G_INFO += " SPSB_LT : " + SPSB_LT + " \n";
			G_INFO += " CVSB_LT : " + CVSB_LT + " \n";
			G_INFO += " EMSB_LT : " + EMSB_LT + " \n";
			G_INFO += " ETSB_LT : " + ETSB_LT + " \n";
			G_INFO += " ADD_LT : " + ADD_LT + " \n";
			G_INFO += " SPCL_LT : " + SPCL_LT + " \n";
			G_INFO += " ORDER_LT : " + ORDER_LT + " \n";
			G_INFO += " SPCL_CD : " + SPCL_CD + " \n";
			G_INFO += " SPHT_CD : " + SPHT_CD + " \n";
			G_INFO += " INSU_NO : " + INSU_NO + " \n";
			G_INFO += " INSU_CD : " + INSU_CD + " \n";
			G_INFO += " ENTY_CD : " + ENTY_CD + " \n";
			G_INFO += " ASSO_CD : " + ASSO_CD + " \n";
			G_INFO += " CNTR_CD : " + CNTR_CD + " \n";
			G_INFO += " ARMY_CD : " + ARMY_CD + " \n";
			G_INFO += " HEPA_YN : " + HEPA_YN + " \n";
			G_INFO += " ORAL_YN : " + ORAL_YN + " \n";
			G_INFO += " CANAD_YN : " + CANAD_YN + " \n";
			G_INFO += " HOLIDAY_YN : " + HOLIDAY_YN + " \n";
			G_INFO += " STOMA_CD : " + STOMA_CD + " \n";
			G_INFO += " COLON_CD : " + COLON_CD + " \n";
			G_INFO += " LIVER_CD : " + LIVER_CD + " \n";
			G_INFO += " BAST_CD : " + BAST_CD + " \n";
			G_INFO += " UTER_CD : " + UTER_CD + " \n";
			G_INFO += " STOMA_DR : " + STOMA_DR + " \n";
			G_INFO += " COLON_DR : " + COLON_DR + " \n";
			G_INFO += " LIVER_DR : " + LIVER_DR + " \n";
			G_INFO += " BAST_DR : " + BAST_DR + " \n";
			G_INFO += " UTER_DR : " + UTER_DR + " \n";
			G_INFO += " HDMD_YN : " + HDMD_YN + " \n";
			G_INFO += " SDMD_YN : " + SDMD_YN + " \n";
			G_INFO += " SPRT_PR : " + SPRT_PR + " \n";
			G_INFO += " COMP_PR : " + COMP_PR + " \n";
			G_INFO += " PSNL_PR : " + PSNL_PR + " \n";
			G_INFO += " HLTH_PR : " + HLTH_PR + " \n";
			G_INFO += " SPCL_PR : " + SPCL_PR + " \n";
			G_INFO += " CAN_PR : " + CAN_PR + " \n";
			G_INFO += " ORAL_PR : " + ORAL_PR + " \n";
			G_INFO += " COMPR_PR : " + COMPR_PR + " \n";
			G_INFO += " PSNLR_PR : " + PSNLR_PR + " \n";
			G_INFO += " HLTHR_PR : " + HLTHR_PR + " \n";
			G_INFO += " SPCLR_PR : " + SPCLR_PR + " \n";
			G_INFO += " CANR_PR : " + CANR_PR + " \n";
			G_INFO += " ORALR_PR : " + ORALR_PR + " \n";
			G_INFO += " PYER_CD : " + PYER_CD + " \n";
			G_INFO += " CMPY_CD : " + CMPY_CD + " \n";
			G_INFO += " PRPY_CD : " + PRPY_CD + " \n";
			G_INFO += " RECE_NO : " + RECE_NO + " \n";
			G_INFO += " RECE_KD : " + RECE_KD + " \n";
			G_INFO += " RSLT_CD : " + RSLT_CD + " \n";
			G_INFO += " BLRT_CD : " + BLRT_CD + " \n";
			G_INFO += " DEFER_KD : " + DEFER_KD + " \n";
			G_INFO += " ORDER_YN : " + ORDER_YN + " \n";
			G_INFO += " NHIC_TX : " + NHIC_TX + " \n";
			G_INFO += " ACPT_TX : " + ACPT_TX + " \n";
			G_INFO += " INPT_ID : " + INPT_ID + " \n";
			G_INFO += " MODI_ID : " + MODI_ID + " \n";
			G_INFO += " CANAD_KD : " + CANAD_KD + " \n";
			G_INFO += " SND_YN : " + SND_YN + " \n";
			G_INFO += " COMP_CD2 : " + COMP_CD2 + " \n";
			G_INFO += " LIFE_YN : " + LIFE_YN + " \n";
			G_INFO += " TOTAL_YN : " + TOTAL_YN + " \n";
			G_INFO += " HCV_YN : " + HCV_YN + " \n";
			G_INFO += " EXEC_ID : " + EXEC_ID + " \n";
			G_INFO += " CANPR_KD : " + CANPR_KD + " \n";
			G_INFO += " HLTH_KD : " + HLTH_KD + " \n";
			G_INFO += " SAFE_YN : " + SAFE_YN + " \n";
			G_INFO += " ADD_DT : " + ADD_DT + " \n";
			G_INFO += " LUNG_CD : " + LUNG_CD + " \n";
			G_INFO += " LUNG_DR : " + LUNG_DR + " \n";
			G_INFO += " LUNG_KD : " + LUNG_KD + " \n";
			G_INFO += " UBEH_YN : " + UBEH_YN + " \n";
			G_INFO += " DISC_RC : " + DISC_RC + " \n";
			G_INFO += " DISC_CD : " + DISC_CD + " \n";
			G_INFO += " DISC_RT : " + DISC_RT + " \n";
			G_INFO += " DISC_PR : " + DISC_PR + " \n";
			G_INFO += " DISC_CPR : " + DISC_CPR + " \n";
			G_INFO += " DISC_TX : " + DISC_TX + " \n";
			G_INFO += " CUPN_NO : " + CUPN_NO + " \n";
			G_INFO += " OCS_DR : " + OCS_DR + " \n";
			G_INFO += " CNTB_RC : " + CNTB_RC + " \n";
			G_INFO += " CNTB_CD : " + CNTB_CD + " \n";
			G_INFO += " CNTB_RT : " + CNTB_RT + " \n";
			G_INFO += " CNTB_PR : " + CNTB_PR + " \n";
			G_INFO += "\n\n";

			G_INFO += "질의문 : " + sql + " \n";
			G_INFO += "-->";

		out.clear();		// include된 파일안의 공백 제거
		response.addHeader("Content-type", "text/xml");
%><?xml version="1.0" encoding="UTF-8"?>

<%= G_INFO%>

<nurionXml>
	<resultCode>200</resultCode>
	<resultXml></resultXml>
	<errorMsg></errorMsg>
</nurionXml>

<%
	} catch (FuncException fe) {

		out.clear();		// include된 파일안의 공백 제거
		response.addHeader("Content-type", "text/xml");
%><?xml version="1.0" encoding="UTF-8"?>

<%= G_INFO%>

<nurionXml>
	<resultCode>400</resultCode>
	<resultXml></resultXml>
	<errorMsg><![CDATA[<%= fe.toString()%>]]></errorMsg>
	<sql><![CDATA[<%= fe.getSql()%>]]></sql>
</nurionXml>

<%
	} catch (Exception e) {

		out.clear();		// include된 파일안의 공백 제거
		response.addHeader("Content-type", "text/xml");
%><?xml version="1.0" encoding="UTF-8"?>

<%= G_INFO%>

<nurionXml>
	<resultCode>400</resultCode>
	<resultXml></resultXml>
	<errorMsg><![CDATA[<%= e.toString()%>]]></errorMsg>
</nurionXml>

<%
	} finally {

		if(stmtExec != null) {
			stmtExec.close();
			stmtExec = null;
		}
%>
<%@ include file="/inc_prg/disconnect.jsp"%>
<%
	}
%>
