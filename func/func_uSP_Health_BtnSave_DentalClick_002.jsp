<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%!
	public String func_uSP_Health_BtnSave_DentalClick_002(Statement argStmtExec, HashMap argHtMethod) throws Exception {

		String sql = "";
		String sql2 = "";
		String sql_disp = "";

		try {

			String SSAVEMODE = (String) argHtMethod.get("SSAVEMODE");
			String EXAM_DT = (String) argHtMethod.get("EXAM_DT");
			String EXAM_SQ = (String) argHtMethod.get("EXAM_SQ");
			String EXAM_CHA = (String) argHtMethod.get("EXAM_CHA");
			String GUL7_YN = (String) argHtMethod.get("GUL7_YN");
			String GUL6_YN = (String) argHtMethod.get("GUL6_YN");
			String GUL5_YN = (String) argHtMethod.get("GUL5_YN");
			String GUL4_YN = (String) argHtMethod.get("GUL4_YN");
			String GUL3_YN = (String) argHtMethod.get("GUL3_YN");
			String GUL2_YN = (String) argHtMethod.get("GUL2_YN");
			String GUL1_YN = (String) argHtMethod.get("GUL1_YN");
			String GUR1_YN = (String) argHtMethod.get("GUR1_YN");
			String GUR2_YN = (String) argHtMethod.get("GUR2_YN");
			String GUR3_YN = (String) argHtMethod.get("GUR3_YN");
			String GUR4_YN = (String) argHtMethod.get("GUR4_YN");
			String GUR5_YN = (String) argHtMethod.get("GUR5_YN");
			String GUR6_YN = (String) argHtMethod.get("GUR6_YN");
			String GUR7_YN = (String) argHtMethod.get("GUR7_YN");
			String GUR8_YN = (String) argHtMethod.get("GUR8_YN");
			String GDL7_YN = (String) argHtMethod.get("GDL7_YN");
			String GDL6_YN = (String) argHtMethod.get("GDL6_YN");
			String GDL5_YN = (String) argHtMethod.get("GDL5_YN");
			String GDL4_YN = (String) argHtMethod.get("GDL4_YN");
			String GDL3_YN = (String) argHtMethod.get("GDL3_YN");
			String GDL2_YN = (String) argHtMethod.get("GDL2_YN");
			String GDL1_YN = (String) argHtMethod.get("GDL1_YN");
			String GDR1_YN = (String) argHtMethod.get("GDR1_YN");
			String GDR2_YN = (String) argHtMethod.get("GDR2_YN");
			String GDR3_YN = (String) argHtMethod.get("GDR3_YN");
			String GDR4_YN = (String) argHtMethod.get("GDR4_YN");
			String GDR5_YN = (String) argHtMethod.get("GDR5_YN");
			String GDR6_YN = (String) argHtMethod.get("GDR6_YN");
			String GDR7_YN = (String) argHtMethod.get("GDR7_YN");
			String GDR8_YN = (String) argHtMethod.get("GDR8_YN");
			String BUL_YN = (String) argHtMethod.get("BUL_YN");
			String BUF_YN = (String) argHtMethod.get("BUF_YN");
			String BUR_YN = (String) argHtMethod.get("BUR_YN");
			String BDL_YN = (String) argHtMethod.get("BDL_YN");
			String BDF_YN = (String) argHtMethod.get("BDF_YN");
			String BDR_YN = (String) argHtMethod.get("BDR_YN");
			String BRSLT_TX = (String) argHtMethod.get("BRSLT_TX");
			String DE0_YN = (String) argHtMethod.get("DE0_YN");
			String DE1_YN = (String) argHtMethod.get("DE1_YN");
			String DE2_YN = (String) argHtMethod.get("DE2_YN");
			String DE3_YN = (String) argHtMethod.get("DE3_YN");
			String DE4_YN = (String) argHtMethod.get("DE4_YN");
			String DE5_YN = (String) argHtMethod.get("DE5_YN");
			String PT0_YN = (String) argHtMethod.get("PT0_YN");
			String PT1_YN = (String) argHtMethod.get("PT1_YN");
			String PT2_YN = (String) argHtMethod.get("PT2_YN");
			String PT3_YN = (String) argHtMethod.get("PT3_YN");
			String PT4_YN = (String) argHtMethod.get("PT4_YN");
			String P0_YN = (String) argHtMethod.get("P0_YN");
			String P1_YN = (String) argHtMethod.get("P1_YN");
			String P2_YN = (String) argHtMethod.get("P2_YN");
			String P3_YN = (String) argHtMethod.get("P3_YN");
			String P4_YN = (String) argHtMethod.get("P4_YN");
			String P5_YN = (String) argHtMethod.get("P5_YN");
			String P5_ETC = (String) argHtMethod.get("P5_ETC");
			String DENT_DT = (String) argHtMethod.get("DENT_DT");
			String HOSP_CD = (String) argHtMethod.get("HOSP_CD");
			String USER_ID = (String) argHtMethod.get("USER_ID");

			//
			if(SSAVEMODE == null) { SSAVEMODE = ""; }
			if(EXAM_DT == null) { EXAM_DT = ""; }
			if(EXAM_SQ == null) { EXAM_SQ = ""; }
			if(EXAM_CHA == null) { EXAM_CHA = ""; }
			if(GUL7_YN == null) { GUL7_YN = ""; }
			if(GUL6_YN == null) { GUL6_YN = ""; }
			if(GUL5_YN == null) { GUL5_YN = ""; }
			if(GUL4_YN == null) { GUL4_YN = ""; }
			if(GUL3_YN == null) { GUL3_YN = ""; }
			if(GUL2_YN == null) { GUL2_YN = ""; }
			if(GUL1_YN == null) { GUL1_YN = ""; }
			if(GUR1_YN == null) { GUR1_YN = ""; }
			if(GUR2_YN == null) { GUR2_YN = ""; }
			if(GUR3_YN == null) { GUR3_YN = ""; }
			if(GUR4_YN == null) { GUR4_YN = ""; }
			if(GUR5_YN == null) { GUR5_YN = ""; }
			if(GUR6_YN == null) { GUR6_YN = ""; }
			if(GUR7_YN == null) { GUR7_YN = ""; }
			if(GUR8_YN == null) { GUR8_YN = ""; }
			if(GDL7_YN == null) { GDL7_YN = ""; }
			if(GDL6_YN == null) { GDL6_YN = ""; }
			if(GDL5_YN == null) { GDL5_YN = ""; }
			if(GDL4_YN == null) { GDL4_YN = ""; }
			if(GDL3_YN == null) { GDL3_YN = ""; }
			if(GDL2_YN == null) { GDL2_YN = ""; }
			if(GDL1_YN == null) { GDL1_YN = ""; }
			if(GDR1_YN == null) { GDR1_YN = ""; }
			if(GDR2_YN == null) { GDR2_YN = ""; }
			if(GDR3_YN == null) { GDR3_YN = ""; }
			if(GDR4_YN == null) { GDR4_YN = ""; }
			if(GDR5_YN == null) { GDR5_YN = ""; }
			if(GDR6_YN == null) { GDR6_YN = ""; }
			if(GDR7_YN == null) { GDR7_YN = ""; }
			if(GDR8_YN == null) { GDR8_YN = ""; }
			if(BUL_YN == null) { BUL_YN = ""; }
			if(BUF_YN == null) { BUF_YN = ""; }
			if(BUR_YN == null) { BUR_YN = ""; }
			if(BDL_YN == null) { BDL_YN = ""; }
			if(BDF_YN == null) { BDF_YN = ""; }
			if(BDR_YN == null) { BDR_YN = ""; }
			if(BRSLT_TX == null) { BRSLT_TX = ""; }
			if(DE0_YN == null) { DE0_YN = ""; }
			if(DE1_YN == null) { DE1_YN = ""; }
			if(DE2_YN == null) { DE2_YN = ""; }
			if(DE3_YN == null) { DE3_YN = ""; }
			if(DE4_YN == null) { DE4_YN = ""; }
			if(DE5_YN == null) { DE5_YN = ""; }
			if(PT0_YN == null) { PT0_YN = ""; }
			if(PT1_YN == null) { PT1_YN = ""; }
			if(PT2_YN == null) { PT2_YN = ""; }
			if(PT3_YN == null) { PT3_YN = ""; }
			if(PT4_YN == null) { PT4_YN = ""; }
			if(P0_YN == null) { P0_YN = ""; }
			if(P1_YN == null) { P1_YN = ""; }
			if(P2_YN == null) { P2_YN = ""; }
			if(P3_YN == null) { P3_YN = ""; }
			if(P4_YN == null) { P4_YN = ""; }
			if(P5_YN == null) { P5_YN = ""; }
			if(P5_ETC == null) { P5_ETC = ""; }
			if(DENT_DT == null) { DENT_DT = ""; }
			if(HOSP_CD == null) { HOSP_CD = ""; }
			if(USER_ID == null) { USER_ID = ""; }

			//
			SSAVEMODE = CTr.Replace(SSAVEMODE, "'", "''");
			EXAM_DT = CTr.Replace(EXAM_DT, "'", "''");
			EXAM_SQ = CTr.Replace(EXAM_SQ, "'", "''");
			EXAM_CHA = CTr.Replace(EXAM_CHA, "'", "''");
			GUL7_YN = CTr.Replace(GUL7_YN, "'", "''");
			GUL6_YN = CTr.Replace(GUL6_YN, "'", "''");
			GUL5_YN = CTr.Replace(GUL5_YN, "'", "''");
			GUL4_YN = CTr.Replace(GUL4_YN, "'", "''");
			GUL3_YN = CTr.Replace(GUL3_YN, "'", "''");
			GUL2_YN = CTr.Replace(GUL2_YN, "'", "''");
			GUL1_YN = CTr.Replace(GUL1_YN, "'", "''");
			GUR1_YN = CTr.Replace(GUR1_YN, "'", "''");
			GUR2_YN = CTr.Replace(GUR2_YN, "'", "''");
			GUR3_YN = CTr.Replace(GUR3_YN, "'", "''");
			GUR4_YN = CTr.Replace(GUR4_YN, "'", "''");
			GUR5_YN = CTr.Replace(GUR5_YN, "'", "''");
			GUR6_YN = CTr.Replace(GUR6_YN, "'", "''");
			GUR7_YN = CTr.Replace(GUR7_YN, "'", "''");
			GUR8_YN = CTr.Replace(GUR8_YN, "'", "''");
			GDL7_YN = CTr.Replace(GDL7_YN, "'", "''");
			GDL6_YN = CTr.Replace(GDL6_YN, "'", "''");
			GDL5_YN = CTr.Replace(GDL5_YN, "'", "''");
			GDL4_YN = CTr.Replace(GDL4_YN, "'", "''");
			GDL3_YN = CTr.Replace(GDL3_YN, "'", "''");
			GDL2_YN = CTr.Replace(GDL2_YN, "'", "''");
			GDL1_YN = CTr.Replace(GDL1_YN, "'", "''");
			GDR1_YN = CTr.Replace(GDR1_YN, "'", "''");
			GDR2_YN = CTr.Replace(GDR2_YN, "'", "''");
			GDR3_YN = CTr.Replace(GDR3_YN, "'", "''");
			GDR4_YN = CTr.Replace(GDR4_YN, "'", "''");
			GDR5_YN = CTr.Replace(GDR5_YN, "'", "''");
			GDR6_YN = CTr.Replace(GDR6_YN, "'", "''");
			GDR7_YN = CTr.Replace(GDR7_YN, "'", "''");
			GDR8_YN = CTr.Replace(GDR8_YN, "'", "''");
			BUL_YN = CTr.Replace(BUL_YN, "'", "''");
			BUF_YN = CTr.Replace(BUF_YN, "'", "''");
			BUR_YN = CTr.Replace(BUR_YN, "'", "''");
			BDL_YN = CTr.Replace(BDL_YN, "'", "''");
			BDF_YN = CTr.Replace(BDF_YN, "'", "''");
			BDR_YN = CTr.Replace(BDR_YN, "'", "''");
			BRSLT_TX = CTr.Replace(BRSLT_TX, "'", "''");
			DE0_YN = CTr.Replace(DE0_YN, "'", "''");
			DE1_YN = CTr.Replace(DE1_YN, "'", "''");
			DE2_YN = CTr.Replace(DE2_YN, "'", "''");
			DE3_YN = CTr.Replace(DE3_YN, "'", "''");
			DE4_YN = CTr.Replace(DE4_YN, "'", "''");
			DE5_YN = CTr.Replace(DE5_YN, "'", "''");
			PT0_YN = CTr.Replace(PT0_YN, "'", "''");
			PT1_YN = CTr.Replace(PT1_YN, "'", "''");
			PT2_YN = CTr.Replace(PT2_YN, "'", "''");
			PT3_YN = CTr.Replace(PT3_YN, "'", "''");
			PT4_YN = CTr.Replace(PT4_YN, "'", "''");
			P0_YN = CTr.Replace(P0_YN, "'", "''");
			P1_YN = CTr.Replace(P1_YN, "'", "''");
			P2_YN = CTr.Replace(P2_YN, "'", "''");
			P3_YN = CTr.Replace(P3_YN, "'", "''");
			P4_YN = CTr.Replace(P4_YN, "'", "''");
			P5_YN = CTr.Replace(P5_YN, "'", "''");
			P5_ETC = CTr.Replace(P5_ETC, "'", "''");
			DENT_DT = CTr.Replace(DENT_DT, "'", "''");
			HOSP_CD = CTr.Replace(HOSP_CD, "'", "''");
			USER_ID = CTr.Replace(USER_ID, "'", "''");

			if(SSAVEMODE.equals("I")) {
				sql = "INSERT INTO ST_DENTAL (SDP_EXAM_DT, SDP_EXAM_SQ, SDP_EXAM_CHA ,SDP_GUL7_YN, SDP_GUL6_YN, SDP_GUL5_YN, SDP_GUL4_YN, SDP_GUL3_YN, SDP_GUL2_YN, SDP_GUL1_YN ,SDP_GUR1_YN, SDP_GUR2_YN, SDP_GUR3_YN, SDP_GUR4_YN, SDP_GUR5_YN, SDP_GUR6_YN, SDP_GUR7_YN, SDP_GUR8_YN ,SDP_GDL7_YN, SDP_GDL6_YN, SDP_GDL5_YN, SDP_GDL4_YN, SDP_GDL3_YN, SDP_GDL2_YN, SDP_GDL1_YN ,SDP_GDR1_YN, SDP_GDR2_YN, SDP_GDR3_YN, SDP_GDR4_YN, SDP_GDR5_YN, SDP_GDR6_YN, SDP_GDR7_YN, SDP_GDR8_YN ,SDP_BUL_YN, SDP_BUF_YN, SDP_BUR_YN, SDP_BDL_YN, SDP_BDF_YN, SDP_BDR_YN, SDP_BRSLT_TX ,SDP_DE0_YN, SDP_DE1_YN, SDP_DE2_YN, SDP_DE3_YN, SDP_DE4_YN, SDP_DE5_YN ,SDP_PT0_YN, SDP_PT1_YN, SDP_PT2_YN, SDP_PT3_YN, SDP_PT4_YN ,SDP_P0_YN, SDP_P1_YN, SDP_P2_YN, SDP_P3_YN, SDP_P4_YN, SDP_P5_YN, SDP_P5_ETC ,SDP_DENT_DT, SDP_HOSP_CD, SDP_INPT_ID, SDP_INPT_DTT) VALUES (";
				sql += "  '" + EXAM_DT + "'";
				sql += ", '" + EXAM_SQ + "'";
				sql += ", '" + EXAM_CHA + "'";
				sql += ", '" + GUL7_YN + "'";
				sql += ", '" + GUL6_YN + "'";
				sql += ", '" + GUL5_YN + "'";
				sql += ", '" + GUL4_YN + "'";
				sql += ", '" + GUL3_YN + "'";
				sql += ", '" + GUL2_YN + "'";
				sql += ", '" + GUL1_YN + "'";
				sql += ", '" + GUR1_YN + "'";
				sql += ", '" + GUR2_YN + "'";
				sql += ", '" + GUR3_YN + "'";
				sql += ", '" + GUR4_YN + "'";
				sql += ", '" + GUR5_YN + "'";
				sql += ", '" + GUR6_YN + "'";
				sql += ", '" + GUR7_YN + "'";
				sql += ", '" + GUR8_YN + "'";
				sql += ", '" + GDL7_YN + "'";
				sql += ", '" + GDL6_YN + "'";
				sql += ", '" + GDL5_YN + "'";
				sql += ", '" + GDL4_YN + "'";
				sql += ", '" + GDL3_YN + "'";
				sql += ", '" + GDL2_YN + "'";
				sql += ", '" + GDL1_YN + "'";
				sql += ", '" + GDR1_YN + "'";
				sql += ", '" + GDR2_YN + "'";
				sql += ", '" + GDR3_YN + "'";
				sql += ", '" + GDR4_YN + "'";
				sql += ", '" + GDR5_YN + "'";
				sql += ", '" + GDR6_YN + "'";
				sql += ", '" + GDR7_YN + "'";
				sql += ", '" + GDR8_YN + "'";
				sql += ", '" + BUL_YN + "'";
				sql += ", '" + BUF_YN + "'";
				sql += ", '" + BUR_YN + "'";
				sql += ", '" + BDL_YN + "'";
				sql += ", '" + BDF_YN + "'";
				sql += ", '" + BDR_YN + "'";
				sql += ", '" + BRSLT_TX + "'";
				sql += ", '" + DE0_YN + "'";
				sql += ", '" + DE1_YN + "'";
				sql += ", '" + DE2_YN + "'";
				sql += ", '" + DE3_YN + "'";
				sql += ", '" + DE4_YN + "'";
				sql += ", '" + DE5_YN + "'";
				sql += ", '" + PT0_YN + "'";
				sql += ", '" + PT1_YN + "'";
				sql += ", '" + PT2_YN + "'";
				sql += ", '" + PT3_YN + "'";
				sql += ", '" + PT4_YN + "'";
				sql += ", '" + P0_YN + "'";
				sql += ", '" + P1_YN + "'";
				sql += ", '" + P2_YN + "'";
				sql += ", '" + P3_YN + "'";
				sql += ", '" + P4_YN + "'";
				sql += ", '" + P5_YN + "'";
				sql += ", '" + P5_ETC + "'";
				sql += ", '" + DENT_DT + "'";
				sql += ", '" + HOSP_CD + "'";
				sql += ", '" + USER_ID + "'";
				sql += ", SYSDATE";
				sql += ")";

				argStmtExec.executeUpdate(sql);
			}
			else {
				sql = "UPDATE ST_DENTAL SET ";
				sql += "  SDP_GUL7_YN = '" + GUL7_YN + "'";
				sql += ", SDP_GUL6_YN = '" + GUL6_YN + "'";
				sql += ", SDP_GUL5_YN = '" + GUL5_YN + "'";
				sql += ", SDP_GUL4_YN = '" + GUL4_YN + "'";
				sql += ", SDP_GUL3_YN = '" + GUL3_YN + "'";
				sql += ", SDP_GUL2_YN = '" + GUL2_YN + "'";
				sql += ", SDP_GUL1_YN = '" + GUL1_YN + "'";
				sql += ", SDP_GUR1_YN = '" + GUR1_YN + "'";
				sql += ", SDP_GUR2_YN = '" + GUR2_YN + "'";
				sql += ", SDP_GUR3_YN = '" + GUR3_YN + "'";
				sql += ", SDP_GUR4_YN = '" + GUR4_YN + "'";
				sql += ", SDP_GUR5_YN = '" + GUR5_YN + "'";
				sql += ", SDP_GUR6_YN = '" + GUR6_YN + "'";
				sql += ", SDP_GUR7_YN = '" + GUR7_YN + "'";
				sql += ", SDP_GUR8_YN = '" + GUR8_YN + "'";
				sql += ", SDP_GDL7_YN = '" + GDL7_YN + "'";
				sql += ", SDP_GDL6_YN = '" + GDL6_YN + "'";
				sql += ", SDP_GDL5_YN = '" + GDL5_YN + "'";
				sql += ", SDP_GDL4_YN = '" + GDL4_YN + "'";
				sql += ", SDP_GDL3_YN = '" + GDL3_YN + "'";
				sql += ", SDP_GDL2_YN = '" + GDL2_YN + "'";
				sql += ", SDP_GDL1_YN = '" + GDL1_YN + "'";
				sql += ", SDP_GDR1_YN = '" + GDR1_YN + "'";
				sql += ", SDP_GDR2_YN = '" + GDR2_YN + "'";
				sql += ", SDP_GDR3_YN = '" + GDR3_YN + "'";
				sql += ", SDP_GDR4_YN = '" + GDR4_YN + "'";
				sql += ", SDP_GDR5_YN = '" + GDR5_YN + "'";
				sql += ", SDP_GDR6_YN = '" + GDR6_YN + "'";
				sql += ", SDP_GDR7_YN = '" + GDR7_YN + "'";
				sql += ", SDP_GDR8_YN = '" + GDR8_YN + "'";
				sql += ", SDP_BUL_YN = '" + BUL_YN + "'";
				sql += ", SDP_BUF_YN = '" + BUF_YN + "'";
				sql += ", SDP_BUR_YN = '" + BUR_YN + "'";
				sql += ", SDP_BDL_YN = '" + BDL_YN + "'";
				sql += ", SDP_BDF_YN = '" + BDF_YN + "'";
				sql += ", SDP_BDR_YN = '" + BDR_YN + "'";
				sql += ", SDP_BRSLT_TX = '" + BRSLT_TX + "'";
				sql += ", SDP_DE0_YN = '" + DE0_YN + "'";
				sql += ", SDP_DE1_YN = '" + DE1_YN + "'";
				sql += ", SDP_DE2_YN = '" + DE2_YN + "'";
				sql += ", SDP_DE3_YN = '" + DE3_YN + "'";
				sql += ", SDP_DE4_YN = '" + DE4_YN + "'";
				sql += ", SDP_DE5_YN = '" + DE5_YN + "'";
				sql += ", SDP_PT0_YN = '" + PT0_YN + "'";
				sql += ", SDP_PT1_YN = '" + PT1_YN + "'";
				sql += ", SDP_PT2_YN = '" + PT2_YN + "'";
				sql += ", SDP_PT3_YN = '" + PT3_YN + "'";
				sql += ", SDP_PT4_YN = '" + PT4_YN + "'";
				sql += ", SDP_P0_YN = '" + P0_YN + "'";
				sql += ", SDP_P1_YN = '" + P1_YN + "'";
				sql += ", SDP_P2_YN = '" + P2_YN + "'";
				sql += ", SDP_P3_YN = '" + P3_YN + "'";
				sql += ", SDP_P4_YN = '" + P4_YN + "'";
				sql += ", SDP_P5_YN = '" + P5_YN + "'";
				sql += ", SDP_P5_ETC = '" + P5_ETC + "'";
				sql += ", SDP_DENT_DT = '" + DENT_DT + "'";
				sql += ", SDP_HOSP_CD = '" + HOSP_CD + "'";
				sql += ", SDP_MODI_ID = '" + USER_ID + "'";
				sql += ", SDP_MODI_DTT = SYSDATE";
				sql += " WHERE SDP_EXAM_DT = '" + EXAM_DT + "'";
				sql += " AND SDP_EXAM_SQ = '" + EXAM_SQ + "'";
				sql += " AND SDP_EXAM_CHA = '" + EXAM_CHA + "'";

				argStmtExec.executeUpdate(sql);
			}
		} catch (Exception e) {

			throw new FuncException(e.toString(), sql);
		}

		return sql;
	}
%>
