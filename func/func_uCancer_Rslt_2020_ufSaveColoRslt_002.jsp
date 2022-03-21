<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%!
	public String func_uCancer_Rslt_2020_ufSaveColoRslt_002(Statement argStmtExec, HashMap argHtMethod) throws Exception {

		String sql = "";
		String sql2 = "";
		String sql_disp = "";

		try {

			String ICOUNT = (String) argHtMethod.get("ICOUNT");
			String EXAM_DT = (String) argHtMethod.get("EXAM_DT");
			String EXAM_SQ = (String) argHtMethod.get("EXAM_SQ");
			String OBEX_DT = (String) argHtMethod.get("OBEX_DT");
			String OBTP_KD = (String) argHtMethod.get("OBTP_KD");
			String OBRT_CD = (String) argHtMethod.get("OBRT_CD");
			String OBRT_VL = (String) argHtMethod.get("OBRT_VL");
			String OBVL_VL = (String) argHtMethod.get("OBVL_VL");
			String GIEX_DT = (String) argHtMethod.get("GIEX_DT");
			String GIEX_KD = (String) argHtMethod.get("GIEX_KD");
			String GIRT1_KD = (String) argHtMethod.get("GIRT1_KD");
			String GIRT1S_KD = (String) argHtMethod.get("GIRT1S_KD");
			String GIRT2_KD = (String) argHtMethod.get("GIRT2_KD");
			String GIRT2S_KD = (String) argHtMethod.get("GIRT2S_KD");
			String GIRT3_KD = (String) argHtMethod.get("GIRT3_KD");
			String GIRT3S_KD = (String) argHtMethod.get("GIRT3S_KD");
			String GIPL_VL = (String) argHtMethod.get("GIPL_VL");
			String GIETC_KD = (String) argHtMethod.get("GIETC_KD");
			String GIRT_EX = (String) argHtMethod.get("GIRT_EX");
			String ENEX_DT = (String) argHtMethod.get("ENEX_DT");
			String ENRT1_KD = (String) argHtMethod.get("ENRT1_KD");
			String ENRT1S_KD = (String) argHtMethod.get("ENRT1S_KD");
			String ENRT2_KD = (String) argHtMethod.get("ENRT2_KD");
			String ENRT2S_KD = (String) argHtMethod.get("ENRT2S_KD");
			String ENRT3_KD = (String) argHtMethod.get("ENRT3_KD");
			String ENRT3S_KD = (String) argHtMethod.get("ENRT3S_KD");
			String ENCE_KD = (String) argHtMethod.get("ENCE_KD");
			String ENJJ_KD = (String) argHtMethod.get("ENJJ_KD");
			String ENPL_VL = (String) argHtMethod.get("ENPL_VL");
			String ENPL_CT = (String) argHtMethod.get("ENPL_CT");
			String ENETC_KD = (String) argHtMethod.get("ENETC_KD");
			String ENRT_EX = (String) argHtMethod.get("ENRT_EX");
			String BIEX_YN = (String) argHtMethod.get("BIEX_YN");
			String FOCP_KD = (String) argHtMethod.get("FOCP_KD");
			String FOCP_ADD_KD = (String) argHtMethod.get("FOCP_ADD_KD");
			String BIBF_KD = (String) argHtMethod.get("BIBF_KD");
			String BICT_KD = (String) argHtMethod.get("BICT_KD");
			String BIRT_KD = (String) argHtMethod.get("BIRT_KD");
			String BICNCR_KD = (String) argHtMethod.get("BICNCR_KD");
			String BICNCR_EX = (String) argHtMethod.get("BICNCR_EX");
			String BIETC_KD = (String) argHtMethod.get("BIETC_KD");
			String BIETC_EX = (String) argHtMethod.get("BIETC_EX");
			String RSLT_KD = (String) argHtMethod.get("RSLT_KD");
			String ETC_EX = (String) argHtMethod.get("ETC_EX");
			String STCN_YN = (String) argHtMethod.get("STCN_YN");
			String RSLT_EX = (String) argHtMethod.get("RSLT_EX");
			String CFRM_DT = (String) argHtMethod.get("CFRM_DT");
			String LICEN_CD = (String) argHtMethod.get("LICEN_CD");
			String DECI_LICEN_CD = (String) argHtMethod.get("DECI_LICEN_CD");
			String CKUP_LICEN_CD = (String) argHtMethod.get("CKUP_LICEN_CD");
			String PATH_LICEN_CD = (String) argHtMethod.get("PATH_LICEN_CD");
			String USER = (String) argHtMethod.get("USER");

			//
			if(ICOUNT == null) { ICOUNT = ""; }
			if(EXAM_DT == null) { EXAM_DT = ""; }
			if(EXAM_SQ == null) { EXAM_SQ = ""; }
			if(OBEX_DT == null) { OBEX_DT = ""; }
			if(OBTP_KD == null) { OBTP_KD = ""; }
			if(OBRT_CD == null) { OBRT_CD = ""; }
			if(OBRT_VL == null) { OBRT_VL = ""; }
			if(OBVL_VL == null) { OBVL_VL = ""; }
			if(GIEX_DT == null) { GIEX_DT = ""; }
			if(GIEX_KD == null) { GIEX_KD = ""; }
			if(GIRT1_KD == null) { GIRT1_KD = ""; }
			if(GIRT1S_KD == null) { GIRT1S_KD = ""; }
			if(GIRT2_KD == null) { GIRT2_KD = ""; }
			if(GIRT2S_KD == null) { GIRT2S_KD = ""; }
			if(GIRT3_KD == null) { GIRT3_KD = ""; }
			if(GIRT3S_KD == null) { GIRT3S_KD = ""; }
			if(GIPL_VL == null) { GIPL_VL = ""; }
			if(GIETC_KD == null) { GIETC_KD = ""; }
			if(GIRT_EX == null) { GIRT_EX = ""; }
			if(ENEX_DT == null) { ENEX_DT = ""; }
			if(ENRT1_KD == null) { ENRT1_KD = ""; }
			if(ENRT1S_KD == null) { ENRT1S_KD = ""; }
			if(ENRT2_KD == null) { ENRT2_KD = ""; }
			if(ENRT2S_KD == null) { ENRT2S_KD = ""; }
			if(ENRT3_KD == null) { ENRT3_KD = ""; }
			if(ENRT3S_KD == null) { ENRT3S_KD = ""; }
			if(ENCE_KD == null) { ENCE_KD = ""; }
			if(ENJJ_KD == null) { ENJJ_KD = ""; }
			if(ENPL_VL == null) { ENPL_VL = ""; }
			if(ENPL_CT == null) { ENPL_CT = ""; }
			if(ENETC_KD == null) { ENETC_KD = ""; }
			if(ENRT_EX == null) { ENRT_EX = ""; }
			if(BIEX_YN == null) { BIEX_YN = ""; }
			if(FOCP_KD == null) { FOCP_KD = ""; }
			if(FOCP_ADD_KD == null) { FOCP_ADD_KD = ""; }
			if(BIBF_KD == null) { BIBF_KD = ""; }
			if(BICT_KD == null) { BICT_KD = ""; }
			if(BIRT_KD == null) { BIRT_KD = ""; }
			if(BICNCR_KD == null) { BICNCR_KD = ""; }
			if(BICNCR_EX == null) { BICNCR_EX = ""; }
			if(BIETC_KD == null) { BIETC_KD = ""; }
			if(BIETC_EX == null) { BIETC_EX = ""; }
			if(RSLT_KD == null) { RSLT_KD = ""; }
			if(ETC_EX == null) { ETC_EX = ""; }
			if(STCN_YN == null) { STCN_YN = ""; }
			if(RSLT_EX == null) { RSLT_EX = ""; }
			if(CFRM_DT == null) { CFRM_DT = ""; }
			if(LICEN_CD == null) { LICEN_CD = ""; }
			if(DECI_LICEN_CD == null) { DECI_LICEN_CD = ""; }
			if(CKUP_LICEN_CD == null) { CKUP_LICEN_CD = ""; }
			if(PATH_LICEN_CD == null) { PATH_LICEN_CD = ""; }
			if(USER == null) { USER = ""; }

			//
			ICOUNT = CTr.Replace(ICOUNT, "'", "''");
			EXAM_DT = CTr.Replace(EXAM_DT, "'", "''");
			EXAM_SQ = CTr.Replace(EXAM_SQ, "'", "''");
			OBEX_DT = CTr.Replace(OBEX_DT, "'", "''");
			OBTP_KD = CTr.Replace(OBTP_KD, "'", "''");
			OBRT_CD = CTr.Replace(OBRT_CD, "'", "''");
			OBRT_VL = CTr.Replace(OBRT_VL, "'", "''");
			OBVL_VL = CTr.Replace(OBVL_VL, "'", "''");
			GIEX_DT = CTr.Replace(GIEX_DT, "'", "''");
			GIEX_KD = CTr.Replace(GIEX_KD, "'", "''");
			GIRT1_KD = CTr.Replace(GIRT1_KD, "'", "''");
			GIRT1S_KD = CTr.Replace(GIRT1S_KD, "'", "''");
			GIRT2_KD = CTr.Replace(GIRT2_KD, "'", "''");
			GIRT2S_KD = CTr.Replace(GIRT2S_KD, "'", "''");
			GIRT3_KD = CTr.Replace(GIRT3_KD, "'", "''");
			GIRT3S_KD = CTr.Replace(GIRT3S_KD, "'", "''");
			GIPL_VL = CTr.Replace(GIPL_VL, "'", "''");
			GIETC_KD = CTr.Replace(GIETC_KD, "'", "''");
			GIRT_EX = CTr.Replace(GIRT_EX, "'", "''");
			ENEX_DT = CTr.Replace(ENEX_DT, "'", "''");
			ENRT1_KD = CTr.Replace(ENRT1_KD, "'", "''");
			ENRT1S_KD = CTr.Replace(ENRT1S_KD, "'", "''");
			ENRT2_KD = CTr.Replace(ENRT2_KD, "'", "''");
			ENRT2S_KD = CTr.Replace(ENRT2S_KD, "'", "''");
			ENRT3_KD = CTr.Replace(ENRT3_KD, "'", "''");
			ENRT3S_KD = CTr.Replace(ENRT3S_KD, "'", "''");
			ENCE_KD = CTr.Replace(ENCE_KD, "'", "''");
			ENJJ_KD = CTr.Replace(ENJJ_KD, "'", "''");
			ENPL_VL = CTr.Replace(ENPL_VL, "'", "''");
			ENPL_CT = CTr.Replace(ENPL_CT, "'", "''");
			ENETC_KD = CTr.Replace(ENETC_KD, "'", "''");
			ENRT_EX = CTr.Replace(ENRT_EX, "'", "''");
			BIEX_YN = CTr.Replace(BIEX_YN, "'", "''");
			FOCP_KD = CTr.Replace(FOCP_KD, "'", "''");
			FOCP_ADD_KD = CTr.Replace(FOCP_ADD_KD, "'", "''");
			BIBF_KD = CTr.Replace(BIBF_KD, "'", "''");
			BICT_KD = CTr.Replace(BICT_KD, "'", "''");
			BIRT_KD = CTr.Replace(BIRT_KD, "'", "''");
			BICNCR_KD = CTr.Replace(BICNCR_KD, "'", "''");
			BICNCR_EX = CTr.Replace(BICNCR_EX, "'", "''");
			BIETC_KD = CTr.Replace(BIETC_KD, "'", "''");
			BIETC_EX = CTr.Replace(BIETC_EX, "'", "''");
			RSLT_KD = CTr.Replace(RSLT_KD, "'", "''");
			ETC_EX = CTr.Replace(ETC_EX, "'", "''");
			STCN_YN = CTr.Replace(STCN_YN, "'", "''");
			RSLT_EX = CTr.Replace(RSLT_EX, "'", "''");
			CFRM_DT = CTr.Replace(CFRM_DT, "'", "''");
			LICEN_CD = CTr.Replace(LICEN_CD, "'", "''");
			DECI_LICEN_CD = CTr.Replace(DECI_LICEN_CD, "'", "''");
			CKUP_LICEN_CD = CTr.Replace(CKUP_LICEN_CD, "'", "''");
			PATH_LICEN_CD = CTr.Replace(PATH_LICEN_CD, "'", "''");
			USER = CTr.Replace(USER, "'", "''");

			if(ICOUNT.equals("0")) {
				sql = "INSERT INTO ET_CANCER_COLO ( ECC_EXAM_DT , ECC_EXAM_SQ , ECC_OBEX_DT , ECC_OBTP_KD , ECC_OBRT_CD , ECC_OBRT_VL , ECC_OBVL_VL , ECC_GIEX_DT , ECC_GIEX_KD , ECC_GIRT1_KD , ECC_GIRT1S_KD , ECC_GIRT2_KD , ECC_GIRT2S_KD , ECC_GIRT3_KD , ECC_GIRT3S_KD , ECC_GIPL_VL , ECC_GIETC_KD , ECC_GIRT_EX , ECC_ENEX_DT , ECC_ENRT1_KD , ECC_ENRT1S_KD , ECC_ENRT2_KD , ECC_ENRT2S_KD , ECC_ENRT3_KD , ECC_ENRT3S_KD , ECC_ENCE_KD , ECC_ENJJ_KD , ECC_ENPL_VL , ECC_ENPL_CT , ECC_ENETC_KD , ECC_ENRT_EX , ECC_BIEX_YN , ECC_FOCP_KD , ECC_FOCP_ADD_KD , ECC_BIBF_KD , ECC_BICT_KD , ECC_BIRT_KD , ECC_BICNCR_KD , ECC_BICNCR_EX , ECC_BIETC_KD , ECC_BIETC_EX , ECC_RSLT_KD , ECC_ETC_EX , ECC_STCN_YN , ECC_RSLT_EX , ECC_CFRM_DT , ECC_LICEN_CD , ECC_DECI_LICEN_CD , ECC_CKUP_LICEN_CD , ECC_PATH_LICEN_CD , ECC_INPUT_DTT , ECC_INPUT_ID ) VALUES (";
				sql += "  '" + EXAM_DT + "'";
				sql += ", '" + EXAM_SQ + "'";
				sql += ", '" + OBEX_DT + "'";
				sql += ", '" + OBTP_KD + "'";
				sql += ", '" + OBRT_CD + "'";
				sql += ", '" + OBRT_VL + "'";
				sql += ", '" + OBVL_VL + "'";
				sql += ", '" + GIEX_DT + "'";
				sql += ", '" + GIEX_KD + "'";
				sql += ", '" + GIRT1_KD + "'";
				sql += ", '" + GIRT1S_KD + "'";
				sql += ", '" + GIRT2_KD + "'";
				sql += ", '" + GIRT2S_KD + "'";
				sql += ", '" + GIRT3_KD + "'";
				sql += ", '" + GIRT3S_KD + "'";
				sql += ", '" + GIPL_VL + "'";
				sql += ", '" + GIETC_KD + "'";
				sql += ", '" + GIRT_EX + "'";
				sql += ", '" + ENEX_DT + "'";
				sql += ", '" + ENRT1_KD + "'";
				sql += ", '" + ENRT1S_KD + "'";
				sql += ", '" + ENRT2_KD + "'";
				sql += ", '" + ENRT2S_KD + "'";
				sql += ", '" + ENRT3_KD + "'";
				sql += ", '" + ENRT3S_KD + "'";
				sql += ", '" + ENCE_KD + "'";
				sql += ", '" + ENJJ_KD + "'";
				sql += ", '" + ENPL_VL + "'";
				sql += ", '" + ENPL_CT + "'";
				sql += ", '" + ENETC_KD + "'";
				sql += ", '" + ENRT_EX + "'";
				sql += ", '" + BIEX_YN + "'";
				sql += ", '" + FOCP_KD + "'";
				sql += ", '" + FOCP_ADD_KD + "'";
				sql += ", '" + BIBF_KD + "'";
				sql += ", '" + BICT_KD + "'";
				sql += ", '" + BIRT_KD + "'";
				sql += ", '" + BICNCR_KD + "'";
				sql += ", '" + BICNCR_EX + "'";
				sql += ", '" + BIETC_KD + "'";
				sql += ", '" + BIETC_EX + "'";
				sql += ", '" + RSLT_KD + "'";
				sql += ", '" + ETC_EX + "'";
				sql += ", '" + STCN_YN + "'";
				sql += ", '" + RSLT_EX + "'";
				sql += ", '" + CFRM_DT + "'";
				sql += ", '" + LICEN_CD + "'";
				sql += ", '" + DECI_LICEN_CD + "'";
				sql += ", '" + CKUP_LICEN_CD + "'";
				sql += ", '" + PATH_LICEN_CD + "'";
				sql += ", SYSDATE";
				sql += ", '" + USER + "'";
				sql += ")";

				argStmtExec.executeUpdate(sql);
			}
			else {
				sql = "UPDATE ET_CANCER_COLO SET ";
				sql += "  ECC_OBEX_DT = '" + OBEX_DT + "'";
				sql += ", ECC_OBTP_KD = '" + OBTP_KD + "'";
				sql += ", ECC_OBRT_CD = '" + OBRT_CD + "'";
				sql += ", ECC_OBRT_VL = '" + OBRT_VL + "'";
				sql += ", ECC_OBVL_VL = '" + OBVL_VL + "'";
				sql += ", ECC_GIEX_DT = '" + GIEX_DT + "'";
				sql += ", ECC_GIEX_KD = '" + GIEX_KD + "'";
				sql += ", ECC_GIRT1_KD = '" + GIRT1_KD + "'";
				sql += ", ECC_GIRT1S_KD = '" + GIRT1S_KD + "'";
				sql += ", ECC_GIRT2_KD = '" + GIRT2_KD + "'";
				sql += ", ECC_GIRT2S_KD = '" + GIRT2S_KD + "'";
				sql += ", ECC_GIRT3_KD = '" + GIRT3_KD + "'";
				sql += ", ECC_GIRT3S_KD = '" + GIRT3S_KD + "'";
				sql += ", ECC_GIPL_VL = '" + GIPL_VL + "'";
				sql += ", ECC_GIETC_KD = '" + GIETC_KD + "'";
				sql += ", ECC_GIRT_EX = '" + GIRT_EX + "'";
				sql += ", ECC_ENEX_DT = '" + ENEX_DT + "'";
				sql += ", ECC_ENRT1_KD = '" + ENRT1_KD + "'";
				sql += ", ECC_ENRT1S_KD = '" + ENRT1S_KD + "'";
				sql += ", ECC_ENRT2_KD = '" + ENRT2_KD + "'";
				sql += ", ECC_ENRT2S_KD = '" + ENRT2S_KD + "'";
				sql += ", ECC_ENRT3_KD = '" + ENRT3_KD + "'";
				sql += ", ECC_ENRT3S_KD = '" + ENRT3S_KD + "'";
				sql += ", ECC_ENCE_KD = '" + ENCE_KD + "'";
				sql += ", ECC_ENJJ_KD = '" + ENJJ_KD + "'";
				sql += ", ECC_ENPL_VL = '" + ENPL_VL + "'";
				sql += ", ECC_ENPL_CT = '" + ENPL_CT + "'";
				sql += ", ECC_ENETC_KD = '" + ENETC_KD + "'";
				sql += ", ECC_ENRT_EX = '" + ENRT_EX + "'";
				sql += ", ECC_BIEX_YN = '" + BIEX_YN + "'";
				sql += ", ECC_FOCP_KD = '" + FOCP_KD + "'";
				sql += ", ECC_FOCP_ADD_KD = '" + FOCP_ADD_KD + "'";
				sql += ", ECC_BIBF_KD = '" + BIBF_KD + "'";
				sql += ", ECC_BICT_KD = '" + BICT_KD + "'";
				sql += ", ECC_BIRT_KD = '" + BIRT_KD + "'";
				sql += ", ECC_BICNCR_KD = '" + BICNCR_KD + "'";
				sql += ", ECC_BICNCR_EX = '" + BICNCR_EX + "'";
				sql += ", ECC_BIETC_KD = '" + BIETC_KD + "'";
				sql += ", ECC_BIETC_EX = '" + BIETC_EX + "'";
				sql += ", ECC_RSLT_KD = '" + RSLT_KD + "'";
				sql += ", ECC_ETC_EX = '" + ETC_EX + "'";
				sql += ", ECC_STCN_YN = '" + STCN_YN + "'";
				sql += ", ECC_RSLT_EX = '" + RSLT_EX + "'";
				sql += ", ECC_CFRM_DT = '" + CFRM_DT + "'";
				sql += ", ECC_LICEN_CD = '" + LICEN_CD + "'";
				sql += ", ECC_DECI_LICEN_CD = '" + DECI_LICEN_CD + "'";
				sql += ", ECC_CKUP_LICEN_CD = '" + CKUP_LICEN_CD + "'";
				sql += ", ECC_PATH_LICEN_CD = '" + PATH_LICEN_CD + "'";
				sql += ", ECC_MODI_DTT = SYSDATE";
				sql += ", ECC_MODI_ID = '" + USER + "'";
				sql += " WHERE ECC_EXAM_DT = '" + EXAM_DT + "'";
				sql += " AND ECC_EXAM_SQ = '" + EXAM_SQ + "'";
	
				argStmtExec.executeUpdate(sql);
			}
		} catch (Exception e) {

			throw new FuncException(e.toString(), sql);
		}

		return sql;
	}
%>
