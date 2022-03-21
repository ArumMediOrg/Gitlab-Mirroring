<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%!
	public String func_uCancer_Rslt_2020_ufSaveBrstRslt_002(Statement argStmtExec, HashMap argHtMethod) throws Exception {

		String sql = "";
		String sql2 = "";
		String sql_disp = "";

		try {

			String ICOUNT = (String) argHtMethod.get("ICOUNT");
			String EXAM_DT = (String) argHtMethod.get("EXAM_DT");
			String EXAM_SQ = (String) argHtMethod.get("EXAM_SQ");
			String MGEX_DT = (String) argHtMethod.get("MGEX_DT");
			String MGDS_KD = (String) argHtMethod.get("MGDS_KD");
			String MGEX_KD = (String) argHtMethod.get("MGEX_KD");
			String MGPT_KD = (String) argHtMethod.get("MGPT_KD");
			String MGRT1_KD = (String) argHtMethod.get("MGRT1_KD");
			String MGRT1SR_KD = (String) argHtMethod.get("MGRT1SR_KD");
			String MGRT1R_EX = (String) argHtMethod.get("MGRT1R_EX");
			String MGRT1SL_KD = (String) argHtMethod.get("MGRT1SL_KD");
			String MGRT1L_EX = (String) argHtMethod.get("MGRT1L_EX");
			String MGRT2SL_KD = (String) argHtMethod.get("MGRT2SL_KD");
			String MGRT2L_EX = (String) argHtMethod.get("MGRT2L_EX");
			String MGRT2_KD = (String) argHtMethod.get("MGRT2_KD");
			String MGRT2SR_KD = (String) argHtMethod.get("MGRT2SR_KD");
			String MGRT2R_EX = (String) argHtMethod.get("MGRT2R_EX");
			String MGRT3_KD = (String) argHtMethod.get("MGRT3_KD");
			String MGRT3SR_KD = (String) argHtMethod.get("MGRT3SR_KD");
			String MGRT3R_EX = (String) argHtMethod.get("MGRT3R_EX");
			String MGRT3SL_KD = (String) argHtMethod.get("MGRT3SL_KD");
			String MGRT3L_EX = (String) argHtMethod.get("MGRT3L_EX");
			String MGRT_EX = (String) argHtMethod.get("MGRT_EX");
			String RSLT_KD = (String) argHtMethod.get("RSLT_KD");
			String BRCN_YN = (String) argHtMethod.get("BRCN_YN");
			String RSLT_EX = (String) argHtMethod.get("RSLT_EX");
			String CFRM_DT = (String) argHtMethod.get("CFRM_DT");
			String LICEN_CD = (String) argHtMethod.get("LICEN_CD");
			String DECI_LICEN_CD = (String) argHtMethod.get("DECI_LICEN_CD");
			String USER = (String) argHtMethod.get("USER");

			//
			if(ICOUNT == null) { ICOUNT = ""; }
			if(EXAM_DT == null) { EXAM_DT = ""; }
			if(EXAM_SQ == null) { EXAM_SQ = ""; }
			if(MGEX_DT == null) { MGEX_DT = ""; }
			if(MGDS_KD == null) { MGDS_KD = ""; }
			if(MGEX_KD == null) { MGEX_KD = ""; }
			if(MGPT_KD == null) { MGPT_KD = ""; }
			if(MGRT1_KD == null) { MGRT1_KD = ""; }
			if(MGRT1SR_KD == null) { MGRT1SR_KD = ""; }
			if(MGRT1R_EX == null) { MGRT1R_EX = ""; }
			if(MGRT1SL_KD == null) { MGRT1SL_KD = ""; }
			if(MGRT1L_EX == null) { MGRT1L_EX = ""; }
			if(MGRT2SL_KD == null) { MGRT2SL_KD = ""; }
			if(MGRT2L_EX == null) { MGRT2L_EX = ""; }
			if(MGRT2_KD == null) { MGRT2_KD = ""; }
			if(MGRT2SR_KD == null) { MGRT2SR_KD = ""; }
			if(MGRT2R_EX == null) { MGRT2R_EX = ""; }
			if(MGRT3_KD == null) { MGRT3_KD = ""; }
			if(MGRT3SR_KD == null) { MGRT3SR_KD = ""; }
			if(MGRT3R_EX == null) { MGRT3R_EX = ""; }
			if(MGRT3SL_KD == null) { MGRT3SL_KD = ""; }
			if(MGRT3L_EX == null) { MGRT3L_EX = ""; }
			if(MGRT_EX == null) { MGRT_EX = ""; }
			if(RSLT_KD == null) { RSLT_KD = ""; }
			if(BRCN_YN == null) { BRCN_YN = ""; }
			if(RSLT_EX == null) { RSLT_EX = ""; }
			if(CFRM_DT == null) { CFRM_DT = ""; }
			if(LICEN_CD == null) { LICEN_CD = ""; }
			if(DECI_LICEN_CD == null) { DECI_LICEN_CD = ""; }
			if(USER == null) { USER = ""; }

			//
			ICOUNT = CTr.Replace(ICOUNT, "'", "''");
			EXAM_DT = CTr.Replace(EXAM_DT, "'", "''");
			EXAM_SQ = CTr.Replace(EXAM_SQ, "'", "''");
			MGEX_DT = CTr.Replace(MGEX_DT, "'", "''");
			MGDS_KD = CTr.Replace(MGDS_KD, "'", "''");
			MGEX_KD = CTr.Replace(MGEX_KD, "'", "''");
			MGPT_KD = CTr.Replace(MGPT_KD, "'", "''");
			MGRT1_KD = CTr.Replace(MGRT1_KD, "'", "''");
			MGRT1SR_KD = CTr.Replace(MGRT1SR_KD, "'", "''");
			MGRT1R_EX = CTr.Replace(MGRT1R_EX, "'", "''");
			MGRT1SL_KD = CTr.Replace(MGRT1SL_KD, "'", "''");
			MGRT1L_EX = CTr.Replace(MGRT1L_EX, "'", "''");
			MGRT2SL_KD = CTr.Replace(MGRT2SL_KD, "'", "''");
			MGRT2L_EX = CTr.Replace(MGRT2L_EX, "'", "''");
			MGRT2_KD = CTr.Replace(MGRT2_KD, "'", "''");
			MGRT2SR_KD = CTr.Replace(MGRT2SR_KD, "'", "''");
			MGRT2R_EX = CTr.Replace(MGRT2R_EX, "'", "''");
			MGRT3_KD = CTr.Replace(MGRT3_KD, "'", "''");
			MGRT3SR_KD = CTr.Replace(MGRT3SR_KD, "'", "''");
			MGRT3R_EX = CTr.Replace(MGRT3R_EX, "'", "''");
			MGRT3SL_KD = CTr.Replace(MGRT3SL_KD, "'", "''");
			MGRT3L_EX = CTr.Replace(MGRT3L_EX, "'", "''");
			MGRT_EX = CTr.Replace(MGRT_EX, "'", "''");
			RSLT_KD = CTr.Replace(RSLT_KD, "'", "''");
			BRCN_YN = CTr.Replace(BRCN_YN, "'", "''");
			RSLT_EX = CTr.Replace(RSLT_EX, "'", "''");
			CFRM_DT = CTr.Replace(CFRM_DT, "'", "''");
			LICEN_CD = CTr.Replace(LICEN_CD, "'", "''");
			DECI_LICEN_CD = CTr.Replace(DECI_LICEN_CD, "'", "''");
			USER = CTr.Replace(USER, "'", "''");

			if(ICOUNT.equals("0")) {
				sql = "INSERT INTO ET_CANCER_BRST ( ECB_EXAM_DT , ECB_EXAM_SQ , ECB_MGEX_DT , ECB_MGDS_KD , ECB_MGEX_KD , ECB_MGPT_KD , ECB_MGRT1_KD , ECB_MGRT1SR_KD , ECB_MGRT1R_EX , ECB_MGRT1SL_KD , ECB_MGRT1L_EX , ECB_MGRT2SL_KD , ECB_MGRT2L_EX , ECB_MGRT2_KD , ECB_MGRT2SR_KD , ECB_MGRT2R_EX , ECB_MGRT3_KD , ECB_MGRT3SR_KD , ECB_MGRT3R_EX , ECB_MGRT3SL_KD , ECB_MGRT3L_EX , ECB_MGRT_EX , ECB_RSLT_KD , ECB_BRCN_YN , ECB_RSLT_EX , ECB_CFRM_DT , ECB_LICEN_CD , ECB_DECI_LICEN_CD , ECB_INPUT_DTT , ECB_INPUT_ID ) VALUES (";
				sql += "  '" + EXAM_DT + "'";
				sql += ", '" + EXAM_SQ + "'";
				sql += ", '" + MGEX_DT + "'";
				sql += ", '" + MGDS_KD + "'";
				sql += ", '" + MGEX_KD + "'";
				sql += ", '" + MGPT_KD + "'";
				sql += ", '" + MGRT1_KD + "'";
				sql += ", '" + MGRT1SR_KD + "'";
				sql += ", '" + MGRT1R_EX + "'";
				sql += ", '" + MGRT1SL_KD + "'";
				sql += ", '" + MGRT1L_EX + "'";
				sql += ", '" + MGRT2SL_KD + "'";
				sql += ", '" + MGRT2L_EX + "'";
				sql += ", '" + MGRT2_KD + "'";
				sql += ", '" + MGRT2SR_KD + "'";
				sql += ", '" + MGRT2R_EX + "'";
				sql += ", '" + MGRT3_KD + "'";
				sql += ", '" + MGRT3SR_KD + "'";
				sql += ", '" + MGRT3R_EX + "'";
				sql += ", '" + MGRT3SL_KD + "'";
				sql += ", '" + MGRT3L_EX + "'";
				sql += ", '" + MGRT_EX + "'";
				sql += ", '" + RSLT_KD + "'";
				sql += ", '" + BRCN_YN + "'";
				sql += ", '" + RSLT_EX + "'";
				sql += ", '" + CFRM_DT + "'";
				sql += ", '" + LICEN_CD + "'";
				sql += ", '" + DECI_LICEN_CD + "'";
				sql += ", SYSDATE";
				sql += ", '" + USER + "'";
				sql += ")";
	
				argStmtExec.executeUpdate(sql);
	
			}
			else {
				sql = "UPDATE ET_CANCER_BRST SET ";
				sql += "  ECB_MGEX_DT = '" + MGEX_DT + "'";
				sql += ", ECB_MGDS_KD = '" + MGDS_KD + "'";
				sql += ", ECB_MGEX_KD = '" + MGEX_KD + "'";
				sql += ", ECB_MGPT_KD = '" + MGPT_KD + "'";
				sql += ", ECB_MGRT1_KD = '" + MGRT1_KD + "'";
				sql += ", ECB_MGRT1SR_KD = '" + MGRT1SR_KD + "'";
				sql += ", ECB_MGRT1R_EX = '" + MGRT1R_EX + "'";
				sql += ", ECB_MGRT1SL_KD = '" + MGRT1SL_KD + "'";
				sql += ", ECB_MGRT1L_EX = '" + MGRT1L_EX + "'";
				sql += ", ECB_MGRT2SL_KD = '" + MGRT2SL_KD + "'";
				sql += ", ECB_MGRT2L_EX = '" + MGRT2L_EX + "'";
				sql += ", ECB_MGRT2_KD = '" + MGRT2_KD + "'";
				sql += ", ECB_MGRT2SR_KD = '" + MGRT2SR_KD + "'";
				sql += ", ECB_MGRT2R_EX = '" + MGRT2R_EX + "'";
				sql += ", ECB_MGRT3_KD = '" + MGRT3_KD + "'";
				sql += ", ECB_MGRT3SR_KD = '" + MGRT3SR_KD + "'";
				sql += ", ECB_MGRT3R_EX = '" + MGRT3R_EX + "'";
				sql += ", ECB_MGRT3SL_KD = '" + MGRT3SL_KD + "'";
				sql += ", ECB_MGRT3L_EX = '" + MGRT3L_EX + "'";
				sql += ", ECB_MGRT_EX = '" + MGRT_EX + "'";
				sql += ", ECB_RSLT_KD = '" + RSLT_KD + "'";
				sql += ", ECB_BRCN_YN = '" + BRCN_YN + "'";
				sql += ", ECB_RSLT_EX = '" + RSLT_EX + "'";
				sql += ", ECB_CFRM_DT = '" + CFRM_DT + "'";
				sql += ", ECB_LICEN_CD = '" + LICEN_CD + "'";
				sql += ", ECB_DECI_LICEN_CD = '" + DECI_LICEN_CD + "'";
				sql += ", ECB_MODI_DTT = SYSDATE";
				sql += ", ECB_MODI_ID = '" + USER + "'";
				sql += " WHERE ECB_EXAM_DT = '" + EXAM_DT + "'";
				sql += " AND ECB_EXAM_SQ = '" + EXAM_SQ + "'";
	
				argStmtExec.executeUpdate(sql);
			}
		} catch (Exception e) {

			throw new FuncException(e.toString(), sql);
		}

		return sql;
	}
%>
