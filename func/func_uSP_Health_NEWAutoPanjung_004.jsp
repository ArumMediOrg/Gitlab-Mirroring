<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%!
	public String func_uSP_Health_NEWAutoPanjung_004(Statement argStmtExec, HashMap argHtMethod) throws Exception {

		String sql = "";
		String sql2 = "";
		String sql_disp = "";

		try {

			String ORGA_CD = (String) argHtMethod.get("ORGA_CD");
			String SOKY_CD = (String) argHtMethod.get("SOKY_CD");
			String SOKY_NM = (String) argHtMethod.get("SOKY_NM");
			String PANJ_CD = (String) argHtMethod.get("PANJ_CD");
			String JOCHI_CD = (String) argHtMethod.get("JOCHI_CD");
			String JOCHI_NM = (String) argHtMethod.get("JOCHI_NM");
			String JILH_CD = (String) argHtMethod.get("JILH_CD");
			String POSM1_CD = (String) argHtMethod.get("POSM1_CD");
			String POSM2_CD = (String) argHtMethod.get("POSM2_CD");
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
			String SOKY_TX = (String) argHtMethod.get("SOKY_TX");
			String ORGA_ETC = (String) argHtMethod.get("ORGA_ETC");
			String EXAM_DT = (String) argHtMethod.get("EXAM_DT");
			String EXAM_SQ = (String) argHtMethod.get("EXAM_SQ");
			String SWING_CD = (String) argHtMethod.get("SWING_CD");

			//
			if(ORGA_CD == null) { ORGA_CD = ""; }
			if(SOKY_CD == null) { SOKY_CD = ""; }
			if(SOKY_NM == null) { SOKY_NM = ""; }
			if(PANJ_CD == null) { PANJ_CD = ""; }
			if(JOCHI_CD == null) { JOCHI_CD = ""; }
			if(JOCHI_NM == null) { JOCHI_NM = ""; }
			if(JILH_CD == null) { JILH_CD = ""; }
			if(POSM1_CD == null) { POSM1_CD = ""; }
			if(POSM2_CD == null) { POSM2_CD = ""; }
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
			if(SOKY_TX == null) { SOKY_TX = ""; }
			if(ORGA_ETC == null) { ORGA_ETC = ""; }
			if(EXAM_DT == null) { EXAM_DT = ""; }
			if(EXAM_SQ == null) { EXAM_SQ = ""; }
			if(SWING_CD == null) { SWING_CD = ""; }

			//
			ORGA_CD = CTr.Replace(ORGA_CD, "'", "''");
			SOKY_CD = CTr.Replace(SOKY_CD, "'", "''");
			SOKY_NM = CTr.Replace(SOKY_NM, "'", "''");
			PANJ_CD = CTr.Replace(PANJ_CD, "'", "''");
			JOCHI_CD = CTr.Replace(JOCHI_CD, "'", "''");
			JOCHI_NM = CTr.Replace(JOCHI_NM, "'", "''");
			JILH_CD = CTr.Replace(JILH_CD, "'", "''");
			POSM1_CD = CTr.Replace(POSM1_CD, "'", "''");
			POSM2_CD = CTr.Replace(POSM2_CD, "'", "''");
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
			SOKY_TX = CTr.Replace(SOKY_TX, "'", "''");
			ORGA_ETC = CTr.Replace(ORGA_ETC, "'", "''");
			EXAM_DT = CTr.Replace(EXAM_DT, "'", "''");
			EXAM_SQ = CTr.Replace(EXAM_SQ, "'", "''");
			SWING_CD = CTr.Replace(SWING_CD, "'", "''");

			sql = "UPDATE ST_PANJUNG SET ";
			sql += "  SPG_ORGA_CD = '" + ORGA_CD + "'";
			sql += ", SPG_SOKY_CD = '" + SOKY_CD + "'";
			sql += ", SPG_SOKY_NM = '" + SOKY_NM + "'";
			sql += ", SPG_PANJ_CD = '" + PANJ_CD + "'";
			sql += ", SPG_JOCHI_CD = '" + JOCHI_CD + "'";
			sql += ", SPG_JOCHI_NM = '" + JOCHI_NM + "'";
			sql += ", SPG_JILH_CD = '" + JILH_CD + "'";
			sql += ", SPG_POSM1_CD = '" + POSM1_CD + "'";
			sql += ", SPG_POSM2_CD = '" + POSM2_CD + "'";
			sql += ", SPG_POSM3_CD = '" + POSM1_CD + "'";
			sql += ", SPG_POSM1_TX = '" + POSM1_TX + "'";
			sql += ", SPG_POSM2_TX = '" + POSM2_TX + "'";
			sql += ", SPG_POSM3_TX = '" + POSM3_TX + "'";
			sql += ", SPG_POSM1_DT = '" + POSM1_DT + "'";
			sql += ", SPG_POSM2_DT = '" + POSM2_DT + "'";
			sql += ", SPG_POSM3_DT = '" + POSM3_DT + "'";
			sql += ", SPG_BUSI_CD = '" + BUSI_CD + "'";
			sql += ", SPG_REMARK= '" + REMARK + "'";
			sql += ", SPG_ETC_TX= '" + ETC_TX + "'";
			sql += ", SPG_ORSU_CD = '" + ORSU_CD + "'";
			sql += ", SPG_CYCLE_CD = '" + CYCLE_CD + "'";
			sql += ", SPG_CYCLE_TX = '" + CYCLE_TX + "'";
			sql += ", SPG_CYCLE_DT = '" + CYCLE_DT + "'";
			sql += ", SPG_SOKY_TX = '" + SOKY_TX + "'";
			sql += ", SPG_ORGA_ETC = '" + ORGA_ETC + "'";
			sql += " WHERE SPG_EXAM_DT = '" + EXAM_DT + "'";
			sql += " AND SPG_EXAM_SQ = '" + EXAM_SQ + "'";
			sql += " AND SPG_SWING_CD = '" + SWING_CD + "'";

			argStmtExec.executeUpdate(sql);

		} catch (Exception e) {

			throw new FuncException(e.toString(), sql);
		}

		return sql;
	}
%>
