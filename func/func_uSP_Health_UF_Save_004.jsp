<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%!
	public String func_uSP_Health_UF_Save_004(Statement argStmtExec, HashMap argHtMethod) throws Exception {

		String sql = "";
		String sql2 = "";
		String sql_disp = "";

		try {

			String SSAVEMODE = (String) argHtMethod.get("SSAVEMODE");
			String EXAM_DT = (String) argHtMethod.get("EXAM_DT");
			String EXAM_SQ = (String) argHtMethod.get("EXAM_SQ");
			String EXAM_CHA = (String) argHtMethod.get("EXAM_CHA");
			String MATT_CD = (String) argHtMethod.get("MATT_CD");
			String MATT_SQ = (String) argHtMethod.get("MATT_SQ");
			String ORGA_CD = (String) argHtMethod.get("ORGA_CD");
			String SWING_CD = (String) argHtMethod.get("SWING_CD");
			String SLNS_KD = (String) argHtMethod.get("SLNS_KD");
			String SOKY_CD = (String) argHtMethod.get("SOKY_CD");
			String SOKY_NM = (String) argHtMethod.get("SOKY_NM");
			String PANJ_CD = (String) argHtMethod.get("PANJ_CD");
			String JOCHI_CD = (String) argHtMethod.get("JOCHI_CD");
			String JOCHI_NM = (String) argHtMethod.get("JOCHI_NM");
			String JILH_CD = (String) argHtMethod.get("JILH_CD");
			String POSM1_CD = (String) argHtMethod.get("POSM1_CD");
			String POSM2_CD = (String) argHtMethod.get("POSM2_CD");
			String POSM3_CD = (String) argHtMethod.get("POSM3_CD");
			String POSM1_TX = (String) argHtMethod.get("POSM1_TX");
			String POSM2_TX = (String) argHtMethod.get("POSM2_TX");
			String POSM3_TX = (String) argHtMethod.get("POSM3_TX");
			String POSM1_DT = (String) argHtMethod.get("POSM1_DT");
			String POSM2_DT = (String) argHtMethod.get("POSM2_DT");
			String POSM3_DT = (String) argHtMethod.get("POSM3_DT");
			String BUSI_CD = (String) argHtMethod.get("BUSI_CD");
			String REMARK = (String) argHtMethod.get("REMARK");
			String ETC_TX = (String) argHtMethod.get("ETC_TX");
			String ORSU_CD = (String) argHtMethod.get("ORSU_CD");
			String CYCLE_CD = (String) argHtMethod.get("CYCLE_CD");
			String CYCLE_TX = (String) argHtMethod.get("CYCLE_TX");
			String CYCLE_DT = (String) argHtMethod.get("CYCLE_DT");
			String PANJ_DT = (String) argHtMethod.get("PANJ_DT");
			String DOCT_CD = (String) argHtMethod.get("DOCT_CD");
			String USER_ID = (String) argHtMethod.get("USER_ID");
			String SOKY_TX = (String) argHtMethod.get("SOKY_TX");

			//
			if(SSAVEMODE == null) { SSAVEMODE = ""; }
			if(EXAM_DT == null) { EXAM_DT = ""; }
			if(EXAM_SQ == null) { EXAM_SQ = ""; }
			if(EXAM_CHA == null) { EXAM_CHA = ""; }
			if(MATT_CD == null) { MATT_CD = ""; }
			if(MATT_SQ == null) { MATT_SQ = ""; }
			if(ORGA_CD == null) { ORGA_CD = ""; }
			if(SWING_CD == null) { SWING_CD = ""; }
			if(SLNS_KD == null) { SLNS_KD = ""; }
			if(SOKY_CD == null) { SOKY_CD = ""; }
			if(SOKY_NM == null) { SOKY_NM = ""; }
			if(PANJ_CD == null) { PANJ_CD = ""; }
			if(JOCHI_CD == null) { JOCHI_CD = ""; }
			if(JOCHI_NM == null) { JOCHI_NM = ""; }
			if(JILH_CD == null) { JILH_CD = ""; }
			if(POSM1_CD == null) { POSM1_CD = ""; }
			if(POSM2_CD == null) { POSM2_CD = ""; }
			if(POSM3_CD == null) { POSM3_CD = ""; }
			if(POSM1_TX == null) { POSM1_TX = ""; }
			if(POSM2_TX == null) { POSM2_TX = ""; }
			if(POSM3_TX == null) { POSM3_TX = ""; }
			if(POSM1_DT == null) { POSM1_DT = ""; }
			if(POSM2_DT == null) { POSM2_DT = ""; }
			if(POSM3_DT == null) { POSM3_DT = ""; }
			if(BUSI_CD == null) { BUSI_CD = ""; }
			if(REMARK == null) { REMARK = ""; }
			if(ETC_TX == null) { ETC_TX = ""; }
			if(ORSU_CD == null) { ORSU_CD = ""; }
			if(CYCLE_CD == null) { CYCLE_CD = ""; }
			if(CYCLE_TX == null) { CYCLE_TX = ""; }
			if(CYCLE_DT == null) { CYCLE_DT = ""; }
			if(PANJ_DT == null) { PANJ_DT = ""; }
			if(DOCT_CD == null) { DOCT_CD = ""; }
			if(USER_ID == null) { USER_ID = ""; }
			if(SOKY_TX == null) { SOKY_TX = ""; }

			//
			SSAVEMODE = CTr.Replace(SSAVEMODE, "'", "''");
			EXAM_DT = CTr.Replace(EXAM_DT, "'", "''");
			EXAM_SQ = CTr.Replace(EXAM_SQ, "'", "''");
			EXAM_CHA = CTr.Replace(EXAM_CHA, "'", "''");
			MATT_CD = CTr.Replace(MATT_CD, "'", "''");
			MATT_SQ = CTr.Replace(MATT_SQ, "'", "''");
			ORGA_CD = CTr.Replace(ORGA_CD, "'", "''");
			SWING_CD = CTr.Replace(SWING_CD, "'", "''");
			SLNS_KD = CTr.Replace(SLNS_KD, "'", "''");
			SOKY_CD = CTr.Replace(SOKY_CD, "'", "''");
			SOKY_NM = CTr.Replace(SOKY_NM, "'", "''");
			PANJ_CD = CTr.Replace(PANJ_CD, "'", "''");
			JOCHI_CD = CTr.Replace(JOCHI_CD, "'", "''");
			JOCHI_NM = CTr.Replace(JOCHI_NM, "'", "''");
			JILH_CD = CTr.Replace(JILH_CD, "'", "''");
			POSM1_CD = CTr.Replace(POSM1_CD, "'", "''");
			POSM2_CD = CTr.Replace(POSM2_CD, "'", "''");
			POSM3_CD = CTr.Replace(POSM3_CD, "'", "''");
			POSM1_TX = CTr.Replace(POSM1_TX, "'", "''");
			POSM2_TX = CTr.Replace(POSM2_TX, "'", "''");
			POSM3_TX = CTr.Replace(POSM3_TX, "'", "''");
			POSM1_DT = CTr.Replace(POSM1_DT, "'", "''");
			POSM2_DT = CTr.Replace(POSM2_DT, "'", "''");
			POSM3_DT = CTr.Replace(POSM3_DT, "'", "''");
			BUSI_CD = CTr.Replace(BUSI_CD, "'", "''");
			REMARK = CTr.Replace(REMARK, "'", "''");
			ETC_TX = CTr.Replace(ETC_TX, "'", "''");
			ORSU_CD = CTr.Replace(ORSU_CD, "'", "''");
			CYCLE_CD = CTr.Replace(CYCLE_CD, "'", "''");
			CYCLE_TX = CTr.Replace(CYCLE_TX, "'", "''");
			CYCLE_DT = CTr.Replace(CYCLE_DT, "'", "''");
			PANJ_DT = CTr.Replace(PANJ_DT, "'", "''");
			DOCT_CD = CTr.Replace(DOCT_CD, "'", "''");
			USER_ID = CTr.Replace(USER_ID, "'", "''");
			SOKY_TX = CTr.Replace(SOKY_TX, "'", "''");

			if(SSAVEMODE.equals("I")) {
				sql = "INSERT INTO ST_PANJUNG (SPG_EXAM_DT ,SPG_EXAM_SQ ,SPG_EXAM_CHA ,SPG_MATT_CD ,SPG_MATT_SQ ,SPG_ORGA_CD ,SPG_SWING_CD ,SPG_SLNS_KD ,SPG_SOKY_CD ,SPG_SOKY_NM ,SPG_PANJ_CD ,SPG_JOCHI_CD ,SPG_JOCHI_NM ,SPG_JILH_CD ,SPG_POSM1_CD ,SPG_POSM2_CD ,SPG_POSM3_CD ,SPG_POSM1_TX ,SPG_POSM2_TX ,SPG_POSM3_TX ,SPG_POSM1_DT ,SPG_POSM2_DT ,SPG_POSM3_DT ,SPG_BUSI_CD ,SPG_REMARK ,SPG_ETC_TX ,SPG_ORSU_CD ,SPG_CYCLE_CD ,SPG_CYCLE_TX ,SPG_CYCLE_DT ,SPG_PANJ_DT ,SPG_DOCT_CD ,SPG_INPT_ID ,SPG_INPT_DTT ,SPG_SOKY_TX) VALUES (";
				sql += "  '" + EXAM_DT + "'";
				sql += ", '" + EXAM_SQ + "'";
				sql += ", '" + EXAM_CHA + "'";
				sql += ", '" + MATT_CD + "'";
				sql += ", '" + MATT_SQ + "'";
				sql += ", '" + ORGA_CD + "'";
				sql += ", '" + SWING_CD + "'";
				sql += ", '" + SLNS_KD + "'";
				sql += ", '" + SOKY_CD + "'";
				sql += ", '" + SOKY_NM + "'";
				sql += ", '" + PANJ_CD + "'";
				sql += ", '" + JOCHI_CD + "'";
				sql += ", '" + JOCHI_NM + "'";
				sql += ", '" + JILH_CD + "'";
				sql += ", '" + POSM1_CD + "'";
				sql += ", '" + POSM2_CD + "'";
				sql += ", '" + POSM3_CD + "'";
				sql += ", '" + POSM1_TX + "'";
				sql += ", '" + POSM2_TX + "'";
				sql += ", '" + POSM3_TX + "'";
				sql += ", '" + POSM1_DT + "'";
				sql += ", '" + POSM2_DT + "'";
				sql += ", '" + POSM3_DT + "'";
				sql += ", '" + BUSI_CD + "'";
				sql += ", '" + REMARK + "'";
				sql += ", '" + ETC_TX + "'";
				sql += ", '" + ORSU_CD + "'";
				sql += ", '" + CYCLE_CD + "'";
				sql += ", '" + CYCLE_TX + "'";
				sql += ", '" + CYCLE_DT + "'";
				sql += ", '" + PANJ_DT + "'";
				sql += ", '" + DOCT_CD + "'";
				sql += ", '" + USER_ID + "'";
				sql += ", SYSDATE";
				sql += ", '" + SOKY_TX + "'";
				sql += ")";

				argStmtExec.executeUpdate(sql);
			}
			else {
				sql = "UPDATE ST_PANJUNG SET ";
				sql += "  SPG_ORGA_CD = '" + ORGA_CD + "'";
				sql += ", SPG_SWING_CD = '" + SWING_CD + "'";
				sql += ", SPG_SLNS_KD = '" + SLNS_KD + "'";
				sql += ", SPG_SOKY_CD = '" + SOKY_CD + "'";
				sql += ", SPG_SOKY_NM = '" + SOKY_NM + "'";
				sql += ", SPG_PANJ_CD = '" + PANJ_CD + "'";
				sql += ", SPG_JOCHI_CD = '" + JOCHI_CD + "'";
				sql += ", SPG_JOCHI_NM = '" + JOCHI_NM + "'";
				sql += ", SPG_JILH_CD = '" + JILH_CD + "'";
				sql += ", SPG_POSM1_CD = '" + POSM1_CD + "'";
				sql += ", SPG_POSM2_CD = '" + POSM2_CD + "'";
				sql += ", SPG_POSM3_CD = '" + POSM3_CD + "'";
				sql += ", SPG_POSM1_TX = '" + POSM1_TX + "'";
				sql += ", SPG_POSM2_TX = '" + POSM2_TX + "'";
				sql += ", SPG_POSM3_TX = '" + POSM3_TX + "'";
				sql += ", SPG_POSM1_DT = '" + POSM1_DT + "'";
				sql += ", SPG_POSM2_DT = '" + POSM2_DT + "'";
				sql += ", SPG_POSM3_DT = '" + POSM3_DT + "'";
				sql += ", SPG_BUSI_CD = '" + BUSI_CD + "'";
				sql += ", SPG_REMARK = '" + REMARK + "'";
				sql += ", SPG_ETC_TX = '" + ETC_TX + "'";
				sql += ", SPG_ORSU_CD = '" + ORSU_CD + "'";
				sql += ", SPG_CYCLE_CD = '" + CYCLE_CD + "'";
				sql += ", SPG_CYCLE_TX = '" + CYCLE_TX + "'";
				sql += ", SPG_CYCLE_DT = '" + CYCLE_DT + "'";
				sql += ", SPG_PANJ_DT = '" + PANJ_DT + "'";
				sql += ", SPG_DOCT_CD = '" + DOCT_CD + "'";
				sql += ", SPG_MODI_ID = '" + USER_ID + "'";
				sql += ", SPG_MODI_DTT = SYSDATE";
				sql += ", SPG_SOKY_TX = '" + SOKY_TX + "'";
				sql += " WHERE SPG_EXAM_DT = '" + EXAM_DT + "'";
				sql += " AND SPG_EXAM_SQ = '" + EXAM_SQ + "'";
				sql += " AND SPG_EXAM_CHA = '" + EXAM_CHA + "'";
				sql += " AND SPG_MATT_CD = '" + MATT_CD + "'";
				sql += " AND SPG_MATT_SQ = '" + MATT_SQ + "'";

				argStmtExec.executeUpdate(sql);
			}

		} catch (Exception e) {

			throw new FuncException(e.toString(), sql);
		}

		return sql;
	}
%>
