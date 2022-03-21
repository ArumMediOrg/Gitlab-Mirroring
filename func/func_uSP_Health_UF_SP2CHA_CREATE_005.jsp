<%!
	public String func_uSP_Health_UF_SP2CHA_CREATE_005(Statement argStmtExec, HashMap argHtMethod) throws Exception {

		String sql = "";
		String sql2 = "";
		String sql_disp = "";

		try {

			String SSQL_ADD = (String) argHtMethod.get("SSQL_ADD");

			//
			if(SSQL_ADD == null) { SSQL_ADD = ""; }

			//
			SSQL_ADD = CTr.Replace(SSQL_ADD, "'", "''");

			sql = "INSERT INTO ET_EXAM_ACPT (EEA_EXAM_DT, EEA_EXAM_SQ, EEA_ACPT_TM, EEA_ACPT_CD, EEA_ACPT_KD, EEA_PLCE_CD, ";
			sql += " EEA_CUST_NO, EEA_MMBR_CD, EEA_PSNL_NM, EEA_SEX_CD, EEA_PSNL_AGE, EEA_ZIP_CD, EEA_ZIP_SQ, EEA_ZIP_AR, ";
			sql += " EEA_ROAD_AR, EEA_BLDG_NO, EEA_TEL_NO, EEA_MOBL_NO, EEA_EMAIL_AR, EEA_SEND_CD, EEA_SMS_YN, EEA_COMP_CD, ";
			sql += " EEA_COTK_CD, EEA_NOTE_YN, EEA_DEPT_CD, EEA_DEPT_NM, EEA_DIVI_CD, EEA_ENTRY_DT, EEA_FAMY_CD, EEA_FAMY_NM, ";
			sql += " EEA_FOOD_YN, EEA_EXAM_CD, EEA_SPSB_CD, EEA_HTSB_YN, EEA_SPSB_YN, EEA_CVSB_YN, EEA_EMSB_YN, EEA_ETSB_YN, ";
			sql += " EEA_CNCL_CD, EEA_MNGT_SPYM, EEA_EXAM_LT, EEA_SPCL_LT, EEA_SPCL_CD, EEA_SPHT_CD, EEA_INSU_CD, EEA_ENTY_CD, ";
			sql += " EEA_HEPA_YN, EEA_ORAL_YN, EEA_CANAD_YN, EEA_STOMA_CD, EEA_COLON_CD, EEA_LIVER_CD, EEA_BAST_CD, EEA_UTER_CD, ";
			sql += " EEA_HDMD_YN, EEA_SDMD_YN, EEA_SPRT_PR, EEA_COMP_PR, EEA_PSNL_PR, EEA_HLTH_PR, EEA_SPCL_PR, EEA_CAN_PR, EEA_ORAL_PR, ";
			sql += " EEA_COMPR_PR, EEA_PSNLR_PR, EEA_HLTHR_PR, EEA_SPCLR_PR, EEA_CANR_PR, EEA_ORALR_PR, EEA_PYER_CD, EEA_CMPY_CD, EEA_PRPY_CD, ";
			sql += " EEA_RECE_KD, EEA_RSLT_CD, EEA_BLRT_CD, EEA_ORDER_YN, EEA_CANAD_KD, EEA_2ND_YN, EEA_COMP_CD2, EEA_LIFE_YN, EEA_TOTAL_YN, ";
			sql += " EEA_HCV_YN, EEA_SELF_KD, EEA_CANPR_KD, EEA_HLTH_KD, EEA_SAFE_YN, EEA_PDF_KD, EEA_HOLIDAY_YN,EEA_INPT_ID, EEA_INPT_DTT, ";
			sql += " EEA_INPT_DTT, EEA_DISC_PR,  EEA_DISC_RT,  EEA_DISC_CPR";
			sql += " ) VALUES ";
			sql += SSQL_ADD;

			argStmtExec.executeUpdate(sql);
		} catch (Exception e) {

			throw new FuncException(e.toString(), sql);
		}

		return sql;
	}
%>
