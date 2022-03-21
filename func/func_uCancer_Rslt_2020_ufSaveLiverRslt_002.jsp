<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%!
	public String func_uCancer_Rslt_2020_ufSaveLiverRslt_002(Statement argStmtExec, HashMap argHtMethod) throws Exception {

		String sql = "";
		String sql2 = "";
		String sql_disp = "";

		try {

			String ICOUNT = (String) argHtMethod.get("ICOUNT");
			String EXAM_DT = (String) argHtMethod.get("EXAM_DT");
			String EXAM_SQ = (String) argHtMethod.get("EXAM_SQ");
			String ALT_VL = (String) argHtMethod.get("ALT_VL");
			String HBTP_KD = (String) argHtMethod.get("HBTP_KD");
			String HBRT_CD = (String) argHtMethod.get("HBRT_CD");
			String HBRT_VL = (String) argHtMethod.get("HBRT_VL");
			String HBVL_VL = (String) argHtMethod.get("HBVL_VL");
			String HBPJ_KD = (String) argHtMethod.get("HBPJ_KD");
			String HCTP_KD = (String) argHtMethod.get("HCTP_KD");
			String HCRT_CD = (String) argHtMethod.get("HCRT_CD");
			String HCRT_VL = (String) argHtMethod.get("HCRT_VL");
			String HCVL_VL = (String) argHtMethod.get("HCVL_VL");
			String HCPJ_KD = (String) argHtMethod.get("HCPJ_KD");
			String LVEX_DT = (String) argHtMethod.get("LVEX_DT");
			String USRL1_KD = (String) argHtMethod.get("USRL1_KD");
			String USRL2_KD = (String) argHtMethod.get("USRL2_KD");
			String USRL3_KD = (String) argHtMethod.get("USRL3_KD");
			String USRL4_KD = (String) argHtMethod.get("USRL4_KD");
			String USRL5_KD = (String) argHtMethod.get("USRL5_KD");
			String USRL6_KD = (String) argHtMethod.get("USRL6_KD");
			String USRL7_KD = (String) argHtMethod.get("USRL7_KD");
			String USCN1_KD = (String) argHtMethod.get("USCN1_KD");
			String USCN2_1_KD = (String) argHtMethod.get("USCN2_1_KD");
			String USCN2_KD = (String) argHtMethod.get("USCN2_KD");
			String USCN2_VL1 = (String) argHtMethod.get("USCN2_VL1");
			String USCN2_VL2 = (String) argHtMethod.get("USCN2_VL2");
			String USCN2_VL3 = (String) argHtMethod.get("USCN2_VL3");
			String USETC_KD = (String) argHtMethod.get("USETC_KD");
			String USETC_EX2 = (String) argHtMethod.get("USETC_EX2");
			String USETC_EX = (String) argHtMethod.get("USETC_EX");
			String AFPTP_KD = (String) argHtMethod.get("AFPTP_KD");
			String AFPRT_CD = (String) argHtMethod.get("AFPRT_CD");
			String AFPRT_VL = (String) argHtMethod.get("AFPRT_VL");
			String AFPRT_UNIT = (String) argHtMethod.get("AFPRT_UNIT");
			String AFPVL_VL = (String) argHtMethod.get("AFPVL_VL");
			String RSLT_KD = (String) argHtMethod.get("RSLT_KD");
			String ETC_EX = (String) argHtMethod.get("ETC_EX");
			String LICN_YN = (String) argHtMethod.get("LICN_YN");
			String RSLT_EX = (String) argHtMethod.get("RSLT_EX");
			String CFRM_DT = (String) argHtMethod.get("CFRM_DT");
			String LICEN_CD = (String) argHtMethod.get("LICEN_CD");
			String CKUP_LICEN_CD = (String) argHtMethod.get("CKUP_LICEN_CD");
			String USER = (String) argHtMethod.get("USER");

			//
			if(ICOUNT == null) { ICOUNT = ""; }
			if(EXAM_DT == null) { EXAM_DT = ""; }
			if(EXAM_SQ == null) { EXAM_SQ = ""; }
			if(ALT_VL == null) { ALT_VL = ""; }
			if(HBTP_KD == null) { HBTP_KD = ""; }
			if(HBRT_CD == null) { HBRT_CD = ""; }
			if(HBRT_VL == null) { HBRT_VL = ""; }
			if(HBVL_VL == null) { HBVL_VL = ""; }
			if(HBPJ_KD == null) { HBPJ_KD = ""; }
			if(HCTP_KD == null) { HCTP_KD = ""; }
			if(HCRT_CD == null) { HCRT_CD = ""; }
			if(HCRT_VL == null) { HCRT_VL = ""; }
			if(HCVL_VL == null) { HCVL_VL = ""; }
			if(HCPJ_KD == null) { HCPJ_KD = ""; }
			if(LVEX_DT == null) { LVEX_DT = ""; }
			if(USRL1_KD == null) { USRL1_KD = ""; }
			if(USRL2_KD == null) { USRL2_KD = ""; }
			if(USRL3_KD == null) { USRL3_KD = ""; }
			if(USRL4_KD == null) { USRL4_KD = ""; }
			if(USRL5_KD == null) { USRL5_KD = ""; }
			if(USRL6_KD == null) { USRL6_KD = ""; }
			if(USRL7_KD == null) { USRL7_KD = ""; }
			if(USCN1_KD == null) { USCN1_KD = ""; }
			if(USCN2_1_KD == null) { USCN2_1_KD = ""; }
			if(USCN2_KD == null) { USCN2_KD = ""; }
			if(USCN2_VL1 == null) { USCN2_VL1 = ""; }
			if(USCN2_VL2 == null) { USCN2_VL2 = ""; }
			if(USCN2_VL3 == null) { USCN2_VL3 = ""; }
			if(USETC_KD == null) { USETC_KD = ""; }
			if(USETC_EX2 == null) { USETC_EX2 = ""; }
			if(USETC_EX == null) { USETC_EX = ""; }
			if(AFPTP_KD == null) { AFPTP_KD = ""; }
			if(AFPRT_CD == null) { AFPRT_CD = ""; }
			if(AFPRT_VL == null) { AFPRT_VL = ""; }
			if(AFPRT_UNIT == null) { AFPRT_UNIT = ""; }
			if(AFPVL_VL == null) { AFPVL_VL = ""; }
			if(RSLT_KD == null) { RSLT_KD = ""; }
			if(ETC_EX == null) { ETC_EX = ""; }
			if(LICN_YN == null) { LICN_YN = ""; }
			if(RSLT_EX == null) { RSLT_EX = ""; }
			if(CFRM_DT == null) { CFRM_DT = ""; }
			if(LICEN_CD == null) { LICEN_CD = ""; }
			if(CKUP_LICEN_CD == null) { CKUP_LICEN_CD = ""; }
			if(USER == null) { USER = ""; }

			//
			ICOUNT = CTr.Replace(ICOUNT, "'", "''");
			EXAM_DT = CTr.Replace(EXAM_DT, "'", "''");
			EXAM_SQ = CTr.Replace(EXAM_SQ, "'", "''");
			ALT_VL = CTr.Replace(ALT_VL, "'", "''");
			HBTP_KD = CTr.Replace(HBTP_KD, "'", "''");
			HBRT_CD = CTr.Replace(HBRT_CD, "'", "''");
			HBRT_VL = CTr.Replace(HBRT_VL, "'", "''");
			HBVL_VL = CTr.Replace(HBVL_VL, "'", "''");
			HBPJ_KD = CTr.Replace(HBPJ_KD, "'", "''");
			HCTP_KD = CTr.Replace(HCTP_KD, "'", "''");
			HCRT_CD = CTr.Replace(HCRT_CD, "'", "''");
			HCRT_VL = CTr.Replace(HCRT_VL, "'", "''");
			HCVL_VL = CTr.Replace(HCVL_VL, "'", "''");
			HCPJ_KD = CTr.Replace(HCPJ_KD, "'", "''");
			LVEX_DT = CTr.Replace(LVEX_DT, "'", "''");
			USRL1_KD = CTr.Replace(USRL1_KD, "'", "''");
			USRL2_KD = CTr.Replace(USRL2_KD, "'", "''");
			USRL3_KD = CTr.Replace(USRL3_KD, "'", "''");
			USRL4_KD = CTr.Replace(USRL4_KD, "'", "''");
			USRL5_KD = CTr.Replace(USRL5_KD, "'", "''");
			USRL6_KD = CTr.Replace(USRL6_KD, "'", "''");
			USRL7_KD = CTr.Replace(USRL7_KD, "'", "''");
			USCN1_KD = CTr.Replace(USCN1_KD, "'", "''");
			USCN2_1_KD = CTr.Replace(USCN2_1_KD, "'", "''");
			USCN2_KD = CTr.Replace(USCN2_KD, "'", "''");
			USCN2_VL1 = CTr.Replace(USCN2_VL1, "'", "''");
			USCN2_VL2 = CTr.Replace(USCN2_VL2, "'", "''");
			USCN2_VL3 = CTr.Replace(USCN2_VL3, "'", "''");
			USETC_KD = CTr.Replace(USETC_KD, "'", "''");
			USETC_EX2 = CTr.Replace(USETC_EX2, "'", "''");
			USETC_EX = CTr.Replace(USETC_EX, "'", "''");
			AFPTP_KD = CTr.Replace(AFPTP_KD, "'", "''");
			AFPRT_CD = CTr.Replace(AFPRT_CD, "'", "''");
			AFPRT_VL = CTr.Replace(AFPRT_VL, "'", "''");
			AFPRT_UNIT = CTr.Replace(AFPRT_UNIT, "'", "''");
			AFPVL_VL = CTr.Replace(AFPVL_VL, "'", "''");
			RSLT_KD = CTr.Replace(RSLT_KD, "'", "''");
			ETC_EX = CTr.Replace(ETC_EX, "'", "''");
			LICN_YN = CTr.Replace(LICN_YN, "'", "''");
			RSLT_EX = CTr.Replace(RSLT_EX, "'", "''");
			CFRM_DT = CTr.Replace(CFRM_DT, "'", "''");
			LICEN_CD = CTr.Replace(LICEN_CD, "'", "''");
			CKUP_LICEN_CD = CTr.Replace(CKUP_LICEN_CD, "'", "''");
			USER = CTr.Replace(USER, "'", "''");

			if(ICOUNT.equals("0")) {
				sql = "INSERT INTO ET_CANCER_LIVER ( ECL_EXAM_DT , ECL_EXAM_SQ , ECL_ALT_VL , ECL_HBTP_KD , ECL_HBRT_CD , ECL_HBRT_VL , ECL_HBVL_VL , ECL_HBPJ_KD , ECL_HCTP_KD , ECL_HCRT_CD , ECL_HCRT_VL , ECL_HCVL_VL , ECL_HCPJ_KD , ECL_LVEX_DT , ECL_USRL1_KD , ECL_USRL2_KD , ECL_USRL3_KD , ECL_USRL4_KD , ECL_USRL5_KD , ECL_USRL6_KD , ECL_USRL7_KD , ECL_USCN1_KD , ECL_USCN2_1_KD , ECL_USCN2_KD , ECL_USCN2_VL1 , ECL_USCN2_VL2 , ECL_USCN2_VL3 , ECL_USETC_KD , ECL_USETC_EX2 , ECL_USETC_EX , ECL_AFPTP_KD , ECL_AFPRT_CD , ECL_AFPRT_VL , ECL_AFPRT_UNIT , ECL_AFPVL_VL , ECL_RSLT_KD , ECL_ETC_EX , ECL_LICN_YN , ECL_RSLT_EX , ECL_CFRM_DT , ECL_LICEN_CD , ECL_CKUP_LICEN_CD , ECL_INPUT_DTT , ECL_INPUT_ID ) VALUES (";
				sql += "  '" + EXAM_DT + "'";
				sql += ", '" + EXAM_SQ + "'";
				sql += ", '" + ALT_VL + "'";
				sql += ", '" + HBTP_KD + "'";
				sql += ", '" + HBRT_CD + "'";
				sql += ", '" + HBRT_VL + "'";
				sql += ", '" + HBVL_VL + "'";
				sql += ", '" + HBPJ_KD + "'";
				sql += ", '" + HCTP_KD + "'";
				sql += ", '" + HCRT_CD + "'";
				sql += ", '" + HCRT_VL + "'";
				sql += ", '" + HCVL_VL + "'";
				sql += ", '" + HCPJ_KD + "'";
				sql += ", '" + LVEX_DT + "'";
				sql += ", '" + USRL1_KD + "'";
				sql += ", '" + USRL2_KD + "'";
				sql += ", '" + USRL3_KD + "'";
				sql += ", '" + USRL4_KD + "'";
				sql += ", '" + USRL5_KD + "'";
				sql += ", '" + USRL6_KD + "'";
				sql += ", '" + USRL7_KD + "'";
				sql += ", '" + USCN1_KD + "'";
				sql += ", '" + USCN2_1_KD + "'";
				sql += ", '" + USCN2_KD + "'";
				sql += ", '" + USCN2_VL1 + "'";
				sql += ", '" + USCN2_VL2 + "'";
				sql += ", '" + USCN2_VL3 + "'";
				sql += ", '" + USETC_KD + "'";
				sql += ", '" + USETC_EX2 + "'";
				sql += ", '" + USETC_EX + "'";
				sql += ", '" + AFPTP_KD + "'";
				sql += ", '" + AFPRT_CD + "'";
				sql += ", '" + AFPRT_VL + "'";
				sql += ", '" + AFPRT_UNIT + "'";
				sql += ", '" + AFPVL_VL + "'";
				sql += ", '" + RSLT_KD + "'";
				sql += ", '" + ETC_EX + "'";
				sql += ", '" + LICN_YN + "'";
				sql += ", '" + RSLT_EX + "'";
				sql += ", '" + CFRM_DT + "'";
				sql += ", '" + LICEN_CD + "'";
				sql += ", '" + CKUP_LICEN_CD + "'";
				sql += ", SYSDATE";
				sql += ", '" + USER + "'";
				sql += ")";

				argStmtExec.executeUpdate(sql);

			}
			else {
				sql = "UPDATE ET_CANCER_LIVER SET ";
				sql += "  ECL_ALT_VL = '" + ALT_VL + "'";
				sql += ", ECL_HBTP_KD = '" + HBTP_KD + "'";
				sql += ", ECL_HBRT_CD = '" + HBRT_CD + "'";
				sql += ", ECL_HBRT_VL = '" + HBRT_VL + "'";
				sql += ", ECL_HBVL_VL = '" + HBVL_VL + "'";
				sql += ", ECL_HBPJ_KD = '" + HBPJ_KD + "'";
				sql += ", ECL_HCTP_KD = '" + HCTP_KD + "'";
				sql += ", ECL_HCRT_CD = '" + HCRT_CD + "'";
				sql += ", ECL_HCRT_VL = '" + HCRT_VL + "'";
				sql += ", ECL_HCVL_VL = '" + HCVL_VL + "'";
				sql += ", ECL_HCPJ_KD = '" + HCPJ_KD + "'";
				sql += ", ECL_LVEX_DT = '" + LVEX_DT + "'";
				sql += ", ECL_USRL1_KD = '" + USRL1_KD + "'";
				sql += ", ECL_USRL2_KD = '" + USRL2_KD + "'";
				sql += ", ECL_USRL3_KD = '" + USRL3_KD + "'";
				sql += ", ECL_USRL4_KD = '" + USRL4_KD + "'";
				sql += ", ECL_USRL5_KD = '" + USRL5_KD + "'";
				sql += ", ECL_USRL6_KD = '" + USRL6_KD + "'";
				sql += ", ECL_USRL7_KD = '" + USRL7_KD + "'";
				sql += ", ECL_USCN1_KD = '" + USCN1_KD + "'";
				sql += ", ECL_USCN2_1_KD = '" + USCN2_1_KD + "'";
				sql += ", ECL_USCN2_KD = '" + USCN2_KD + "'";
				sql += ", ECL_USCN2_VL1 = '" + USCN2_VL1 + "'";
				sql += ", ECL_USCN2_VL2 = '" + USCN2_VL2 + "'";
				sql += ", ECL_USCN2_VL3 = '" + USCN2_VL3 + "'";
				sql += ", ECL_USETC_KD = '" + USETC_KD + "'";
				sql += ", ECL_USETC_EX2 = '" + USETC_EX2 + "'";
				sql += ", ECL_USETC_EX = '" + USETC_EX + "'";
				sql += ", ECL_AFPTP_KD = '" + AFPTP_KD + "'";
				sql += ", ECL_AFPRT_CD = '" + AFPRT_CD + "'";
				sql += ", ECL_AFPRT_VL = '" + AFPRT_VL + "'";
				sql += ", ECL_AFPRT_UNIT = '" + AFPRT_UNIT + "'";
				sql += ", ECL_AFPVL_VL = '" + AFPVL_VL + "'";
				sql += ", ECL_RSLT_KD = '" + RSLT_KD + "'";
				sql += ", ECL_ETC_EX = '" + ETC_EX + "'";
				sql += ", ECL_LICN_YN = '" + LICN_YN + "'";
				sql += ", ECL_RSLT_EX = '" + RSLT_EX + "'";
				sql += ", ECL_CFRM_DT = '" + CFRM_DT + "'";
				sql += ", ECL_LICEN_CD = '" + LICEN_CD + "'";
				sql += ", ECL_CKUP_LICEN_CD = '" + CKUP_LICEN_CD + "'";
				sql += ", ECL_MODI_DTT = SYSDATE";
				sql += ", ECL_MODI_ID = '" + USER + "'";
				sql += " WHERE ECL_EXAM_DT = '" + EXAM_DT + "'";
				sql += " AND ECL_EXAM_SQ = '" + EXAM_SQ + "'";

				argStmtExec.executeUpdate(sql);

			}
		} catch (Exception e) {

			throw new FuncException(e.toString(), sql);
		}

		return sql;
	}
%>
