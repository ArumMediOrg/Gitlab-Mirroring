<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%!
	public String func_uRsvn_Acpt_UP_Rsvn_Log_001(Statement argStmtExec, HashMap argHtMethod) throws Exception {

		String sql = "";
		String sql2 = "";
		String sql_disp = "";

		try {

			String DATA_KD = (String) argHtMethod.get("DATA_KD");
			String INPT_ID = (String) argHtMethod.get("INPT_ID");
			String RSVN_NO = (String) argHtMethod.get("RSVN_NO");

			//
			if(DATA_KD == null) { DATA_KD = ""; }
			if(INPT_ID == null) { INPT_ID = ""; }
			if(RSVN_NO == null) { RSVN_NO = ""; }

			//
			DATA_KD = CTr.Replace(DATA_KD, "'", "''");
			INPT_ID = CTr.Replace(INPT_ID, "'", "''");
			RSVN_NO = CTr.Replace(RSVN_NO, "'", "''");

			sql = "INSERT INTO RT_RSVT_LOG (RRG_RSVN_NO, RRG_RSVN_CD, RRG_WEB_ID, RRG_EXAM_DT, RRG_EXAM_SQ, RRG_EXAM_TM, RRG_ACPT_CD, RRG_ACPT_KD, ";
			sql += " RRG_PLCE_CD, RRG_CUST_NO, RRG_MMBR_CD, RRG_CHART_NO, RRG_PSNL_ID, RRG_PSNL_NM, RRG_SEX_CD, RRG_PSNL_AGE, RRG_ZIP_CD, RRG_ZIP_SQ, ";
			sql += " RRG_ZIP_AR, RRG_ROAD_AR, RRG_BLDG_NO, RRG_TEL_NO, RRG_MOBL_NO, RRG_EMAIL_AR, RRG_SEND_CD, RRG_SMS_YN, RRG_COMP_CD, RRG_DEPT_CD, ";
			sql += " RRG_DEPT_NM, RRG_DIVI_CD, RRG_ENTRY_DT, RRG_DIVI_NO, RRG_FAMY_CD, RRG_FAMY_NM, RRG_DRUG_YN, RRG_SALES_ID, RRG_EXAM_CD, RRG_HTSB_CD, ";
			sql += " RRG_HTSB_YN, RRG_HTPR_CD, RRG_EXAM_LT, RRG_EQUIP_TM, RRG_EQUIP_LT, RRG_INSU_NO, RRG_INSU_CD, RRG_ENTY_CD, RRG_ASSO_CD, RRG_CNTR_CD, ";
			sql += " RRG_HEPA_YN, RRG_ORAL_YN, RRG_STOMA_CD, RRG_COLON_CD, RRG_LIVER_CD, RRG_BAST_CD, RRG_UTER_CD, RRG_STOMA_DR, RRG_COLON_DR, RRG_LIVER_DR, ";
			sql += " RRG_BAST_DR, RRG_UTER_DR, RRG_HDMD_YN, RRG_SPRT_PR, RRG_COMP_PR, RRG_PSNL_PR, RRG_HLTH_PR, RRG_PYER_CD, RRG_CMPY_CD, RRG_PRPY_CD, RRG_RECE_NO, ";
			sql += " RRG_RECE_KD, RRG_NHIC_TX, RRG_RSVN_TX, RRG_HCV_YN, RRG_BLOOD_YN, RRG_ASPL_YN, RRG_STOOL_YN, RRG_SPSB_CD, RRG_CVSB_CD, RRG_EMSB_CD, RRG_ETSB_CD, ";
			sql += " RRG_SPSB_YN, RRG_CVSB_YN, RRG_EMSB_YN, RRG_ETSB_YN, RRG_SPCL_CD, RRG_SPHT_CD, RRG_SDMD_YN, RRG_SPCL_PR, RRG_CNCL_YN, RRG_SMPL_YN, RRG_STOMA_YN, ";
			sql += " RRG_COLON_YN, RRG_HLTH_KD, RRG_SAFE_YN, RRG_LUNG_CD, RRG_LUNG_DR, RRG_UBEH_YN, RRG_QUEST_KD, RRG_DATA_KD, RRG_DRUG_DT, ";
			sql += " RRG_OCS_NO, RRG_OCS_DR, RRG_OCS_DV, RRG_ORDER_LT, RRG_DISC_RC, RRG_DISC_CD, RRG_DISC_RT, RRG_DISC_PR, RRG_DISC_CPR, RRG_DISC_TX, ";
			sql += " RRG_INPT_ID, RRG_INPT_DTT, RRG_DEL_ID, RRG_DEL_DTT)";
			sql += " SELECT ";
			sql += "  RRT_RSVN_NO";
			sql += ", RRT_RSVN_CD";
			sql += ", RRT_WEB_ID";
			sql += ", RRT_EXAM_DT";
			sql += ", RRT_EXAM_SQ";
			sql += ", RRT_EXAM_TM";
			sql += ", RRT_ACPT_CD";
			sql += ", RRT_ACPT_KD";
			sql += ", RRT_PLCE_CD";
			sql += ", RRT_CUST_NO";
			sql += ", RRT_MMBR_CD";
			sql += ", RRT_CHART_NO";
			sql += ", RRT_PSNL_ID";
			sql += ", RRT_PSNL_NM";
			sql += ", RRT_SEX_CD";
			sql += ", RRT_PSNL_AGE";
			sql += ", RRT_ZIP_CD";
			sql += ", RRT_ZIP_SQ";
			sql += ", RRT_ZIP_AR";
			sql += ", RRT_ROAD_AR";
			sql += ", RRT_BLDG_NO";
			sql += ", RRT_TEL_NO";
			sql += ", RRT_MOBL_NO";
			sql += ", RRT_EMAIL_AR";
			sql += ", RRT_SEND_CD";
			sql += ", RRT_SMS_YN";
			sql += ", RRT_COMP_CD";
			sql += ", RRT_DEPT_CD";
			sql += ", RRT_DEPT_NM";
			sql += ", RRT_DIVI_CD";
			sql += ", RRT_ENTRY_DT";
			sql += ", RRT_DIVI_NO";
			sql += ", RRT_FAMY_CD";
			sql += ", RRT_FAMY_NM";
			sql += ", RRT_DRUG_YN";
			sql += ", RRT_SALES_ID";
			sql += ", RRT_EXAM_CD";
			sql += ", RRT_HTSB_CD";
			sql += ", RRT_HTSB_YN";
			sql += ", RRT_HTPR_CD";
			sql += ", RRT_EXAM_LT";
			sql += ", RRT_EQUIP_TM";
			sql += ", RRT_EQUIP_LT";
			sql += ", RRT_INSU_NO";
			sql += ", RRT_INSU_CD";
			sql += ", RRT_ENTY_CD";
			sql += ", RRT_ASSO_CD";
			sql += ", RRT_CNTR_CD";
			sql += ", RRT_HEPA_YN";
			sql += ", RRT_ORAL_YN";
			sql += ", RRT_STOMA_CD";
			sql += ", RRT_COLON_CD";
			sql += ", RRT_LIVER_CD";
			sql += ", RRT_BAST_CD";
			sql += ", RRT_UTER_CD";
			sql += ", RRT_STOMA_DR";
			sql += ", RRT_COLON_DR";
			sql += ", RRT_LIVER_DR";
			sql += ", RRT_BAST_DR";
			sql += ", RRT_UTER_DR";
			sql += ", RRT_HDMD_YN";
			sql += ", RRT_SPRT_PR";
			sql += ", RRT_COMP_PR";
			sql += ", RRT_PSNL_PR";
			sql += ", RRT_HLTH_PR";
			sql += ", RRT_PYER_CD";
			sql += ", RRT_CMPY_CD";
			sql += ", RRT_PRPY_CD";
			sql += ", RRT_RECE_NO";
			sql += ", RRT_RECE_KD";
			sql += ", RRT_NHIC_TX";
			sql += ", RRT_RSVN_TX";
			sql += ", RRT_HCV_YN";
			sql += ", RRT_BLOOD_YN";
			sql += ", RRT_ASPL_YN";
			sql += ", RRT_STOOL_YN";
			sql += ", RRT_SPSB_CD";
			sql += ", RRT_CVSB_CD";
			sql += ", RRT_EMSB_CD";
			sql += ", RRT_ETSB_CD";
			sql += ", RRT_SPSB_YN";
			sql += ", RRT_CVSB_YN";
			sql += ", RRT_EMSB_YN";
			sql += ", RRT_ETSB_YN";
			sql += ", RRT_SPCL_CD";
			sql += ", RRT_SPHT_CD";
			sql += ", RRT_SDMD_YN";
			sql += ", RRT_SPCL_PR";
			sql += ", RRT_CNCL_YN";
			sql += ", RRT_SMPL_YN";
			sql += ", RRT_STOMA_YN";
			sql += ", RRT_COLON_YN";
			sql += ", RRT_HLTH_KD";
			sql += ", RRT_SAFE_YN";
			sql += ", RRT_LUNG_CD";
			sql += ", RRT_LUNG_DR";
			sql += ", RRT_UBEH_YN";
			sql += ", RRT_QUEST_KD";
			sql += ", '" + DATA_KD + "'";
			sql += ", RRT_DRUG_DT";
			sql += ", RRT_OCS_NO";
			sql += ", RRT_OCS_DR";
			sql += ", RRT_OCS_DV";
			sql += ", RRT_ORDER_LT";
			sql += ", RRT_DISC_RC";
			sql += ", RRT_DISC_CD";
			sql += ", RRT_DISC_RT";
			sql += ", RRT_DISC_PR";
			sql += ", RRT_DISC_CPR";
			sql += ", RRT_DISC_TX";
			sql += ", ";

			if(DATA_KD.equals("D")) {
				sql += " '" + INPT_ID + "', SYSDATE, '" + INPT_ID + "', SYSDATE";
			}
			else {
				sql += " RRT_INPT_ID, RRT_INPT_DTT, NULL, NULL";
			}
			sql += " FROM RT_RSVT";
			sql += " WHERE RRT_RSVN_NO = '" + RSVN_NO + "'";

			argStmtExec.executeUpdate(sql);
		} catch (Exception e) {

			throw new FuncException(e.toString(), sql);
		}

		return sql;
	}
%>
