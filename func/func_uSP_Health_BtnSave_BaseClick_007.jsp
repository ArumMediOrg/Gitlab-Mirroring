<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%!
	public String func_uSP_Health_BtnSave_BaseClick_007(Statement argStmtExec, HashMap argHtMethod) throws Exception {

		String sql = "";
		String sql2 = "";
		String sql_disp = "";

		try {

			String SSAVEMODE = (String) argHtMethod.get("SSAVEMODE");
			String EXAM_DT = (String) argHtMethod.get("EXAM_DT");
			String EXAM_SQ = (String) argHtMethod.get("EXAM_SQ");
			String EXAM_CHA = (String) argHtMethod.get("EXAM_CHA");
			String ISSU_NO = (String) argHtMethod.get("ISSU_NO");
			String JIJO_CD = (String) argHtMethod.get("JIJO_CD");
			String GOJU_CD = (String) argHtMethod.get("GOJU_CD");
			String NCPN_LT = (String) argHtMethod.get("NCPN_LT");
			String NCHR_HH = (String) argHtMethod.get("NCHR_HH");
			String WORK_LT = (String) argHtMethod.get("WORK_LT");
			String JUIP_DT = (String) argHtMethod.get("JUIP_DT");
			String SAHU_YN = (String) argHtMethod.get("SAHU_YN");
			String XRAY_CD = (String) argHtMethod.get("XRAY_CD");
			String XRAY_NO = (String) argHtMethod.get("XRAY_NO");
			String XRFM_CD = (String) argHtMethod.get("XRFM_CD");
			String XDOC_CD = (String) argHtMethod.get("XDOC_CD");
			String MEDI_YN = (String) argHtMethod.get("MEDI_YN");
			String MEDI_CNT = (String) argHtMethod.get("MEDI_CNT");
			String PANJ_YN = (String) argHtMethod.get("PANJ_YN");
			String DDOC_CD = (String) argHtMethod.get("DDOC_CD");
			String TPAN_NM = (String) argHtMethod.get("TPAN_NM");
			String TBUS_NM = (String) argHtMethod.get("TBUS_NM");
			String TOBO_DT = (String) argHtMethod.get("TOBO_DT");
			String RECHK_DT = (String) argHtMethod.get("RECHK_DT");
			String USER_ID = (String) argHtMethod.get("USER_ID");
			String SMTM_CD = (String) argHtMethod.get("SMTM_CD");
			String BUILD_CD = (String) argHtMethod.get("BUILD_CD");
			String NOT_REG = (String) argHtMethod.get("NOT_REG");
			String SLNS_DELAY = (String) argHtMethod.get("SLNS_DELAY");
			String KOSHA_PROVD_YN = (String) argHtMethod.get("KOSHA_PROVD_YN");
			String INFO_PROVD_YN = (String) argHtMethod.get("INFO_PROVD_YN");

			//
			if(SSAVEMODE == null) { SSAVEMODE = ""; }
			if(EXAM_DT == null) { EXAM_DT = ""; }
			if(EXAM_SQ == null) { EXAM_SQ = ""; }
			if(EXAM_CHA == null) { EXAM_CHA = ""; }
			if(ISSU_NO == null) { ISSU_NO = ""; }
			if(JIJO_CD == null) { JIJO_CD = ""; }
			if(GOJU_CD == null) { GOJU_CD = ""; }
			if(NCPN_LT == null) { NCPN_LT = ""; }
			if(NCHR_HH == null) { NCHR_HH = ""; }
			if(WORK_LT == null) { WORK_LT = ""; }
			if(JUIP_DT == null) { JUIP_DT = ""; }
			if(SAHU_YN == null) { SAHU_YN = ""; }
			if(XRAY_CD == null) { XRAY_CD = ""; }
			if(XRAY_NO == null) { XRAY_NO = ""; }
			if(XRFM_CD == null) { XRFM_CD = ""; }
			if(XDOC_CD == null) { XDOC_CD = ""; }
			if(MEDI_YN == null) { MEDI_YN = ""; }
			if(MEDI_CNT == null) { MEDI_CNT = ""; }
			if(PANJ_YN == null) { PANJ_YN = ""; }
			if(DDOC_CD == null) { DDOC_CD = ""; }
			if(TPAN_NM == null) { TPAN_NM = ""; }
			if(TBUS_NM == null) { TBUS_NM = ""; }
			if(TOBO_DT == null) { TOBO_DT = ""; }
			if(RECHK_DT == null) { RECHK_DT = ""; }
			if(USER_ID == null) { USER_ID = ""; }
			if(SMTM_CD == null) { SMTM_CD = ""; }
			if(BUILD_CD == null) { BUILD_CD = ""; }
			if(NOT_REG == null) { NOT_REG = ""; }
			if(SLNS_DELAY == null) { SLNS_DELAY = ""; }
			if(KOSHA_PROVD_YN == null) { KOSHA_PROVD_YN = ""; }
			if(INFO_PROVD_YN == null) { INFO_PROVD_YN = ""; }

			//
			SSAVEMODE = CTr.Replace(SSAVEMODE, "'", "''");
			EXAM_DT = CTr.Replace(EXAM_DT, "'", "''");
			EXAM_SQ = CTr.Replace(EXAM_SQ, "'", "''");
			EXAM_CHA = CTr.Replace(EXAM_CHA, "'", "''");
			ISSU_NO = CTr.Replace(ISSU_NO, "'", "''");
			JIJO_CD = CTr.Replace(JIJO_CD, "'", "''");
			GOJU_CD = CTr.Replace(GOJU_CD, "'", "''");
			NCPN_LT = CTr.Replace(NCPN_LT, "'", "''");
			NCHR_HH = CTr.Replace(NCHR_HH, "'", "''");
			WORK_LT = CTr.Replace(WORK_LT, "'", "''");
			JUIP_DT = CTr.Replace(JUIP_DT, "'", "''");
			SAHU_YN = CTr.Replace(SAHU_YN, "'", "''");
			XRAY_CD = CTr.Replace(XRAY_CD, "'", "''");
			XRAY_NO = CTr.Replace(XRAY_NO, "'", "''");
			XRFM_CD = CTr.Replace(XRFM_CD, "'", "''");
			XDOC_CD = CTr.Replace(XDOC_CD, "'", "''");
			MEDI_YN = CTr.Replace(MEDI_YN, "'", "''");
			MEDI_CNT = CTr.Replace(MEDI_CNT, "'", "''");
			PANJ_YN = CTr.Replace(PANJ_YN, "'", "''");
			DDOC_CD = CTr.Replace(DDOC_CD, "'", "''");
			TPAN_NM = CTr.Replace(TPAN_NM, "'", "''");
			TBUS_NM = CTr.Replace(TBUS_NM, "'", "''");
			TOBO_DT = CTr.Replace(TOBO_DT, "'", "''");
			RECHK_DT = CTr.Replace(RECHK_DT, "'", "''");
			USER_ID = CTr.Replace(USER_ID, "'", "''");
			SMTM_CD = CTr.Replace(SMTM_CD, "'", "''");
			BUILD_CD = CTr.Replace(BUILD_CD, "'", "''");
			NOT_REG = CTr.Replace(NOT_REG, "'", "''");
			SLNS_DELAY = CTr.Replace(SLNS_DELAY, "'", "''");
			KOSHA_PROVD_YN = CTr.Replace(KOSHA_PROVD_YN, "'", "''");
			INFO_PROVD_YN = CTr.Replace(INFO_PROVD_YN, "'", "''");

			if(SSAVEMODE.equals("I")) {
				sql = "INSERT INTO ST_BASE (SBE_EXAM_DT, SBE_EXAM_SQ, SBE_EXAM_CHA, SBE_ISSU_NO ,SBE_JIJO_CD, SBE_GOJU_CD, ";
				sql += " SBE_NCPN_LT, SBE_NCHR_HH, SBE_WORK_LT ,SBE_JUIP_DT, SBE_SAHU_YN, SBE_XRAY_CD, SBE_XRAY_NO, SBE_XRFM_CD, ";
				sql += " SBE_XDOC_CD, SBE_MEDI_YN, SBE_MEDI_CNT, SBE_PANJ_YN, SBE_DDOC_CD ,SBE_TPAN_NM, SBE_TBUS_NM, SBE_TOBO_DT, ";
				sql += " SBE_RECHK_DT, SBE_INPT_ID, SBE_INPT_DTT, SBE_SMTM_CD, SBE_BUILD_CD, SBE_NOT_REG, SBE_SLNS_DELAY, ";
				sql += " SBE_KOSHA_PROVD_YN, SBE_INFO_PROVD_YN ";
				sql += " ) VALUES (";
				sql += "  '" + EXAM_DT + "'";
				sql += ", '" + EXAM_SQ + "'";
				sql += ", '" + EXAM_CHA + "'";
				sql += ", '" + ISSU_NO + "'";
				sql += ", '" + JIJO_CD + "'";
				sql += ", '" + GOJU_CD + "'";
				sql += ", '" + NCPN_LT + "'";
				sql += ", '" + NCHR_HH + "'";
				sql += ", '" + WORK_LT + "'";
				sql += ", '" + JUIP_DT + "'";
				sql += ", '" + SAHU_YN + "'";
				sql += ", '" + XRAY_CD + "'";
				sql += ", '" + XRAY_NO + "'";
				sql += ", '" + XRFM_CD + "'";
				sql += ", '" + XDOC_CD + "'";
				sql += ", '" + MEDI_YN + "'";
				sql += ", '" + MEDI_CNT + "'";
				sql += ", '" + PANJ_YN + "'";
				sql += ", '" + DDOC_CD + "'";
				sql += ", '" + TPAN_NM + "'";
				sql += ", '" + TBUS_NM + "'";
				sql += ", '" + TOBO_DT + "'";
				sql += ", '" + RECHK_DT + "'";
				sql += ", '" + USER_ID + "'";
				sql += ", SYSDATE";
				sql += ", '" + SMTM_CD + "'";
				sql += ", '" + BUILD_CD + "'";
				sql += ", '" + NOT_REG + "'";
				sql += ", '" + SLNS_DELAY + "'";
				sql += ", '" + KOSHA_PROVD_YN + "'";
				sql += ", '" + INFO_PROVD_YN + "'";
				sql += ")";

				argStmtExec.executeUpdate(sql);
			}
			else {
				sql = "UPDATE ST_BASE SET ";
				sql += "  SBE_ISSU_NO = '" + ISSU_NO + "'";
				sql += ", SBE_JIJO_CD = '" + JIJO_CD + "'";
				sql += ", SBE_GOJU_CD = '" + GOJU_CD + "'";
				sql += ", SBE_NCPN_LT = '" + NCPN_LT + "'";
				sql += ", SBE_NCHR_HH = '" + NCHR_HH + "'";
				sql += ", SBE_WORK_LT = '" + WORK_LT + "'";
				sql += ", SBE_JUIP_DT = '" + JUIP_DT + "'";
				sql += ", SBE_SAHU_YN = '" + SAHU_YN + "'";
				sql += ", SBE_XRAY_CD = '" + XRAY_CD + "'";
				sql += ", SBE_XRAY_NO = '" + XRAY_NO + "'";
				sql += ", SBE_XRFM_CD = '" + XRFM_CD + "'";
				sql += ", SBE_XDOC_CD = '" + XDOC_CD + "'";
				sql += ", SBE_MEDI_YN = '" + MEDI_YN + "'";
				sql += ", SBE_MEDI_CNT = '" + MEDI_CNT + "'";
				sql += ", SBE_PANJ_YN = '" + PANJ_YN + "'";
				sql += ", SBE_TPAN_NM = '" + TPAN_NM + "'";
				sql += ", SBE_TBUS_NM = '" + TBUS_NM + "'";
				sql += ", SBE_TOBO_DT = '" + TOBO_DT + "'";
				sql += ", SBE_RECHK_DT = '" + RECHK_DT + "'";
				sql += ", SBE_DDOC_CD = '" + DDOC_CD + "'";
				sql += ", SBE_MODI_ID = '" + USER_ID + "'";
				sql += ", SBE_MODI_DTT = SYSDATE";
				sql += ", SBE_SMTM_CD = '" + SMTM_CD + "'";
				sql += ", SBE_BUILD_CD = '" + BUILD_CD + "'";
				sql += ", SBE_NOT_REG = '" + NOT_REG + "'";
				sql += ", SBE_SLNS_DELAY = '" + SLNS_DELAY + "'";
				sql += ", SBE_KOSHA_PROVD_YN = '" + KOSHA_PROVD_YN + "'";
         		sql += ", SBE_INFO_PROVD_YN = '" + INFO_PROVD_YN + "'";
				sql += " WHERE SBE_EXAM_DT = '" + EXAM_DT + "'";
				sql += " AND SBE_EXAM_SQ = '" + EXAM_SQ + "'";
				sql += " AND SBE_EXAM_CHA = '" + EXAM_CHA + "'";

				argStmtExec.executeUpdate(sql);
			}

		} catch (Exception e) {

			throw new FuncException(e.toString(), sql);
		}

		return sql;
	}
%>
