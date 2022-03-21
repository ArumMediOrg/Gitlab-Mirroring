<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%!
	public String func_uCancer_Rslt_2020_ufSaveStmcRslt_002(Statement argStmtExec, HashMap argHtMethod) throws Exception {

		String sql = "";
		String sql2 = "";
		String sql_disp = "";

		try {

			String ICOUNT = (String) argHtMethod.get("ICOUNT");
			String EXAM_DT = (String) argHtMethod.get("EXAM_DT");
			String EXAM_SQ = (String) argHtMethod.get("EXAM_SQ");
			String GIEX_KD = (String) argHtMethod.get("GIEX_KD");
			String GIEX_DT = (String) argHtMethod.get("GIEX_DT");
			String GICM_KD = (String) argHtMethod.get("GICM_KD");
			String GIRT1_KD = (String) argHtMethod.get("GIRT1_KD");
			String GIRT1S_KD = (String) argHtMethod.get("GIRT1S_KD");
			String GIRT2_KD = (String) argHtMethod.get("GIRT2_KD");
			String GIRT2S_KD = (String) argHtMethod.get("GIRT2S_KD");
			String GIRT3_KD = (String) argHtMethod.get("GIRT3_KD");
			String GIRT3S_KD = (String) argHtMethod.get("GIRT3S_KD");
			String GIETC_KD = (String) argHtMethod.get("GIETC_KD");
			String GIRT_EX = (String) argHtMethod.get("GIRT_EX");
			String ENEX_DT = (String) argHtMethod.get("ENEX_DT");
			String ENRT1_KD = (String) argHtMethod.get("ENRT1_KD");
			String ENRT1S_KD = (String) argHtMethod.get("ENRT1S_KD");
			String ENRT2_KD = (String) argHtMethod.get("ENRT2_KD");
			String ENRT2S_KD = (String) argHtMethod.get("ENRT2S_KD");
			String ENRT3_KD = (String) argHtMethod.get("ENRT3_KD");
			String ENRT3S_KD = (String) argHtMethod.get("ENRT3S_KD");
			String ENETC_KD = (String) argHtMethod.get("ENETC_KD");
			String ENRT_EX = (String) argHtMethod.get("ENRT_EX");
			String BIEX_YN = (String) argHtMethod.get("BIEX_YN");
			String FOCP_KD = (String) argHtMethod.get("FOCP_KD");
			String BICT_KD = (String) argHtMethod.get("BICT_KD");
			String BIRT_KD = (String) argHtMethod.get("BIRT_KD");
			String BICNCR_KD = (String) argHtMethod.get("BICNCR_KD");
			String BIETC_KD = (String) argHtMethod.get("BIETC_KD");
			String BICNCR_EX = (String) argHtMethod.get("BICNCR_EX");
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
			if(GIEX_KD == null) { GIEX_KD = ""; }
			if(GIEX_DT == null) { GIEX_DT = ""; }
			if(GICM_KD == null) { GICM_KD = ""; }
			if(GIRT1_KD == null) { GIRT1_KD = ""; }
			if(GIRT1S_KD == null) { GIRT1S_KD = ""; }
			if(GIRT2_KD == null) { GIRT2_KD = ""; }
			if(GIRT2S_KD == null) { GIRT2S_KD = ""; }
			if(GIRT3_KD == null) { GIRT3_KD = ""; }
			if(GIRT3S_KD == null) { GIRT3S_KD = ""; }
			if(GIETC_KD == null) { GIETC_KD = ""; }
			if(GIRT_EX == null) { GIRT_EX = ""; }
			if(ENEX_DT == null) { ENEX_DT = ""; }
			if(ENRT1_KD == null) { ENRT1_KD = ""; }
			if(ENRT1S_KD == null) { ENRT1S_KD = ""; }
			if(ENRT2_KD == null) { ENRT2_KD = ""; }
			if(ENRT2S_KD == null) { ENRT2S_KD = ""; }
			if(ENRT3_KD == null) { ENRT3_KD = ""; }
			if(ENRT3S_KD == null) { ENRT3S_KD = ""; }
			if(ENETC_KD == null) { ENETC_KD = ""; }
			if(ENRT_EX == null) { ENRT_EX = ""; }
			if(BIEX_YN == null) { BIEX_YN = ""; }
			if(FOCP_KD == null) { FOCP_KD = ""; }
			if(BICT_KD == null) { BICT_KD = ""; }
			if(BIRT_KD == null) { BIRT_KD = ""; }
			if(BICNCR_KD == null) { BICNCR_KD = ""; }
			if(BIETC_KD == null) { BIETC_KD = ""; }
			if(BICNCR_EX == null) { BICNCR_EX = ""; }
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
			GIEX_KD = CTr.Replace(GIEX_KD, "'", "''");
			GIEX_DT = CTr.Replace(GIEX_DT, "'", "''");
			GICM_KD = CTr.Replace(GICM_KD, "'", "''");
			GIRT1_KD = CTr.Replace(GIRT1_KD, "'", "''");
			GIRT1S_KD = CTr.Replace(GIRT1S_KD, "'", "''");
			GIRT2_KD = CTr.Replace(GIRT2_KD, "'", "''");
			GIRT2S_KD = CTr.Replace(GIRT2S_KD, "'", "''");
			GIRT3_KD = CTr.Replace(GIRT3_KD, "'", "''");
			GIRT3S_KD = CTr.Replace(GIRT3S_KD, "'", "''");
			GIETC_KD = CTr.Replace(GIETC_KD, "'", "''");
			GIRT_EX = CTr.Replace(GIRT_EX, "'", "''");
			ENEX_DT = CTr.Replace(ENEX_DT, "'", "''");
			ENRT1_KD = CTr.Replace(ENRT1_KD, "'", "''");
			ENRT1S_KD = CTr.Replace(ENRT1S_KD, "'", "''");
			ENRT2_KD = CTr.Replace(ENRT2_KD, "'", "''");
			ENRT2S_KD = CTr.Replace(ENRT2S_KD, "'", "''");
			ENRT3_KD = CTr.Replace(ENRT3_KD, "'", "''");
			ENRT3S_KD = CTr.Replace(ENRT3S_KD, "'", "''");
			ENETC_KD = CTr.Replace(ENETC_KD, "'", "''");
			ENRT_EX = CTr.Replace(ENRT_EX, "'", "''");
			BIEX_YN = CTr.Replace(BIEX_YN, "'", "''");
			FOCP_KD = CTr.Replace(FOCP_KD, "'", "''");
			BICT_KD = CTr.Replace(BICT_KD, "'", "''");
			BIRT_KD = CTr.Replace(BIRT_KD, "'", "''");
			BICNCR_KD = CTr.Replace(BICNCR_KD, "'", "''");
			BIETC_KD = CTr.Replace(BIETC_KD, "'", "''");
			BICNCR_EX = CTr.Replace(BICNCR_EX, "'", "''");
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
				sql = "INSERT INTO ET_CANCER_STMC ( ECS_EXAM_DT , ECS_EXAM_SQ , ECS_GIEX_KD , ECS_GIEX_DT , ECS_GICM_KD , ECS_GIRT1_KD , ECS_GIRT1S_KD , ECS_GIRT2_KD , ECS_GIRT2S_KD , ECS_GIRT3_KD , ECS_GIRT3S_KD , ECS_GIETC_KD , ECS_GIRT_EX , ECS_ENEX_DT , ECS_ENRT1_KD , ECS_ENRT1S_KD , ECS_ENRT2_KD , ECS_ENRT2S_KD , ECS_ENRT3_KD , ECS_ENRT3S_KD , ECS_ENETC_KD , ECS_ENRT_EX , ECS_BIEX_YN , ECS_FOCP_KD , ECS_BICT_KD , ECS_BIRT_KD , ECS_BICNCR_KD , ECS_BIETC_KD , ECS_BICNCR_EX , ECS_BIETC_EX , ECS_RSLT_KD , ECS_ETC_EX , ECS_STCN_YN , ECS_RSLT_EX , ECS_CFRM_DT , ECS_LICEN_CD , ECS_DECI_LICEN_CD , ECS_CKUP_LICEN_CD , ECS_PATH_LICEN_CD , ECS_INPUT_DTT , ECS_INPUT_ID ) VALUES (";
				sql += "  '" + EXAM_DT + "'";
				sql += ", '" + EXAM_SQ + "'";
				sql += ", '" + GIEX_KD + "'";
				sql += ", '" + GIEX_DT + "'";
				sql += ", '" + GICM_KD + "'";
				sql += ", '" + GIRT1_KD + "'";
				sql += ", '" + GIRT1S_KD + "'";
				sql += ", '" + GIRT2_KD + "'";
				sql += ", '" + GIRT2S_KD + "'";
				sql += ", '" + GIRT3_KD + "'";
				sql += ", '" + GIRT3S_KD + "'";
				sql += ", '" + GIETC_KD + "'";
				sql += ", '" + GIRT_EX + "'";
				sql += ", '" + ENEX_DT + "'";
				sql += ", '" + ENRT1_KD + "'";
				sql += ", '" + ENRT1S_KD + "'";
				sql += ", '" + ENRT2_KD + "'";
				sql += ", '" + ENRT2S_KD + "'";
				sql += ", '" + ENRT3_KD + "'";
				sql += ", '" + ENRT3S_KD + "'";
				sql += ", '" + ENETC_KD + "'";
				sql += ", '" + ENRT_EX + "'";
				sql += ", '" + BIEX_YN + "'";
				sql += ", '" + FOCP_KD + "'";
				sql += ", '" + BICT_KD + "'";
				sql += ", '" + BIRT_KD + "'";
				sql += ", '" + BICNCR_KD + "'";
				sql += ", '" + BIETC_KD + "'";
				sql += ", '" + BICNCR_EX + "'";
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
				sql = "UPDATE ET_CANCER_STMC SET ";
				sql += "  ECS_GIEX_KD = '" + GIEX_KD + "'";
				sql += ", ECS_GIEX_DT = '" + GIEX_DT + "'";
				sql += ", ECS_GICM_KD = '" + GICM_KD + "'";
				sql += ", ECS_GIRT1_KD = '" + GIRT1_KD + "'";
				sql += ", ECS_GIRT1S_KD = '" + GIRT1S_KD + "'";
				sql += ", ECS_GIRT2_KD = '" + GIRT2_KD + "'";
				sql += ", ECS_GIRT2S_KD = '" + GIRT2S_KD + "'";
				sql += ", ECS_GIRT3_KD = '" + GIRT3_KD + "'";
				sql += ", ECS_GIRT3S_KD = '" + GIRT3S_KD + "'";
				sql += ", ECS_GIETC_KD = '" + GIETC_KD + "'";
				sql += ", ECS_GIRT_EX = '" + GIRT_EX + "'";
				sql += ", ECS_ENEX_DT = '" + ENEX_DT + "'";
				sql += ", ECS_ENRT1_KD = '" + ENRT1_KD + "'";
				sql += ", ECS_ENRT1S_KD = '" + ENRT1S_KD + "'";
				sql += ", ECS_ENRT2_KD = '" + ENRT2_KD + "'";
				sql += ", ECS_ENRT2S_KD = '" + ENRT2S_KD + "'";
				sql += ", ECS_ENRT3_KD = '" + ENRT3_KD + "'";
				sql += ", ECS_ENRT3S_KD = '" + ENRT3S_KD + "'";
				sql += ", ECS_ENETC_KD = '" + ENETC_KD + "'";
				sql += ", ECS_ENRT_EX = '" + ENRT_EX + "'";
				sql += ", ECS_BIEX_YN = '" + BIEX_YN + "'";
				sql += ", ECS_FOCP_KD = '" + FOCP_KD + "'";
				sql += ", ECS_BICT_KD = '" + BICT_KD + "'";
				sql += ", ECS_BIRT_KD = '" + BIRT_KD + "'";
				sql += ", ECS_BICNCR_KD = '" + BICNCR_KD + "'";
				sql += ", ECS_BIETC_KD = '" + BIETC_KD + "'";
				sql += ", ECS_BICNCR_EX = '" + BICNCR_EX + "'";
				sql += ", ECS_BIETC_EX = '" + BIETC_EX + "'";
				sql += ", ECS_RSLT_KD = '" + RSLT_KD + "'";
				sql += ", ECS_ETC_EX = '" + ETC_EX + "'";
				sql += ", ECS_STCN_YN = '" + STCN_YN + "'";
				sql += ", ECS_RSLT_EX = '" + RSLT_EX + "'";
				sql += ", ECS_CFRM_DT = '" + CFRM_DT + "'";
				sql += ", ECS_LICEN_CD = '" + LICEN_CD + "'";
				sql += ", ECS_DECI_LICEN_CD = '" + DECI_LICEN_CD + "'";
				sql += ", ECS_CKUP_LICEN_CD = '" + CKUP_LICEN_CD + "'";
				sql += ", ECS_PATH_LICEN_CD = '" + PATH_LICEN_CD + "'";
				sql += ", ECS_MODI_DTT = SYSDATE";
				sql += ", ECS_MODI_ID = '" + USER + "'";
				sql += " WHERE ECS_EXAM_DT = '" + EXAM_DT + "'";
				sql += " AND ECS_EXAM_SQ = '" + EXAM_SQ + "'";

				argStmtExec.executeUpdate(sql);

			}
		} catch (Exception e) {

			throw new FuncException(e.toString(), sql);
		}

		return sql;
	}
%>
