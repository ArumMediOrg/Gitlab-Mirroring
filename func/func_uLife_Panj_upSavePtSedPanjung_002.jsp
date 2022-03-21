<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%!
	public String func_uLife_Panj_upSavePtSedPanjung_002(Statement argStmtExec, HashMap argHtMethod) throws Exception {

		String sql = "";
		String sql2 = "";
		String sql_disp = "";

		try {

			String SSAVEMODE = (String) argHtMethod.get("SSAVEMODE");
			String EXAM_DT = (String) argHtMethod.get("EXAM_DT");
			String EXAM_SQ = (String) argHtMethod.get("EXAM_SQ");
			String CESD = (String) argHtMethod.get("CESD");
			String SCORE_CESD = (String) argHtMethod.get("SCORE_CESD");
			String CESD_INFO_YN = (String) argHtMethod.get("CESD_INFO_YN");
			String GDS = (String) argHtMethod.get("GDS");
			String SCORE_GDS = (String) argHtMethod.get("SCORE_GDS");
			String KDSQC = (String) argHtMethod.get("KDSQC");
			String SCORE_SQC = (String) argHtMethod.get("SCORE_SQC");
			String FIR_VIEW = (String) argHtMethod.get("FIR_VIEW");
			String RVIEW = (String) argHtMethod.get("RVIEW");
			String BVIEW = (String) argHtMethod.get("BVIEW");
			String EVALU_SM = (String) argHtMethod.get("EVALU_SM");
			String NICO_SM = (String) argHtMethod.get("NICO_SM");
			String PRSCR_SM = (String) argHtMethod.get("PRSCR_SM");
			String PRSCR_SM_YN = (String) argHtMethod.get("PRSCR_SM_YN");
			String SCORE_SM = (String) argHtMethod.get("SCORE_SM");
			String EVALU_DRN = (String) argHtMethod.get("EVALU_DRN");
			String PRSCR_DRN = (String) argHtMethod.get("PRSCR_DRN");
			String PRSCR_DRN_YN = (String) argHtMethod.get("PRSCR_DRN_YN");
			String SCORE_DRN = (String) argHtMethod.get("SCORE_DRN");
			String EVALU_SPT = (String) argHtMethod.get("EVALU_SPT");
			String PRSCR_SPT = (String) argHtMethod.get("PRSCR_SPT");
			String PRSCR_SPT_TX = (String) argHtMethod.get("PRSCR_SPT_TX");
			String PRSTM_SPT = (String) argHtMethod.get("PRSTM_SPT");
			String PRSTM_SPT_TX = (String) argHtMethod.get("PRSTM_SPT_TX");
			String PRSNUM_SPT = (String) argHtMethod.get("PRSNUM_SPT");
			String PRSCR_SPT_YN = (String) argHtMethod.get("PRSCR_SPT_YN");
			String SCORE_SPT = (String) argHtMethod.get("SCORE_SPT");
			String EVALU_NUT = (String) argHtMethod.get("EVALU_NUT");
			String RECOMDAI_NUT = (String) argHtMethod.get("RECOMDAI_NUT");
			String RECOMPRO_NUT = (String) argHtMethod.get("RECOMPRO_NUT");
			String RECOMVEG_NUT = (String) argHtMethod.get("RECOMVEG_NUT");
			String RESTFAT_NUT = (String) argHtMethod.get("RESTFAT_NUT");
			String RESTSGA_NUT = (String) argHtMethod.get("RESTSGA_NUT");
			String RESTSALT_NUT = (String) argHtMethod.get("RESTSALT_NUT");
			String BFAST_NUT = (String) argHtMethod.get("BFAST_NUT");
			String ALLFOOD_NUT = (String) argHtMethod.get("ALLFOOD_NUT");
			String PRSCR_NUT = (String) argHtMethod.get("PRSCR_NUT");
			String PRSCR_NUT_YN = (String) argHtMethod.get("PRSCR_NUT_YN");
			String SCORE_NUT = (String) argHtMethod.get("SCORE_NUT");
			String BMI_PYC = (String) argHtMethod.get("BMI_PYC");
			String WAIST_PYC = (String) argHtMethod.get("WAIST_PYC");
			String REPAST_PYC = (String) argHtMethod.get("REPAST_PYC");
			String SNACK_PYC = (String) argHtMethod.get("SNACK_PYC");
			String DRINK_PYC = (String) argHtMethod.get("DRINK_PYC");
			String FASTFD_PYC = (String) argHtMethod.get("FASTFD_PYC");
			String SPORT_PYC = (String) argHtMethod.get("SPORT_PYC");
			String CRINIC_PYC = (String) argHtMethod.get("CRINIC_PYC");
			String ETC_PYC = (String) argHtMethod.get("ETC_PYC");
			String ETC_PYC_TX = (String) argHtMethod.get("ETC_PYC_TX");
			String PRSCR_PYC_YN = (String) argHtMethod.get("PRSCR_PYC_YN");
			String METH_GLO = (String) argHtMethod.get("METH_GLO");
			String RVAL_GLO = (String) argHtMethod.get("RVAL_GLO");
			String RESULT_GLO = (String) argHtMethod.get("RESULT_GLO");
			String HIBLOOD_VAL = (String) argHtMethod.get("HIBLOOD_VAL");
			String LIBLOOD_VAL = (String) argHtMethod.get("LIBLOOD_VAL");
			String RESULT_HIBL = (String) argHtMethod.get("RESULT_HIBL");
			String RESULT_DATE = (String) argHtMethod.get("RESULT_DATE");
			String TRANC_DATE = (String) argHtMethod.get("TRANC_DATE");
			String DOCTORSED = (String) argHtMethod.get("DOCTORSED");
			String LIFE_YN = (String) argHtMethod.get("LIFE_YN");
			String FIX_YN = (String) argHtMethod.get("FIX_YN");
			String USER_ID = (String) argHtMethod.get("USER_ID");

			//
			if(SSAVEMODE == null) { SSAVEMODE = ""; }
			if(EXAM_DT == null) { EXAM_DT = ""; }
			if(EXAM_SQ == null) { EXAM_SQ = ""; }
			if(CESD == null) { CESD = ""; }
			if(SCORE_CESD == null) { SCORE_CESD = ""; }
			if(CESD_INFO_YN == null) { CESD_INFO_YN = ""; }
			if(GDS == null) { GDS = ""; }
			if(SCORE_GDS == null) { SCORE_GDS = ""; }
			if(KDSQC == null) { KDSQC = ""; }
			if(SCORE_SQC == null) { SCORE_SQC = ""; }
			if(FIR_VIEW == null) { FIR_VIEW = ""; }
			if(RVIEW == null) { RVIEW = ""; }
			if(BVIEW == null) { BVIEW = ""; }
			if(EVALU_SM == null) { EVALU_SM = ""; }
			if(NICO_SM == null) { NICO_SM = ""; }
			if(PRSCR_SM == null) { PRSCR_SM = ""; }
			if(PRSCR_SM_YN == null) { PRSCR_SM_YN = ""; }
			if(SCORE_SM == null) { SCORE_SM = ""; }
			if(EVALU_DRN == null) { EVALU_DRN = ""; }
			if(PRSCR_DRN == null) { PRSCR_DRN = ""; }
			if(PRSCR_DRN_YN == null) { PRSCR_DRN_YN = ""; }
			if(SCORE_DRN == null) { SCORE_DRN = ""; }
			if(EVALU_SPT == null) { EVALU_SPT = ""; }
			if(PRSCR_SPT == null) { PRSCR_SPT = ""; }
			if(PRSCR_SPT_TX == null) { PRSCR_SPT_TX = ""; }
			if(PRSTM_SPT == null) { PRSTM_SPT = ""; }
			if(PRSTM_SPT_TX == null) { PRSTM_SPT_TX = ""; }
			if(PRSNUM_SPT == null) { PRSNUM_SPT = ""; }
			if(PRSCR_SPT_YN == null) { PRSCR_SPT_YN = ""; }
			if(SCORE_SPT == null) { SCORE_SPT = ""; }
			if(EVALU_NUT == null) { EVALU_NUT = ""; }
			if(RECOMDAI_NUT == null) { RECOMDAI_NUT = ""; }
			if(RECOMPRO_NUT == null) { RECOMPRO_NUT = ""; }
			if(RECOMVEG_NUT == null) { RECOMVEG_NUT = ""; }
			if(RESTFAT_NUT == null) { RESTFAT_NUT = ""; }
			if(RESTSGA_NUT == null) { RESTSGA_NUT = ""; }
			if(RESTSALT_NUT == null) { RESTSALT_NUT = ""; }
			if(BFAST_NUT == null) { BFAST_NUT = ""; }
			if(ALLFOOD_NUT == null) { ALLFOOD_NUT = ""; }
			if(PRSCR_NUT == null) { PRSCR_NUT = ""; }
			if(PRSCR_NUT_YN == null) { PRSCR_NUT_YN = ""; }
			if(SCORE_NUT == null) { SCORE_NUT = ""; }
			if(BMI_PYC == null) { BMI_PYC = ""; }
			if(WAIST_PYC == null) { WAIST_PYC = ""; }
			if(REPAST_PYC == null) { REPAST_PYC = ""; }
			if(SNACK_PYC == null) { SNACK_PYC = ""; }
			if(DRINK_PYC == null) { DRINK_PYC = ""; }
			if(FASTFD_PYC == null) { FASTFD_PYC = ""; }
			if(SPORT_PYC == null) { SPORT_PYC = ""; }
			if(CRINIC_PYC == null) { CRINIC_PYC = ""; }
			if(ETC_PYC == null) { ETC_PYC = ""; }
			if(ETC_PYC_TX == null) { ETC_PYC_TX = ""; }
			if(PRSCR_PYC_YN == null) { PRSCR_PYC_YN = ""; }
			if(METH_GLO == null) { METH_GLO = ""; }
			if(RVAL_GLO == null) { RVAL_GLO = ""; }
			if(RESULT_GLO == null) { RESULT_GLO = ""; }
			if(HIBLOOD_VAL == null) { HIBLOOD_VAL = ""; }
			if(LIBLOOD_VAL == null) { LIBLOOD_VAL = ""; }
			if(RESULT_HIBL == null) { RESULT_HIBL = ""; }
			if(RESULT_DATE == null) { RESULT_DATE = ""; }
			if(TRANC_DATE == null) { TRANC_DATE = ""; }
			if(DOCTORSED == null) { DOCTORSED = ""; }
			if(LIFE_YN == null) { LIFE_YN = ""; }
			if(FIX_YN == null) { FIX_YN = ""; }
			if(USER_ID == null) { USER_ID = ""; }

			//
			SSAVEMODE = CTr.Replace(SSAVEMODE, "'", "''");
			EXAM_DT = CTr.Replace(EXAM_DT, "'", "''");
			EXAM_SQ = CTr.Replace(EXAM_SQ, "'", "''");
			CESD = CTr.Replace(CESD, "'", "''");
			SCORE_CESD = CTr.Replace(SCORE_CESD, "'", "''");
			CESD_INFO_YN = CTr.Replace(CESD_INFO_YN, "'", "''");
			GDS = CTr.Replace(GDS, "'", "''");
			SCORE_GDS = CTr.Replace(SCORE_GDS, "'", "''");
			KDSQC = CTr.Replace(KDSQC, "'", "''");
			SCORE_SQC = CTr.Replace(SCORE_SQC, "'", "''");
			FIR_VIEW = CTr.Replace(FIR_VIEW, "'", "''");
			RVIEW = CTr.Replace(RVIEW, "'", "''");
			BVIEW = CTr.Replace(BVIEW, "'", "''");
			EVALU_SM = CTr.Replace(EVALU_SM, "'", "''");
			NICO_SM = CTr.Replace(NICO_SM, "'", "''");
			PRSCR_SM = CTr.Replace(PRSCR_SM, "'", "''");
			PRSCR_SM_YN = CTr.Replace(PRSCR_SM_YN, "'", "''");
			SCORE_SM = CTr.Replace(SCORE_SM, "'", "''");
			EVALU_DRN = CTr.Replace(EVALU_DRN, "'", "''");
			PRSCR_DRN = CTr.Replace(PRSCR_DRN, "'", "''");
			PRSCR_DRN_YN = CTr.Replace(PRSCR_DRN_YN, "'", "''");
			SCORE_DRN = CTr.Replace(SCORE_DRN, "'", "''");
			EVALU_SPT = CTr.Replace(EVALU_SPT, "'", "''");
			PRSCR_SPT = CTr.Replace(PRSCR_SPT, "'", "''");
			PRSCR_SPT_TX = CTr.Replace(PRSCR_SPT_TX, "'", "''");
			PRSTM_SPT = CTr.Replace(PRSTM_SPT, "'", "''");
			PRSTM_SPT_TX = CTr.Replace(PRSTM_SPT_TX, "'", "''");
			PRSNUM_SPT = CTr.Replace(PRSNUM_SPT, "'", "''");
			PRSCR_SPT_YN = CTr.Replace(PRSCR_SPT_YN, "'", "''");
			SCORE_SPT = CTr.Replace(SCORE_SPT, "'", "''");
			EVALU_NUT = CTr.Replace(EVALU_NUT, "'", "''");
			RECOMDAI_NUT = CTr.Replace(RECOMDAI_NUT, "'", "''");
			RECOMPRO_NUT = CTr.Replace(RECOMPRO_NUT, "'", "''");
			RECOMVEG_NUT = CTr.Replace(RECOMVEG_NUT, "'", "''");
			RESTFAT_NUT = CTr.Replace(RESTFAT_NUT, "'", "''");
			RESTSGA_NUT = CTr.Replace(RESTSGA_NUT, "'", "''");
			RESTSALT_NUT = CTr.Replace(RESTSALT_NUT, "'", "''");
			BFAST_NUT = CTr.Replace(BFAST_NUT, "'", "''");
			ALLFOOD_NUT = CTr.Replace(ALLFOOD_NUT, "'", "''");
			PRSCR_NUT = CTr.Replace(PRSCR_NUT, "'", "''");
			PRSCR_NUT_YN = CTr.Replace(PRSCR_NUT_YN, "'", "''");
			SCORE_NUT = CTr.Replace(SCORE_NUT, "'", "''");
			BMI_PYC = CTr.Replace(BMI_PYC, "'", "''");
			WAIST_PYC = CTr.Replace(WAIST_PYC, "'", "''");
			REPAST_PYC = CTr.Replace(REPAST_PYC, "'", "''");
			SNACK_PYC = CTr.Replace(SNACK_PYC, "'", "''");
			DRINK_PYC = CTr.Replace(DRINK_PYC, "'", "''");
			FASTFD_PYC = CTr.Replace(FASTFD_PYC, "'", "''");
			SPORT_PYC = CTr.Replace(SPORT_PYC, "'", "''");
			CRINIC_PYC = CTr.Replace(CRINIC_PYC, "'", "''");
			ETC_PYC = CTr.Replace(ETC_PYC, "'", "''");
			ETC_PYC_TX = CTr.Replace(ETC_PYC_TX, "'", "''");
			PRSCR_PYC_YN = CTr.Replace(PRSCR_PYC_YN, "'", "''");
			METH_GLO = CTr.Replace(METH_GLO, "'", "''");
			RVAL_GLO = CTr.Replace(RVAL_GLO, "'", "''");
			RESULT_GLO = CTr.Replace(RESULT_GLO, "'", "''");
			HIBLOOD_VAL = CTr.Replace(HIBLOOD_VAL, "'", "''");
			LIBLOOD_VAL = CTr.Replace(LIBLOOD_VAL, "'", "''");
			RESULT_HIBL = CTr.Replace(RESULT_HIBL, "'", "''");
			RESULT_DATE = CTr.Replace(RESULT_DATE, "'", "''");
			TRANC_DATE = CTr.Replace(TRANC_DATE, "'", "''");
			DOCTORSED = CTr.Replace(DOCTORSED, "'", "''");
			LIFE_YN = CTr.Replace(LIFE_YN, "'", "''");
			FIX_YN = CTr.Replace(FIX_YN, "'", "''");
			USER_ID = CTr.Replace(USER_ID, "'", "''");

			if(SSAVEMODE.equals("I")) {
				sql = "INSERT INTO PT_SED_PANJUNG ( PSP_EXAM_DT ,PSP_EXAM_SQ ,PSP_CESD ,PSP_SCORE_CESD ,PSP_CESD_INFO_YN, PSP_GDS ,PSP_SCORE_GDS ,PSP_KDSQC ,PSP_SCORE_SQC ,PSP_FIR_VIEW ,PSP_RVIEW ,PSP_BVIEW ,PSP_EVALU_SM ,PSP_NICO_SM ,PSP_PRSCR_SM ,PSP_PRSCR_SM_YN ,PSP_SCORE_SM ,PSP_EVALU_DRN ,PSP_PRSCR_DRN ,PSP_PRSCR_DRN_YN ,PSP_SCORE_DRN ,PSP_EVALU_SPT ,PSP_PRSCR_SPT ,PSP_PRSCR_SPT_TX ,PSP_PRSTM_SPT ,PSP_PRSTM_SPT_TX ,PSP_PRSNUM_SPT ,PSP_PRSCR_SPT_YN ,PSP_SCORE_SPT ,PSP_EVALU_NUT ,PSP_RECOMDAI_NUT ,PSP_RECOMPRO_NUT ,PSP_RECOMVEG_NUT ,PSP_RESTFAT_NUT ,PSP_RESTSGA_NUT ,PSP_RESTSALT_NUT ,PSP_BFAST_NUT ,PSP_ALLFOOD_NUT ,PSP_PRSCR_NUT ,PSP_PRSCR_NUT_YN ,PSP_SCORE_NUT ,PSP_BMI_PYC ,PSP_WAIST_PYC ,PSP_REPAST_PYC ,PSP_SNACK_PYC ,PSP_DRINK_PYC ,PSP_FASTFD_PYC ,PSP_SPORT_PYC ,PSP_CRINIC_PYC ,PSP_ETC_PYC ,PSP_ETC_PYC_TX ,PSP_PRSCR_PYC_YN ,PSP_METH_GLO ,PSP_RVAL_GLO ,PSP_RESULT_GLO ,PSP_HIBLOOD_VAL ,PSP_LIBLOOD_VAL ,PSP_RESULT_HIBL ,PSP_RESULT_DATE ,PSP_TRANC_DATE ,PSP_DOCTORSED ,PSP_LIFE_YN, PSP_FIX_YN ,PSP_INPUT_ID ,PSP_INPUT_DTT ) VALUES (";
				sql += "  '" + EXAM_DT + "'";
				sql += ", '" + EXAM_SQ + "'";
				sql += ", '" + CESD + "'";
				sql += ", '" + SCORE_CESD + "'";
				sql += ", '" + CESD_INFO_YN + "'";
				sql += ", '" + GDS + "'";
				sql += ", '" + SCORE_GDS + "'";
				sql += ", '" + KDSQC + "'";
				sql += ", '" + SCORE_SQC + "'";
				sql += ", '" + FIR_VIEW + "'";
				sql += ", '" + RVIEW + "'";
				sql += ", '" + BVIEW + "'";
				sql += ", '" + EVALU_SM + "'";
				sql += ", '" + NICO_SM + "'";
				sql += ", '" + PRSCR_SM + "'";
				sql += ", '" + PRSCR_SM_YN + "'";
				sql += ", '" + SCORE_SM + "'";
				sql += ", '" + EVALU_DRN + "'";
				sql += ", '" + PRSCR_DRN + "'";
				sql += ", '" + PRSCR_DRN_YN + "'";
				sql += ", '" + SCORE_DRN + "'";
				sql += ", '" + EVALU_SPT + "'";
				sql += ", '" + PRSCR_SPT + "'";
				sql += ", '" + PRSCR_SPT_TX + "'";
				sql += ", '" + PRSTM_SPT + "'";
				sql += ", '" + PRSTM_SPT_TX + "'";
				sql += ", '" + PRSNUM_SPT + "'";
				sql += ", '" + PRSCR_SPT_YN + "'";
				sql += ", '" + SCORE_SPT + "'";
				sql += ", '" + EVALU_NUT + "'";
				sql += ", '" + RECOMDAI_NUT + "'";
				sql += ", '" + RECOMPRO_NUT + "'";
				sql += ", '" + RECOMVEG_NUT + "'";
				sql += ", '" + RESTFAT_NUT + "'";
				sql += ", '" + RESTSGA_NUT + "'";
				sql += ", '" + RESTSALT_NUT + "'";
				sql += ", '" + BFAST_NUT + "'";
				sql += ", '" + ALLFOOD_NUT + "'";
				sql += ", '" + PRSCR_NUT + "'";
				sql += ", '" + PRSCR_NUT_YN + "'";
				sql += ", '" + SCORE_NUT + "'";
				sql += ", '" + BMI_PYC + "'";
				sql += ", '" + WAIST_PYC + "'";
				sql += ", '" + REPAST_PYC + "'";
				sql += ", '" + SNACK_PYC + "'";
				sql += ", '" + DRINK_PYC + "'";
				sql += ", '" + FASTFD_PYC + "'";
				sql += ", '" + SPORT_PYC + "'";
				sql += ", '" + CRINIC_PYC + "'";
				sql += ", '" + ETC_PYC + "'";
				sql += ", '" + ETC_PYC_TX + "'";
				sql += ", '" + PRSCR_PYC_YN + "'";
				sql += ", '" + METH_GLO + "'";
				sql += ", '" + RVAL_GLO + "'";
				sql += ", '" + RESULT_GLO + "'";
				sql += ", '" + HIBLOOD_VAL + "'";
				sql += ", '" + LIBLOOD_VAL + "'";
				sql += ", '" + RESULT_HIBL + "'";
				sql += ", '" + RESULT_DATE + "'";
				sql += ", '" + TRANC_DATE + "'";
				sql += ", '" + DOCTORSED + "'";
				sql += ", '" + LIFE_YN + "'";
				sql += ", '" + FIX_YN + "'";
				sql += ", '" + USER_ID + "'";
				sql += ", SYSDATE";
				sql += ")";

				argStmtExec.executeUpdate(sql);
			}
			else if(SSAVEMODE.equals("U")) {
				sql = "UPDATE PT_SED_PANJUNG SET ";
				sql += "  PSP_CESD = '" + CESD + "'";
				sql += ", PSP_SCORE_CESD = '" + SCORE_CESD + "'";
				sql += ", PSP_CESD_INFO_YN = '" + CESD_INFO_YN + "'";
				sql += ", PSP_GDS = '" + GDS + "'";
				sql += ", PSP_SCORE_GDS = '" + SCORE_GDS + "'";
				sql += ", PSP_KDSQC = '" + KDSQC + "'";
				sql += ", PSP_SCORE_SQC = '" + SCORE_SQC + "'";
				sql += ", PSP_FIR_VIEW = '" + FIR_VIEW + "'";
				sql += ", PSP_RVIEW = '" + RVIEW + "'";
				sql += ", PSP_BVIEW = '" + BVIEW + "'";
				sql += ", PSP_EVALU_SM = '" + EVALU_SM + "'";
				sql += ", PSP_NICO_SM = '" + NICO_SM + "'";
				sql += ", PSP_PRSCR_SM = '" + PRSCR_SM + "'";
				sql += ", PSP_PRSCR_SM_YN = '" + PRSCR_SM_YN + "'";
				sql += ", PSP_SCORE_SM = '" + SCORE_SM + "'";
				sql += ", PSP_EVALU_DRN = '" + EVALU_DRN + "'";
				sql += ", PSP_PRSCR_DRN = '" + PRSCR_DRN + "'";
				sql += ", PSP_PRSCR_DRN_YN = '" + PRSCR_DRN_YN + "'";
				sql += ", PSP_SCORE_DRN = '" + SCORE_DRN + "'";
				sql += ", PSP_EVALU_SPT = '" + EVALU_SPT + "'";
				sql += ", PSP_PRSCR_SPT = '" + PRSCR_SPT + "'";
				sql += ", PSP_PRSCR_SPT_TX = '" + PRSCR_SPT_TX + "'";
				sql += ", PSP_PRSTM_SPT = '" + PRSTM_SPT + "'";
				sql += ", PSP_PRSTM_SPT_TX = '" + PRSTM_SPT_TX + "'";
				sql += ", PSP_PRSNUM_SPT = '" + PRSNUM_SPT + "'";
				sql += ", PSP_PRSCR_SPT_YN = '" + PRSCR_SPT_YN + "'";
				sql += ", PSP_SCORE_SPT = '" + SCORE_SPT + "'";
				sql += ", PSP_EVALU_NUT = '" + EVALU_NUT + "'";
				sql += ", PSP_RECOMDAI_NUT = '" + RECOMDAI_NUT + "'";
				sql += ", PSP_RECOMPRO_NUT = '" + RECOMPRO_NUT + "'";
				sql += ", PSP_RECOMVEG_NUT = '" + RECOMVEG_NUT + "'";
				sql += ", PSP_RESTFAT_NUT = '" + RESTFAT_NUT + "'";
				sql += ", PSP_RESTSGA_NUT = '" + RESTSGA_NUT + "'";
				sql += ", PSP_RESTSALT_NUT = '" + RESTSALT_NUT + "'";
				sql += ", PSP_BFAST_NUT = '" + BFAST_NUT + "'";
				sql += ", PSP_ALLFOOD_NUT = '" + ALLFOOD_NUT + "'";
				sql += ", PSP_PRSCR_NUT = '" + PRSCR_NUT + "'";
				sql += ", PSP_PRSCR_NUT_YN = '" + PRSCR_NUT_YN + "'";
				sql += ", PSP_SCORE_NUT = '" + SCORE_NUT + "'";
				sql += ", PSP_BMI_PYC = '" + BMI_PYC + "'";
				sql += ", PSP_WAIST_PYC = '" + WAIST_PYC + "'";
				sql += ", PSP_REPAST_PYC = '" + REPAST_PYC + "'";
				sql += ", PSP_SNACK_PYC = '" + SNACK_PYC + "'";
				sql += ", PSP_DRINK_PYC = '" + DRINK_PYC + "'";
				sql += ", PSP_FASTFD_PYC = '" + FASTFD_PYC + "'";
				sql += ", PSP_SPORT_PYC = '" + SPORT_PYC + "'";
				sql += ", PSP_CRINIC_PYC = '" + CRINIC_PYC + "'";
				sql += ", PSP_ETC_PYC = '" + ETC_PYC + "'";
				sql += ", PSP_ETC_PYC_TX = '" + ETC_PYC_TX + "'";
				sql += ", PSP_PRSCR_PYC_YN = '" + PRSCR_PYC_YN + "'";
				sql += ", PSP_METH_GLO = '" + METH_GLO + "'";
				sql += ", PSP_RVAL_GLO = '" + RVAL_GLO + "'";
				sql += ", PSP_RESULT_GLO = '" + RESULT_GLO + "'";
				sql += ", PSP_HIBLOOD_VAL = '" + HIBLOOD_VAL + "'";
				sql += ", PSP_LIBLOOD_VAL = '" + LIBLOOD_VAL + "'";
				sql += ", PSP_RESULT_HIBL = '" + RESULT_HIBL + "'";
				sql += ", PSP_RESULT_DATE = '" + RESULT_DATE + "'";
				sql += ", PSP_TRANC_DATE = '" + TRANC_DATE + "'";
				sql += ", PSP_DOCTORSED = '" + DOCTORSED + "'";
				sql += ", PSP_LIFE_YN = '" + LIFE_YN + "'";
				sql += ", PSP_FIX_YN = '" + FIX_YN + "'";
				sql += ", PSP_MODI_DTT = SYSDATE";
				sql += ", PSP_MODI_ID = '" + USER_ID + "'";
				sql += " WHERE PSP_EXAM_DT = '" + EXAM_DT + "'";
				sql += " AND PSP_EXAM_SQ = '" + EXAM_SQ + "'";
	
				argStmtExec.executeUpdate(sql);
			}
		} catch (Exception e) {

			throw new FuncException(e.toString(), sql);
		}

		return sql;
	}
%>
