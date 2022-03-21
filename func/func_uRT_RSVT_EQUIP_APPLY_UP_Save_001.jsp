<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%!
	public String func_uRT_RSVT_EQUIP_APPLY_UP_Save_001(Statement argStmtExec, HashMap argHtMethod) throws Exception {

		String sql = "";
		String sql2 = "";
		String sql_disp = "";

		try {

			String SAVE_KD = (String) argHtMethod.get("SAVE_KD");
			String EQUI_CD = (String) argHtMethod.get("EQUI_CD");
			String EQUI_NM = (String) argHtMethod.get("EQUI_NM");
			String ITEM_LT = (String) argHtMethod.get("ITEM_LT");
			String PART_CD = (String) argHtMethod.get("PART_CD");
			String WKSU_YN = (String) argHtMethod.get("WKSU_YN");
			String WKMO_YN = (String) argHtMethod.get("WKMO_YN");
			String WKTU_YN = (String) argHtMethod.get("WKTU_YN");
			String WKWE_YN = (String) argHtMethod.get("WKWE_YN");
			String WKTH_YN = (String) argHtMethod.get("WKTH_YN");
			String WKFR_YN = (String) argHtMethod.get("WKFR_YN");
			String WKSA_YN = (String) argHtMethod.get("WKSA_YN");
			String TIME_CD = (String) argHtMethod.get("TIME_CD");
			String WDAM_STM = (String) argHtMethod.get("WDAM_STM");
			String WDAM_ETM = (String) argHtMethod.get("WDAM_ETM");
			String WDPM_STM = (String) argHtMethod.get("WDPM_STM");
			String WDPM_ETM = (String) argHtMethod.get("WDPM_ETM");
			String WKAM_STM = (String) argHtMethod.get("WKAM_STM");
			String WKAM_ETM = (String) argHtMethod.get("WKAM_ETM");
			String SCHE_CD = (String) argHtMethod.get("SCHE_CD");
			String SCHE_MM = (String) argHtMethod.get("SCHE_MM");
			String SCHE_CNT = (String) argHtMethod.get("SCHE_CNT");
			String WORK_CD = (String) argHtMethod.get("WORK_CD");
			String USE_YN = (String) argHtMethod.get("USE_YN");
			String INPT_ID = (String) argHtMethod.get("INPT_ID");
			String NUSE_ID = (String) argHtMethod.get("NUSE_ID");
			String MODI_ID = (String) argHtMethod.get("MODI_ID");

			//
			if(SAVE_KD == null) { SAVE_KD = ""; }
			if(EQUI_CD == null) { EQUI_CD = ""; }
			if(EQUI_NM == null) { EQUI_NM = ""; }
			if(ITEM_LT == null) { ITEM_LT = ""; }
			if(PART_CD == null) { PART_CD = ""; }
			if(WKSU_YN == null) { WKSU_YN = ""; }
			if(WKMO_YN == null) { WKMO_YN = ""; }
			if(WKTU_YN == null) { WKTU_YN = ""; }
			if(WKWE_YN == null) { WKWE_YN = ""; }
			if(WKTH_YN == null) { WKTH_YN = ""; }
			if(WKFR_YN == null) { WKFR_YN = ""; }
			if(WKSA_YN == null) { WKSA_YN = ""; }
			if(TIME_CD == null) { TIME_CD = ""; }
			if(WDAM_STM == null) { WDAM_STM = ""; }
			if(WDAM_ETM == null) { WDAM_ETM = ""; }
			if(WDPM_STM == null) { WDPM_STM = ""; }
			if(WDPM_ETM == null) { WDPM_ETM = ""; }
			if(WKAM_STM == null) { WKAM_STM = ""; }
			if(WKAM_ETM == null) { WKAM_ETM = ""; }
			if(SCHE_CD == null) { SCHE_CD = ""; }
			if(SCHE_MM == null) { SCHE_MM = ""; }
			if(SCHE_CNT == null) { SCHE_CNT = ""; }
			if(WORK_CD == null) { WORK_CD = ""; }
			if(USE_YN == null) { USE_YN = ""; }
			if(INPT_ID == null) { INPT_ID = ""; }
			if(NUSE_ID == null) { NUSE_ID = ""; }
			if(MODI_ID == null) { MODI_ID = ""; }

			//
			SAVE_KD = CTr.Replace(SAVE_KD, "'", "''");
			EQUI_CD = CTr.Replace(EQUI_CD, "'", "''");
			EQUI_NM = CTr.Replace(EQUI_NM, "'", "''");
			ITEM_LT = CTr.Replace(ITEM_LT, "'", "''");
			PART_CD = CTr.Replace(PART_CD, "'", "''");
			WKSU_YN = CTr.Replace(WKSU_YN, "'", "''");
			WKMO_YN = CTr.Replace(WKMO_YN, "'", "''");
			WKTU_YN = CTr.Replace(WKTU_YN, "'", "''");
			WKWE_YN = CTr.Replace(WKWE_YN, "'", "''");
			WKTH_YN = CTr.Replace(WKTH_YN, "'", "''");
			WKFR_YN = CTr.Replace(WKFR_YN, "'", "''");
			WKSA_YN = CTr.Replace(WKSA_YN, "'", "''");
			TIME_CD = CTr.Replace(TIME_CD, "'", "''");
			WDAM_STM = CTr.Replace(WDAM_STM, "'", "''");
			WDAM_ETM = CTr.Replace(WDAM_ETM, "'", "''");
			WDPM_STM = CTr.Replace(WDPM_STM, "'", "''");
			WDPM_ETM = CTr.Replace(WDPM_ETM, "'", "''");
			WKAM_STM = CTr.Replace(WKAM_STM, "'", "''");
			WKAM_ETM = CTr.Replace(WKAM_ETM, "'", "''");
			SCHE_CD = CTr.Replace(SCHE_CD, "'", "''");
			SCHE_MM = CTr.Replace(SCHE_MM, "'", "''");
			SCHE_CNT = CTr.Replace(SCHE_CNT, "'", "''");
			WORK_CD = CTr.Replace(WORK_CD, "'", "''");
			USE_YN = CTr.Replace(USE_YN, "'", "''");
			INPT_ID = CTr.Replace(INPT_ID, "'", "''");
			NUSE_ID = CTr.Replace(NUSE_ID, "'", "''");
			MODI_ID = CTr.Replace(MODI_ID, "'", "''");

			if(SAVE_KD.equals("I")) {
				sql = "INSERT INTO RT_RSVT_EQUIP (RRE_EQUI_CD, RRE_EQUI_NM, RRE_ITEM_LT, RRE_PART_CD, RRE_WKSU_YN, RRE_WKMO_YN, RRE_WKTU_YN, RRE_WKWE_YN, RRE_WKTH_YN, RRE_WKFR_YN, RRE_WKSA_YN, RRE_TIME_CD, RRE_WDAM_STM, RRE_WDAM_ETM, RRE_WDPM_STM, RRE_WDPM_ETM, RRE_WKAM_STM, RRE_WKAM_ETM, RRE_SCHE_CD, RRE_SCHE_MM, RRE_SCHE_CNT, RRE_WORK_CD, RRE_USE_YN, RRE_INPT_ID, RRE_INPT_DTT, RRE_NUSE_ID, RRE_NUSE_DTT) VALUES (";
				sql += "  '" + EQUI_CD + "'";
				sql += ", '" + EQUI_NM + "'";
				sql += ", '" + ITEM_LT + "'";
				sql += ", '" + PART_CD + "'";
				sql += ", '" + WKSU_YN + "'";
				sql += ", '" + WKMO_YN + "'";
				sql += ", '" + WKTU_YN + "'";
				sql += ", '" + WKWE_YN + "'";
				sql += ", '" + WKTH_YN + "'";
				sql += ", '" + WKFR_YN + "'";
				sql += ", '" + WKSA_YN + "'";
				sql += ", '" + TIME_CD + "'";
				sql += ", '" + WDAM_STM + "'";
				sql += ", '" + WDAM_ETM + "'";
				sql += ", '" + WDPM_STM + "'";
				sql += ", '" + WDPM_ETM + "'";
				sql += ", '" + WKAM_STM + "'";
				sql += ", '" + WKAM_ETM + "'";
				sql += ", '" + SCHE_CD + "'";
				sql += ", '" + SCHE_MM + "'";
				sql += ", '" + SCHE_CNT + "'";
				sql += ", '" + WORK_CD + "'";
				sql += ", '" + USE_YN + "'";
				sql += ", '" + INPT_ID + "'";
				sql += ", SYSDATE";
				sql += ", CASE WHEN '" + USE_YN + "' <> 'Y' THEN '" + NUSE_ID + "' END";
				sql += ", CASE WHEN '" + USE_YN + "' <> 'Y' THEN SYSDATE END";
				sql += ")";

				argStmtExec.executeUpdate(sql);			
			}
			else {
				sql = "UPDATE RT_RSVT_EQUIP SET ";
				sql += "  RRE_EQUI_NM = '" + EQUI_NM + "'";
				sql += ", RRE_ITEM_LT = '" + ITEM_LT + "'";
				sql += ", RRE_PART_CD = '" + PART_CD + "'";
				sql += ", RRE_WKSU_YN = '" + WKSU_YN + "'";
				sql += ", RRE_WKMO_YN = '" + WKMO_YN + "'";
				sql += ", RRE_WKTU_YN = '" + WKTU_YN + "'";
				sql += ", RRE_WKWE_YN = '" + WKWE_YN + "'";
				sql += ", RRE_WKTH_YN = '" + WKTH_YN + "'";
				sql += ", RRE_WKFR_YN = '" + WKFR_YN + "'";
				sql += ", RRE_WKSA_YN = '" + WKSA_YN + "'";
				sql += ", RRE_TIME_CD = '" + TIME_CD + "'";
				sql += ", RRE_WDAM_STM = '" + WDAM_STM + "'";
				sql += ", RRE_WDAM_ETM = '" + WDAM_ETM + "'";
				sql += ", RRE_WDPM_STM = '" + WDPM_STM + "'";
				sql += ", RRE_WDPM_ETM = '" + WDPM_ETM + "'";
				sql += ", RRE_WKAM_STM = '" + WKAM_STM + "'";
				sql += ", RRE_WKAM_ETM = '" + WKAM_ETM + "'";
				sql += ", RRE_SCHE_CD = '" + SCHE_CD + "'";
				sql += ", RRE_SCHE_MM = '" + SCHE_MM + "'";
				sql += ", RRE_SCHE_CNT = '" + SCHE_CNT + "'";
				sql += ", RRE_WORK_CD = '" + WORK_CD + "'";
				sql += ", RRE_MODI_ID = '" + MODI_ID + "'";
				sql += ", RRE_MODI_DTT = SYSDATE";
				sql += ", RRE_USE_YN = '" + USE_YN + "'";
				sql += ", RRE_NUSE_ID = CASE WHEN '" + USE_YN + "' <> 'Y' THEN '" + NUSE_ID + "' END";
				sql += ", RRE_NUSE_DTT = CASE WHEN '" + USE_YN + "' <> 'Y' THEN SYSDATE END";
				sql += " WHERE RRE_EQUI_CD = '" + EQUI_CD + "'";

				argStmtExec.executeUpdate(sql);
			}
		} catch (Exception e) {

			throw new FuncException(e.toString(), sql);
		}

		return sql;
	}
%>
