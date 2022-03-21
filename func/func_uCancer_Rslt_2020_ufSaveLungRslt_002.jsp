<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%!
	public String func_uCancer_Rslt_2020_ufSaveLungRslt_002(Statement argStmtExec, HashMap argHtMethod) throws Exception {

		String sql = "";
		String sql2 = "";
		String sql_disp = "";

		try {

			String ICOUNT = (String) argHtMethod.get("ICOUNT");
			String EXAM_DT = (String) argHtMethod.get("EXAM_DT");
			String EXAM_SQ = (String) argHtMethod.get("EXAM_SQ");
			String LUEX_DT = (String) argHtMethod.get("LUEX_DT");
			String LUEX_KD = (String) argHtMethod.get("LUEX_KD");
			String CTDI_VL = (String) argHtMethod.get("CTDI_VL");
			String BEFO_YN = (String) argHtMethod.get("BEFO_YN");
			String BEFO_YY = (String) argHtMethod.get("BEFO_YY");
			String BEFO_MM = (String) argHtMethod.get("BEFO_MM");
			String PNRT_YN = (String) argHtMethod.get("PNRT_YN");
			String PNRT1_YN = (String) argHtMethod.get("PNRT1_YN");
			String PNRT1IC_KD = (String) argHtMethod.get("PNRT1IC_KD");
			String PNRT1SL_KD = (String) argHtMethod.get("PNRT1SL_KD");
			String PNRT1SZ1_VL = (String) argHtMethod.get("PNRT1SZ1_VL");
			String PNRT1SZ2_VL = (String) argHtMethod.get("PNRT1SZ2_VL");
			String PNRT1FT_KD = (String) argHtMethod.get("PNRT1FT_KD");
			String PNRT1TR1_KD = (String) argHtMethod.get("PNRT1TR1_KD");
			String PNRT1TR2_KD = (String) argHtMethod.get("PNRT1TR2_KD");
			String PNRT2_YN = (String) argHtMethod.get("PNRT2_YN");
			String PNRT2IC_KD = (String) argHtMethod.get("PNRT2IC_KD");
			String PNRT2SL_KD = (String) argHtMethod.get("PNRT2SL_KD");
			String PNRT2SZ1_VL = (String) argHtMethod.get("PNRT2SZ1_VL");
			String PNRT2SZ2_VL = (String) argHtMethod.get("PNRT2SZ2_VL");
			String PNRT2FT_KD = (String) argHtMethod.get("PNRT2FT_KD");
			String PNRT2TR1_KD = (String) argHtMethod.get("PNRT2TR1_KD");
			String PNRT2TR2_KD = (String) argHtMethod.get("PNRT2TR2_KD");
			String PNRT3_YN = (String) argHtMethod.get("PNRT3_YN");
			String PNRT3IC_KD = (String) argHtMethod.get("PNRT3IC_KD");
			String PNRT3SL_KD = (String) argHtMethod.get("PNRT3SL_KD");
			String PNRT3SZ1_VL = (String) argHtMethod.get("PNRT3SZ1_VL");
			String PNRT3SZ2_VL = (String) argHtMethod.get("PNRT3SZ2_VL");
			String PNRT3FT_KD = (String) argHtMethod.get("PNRT3FT_KD");
			String PNRT3TR1_KD = (String) argHtMethod.get("PNRT3TR1_KD");
			String PNRT3TR2_KD = (String) argHtMethod.get("PNRT3TR2_KD");
			String PNRT4_YN = (String) argHtMethod.get("PNRT4_YN");
			String PNRT4IC_KD = (String) argHtMethod.get("PNRT4IC_KD");
			String PNRT4SL_KD = (String) argHtMethod.get("PNRT4SL_KD");
			String PNRT4SZ1_VL = (String) argHtMethod.get("PNRT4SZ1_VL");
			String PNRT4SZ2_VL = (String) argHtMethod.get("PNRT4SZ2_VL");
			String PNRT4FT_KD = (String) argHtMethod.get("PNRT4FT_KD");
			String PNRT4TR1_KD = (String) argHtMethod.get("PNRT4TR1_KD");
			String PNRT4TR2_KD = (String) argHtMethod.get("PNRT4TR2_KD");
			String PNRT5_YN = (String) argHtMethod.get("PNRT5_YN");
			String PNRT5IC_KD = (String) argHtMethod.get("PNRT5IC_KD");
			String PNRT5SL_KD = (String) argHtMethod.get("PNRT5SL_KD");
			String PNRT5SZ1_VL = (String) argHtMethod.get("PNRT5SZ1_VL");
			String PNRT5SZ2_VL = (String) argHtMethod.get("PNRT5SZ2_VL");
			String PNRT5FT_KD = (String) argHtMethod.get("PNRT5FT_KD");
			String PNRT5TR1_KD = (String) argHtMethod.get("PNRT5TR1_KD");
			String PNRT5TR2_KD = (String) argHtMethod.get("PNRT5TR2_KD");
			String PNRT6_YN = (String) argHtMethod.get("PNRT6_YN");
			String PNRT6IC_KD = (String) argHtMethod.get("PNRT6IC_KD");
			String PNRT6SL_KD = (String) argHtMethod.get("PNRT6SL_KD");
			String PNRT6SZ1_VL = (String) argHtMethod.get("PNRT6SZ1_VL");
			String PNRT6SZ2_VL = (String) argHtMethod.get("PNRT6SZ2_VL");
			String PNRT6FT_KD = (String) argHtMethod.get("PNRT6FT_KD");
			String PNRT6TR1_KD = (String) argHtMethod.get("PNRT6TR1_KD");
			String PNRT6TR2_KD = (String) argHtMethod.get("PNRT6TR2_KD");
			String BRLE_YN = (String) argHtMethod.get("BRLE_YN");
			String BRLE_EX = (String) argHtMethod.get("BRLE_EX");
			String LUCN_KD = (String) argHtMethod.get("LUCN_KD");
			String LUCN_EX = (String) argHtMethod.get("LUCN_EX");
			String SCRT_CD = (String) argHtMethod.get("SCRT_CD");
			String SCRT_EX = (String) argHtMethod.get("SCRT_EX");
			String INPT_YN = (String) argHtMethod.get("INPT_YN");
			String RSLT_KD = (String) argHtMethod.get("RSLT_KD");
			String RSLT2_KD = (String) argHtMethod.get("RSLT2_KD");
			String ETC_KD = (String) argHtMethod.get("ETC_KD");
			String ETC_EX = (String) argHtMethod.get("ETC_EX");
			String RSLT_EX = (String) argHtMethod.get("RSLT_EX");
			String RSLT_ETC_EX = (String) argHtMethod.get("RSLT_ETC_EX");
			String CFRM_DT = (String) argHtMethod.get("CFRM_DT");
			String LICEN_CD = (String) argHtMethod.get("LICEN_CD");
			String DECI_LICEN_CD = (String) argHtMethod.get("DECI_LICEN_CD");
			String LUCN_YN = (String) argHtMethod.get("LUCN_YN");
			String AFRL_EX = (String) argHtMethod.get("AFRL_EX");
			String AFSM_EX = (String) argHtMethod.get("AFSM_EX");
			String AFDT_DT = (String) argHtMethod.get("AFDT_DT");
			String AFPL_CD = (String) argHtMethod.get("AFPL_CD");
			String AFTE_LICEN_CD = (String) argHtMethod.get("AFTE_LICEN_CD");
			String USER = (String) argHtMethod.get("USER");
			String SMOK_CK10 = (String) argHtMethod.get("SMOK_CK10");
			String SMOK_CK11 = (String) argHtMethod.get("SMOK_CK11");
			String SMOK_CK20 = (String) argHtMethod.get("SMOK_CK20");
			String SMOK_CK21 = (String) argHtMethod.get("SMOK_CK21");
			String SMOK_CK22 = (String) argHtMethod.get("SMOK_CK22");
			String SMOK_CK30 = (String) argHtMethod.get("SMOK_CK30");
			String SMOK_CK40 = (String) argHtMethod.get("SMOK_CK40");
			String SMOK_CK41 = (String) argHtMethod.get("SMOK_CK41");
			String SMOK_CK42 = (String) argHtMethod.get("SMOK_CK42");

			//
			if(ICOUNT == null) { ICOUNT = ""; }
			if(EXAM_DT == null) { EXAM_DT = ""; }
			if(EXAM_SQ == null) { EXAM_SQ = ""; }
			if(LUEX_DT == null) { LUEX_DT = ""; }
			if(LUEX_KD == null) { LUEX_KD = ""; }
			if(CTDI_VL == null) { CTDI_VL = ""; }
			if(BEFO_YN == null) { BEFO_YN = ""; }
			if(BEFO_YY == null) { BEFO_YY = ""; }
			if(BEFO_MM == null) { BEFO_MM = ""; }
			if(PNRT_YN == null) { PNRT_YN = ""; }
			if(PNRT1_YN == null) { PNRT1_YN = ""; }
			if(PNRT1IC_KD == null) { PNRT1IC_KD = ""; }
			if(PNRT1SL_KD == null) { PNRT1SL_KD = ""; }
			if(PNRT1SZ1_VL == null) { PNRT1SZ1_VL = ""; }
			if(PNRT1SZ2_VL == null) { PNRT1SZ2_VL = ""; }
			if(PNRT1FT_KD == null) { PNRT1FT_KD = ""; }
			if(PNRT1TR1_KD == null) { PNRT1TR1_KD = ""; }
			if(PNRT1TR2_KD == null) { PNRT1TR2_KD = ""; }
			if(PNRT2_YN == null) { PNRT2_YN = ""; }
			if(PNRT2IC_KD == null) { PNRT2IC_KD = ""; }
			if(PNRT2SL_KD == null) { PNRT2SL_KD = ""; }
			if(PNRT2SZ1_VL == null) { PNRT2SZ1_VL = ""; }
			if(PNRT2SZ2_VL == null) { PNRT2SZ2_VL = ""; }
			if(PNRT2FT_KD == null) { PNRT2FT_KD = ""; }
			if(PNRT2TR1_KD == null) { PNRT2TR1_KD = ""; }
			if(PNRT2TR2_KD == null) { PNRT2TR2_KD = ""; }
			if(PNRT3_YN == null) { PNRT3_YN = ""; }
			if(PNRT3IC_KD == null) { PNRT3IC_KD = ""; }
			if(PNRT3SL_KD == null) { PNRT3SL_KD = ""; }
			if(PNRT3SZ1_VL == null) { PNRT3SZ1_VL = ""; }
			if(PNRT3SZ2_VL == null) { PNRT3SZ2_VL = ""; }
			if(PNRT3FT_KD == null) { PNRT3FT_KD = ""; }
			if(PNRT3TR1_KD == null) { PNRT3TR1_KD = ""; }
			if(PNRT3TR2_KD == null) { PNRT3TR2_KD = ""; }
			if(PNRT4_YN == null) { PNRT4_YN = ""; }
			if(PNRT4IC_KD == null) { PNRT4IC_KD = ""; }
			if(PNRT4SL_KD == null) { PNRT4SL_KD = ""; }
			if(PNRT4SZ1_VL == null) { PNRT4SZ1_VL = ""; }
			if(PNRT4SZ2_VL == null) { PNRT4SZ2_VL = ""; }
			if(PNRT4FT_KD == null) { PNRT4FT_KD = ""; }
			if(PNRT4TR1_KD == null) { PNRT4TR1_KD = ""; }
			if(PNRT4TR2_KD == null) { PNRT4TR2_KD = ""; }
			if(PNRT5_YN == null) { PNRT5_YN = ""; }
			if(PNRT5IC_KD == null) { PNRT5IC_KD = ""; }
			if(PNRT5SL_KD == null) { PNRT5SL_KD = ""; }
			if(PNRT5SZ1_VL == null) { PNRT5SZ1_VL = ""; }
			if(PNRT5SZ2_VL == null) { PNRT5SZ2_VL = ""; }
			if(PNRT5FT_KD == null) { PNRT5FT_KD = ""; }
			if(PNRT5TR1_KD == null) { PNRT5TR1_KD = ""; }
			if(PNRT5TR2_KD == null) { PNRT5TR2_KD = ""; }
			if(PNRT6_YN == null) { PNRT6_YN = ""; }
			if(PNRT6IC_KD == null) { PNRT6IC_KD = ""; }
			if(PNRT6SL_KD == null) { PNRT6SL_KD = ""; }
			if(PNRT6SZ1_VL == null) { PNRT6SZ1_VL = ""; }
			if(PNRT6SZ2_VL == null) { PNRT6SZ2_VL = ""; }
			if(PNRT6FT_KD == null) { PNRT6FT_KD = ""; }
			if(PNRT6TR1_KD == null) { PNRT6TR1_KD = ""; }
			if(PNRT6TR2_KD == null) { PNRT6TR2_KD = ""; }
			if(BRLE_YN == null) { BRLE_YN = ""; }
			if(BRLE_EX == null) { BRLE_EX = ""; }
			if(LUCN_KD == null) { LUCN_KD = ""; }
			if(LUCN_EX == null) { LUCN_EX = ""; }
			if(SCRT_CD == null) { SCRT_CD = ""; }
			if(SCRT_EX == null) { SCRT_EX = ""; }
			if(INPT_YN == null) { INPT_YN = ""; }
			if(RSLT_KD == null) { RSLT_KD = ""; }
			if(RSLT2_KD == null) { RSLT2_KD = ""; }
			if(ETC_KD == null) { ETC_KD = ""; }
			if(ETC_EX == null) { ETC_EX = ""; }
			if(RSLT_EX == null) { RSLT_EX = ""; }
			if(RSLT_ETC_EX == null) { RSLT_ETC_EX = ""; }
			if(CFRM_DT == null) { CFRM_DT = ""; }
			if(LICEN_CD == null) { LICEN_CD = ""; }
			if(DECI_LICEN_CD == null) { DECI_LICEN_CD = ""; }
			if(LUCN_YN == null) { LUCN_YN = ""; }
			if(AFRL_EX == null) { AFRL_EX = ""; }
			if(AFSM_EX == null) { AFSM_EX = ""; }
			if(AFDT_DT == null) { AFDT_DT = ""; }
			if(AFPL_CD == null) { AFPL_CD = ""; }
			if(AFTE_LICEN_CD == null) { AFTE_LICEN_CD = ""; }
			if(USER == null) { USER = ""; }
			if(SMOK_CK10 == null) { SMOK_CK10 = ""; }
			if(SMOK_CK11 == null) { SMOK_CK11 = ""; }
			if(SMOK_CK20 == null) { SMOK_CK20 = ""; }
			if(SMOK_CK21 == null) { SMOK_CK21 = ""; }
			if(SMOK_CK22 == null) { SMOK_CK22 = ""; }
			if(SMOK_CK30 == null) { SMOK_CK30 = ""; }
			if(SMOK_CK40 == null) { SMOK_CK40 = ""; }
			if(SMOK_CK41 == null) { SMOK_CK41 = ""; }
			if(SMOK_CK42 == null) { SMOK_CK42 = ""; }

			//
			ICOUNT = CTr.Replace(ICOUNT, "'", "''");
			EXAM_DT = CTr.Replace(EXAM_DT, "'", "''");
			EXAM_SQ = CTr.Replace(EXAM_SQ, "'", "''");
			LUEX_DT = CTr.Replace(LUEX_DT, "'", "''");
			LUEX_KD = CTr.Replace(LUEX_KD, "'", "''");
			CTDI_VL = CTr.Replace(CTDI_VL, "'", "''");
			BEFO_YN = CTr.Replace(BEFO_YN, "'", "''");
			BEFO_YY = CTr.Replace(BEFO_YY, "'", "''");
			BEFO_MM = CTr.Replace(BEFO_MM, "'", "''");
			PNRT_YN = CTr.Replace(PNRT_YN, "'", "''");
			PNRT1_YN = CTr.Replace(PNRT1_YN, "'", "''");
			PNRT1IC_KD = CTr.Replace(PNRT1IC_KD, "'", "''");
			PNRT1SL_KD = CTr.Replace(PNRT1SL_KD, "'", "''");
			PNRT1SZ1_VL = CTr.Replace(PNRT1SZ1_VL, "'", "''");
			PNRT1SZ2_VL = CTr.Replace(PNRT1SZ2_VL, "'", "''");
			PNRT1FT_KD = CTr.Replace(PNRT1FT_KD, "'", "''");
			PNRT1TR1_KD = CTr.Replace(PNRT1TR1_KD, "'", "''");
			PNRT1TR2_KD = CTr.Replace(PNRT1TR2_KD, "'", "''");
			PNRT2_YN = CTr.Replace(PNRT2_YN, "'", "''");
			PNRT2IC_KD = CTr.Replace(PNRT2IC_KD, "'", "''");
			PNRT2SL_KD = CTr.Replace(PNRT2SL_KD, "'", "''");
			PNRT2SZ1_VL = CTr.Replace(PNRT2SZ1_VL, "'", "''");
			PNRT2SZ2_VL = CTr.Replace(PNRT2SZ2_VL, "'", "''");
			PNRT2FT_KD = CTr.Replace(PNRT2FT_KD, "'", "''");
			PNRT2TR1_KD = CTr.Replace(PNRT2TR1_KD, "'", "''");
			PNRT2TR2_KD = CTr.Replace(PNRT2TR2_KD, "'", "''");
			PNRT3_YN = CTr.Replace(PNRT3_YN, "'", "''");
			PNRT3IC_KD = CTr.Replace(PNRT3IC_KD, "'", "''");
			PNRT3SL_KD = CTr.Replace(PNRT3SL_KD, "'", "''");
			PNRT3SZ1_VL = CTr.Replace(PNRT3SZ1_VL, "'", "''");
			PNRT3SZ2_VL = CTr.Replace(PNRT3SZ2_VL, "'", "''");
			PNRT3FT_KD = CTr.Replace(PNRT3FT_KD, "'", "''");
			PNRT3TR1_KD = CTr.Replace(PNRT3TR1_KD, "'", "''");
			PNRT3TR2_KD = CTr.Replace(PNRT3TR2_KD, "'", "''");
			PNRT4_YN = CTr.Replace(PNRT4_YN, "'", "''");
			PNRT4IC_KD = CTr.Replace(PNRT4IC_KD, "'", "''");
			PNRT4SL_KD = CTr.Replace(PNRT4SL_KD, "'", "''");
			PNRT4SZ1_VL = CTr.Replace(PNRT4SZ1_VL, "'", "''");
			PNRT4SZ2_VL = CTr.Replace(PNRT4SZ2_VL, "'", "''");
			PNRT4FT_KD = CTr.Replace(PNRT4FT_KD, "'", "''");
			PNRT4TR1_KD = CTr.Replace(PNRT4TR1_KD, "'", "''");
			PNRT4TR2_KD = CTr.Replace(PNRT4TR2_KD, "'", "''");
			PNRT5_YN = CTr.Replace(PNRT5_YN, "'", "''");
			PNRT5IC_KD = CTr.Replace(PNRT5IC_KD, "'", "''");
			PNRT5SL_KD = CTr.Replace(PNRT5SL_KD, "'", "''");
			PNRT5SZ1_VL = CTr.Replace(PNRT5SZ1_VL, "'", "''");
			PNRT5SZ2_VL = CTr.Replace(PNRT5SZ2_VL, "'", "''");
			PNRT5FT_KD = CTr.Replace(PNRT5FT_KD, "'", "''");
			PNRT5TR1_KD = CTr.Replace(PNRT5TR1_KD, "'", "''");
			PNRT5TR2_KD = CTr.Replace(PNRT5TR2_KD, "'", "''");
			PNRT6_YN = CTr.Replace(PNRT6_YN, "'", "''");
			PNRT6IC_KD = CTr.Replace(PNRT6IC_KD, "'", "''");
			PNRT6SL_KD = CTr.Replace(PNRT6SL_KD, "'", "''");
			PNRT6SZ1_VL = CTr.Replace(PNRT6SZ1_VL, "'", "''");
			PNRT6SZ2_VL = CTr.Replace(PNRT6SZ2_VL, "'", "''");
			PNRT6FT_KD = CTr.Replace(PNRT6FT_KD, "'", "''");
			PNRT6TR1_KD = CTr.Replace(PNRT6TR1_KD, "'", "''");
			PNRT6TR2_KD = CTr.Replace(PNRT6TR2_KD, "'", "''");
			BRLE_YN = CTr.Replace(BRLE_YN, "'", "''");
			BRLE_EX = CTr.Replace(BRLE_EX, "'", "''");
			LUCN_KD = CTr.Replace(LUCN_KD, "'", "''");
			LUCN_EX = CTr.Replace(LUCN_EX, "'", "''");
			SCRT_CD = CTr.Replace(SCRT_CD, "'", "''");
			SCRT_EX = CTr.Replace(SCRT_EX, "'", "''");
			INPT_YN = CTr.Replace(INPT_YN, "'", "''");
			RSLT_KD = CTr.Replace(RSLT_KD, "'", "''");
			RSLT2_KD = CTr.Replace(RSLT2_KD, "'", "''");
			ETC_KD = CTr.Replace(ETC_KD, "'", "''");
			ETC_EX = CTr.Replace(ETC_EX, "'", "''");
			RSLT_EX = CTr.Replace(RSLT_EX, "'", "''");
			RSLT_ETC_EX = CTr.Replace(RSLT_ETC_EX, "'", "''");
			CFRM_DT = CTr.Replace(CFRM_DT, "'", "''");
			LICEN_CD = CTr.Replace(LICEN_CD, "'", "''");
			DECI_LICEN_CD = CTr.Replace(DECI_LICEN_CD, "'", "''");
			LUCN_YN = CTr.Replace(LUCN_YN, "'", "''");
			AFRL_EX = CTr.Replace(AFRL_EX, "'", "''");
			AFSM_EX = CTr.Replace(AFSM_EX, "'", "''");
			AFDT_DT = CTr.Replace(AFDT_DT, "'", "''");
			AFPL_CD = CTr.Replace(AFPL_CD, "'", "''");
			AFTE_LICEN_CD = CTr.Replace(AFTE_LICEN_CD, "'", "''");
			USER = CTr.Replace(USER, "'", "''");
			SMOK_CK10 = CTr.Replace(SMOK_CK10, "'", "''");
			SMOK_CK11 = CTr.Replace(SMOK_CK11, "'", "''");
			SMOK_CK20 = CTr.Replace(SMOK_CK20, "'", "''");
			SMOK_CK21 = CTr.Replace(SMOK_CK21, "'", "''");
			SMOK_CK22 = CTr.Replace(SMOK_CK22, "'", "''");
			SMOK_CK30 = CTr.Replace(SMOK_CK30, "'", "''");
			SMOK_CK40 = CTr.Replace(SMOK_CK40, "'", "''");
			SMOK_CK41 = CTr.Replace(SMOK_CK41, "'", "''");
			SMOK_CK42 = CTr.Replace(SMOK_CK42, "'", "''");

			if(ICOUNT.equals("0")) {
				sql = " INSERT INTO ET_CANCER_LUNG ";
				sql += " ( ECG_EXAM_DT ";
				sql += " , ECG_EXAM_SQ ";
				sql += " , ECG_LUEX_DT ";
				sql += " , ECG_LUEX_KD ";
				sql += " , ECG_CTDI_VL ";
				sql += " , ECG_BEFO_YN ";
				sql += " , ECG_BEFO_YY ";
				sql += " , ECG_BEFO_MM ";
				sql += " , ECG_PNRT_YN ";
				sql += " , ECG_PNRT1_YN ";
				sql += " , ECG_PNRT1IC_KD ";
				sql += " , ECG_PNRT1SL_KD ";
				sql += " , ECG_PNRT1SZ1_VL ";
				sql += " , ECG_PNRT1SZ2_VL ";
				sql += " , ECG_PNRT1FT_KD ";
				sql += " , ECG_PNRT1TR1_KD ";
				sql += " , ECG_PNRT1TR2_KD ";
				sql += " , ECG_PNRT2_YN ";
				sql += " , ECG_PNRT2IC_KD ";
				sql += " , ECG_PNRT2SL_KD ";
				sql += " , ECG_PNRT2SZ1_VL ";
				sql += " , ECG_PNRT2SZ2_VL ";
				sql += " , ECG_PNRT2FT_KD ";
				sql += " , ECG_PNRT2TR1_KD ";
				sql += " , ECG_PNRT2TR2_KD ";
				sql += " , ECG_PNRT3_YN ";
				sql += " , ECG_PNRT3IC_KD ";
				sql += " , ECG_PNRT3SL_KD ";
				sql += " , ECG_PNRT3SZ1_VL ";
				sql += " , ECG_PNRT3SZ2_VL ";
				sql += " , ECG_PNRT3FT_KD ";
				sql += " , ECG_PNRT3TR1_KD ";
				sql += " , ECG_PNRT3TR2_KD ";
				sql += " , ECG_PNRT4_YN ";
				sql += " , ECG_PNRT4IC_KD ";
				sql += " , ECG_PNRT4SL_KD ";
				sql += " , ECG_PNRT4SZ1_VL ";
				sql += " , ECG_PNRT4SZ2_VL ";
				sql += " , ECG_PNRT4FT_KD ";
				sql += " , ECG_PNRT4TR1_KD ";
				sql += " , ECG_PNRT4TR2_KD ";
				sql += " , ECG_PNRT5_YN ";
				sql += " , ECG_PNRT5IC_KD ";
				sql += " , ECG_PNRT5SL_KD ";
				sql += " , ECG_PNRT5SZ1_VL ";
				sql += " , ECG_PNRT5SZ2_VL ";
				sql += " , ECG_PNRT5FT_KD ";
				sql += " , ECG_PNRT5TR1_KD ";
				sql += " , ECG_PNRT5TR2_KD ";
				sql += " , ECG_PNRT6_YN ";
				sql += " , ECG_PNRT6IC_KD ";
				sql += " , ECG_PNRT6SL_KD ";
				sql += " , ECG_PNRT6SZ1_VL ";
				sql += " , ECG_PNRT6SZ2_VL ";
				sql += " , ECG_PNRT6FT_KD ";
				sql += " , ECG_PNRT6TR1_KD ";
				sql += " , ECG_PNRT6TR2_KD ";
				sql += " , ECG_BRLE_YN ";
				sql += " , ECG_BRLE_EX ";
				sql += " , ECG_LUCN_KD ";
				sql += " , ECG_LUCN_EX ";
				sql += " , ECG_SCRT_CD ";
				sql += " , ECG_SCRT_EX ";
				sql += " , ECG_INPT_YN ";
				sql += " , ECG_RSLT_KD ";
				sql += " , ECG_RSLT2_KD ";
				sql += " , ECG_ETC_KD ";
				sql += " , ECG_ETC_EX ";
				sql += " , ECG_RSLT_EX ";
				sql += " , ECG_RSLT_ETC_EX ";
				sql += " , ECG_CFRM_DT ";
				sql += " , ECG_LICEN_CD ";
				sql += " , ECG_DECI_LICEN_CD ";
				sql += " , ECG_LUCN_YN ";
				sql += " , ECG_AFRL_EX ";
				sql += " , ECG_AFSM_EX ";
				sql += " , ECG_AFDT_DT ";
				sql += " , ECG_AFPL_CD ";
				sql += " , ECG_AFTE_LICEN_CD ";
				sql += " , ECG_SMOK_CK10  ";
				sql += " , ECG_SMOK_CK11  ";
				sql += " , ECG_SMOK_CK20  ";
				sql += " , ECG_SMOK_CK21  ";
				sql += " , ECG_SMOK_CK22  ";
				sql += " , ECG_SMOK_CK30  ";
				sql += " , ECG_SMOK_CK40  ";
				sql += " , ECG_SMOK_CK41  ";
				sql += " , ECG_SMOK_CK42  ";
				sql += " , ECG_INPUT_DTT ";
				sql += " , ECG_INPUT_ID ) ";
				sql += " VALUES ( ";
				sql += "  '" + EXAM_DT + "'";
				sql += ", '" + EXAM_SQ + "'";
				sql += ", '" + LUEX_DT + "'";
				sql += ", '" + LUEX_KD + "'";
				sql += ", '" + CTDI_VL + "'";
				sql += ", '" + BEFO_YN + "'";
				sql += ", '" + BEFO_YY + "'";
				sql += ", '" + BEFO_MM + "'";
				sql += ", '" + PNRT_YN + "'";
				sql += ", '" + PNRT1_YN + "'";
				sql += ", '" + PNRT1IC_KD + "'";
				sql += ", '" + PNRT1SL_KD + "'";
				sql += ", '" + PNRT1SZ1_VL + "'";
				sql += ", '" + PNRT1SZ2_VL + "'";
				sql += ", '" + PNRT1FT_KD + "'";
				sql += ", '" + PNRT1TR1_KD + "'";
				sql += ", '" + PNRT1TR2_KD + "'";
				sql += ", '" + PNRT2_YN + "'";
				sql += ", '" + PNRT2IC_KD + "'";
				sql += ", '" + PNRT2SL_KD + "'";
				sql += ", '" + PNRT2SZ1_VL + "'";
				sql += ", '" + PNRT2SZ2_VL + "'";
				sql += ", '" + PNRT2FT_KD + "'";
				sql += ", '" + PNRT2TR1_KD + "'";
				sql += ", '" + PNRT2TR2_KD + "'";
				sql += ", '" + PNRT3_YN + "'";
				sql += ", '" + PNRT3IC_KD + "'";
				sql += ", '" + PNRT3SL_KD + "'";
				sql += ", '" + PNRT3SZ1_VL + "'";
				sql += ", '" + PNRT3SZ2_VL + "'";
				sql += ", '" + PNRT3FT_KD + "'";
				sql += ", '" + PNRT3TR1_KD + "'";
				sql += ", '" + PNRT3TR2_KD + "'";
				sql += ", '" + PNRT4_YN + "'";
				sql += ", '" + PNRT4IC_KD + "'";
				sql += ", '" + PNRT4SL_KD + "'";
				sql += ", '" + PNRT4SZ1_VL + "'";
				sql += ", '" + PNRT4SZ2_VL + "'";
				sql += ", '" + PNRT4FT_KD + "'";
				sql += ", '" + PNRT4TR1_KD + "'";
				sql += ", '" + PNRT4TR2_KD + "'";
				sql += ", '" + PNRT5_YN + "'";
				sql += ", '" + PNRT5IC_KD + "'";
				sql += ", '" + PNRT5SL_KD + "'";
				sql += ", '" + PNRT5SZ1_VL + "'";
				sql += ", '" + PNRT5SZ2_VL + "'";
				sql += ", '" + PNRT5FT_KD + "'";
				sql += ", '" + PNRT5TR1_KD + "'";
				sql += ", '" + PNRT5TR2_KD + "'";
				sql += ", '" + PNRT6_YN + "'";
				sql += ", '" + PNRT6IC_KD + "'";
				sql += ", '" + PNRT6SL_KD + "'";
				sql += ", '" + PNRT6SZ1_VL + "'";
				sql += ", '" + PNRT6SZ2_VL + "'";
				sql += ", '" + PNRT6FT_KD + "'";
				sql += ", '" + PNRT6TR1_KD + "'";
				sql += ", '" + PNRT6TR2_KD + "'";
				sql += ", '" + BRLE_YN + "'";
				sql += ", '" + BRLE_EX + "'";
				sql += ", '" + LUCN_KD + "'";
				sql += ", '" + LUCN_EX + "'";
				sql += ", '" + SCRT_CD + "'";
				sql += ", '" + SCRT_EX + "'";
				sql += ", '" + INPT_YN + "'";
				sql += ", '" + RSLT_KD + "'";
				sql += ", '" + RSLT2_KD + "'";
				sql += ", '" + ETC_KD + "'";
				sql += ", '" + ETC_EX + "'";
				sql += ", '" + RSLT_EX + "'";
				sql += ", '" + RSLT_ETC_EX + "'";
				sql += ", '" + CFRM_DT + "'";
				sql += ", '" + LICEN_CD + "'";
				sql += ", '" + DECI_LICEN_CD + "'";
				sql += ", '" + LUCN_YN + "'";
				sql += ", '" + AFRL_EX + "'";
				sql += ", '" + AFSM_EX + "'";
				sql += ", '" + AFDT_DT + "'";
				sql += ", '" + AFPL_CD + "'";
				sql += ", '" + AFTE_LICEN_CD + "'";
				sql += ", '" + SMOK_CK10 + "'";
				sql += ", '" + SMOK_CK11 + "'";
				sql += ", '" + SMOK_CK20 + "'";
				sql += ", '" + SMOK_CK21 + "'";
				sql += ", '" + SMOK_CK22 + "'";
				sql += ", '" + SMOK_CK30 + "'";
				sql += ", '" + SMOK_CK40 + "'";
				sql += ", '" + SMOK_CK41 + "'";
				sql += ", '" + SMOK_CK42 + "'";
				sql += ", SYSDATE";
				sql += ", '" + USER + "'";
				sql += ")";

				argStmtExec.executeUpdate(sql);

			}
			else {
				sql = "UPDATE ET_CANCER_LUNG SET ";
				sql += "  ECG_LUEX_DT = '" + LUEX_DT + "'";
				sql += ", ECG_LUEX_KD = '" + LUEX_KD + "'";
				sql += ", ECG_CTDI_VL = '" + CTDI_VL + "'";
				sql += ", ECG_BEFO_YN = '" + BEFO_YN + "'";
				sql += ", ECG_BEFO_YY = '" + BEFO_YY + "'";
				sql += ", ECG_BEFO_MM = '" + BEFO_MM + "'";
				sql += ", ECG_PNRT_YN = '" + PNRT_YN + "'";
				sql += ", ECG_PNRT1_YN = '" + PNRT1_YN + "'";
				sql += ", ECG_PNRT1IC_KD = '" + PNRT1IC_KD + "'";
				sql += ", ECG_PNRT1SL_KD = '" + PNRT1SL_KD + "'";
				sql += ", ECG_PNRT1SZ1_VL = '" + PNRT1SZ1_VL + "'";
				sql += ", ECG_PNRT1SZ2_VL = '" + PNRT1SZ2_VL + "'";
				sql += ", ECG_PNRT1FT_KD = '" + PNRT1FT_KD + "'";
				sql += ", ECG_PNRT1TR1_KD = '" + PNRT1TR1_KD + "'";
				sql += ", ECG_PNRT1TR2_KD = '" + PNRT1TR2_KD + "'";
				sql += ", ECG_PNRT2_YN = '" + PNRT2_YN + "'";
				sql += ", ECG_PNRT2IC_KD = '" + PNRT2IC_KD + "'";
				sql += ", ECG_PNRT2SL_KD = '" + PNRT2SL_KD + "'";
				sql += ", ECG_PNRT2SZ1_VL = '" + PNRT2SZ1_VL + "'";
				sql += ", ECG_PNRT2SZ2_VL = '" + PNRT2SZ2_VL + "'";
				sql += ", ECG_PNRT2FT_KD = '" + PNRT2FT_KD + "'";
				sql += ", ECG_PNRT2TR1_KD = '" + PNRT2TR1_KD + "'";
				sql += ", ECG_PNRT2TR2_KD = '" + PNRT2TR2_KD + "'";
				sql += ", ECG_PNRT3_YN = '" + PNRT3_YN + "'";
				sql += ", ECG_PNRT3IC_KD = '" + PNRT3IC_KD + "'";
				sql += ", ECG_PNRT3SL_KD = '" + PNRT3SL_KD + "'";
				sql += ", ECG_PNRT3SZ1_VL = '" + PNRT3SZ1_VL + "'";
				sql += ", ECG_PNRT3SZ2_VL = '" + PNRT3SZ2_VL + "'";
				sql += ", ECG_PNRT3FT_KD = '" + PNRT3FT_KD + "'";
				sql += ", ECG_PNRT3TR1_KD = '" + PNRT3TR1_KD + "'";
				sql += ", ECG_PNRT3TR2_KD = '" + PNRT3TR2_KD + "'";
				sql += ", ECG_PNRT4_YN = '" + PNRT4_YN + "'";
				sql += ", ECG_PNRT4IC_KD = '" + PNRT4IC_KD + "'";
				sql += ", ECG_PNRT4SL_KD = '" + PNRT4SL_KD + "'";
				sql += ", ECG_PNRT4SZ1_VL = '" + PNRT4SZ1_VL + "'";
				sql += ", ECG_PNRT4SZ2_VL = '" + PNRT4SZ2_VL + "'";
				sql += ", ECG_PNRT4FT_KD = '" + PNRT4FT_KD + "'";
				sql += ", ECG_PNRT4TR1_KD = '" + PNRT4TR1_KD + "'";
				sql += ", ECG_PNRT4TR2_KD = '" + PNRT4TR2_KD + "'";
				sql += ", ECG_PNRT5_YN = '" + PNRT5_YN + "'";
				sql += ", ECG_PNRT5IC_KD = '" + PNRT5IC_KD + "'";
				sql += ", ECG_PNRT5SL_KD = '" + PNRT5SL_KD + "'";
				sql += ", ECG_PNRT5SZ1_VL = '" + PNRT5SZ1_VL + "'";
				sql += ", ECG_PNRT5SZ2_VL = '" + PNRT5SZ2_VL + "'";
				sql += ", ECG_PNRT5FT_KD = '" + PNRT5FT_KD + "'";
				sql += ", ECG_PNRT5TR1_KD = '" + PNRT5TR1_KD + "'";
				sql += ", ECG_PNRT5TR2_KD = '" + PNRT5TR2_KD + "'";
				sql += ", ECG_PNRT6_YN = '" + PNRT6_YN + "'";
				sql += ", ECG_PNRT6IC_KD = '" + PNRT6IC_KD + "'";
				sql += ", ECG_PNRT6SL_KD = '" + PNRT6SL_KD + "'";
				sql += ", ECG_PNRT6SZ1_VL = '" + PNRT6SZ1_VL + "'";
				sql += ", ECG_PNRT6SZ2_VL = '" + PNRT6SZ2_VL + "'";
				sql += ", ECG_PNRT6FT_KD = '" + PNRT6FT_KD + "'";
				sql += ", ECG_PNRT6TR1_KD = '" + PNRT6TR1_KD + "'";
				sql += ", ECG_PNRT6TR2_KD = '" + PNRT6TR2_KD + "'";
				sql += ", ECG_BRLE_YN = '" + BRLE_YN + "'";
				sql += ", ECG_BRLE_EX = '" + BRLE_EX + "'";
				sql += ", ECG_LUCN_KD = '" + LUCN_KD + "'";
				sql += ", ECG_LUCN_EX = '" + LUCN_EX + "'";
				sql += ", ECG_SCRT_CD = '" + SCRT_CD + "'";
				sql += ", ECG_SCRT_EX = '" + SCRT_EX + "'";
				sql += ", ECG_INPT_YN = '" + INPT_YN + "'";
				sql += ", ECG_RSLT_KD = '" + RSLT_KD + "'";
				sql += ", ECG_RSLT2_KD = '" + RSLT2_KD + "'";
				sql += ", ECG_ETC_KD = '" + ETC_KD + "'";
				sql += ", ECG_ETC_EX = '" + ETC_EX + "'";
				sql += ", ECG_RSLT_EX = '" + RSLT_EX + "'";
				sql += ", ECG_RSLT_ETC_EX = '" + RSLT_ETC_EX + "'";
				sql += ", ECG_CFRM_DT = '" + CFRM_DT + "'";
				sql += ", ECG_LICEN_CD = '" + LICEN_CD + "'";
				sql += ", ECG_DECI_LICEN_CD = '" + DECI_LICEN_CD + "'";
				sql += ", ECG_LUCN_YN = '" + LUCN_YN + "'";
				sql += ", ECG_AFRL_EX = '" + AFRL_EX + "'";
				sql += ", ECG_AFSM_EX = '" + AFSM_EX + "'";
				sql += ", ECG_AFDT_DT = '" + AFDT_DT + "'";
				sql += ", ECG_AFPL_CD = '" + AFPL_CD + "'";
				sql += ", ECG_AFTE_LICEN_CD = '" + AFTE_LICEN_CD + "'";
				sql += ", ECG_SMOK_CK10   = '" + SMOK_CK10 + "' ";
				sql += ", ECG_SMOK_CK11   = '" + SMOK_CK11 + "' ";
				sql += ", ECG_SMOK_CK20   = '" + SMOK_CK20 + "' ";
				sql += ", ECG_SMOK_CK21   = '" + SMOK_CK21 + "' ";
				sql += ", ECG_SMOK_CK22   = '" + SMOK_CK22 + "' ";
				sql += ", ECG_SMOK_CK30   = '" + SMOK_CK30 + "' ";
				sql += ", ECG_SMOK_CK40   = '" + SMOK_CK40 + "' ";
				sql += ", ECG_SMOK_CK41   = '" + SMOK_CK41 + "' ";
				sql += ", ECG_SMOK_CK42   = '" + SMOK_CK42 + "' ";
				sql += ", ECG_MODI_DTT = SYSDATE";
				sql += ", ECG_MODI_ID = '" + USER + "'";
				sql += " WHERE ECG_EXAM_DT = '" + EXAM_DT + "'";
				sql += " AND ECG_EXAM_SQ = '" + EXAM_SQ + "'";

				argStmtExec.executeUpdate(sql);

			}
		} catch (Exception e) {

			throw new FuncException(e.toString(), sql);
		}

		return sql;
	}
%>
