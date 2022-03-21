<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%!
	public String func_uLife_Panj_upSavePtLifePrescr_002(Statement argStmtExec, HashMap argHtMethod) throws Exception {

		String sql = "";
		String sql2 = "";
		String sql_disp = "";

		try {

			String SSAVEMODE = (String) argHtMethod.get("SSAVEMODE");
			String EXAM_DT = (String) argHtMethod.get("EXAM_DT");
			String EXAM_SQ = (String) argHtMethod.get("EXAM_SQ");
			String SMK_1 = (String) argHtMethod.get("SMK_1");
			String SMK_2 = (String) argHtMethod.get("SMK_2");
			String SMK_3 = (String) argHtMethod.get("SMK_3");
			String SMK_4 = (String) argHtMethod.get("SMK_4");
			String SMK_4_TX = (String) argHtMethod.get("SMK_4_TX");
			String SMK_5 = (String) argHtMethod.get("SMK_5");
			String SMK_6 = (String) argHtMethod.get("SMK_6");
			String SMK_6_TX = (String) argHtMethod.get("SMK_6_TX");
			String DRK_PR1 = (String) argHtMethod.get("DRK_PR1");
			String DRK_PR1_YN = (String) argHtMethod.get("DRK_PR1_YN");
			String DRK_PR2 = (String) argHtMethod.get("DRK_PR2");
			String DRK_PR2_TX = (String) argHtMethod.get("DRK_PR2_TX");
			String DRK_1 = (String) argHtMethod.get("DRK_1");
			String DRK_2 = (String) argHtMethod.get("DRK_2");
			String DRK_3 = (String) argHtMethod.get("DRK_3");
			String DRK_3_TX = (String) argHtMethod.get("DRK_3_TX");
			String EXCS_1 = (String) argHtMethod.get("EXCS_1");
			String EXCS_2_1 = (String) argHtMethod.get("EXCS_2_1");
			String EXCS_2_1_TX = (String) argHtMethod.get("EXCS_2_1_TX");
			String EXCS_2_2 = (String) argHtMethod.get("EXCS_2_2");
			String EXCS_2_2_TX = (String) argHtMethod.get("EXCS_2_2_TX");
			String EXCS_2_3 = (String) argHtMethod.get("EXCS_2_3");
			String EXCS_3 = (String) argHtMethod.get("EXCS_3");
			String EXCS_3_TX = (String) argHtMethod.get("EXCS_3_TX");
			String EXCS_4 = (String) argHtMethod.get("EXCS_4");
			String EXCS_4_TX = (String) argHtMethod.get("EXCS_4_TX");
			String NUTR_1 = (String) argHtMethod.get("NUTR_1");
			String NUTR_2 = (String) argHtMethod.get("NUTR_2");
			String NUTR_3 = (String) argHtMethod.get("NUTR_3");
			String NUTR_3_TX = (String) argHtMethod.get("NUTR_3_TX");
			String NUTR_4 = (String) argHtMethod.get("NUTR_4");
			String NUTR_4_TX = (String) argHtMethod.get("NUTR_4_TX");
			String FAT_1 = (String) argHtMethod.get("FAT_1");
			String FAT_2 = (String) argHtMethod.get("FAT_2");
			String FAT_3 = (String) argHtMethod.get("FAT_3");
			String FAT_4 = (String) argHtMethod.get("FAT_4");
			String FAT_4_1 = (String) argHtMethod.get("FAT_4_1");
			String FAT_4_2 = (String) argHtMethod.get("FAT_4_2");
			String FAT_4_3 = (String) argHtMethod.get("FAT_4_3");
			String FAT_4_4 = (String) argHtMethod.get("FAT_4_4");
			String FAT_5 = (String) argHtMethod.get("FAT_5");
			String FAT_5_TX = (String) argHtMethod.get("FAT_5_TX");
			String FAT_6 = (String) argHtMethod.get("FAT_6");
			String FAT_6_TX = (String) argHtMethod.get("FAT_6_TX");
			String FAT_7 = (String) argHtMethod.get("FAT_7");
			String FAT_7_TX = (String) argHtMethod.get("FAT_7_TX");
			String USER_ID = (String) argHtMethod.get("USER_ID");

			//
			if(SSAVEMODE == null) { SSAVEMODE = ""; }
			if(EXAM_DT == null) { EXAM_DT = ""; }
			if(EXAM_SQ == null) { EXAM_SQ = ""; }
			if(SMK_1 == null) { SMK_1 = ""; }
			if(SMK_2 == null) { SMK_2 = ""; }
			if(SMK_3 == null) { SMK_3 = ""; }
			if(SMK_4 == null) { SMK_4 = ""; }
			if(SMK_4_TX == null) { SMK_4_TX = ""; }
			if(SMK_5 == null) { SMK_5 = ""; }
			if(SMK_6 == null) { SMK_6 = ""; }
			if(SMK_6_TX == null) { SMK_6_TX = ""; }
			if(DRK_PR1 == null) { DRK_PR1 = ""; }
			if(DRK_PR1_YN == null) { DRK_PR1_YN = ""; }
			if(DRK_PR2 == null) { DRK_PR2 = ""; }
			if(DRK_PR2_TX == null) { DRK_PR2_TX = ""; }
			if(DRK_1 == null) { DRK_1 = ""; }
			if(DRK_2 == null) { DRK_2 = ""; }
			if(DRK_3 == null) { DRK_3 = ""; }
			if(DRK_3_TX == null) { DRK_3_TX = ""; }
			if(EXCS_1 == null) { EXCS_1 = ""; }
			if(EXCS_2_1 == null) { EXCS_2_1 = ""; }
			if(EXCS_2_1_TX == null) { EXCS_2_1_TX = ""; }
			if(EXCS_2_2 == null) { EXCS_2_2 = ""; }
			if(EXCS_2_2_TX == null) { EXCS_2_2_TX = ""; }
			if(EXCS_2_3 == null) { EXCS_2_3 = ""; }
			if(EXCS_3 == null) { EXCS_3 = ""; }
			if(EXCS_3_TX == null) { EXCS_3_TX = ""; }
			if(EXCS_4 == null) { EXCS_4 = ""; }
			if(EXCS_4_TX == null) { EXCS_4_TX = ""; }
			if(NUTR_1 == null) { NUTR_1 = ""; }
			if(NUTR_2 == null) { NUTR_2 = ""; }
			if(NUTR_3 == null) { NUTR_3 = ""; }
			if(NUTR_3_TX == null) { NUTR_3_TX = ""; }
			if(NUTR_4 == null) { NUTR_4 = ""; }
			if(NUTR_4_TX == null) { NUTR_4_TX = ""; }
			if(FAT_1 == null) { FAT_1 = ""; }
			if(FAT_2 == null) { FAT_2 = ""; }
			if(FAT_3 == null) { FAT_3 = ""; }
			if(FAT_4 == null) { FAT_4 = ""; }
			if(FAT_4_1 == null) { FAT_4_1 = ""; }
			if(FAT_4_2 == null) { FAT_4_2 = ""; }
			if(FAT_4_3 == null) { FAT_4_3 = ""; }
			if(FAT_4_4 == null) { FAT_4_4 = ""; }
			if(FAT_5 == null) { FAT_5 = ""; }
			if(FAT_5_TX == null) { FAT_5_TX = ""; }
			if(FAT_6 == null) { FAT_6 = ""; }
			if(FAT_6_TX == null) { FAT_6_TX = ""; }
			if(FAT_7 == null) { FAT_7 = ""; }
			if(FAT_7_TX == null) { FAT_7_TX = ""; }
			if(USER_ID == null) { USER_ID = ""; }

			//
			SSAVEMODE = CTr.Replace(SSAVEMODE, "'", "''");
			EXAM_DT = CTr.Replace(EXAM_DT, "'", "''");
			EXAM_SQ = CTr.Replace(EXAM_SQ, "'", "''");
			SMK_1 = CTr.Replace(SMK_1, "'", "''");
			SMK_2 = CTr.Replace(SMK_2, "'", "''");
			SMK_3 = CTr.Replace(SMK_3, "'", "''");
			SMK_4 = CTr.Replace(SMK_4, "'", "''");
			SMK_4_TX = CTr.Replace(SMK_4_TX, "'", "''");
			SMK_5 = CTr.Replace(SMK_5, "'", "''");
			SMK_6 = CTr.Replace(SMK_6, "'", "''");
			SMK_6_TX = CTr.Replace(SMK_6_TX, "'", "''");
			DRK_PR1 = CTr.Replace(DRK_PR1, "'", "''");
			DRK_PR1_YN = CTr.Replace(DRK_PR1_YN, "'", "''");
			DRK_PR2 = CTr.Replace(DRK_PR2, "'", "''");
			DRK_PR2_TX = CTr.Replace(DRK_PR2_TX, "'", "''");
			DRK_1 = CTr.Replace(DRK_1, "'", "''");
			DRK_2 = CTr.Replace(DRK_2, "'", "''");
			DRK_3 = CTr.Replace(DRK_3, "'", "''");
			DRK_3_TX = CTr.Replace(DRK_3_TX, "'", "''");
			EXCS_1 = CTr.Replace(EXCS_1, "'", "''");
			EXCS_2_1 = CTr.Replace(EXCS_2_1, "'", "''");
			EXCS_2_1_TX = CTr.Replace(EXCS_2_1_TX, "'", "''");
			EXCS_2_2 = CTr.Replace(EXCS_2_2, "'", "''");
			EXCS_2_2_TX = CTr.Replace(EXCS_2_2_TX, "'", "''");
			EXCS_2_3 = CTr.Replace(EXCS_2_3, "'", "''");
			EXCS_3 = CTr.Replace(EXCS_3, "'", "''");
			EXCS_3_TX = CTr.Replace(EXCS_3_TX, "'", "''");
			EXCS_4 = CTr.Replace(EXCS_4, "'", "''");
			EXCS_4_TX = CTr.Replace(EXCS_4_TX, "'", "''");
			NUTR_1 = CTr.Replace(NUTR_1, "'", "''");
			NUTR_2 = CTr.Replace(NUTR_2, "'", "''");
			NUTR_3 = CTr.Replace(NUTR_3, "'", "''");
			NUTR_3_TX = CTr.Replace(NUTR_3_TX, "'", "''");
			NUTR_4 = CTr.Replace(NUTR_4, "'", "''");
			NUTR_4_TX = CTr.Replace(NUTR_4_TX, "'", "''");
			FAT_1 = CTr.Replace(FAT_1, "'", "''");
			FAT_2 = CTr.Replace(FAT_2, "'", "''");
			FAT_3 = CTr.Replace(FAT_3, "'", "''");
			FAT_4 = CTr.Replace(FAT_4, "'", "''");
			FAT_4_1 = CTr.Replace(FAT_4_1, "'", "''");
			FAT_4_2 = CTr.Replace(FAT_4_2, "'", "''");
			FAT_4_3 = CTr.Replace(FAT_4_3, "'", "''");
			FAT_4_4 = CTr.Replace(FAT_4_4, "'", "''");
			FAT_5 = CTr.Replace(FAT_5, "'", "''");
			FAT_5_TX = CTr.Replace(FAT_5_TX, "'", "''");
			FAT_6 = CTr.Replace(FAT_6, "'", "''");
			FAT_6_TX = CTr.Replace(FAT_6_TX, "'", "''");
			FAT_7 = CTr.Replace(FAT_7, "'", "''");
			FAT_7_TX = CTr.Replace(FAT_7_TX, "'", "''");
			USER_ID = CTr.Replace(USER_ID, "'", "''");

			if(SSAVEMODE.equals("I")) {
				sql = "INSERT INTO PT_LIFE_PRESCR ( PLR_EXAM_DT,PLR_EXAM_SQ ,PLR_SMK_1,PLR_SMK_2,PLR_SMK_3,PLR_SMK_4,PLR_SMK_4_TX ,PLR_SMK_5,PLR_SMK_6,PLR_SMK_6_TX,PLR_DRK_PR1,PLR_DRK_PR1_YN ,PLR_DRK_PR2,PLR_DRK_PR2_TX,PLR_DRK_1,PLR_DRK_2,PLR_DRK_3 ,PLR_DRK_3_TX,PLR_EXCS_1,PLR_EXCS_2_1,PLR_EXCS_2_1_TX,PLR_EXCS_2_2 ,PLR_EXCS_2_2_TX,PLR_EXCS_2_3,PLR_EXCS_3,PLR_EXCS_3_TX,PLR_EXCS_4 ,PLR_EXCS_4_TX,PLR_NUTR_1,PLR_NUTR_2,PLR_NUTR_3,PLR_NUTR_3_TX ,PLR_NUTR_4,PLR_NUTR_4_TX,PLR_FAT_1,PLR_FAT_2,PLR_FAT_3 ,PLR_FAT_4,PLR_FAT_4_1,PLR_FAT_4_2,PLR_FAT_4_3,PLR_FAT_4_4,PLR_FAT_5 ,PLR_FAT_5_TX,PLR_FAT_6,PLR_FAT_6_TX,PLR_FAT_7,PLR_FAT_7_TX ,PLR_INPUT_ID,PLR_INPUT_DTT ) VALUES (";
				sql += "  '" + EXAM_DT + "'";
				sql += ", '" + EXAM_SQ + "'";
				sql += ", '" + SMK_1 + "'";
				sql += ", '" + SMK_2 + "'";
				sql += ", '" + SMK_3 + "'";
				sql += ", '" + SMK_4 + "'";
				sql += ", '" + SMK_4_TX + "'";
				sql += ", '" + SMK_5 + "'";
				sql += ", '" + SMK_6 + "'";
				sql += ", '" + SMK_6_TX + "'";
				sql += ", '" + DRK_PR1 + "'";
				sql += ", '" + DRK_PR1_YN + "'";
				sql += ", '" + DRK_PR2 + "'";
				sql += ", '" + DRK_PR2_TX + "'";
				sql += ", '" + DRK_1 + "'";
				sql += ", '" + DRK_2 + "'";
				sql += ", '" + DRK_3 + "'";
				sql += ", '" + DRK_3_TX + "'";
				sql += ", '" + EXCS_1 + "'";
				sql += ", '" + EXCS_2_1 + "'";
				sql += ", '" + EXCS_2_1_TX + "'";
				sql += ", '" + EXCS_2_2 + "'";
				sql += ", '" + EXCS_2_2_TX + "'";
				sql += ", '" + EXCS_2_3 + "'";
				sql += ", '" + EXCS_3 + "'";
				sql += ", '" + EXCS_3_TX + "'";
				sql += ", '" + EXCS_4 + "'";
				sql += ", '" + EXCS_4_TX + "'";
				sql += ", '" + NUTR_1 + "'";
				sql += ", '" + NUTR_2 + "'";
				sql += ", '" + NUTR_3 + "'";
				sql += ", '" + NUTR_3_TX + "'";
				sql += ", '" + NUTR_4 + "'";
				sql += ", '" + NUTR_4_TX + "'";
				sql += ", '" + FAT_1 + "'";
				sql += ", '" + FAT_2 + "'";
				sql += ", '" + FAT_3 + "'";
				sql += ", '" + FAT_4 + "'";
				sql += ", '" + FAT_4_1 + "'";
				sql += ", '" + FAT_4_2 + "'";
				sql += ", '" + FAT_4_3 + "'";
				sql += ", '" + FAT_4_4 + "'";
				sql += ", '" + FAT_5 + "'";
				sql += ", '" + FAT_5_TX + "'";
				sql += ", '" + FAT_6 + "'";
				sql += ", '" + FAT_6_TX + "'";
				sql += ", '" + FAT_7 + "'";
				sql += ", '" + FAT_7_TX + "'";
				sql += ", '" + USER_ID + "'";
				sql += ", SYSDATE";
				sql += ")";
	
				argStmtExec.executeUpdate(sql);

			}
			else if(SSAVEMODE.equals("U")) {
				sql = "UPDATE PT_LIFE_PRESCR SET ";
				sql += "  PLR_SMK_1 = '" + SMK_1 + "'";
				sql += ", PLR_SMK_2 = '" + SMK_2 + "'";
				sql += ", PLR_SMK_3 = '" + SMK_3 + "'";
				sql += ", PLR_SMK_4 = '" + SMK_4 + "'";
				sql += ", PLR_SMK_4_TX = '" + SMK_4_TX + "'";
				sql += ", PLR_SMK_5 = '" + SMK_5 + "'";
				sql += ", PLR_SMK_6 = '" + SMK_6 + "'";
				sql += ", PLR_SMK_6_TX = '" + SMK_6_TX + "'";
				sql += ", PLR_DRK_PR1 = '" + DRK_PR1 + "'";
				sql += ", PLR_DRK_PR1_YN = '" + DRK_PR1_YN + "'";
				sql += ", PLR_DRK_PR2 = '" + DRK_PR2 + "'";
				sql += ", PLR_DRK_PR2_TX = '" + DRK_PR2_TX + "'";
				sql += ", PLR_DRK_1 = '" + DRK_1 + "'";
				sql += ", PLR_DRK_2 = '" + DRK_2 + "'";
				sql += ", PLR_DRK_3 = '" + DRK_3 + "'";
				sql += ", PLR_DRK_3_TX = '" + DRK_3_TX + "'";
				sql += ", PLR_EXCS_1 = '" + EXCS_1 + "'";
				sql += ", PLR_EXCS_2_1 = '" + EXCS_2_1 + "'";
				sql += ", PLR_EXCS_2_1_TX = '" + EXCS_2_1_TX + "'";
				sql += ", PLR_EXCS_2_2 = '" + EXCS_2_2 + "'";
				sql += ", PLR_EXCS_2_2_TX = '" + EXCS_2_2_TX + "'";
				sql += ", PLR_EXCS_2_3 = '" + EXCS_2_3 + "'";
				sql += ", PLR_EXCS_3 = '" + EXCS_3 + "'";
				sql += ", PLR_EXCS_3_TX = '" + EXCS_3_TX + "'";
				sql += ", PLR_EXCS_4 = '" + EXCS_4 + "'";
				sql += ", PLR_EXCS_4_TX = '" + EXCS_4_TX + "'";
				sql += ", PLR_NUTR_1 = '" + NUTR_1 + "'";
				sql += ", PLR_NUTR_2 = '" + NUTR_2 + "'";
				sql += ", PLR_NUTR_3 = '" + NUTR_3 + "'";
				sql += ", PLR_NUTR_3_TX = '" + NUTR_3_TX + "'";
				sql += ", PLR_NUTR_4 = '" + NUTR_4 + "'";
				sql += ", PLR_NUTR_4_TX = '" + NUTR_4_TX + "'";
				sql += ", PLR_FAT_1 = '" + FAT_1 + "'";
				sql += ", PLR_FAT_2 = '" + FAT_2 + "'";
				sql += ", PLR_FAT_3 = '" + FAT_3 + "'";
				sql += ", PLR_FAT_4 = '" + FAT_4 + "'";
				sql += ", PLR_FAT_4_1 = '" + FAT_4_1 + "'";
				sql += ", PLR_FAT_4_2 = '" + FAT_4_2 + "'";
				sql += ", PLR_FAT_4_3 = '" + FAT_4_3 + "'";
				sql += ", PLR_FAT_4_4 = '" + FAT_4_4 + "'";
				sql += ", PLR_FAT_5 = '" + FAT_5 + "'";
				sql += ", PLR_FAT_5_TX = '" + FAT_5_TX + "'";
				sql += ", PLR_FAT_6 = '" + FAT_6 + "'";
				sql += ", PLR_FAT_6_TX = '" + FAT_6_TX + "'";
				sql += ", PLR_FAT_7 = '" + FAT_7 + "'";
				sql += ", PLR_FAT_7_TX = '" + FAT_7_TX + "'";
				sql += ", PLR_MODI_DTT = SYSDATE";
				sql += ", PLR_MODI_ID = '" + USER_ID + "'";
				sql += " WHERE PLR_EXAM_DT = '" + EXAM_DT + "'";
				sql += " AND PLR_EXAM_SQ = '" + EXAM_SQ + "'";
	
				argStmtExec.executeUpdate(sql);

			}
		} catch (Exception e) {

			throw new FuncException(e.toString(), sql);
		}

		return sql;
	}
%>
