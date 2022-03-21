<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%!
	public String func_uCRM_BASIC_CRMMain_Save_002(Statement argStmtExec, HashMap argHtMethod) throws Exception {

		String sql = "";
		String sql2 = "";
		String sql_disp = "";

		try {
			String SSQL_ADD = (String) argHtMethod.get("SSQL_ADD");
			String SRSVN_NO = (String) argHtMethod.get("SRSVN_NO");

			//
			if(SSQL_ADD == null) { SSQL_ADD = ""; }
			if(SRSVN_NO == null) { SRSVN_NO = ""; }

			//
			SSQL_ADD = CTr.Replace(SSQL_ADD, "'", "''");
			SRSVN_NO = CTr.Replace(SRSVN_NO, "'", "''");

			sql = " Insert Into RT_RSVT_LOG ";
			sql += " (RRG_RSVN_NO,  RRG_RSVN_CD,  RRG_WEB_ID,   RRG_EXAM_DT,  RRG_EXAM_SQ, ";
			sql += " RRG_EXAM_TM,  RRG_ACPT_CD,  RRG_ACPT_KD,  RRG_PLCE_CD,  RRG_CUST_NO, ";
			sql += " RRG_MMBR_CD,  RRG_CHART_NO, RRG_PSNL_ID,  RRG_PSNL_NM,  RRG_SEX_CD, ";
			sql += " RRG_PSNL_AGE, RRG_ZIP_CD,   RRG_ZIP_SQ,   RRG_ZIP_AR,   RRG_ROAD_AR, ";
			sql += " RRG_BLDG_NO,  RRG_TEL_NO,   RRG_MOBL_NO,  RRG_EMAIL_AR, RRG_SEND_CD, ";
			sql += " RRG_SMS_YN,   RRG_COMP_CD,  RRG_DEPT_CD,  RRG_DEPT_NM,  RRG_DIVI_CD, ";
			sql += " RRG_ENTRY_DT, RRG_DIVI_NO,  RRG_FAMY_CD,  RRG_FAMY_NM,  RRG_DRUG_YN, ";
			sql += " RRG_SALES_ID, RRG_EXAM_CD,  RRG_HTSB_CD,  RRG_HTSB_YN,  RRG_HTPR_CD, ";
			sql += " RRG_EXAM_LT,  RRG_EQUIP_TM, RRG_EQUIP_LT, RRG_INSU_NO,  RRG_INSU_CD, ";
			sql += " RRG_ENTY_CD,  RRG_ASSO_CD,  RRG_CNTR_CD,  RRG_HEPA_YN,  RRG_ORAL_YN, ";
			sql += " RRG_STOMA_CD, RRG_COLON_CD, RRG_LIVER_CD, RRG_BAST_CD,  RRG_UTER_CD, ";
			sql += " RRG_STOMA_DR, RRG_COLON_DR, RRG_LIVER_DR, RRG_BAST_DR,  RRG_UTER_DR, ";
			sql += " RRG_HDMD_YN,  RRG_SPRT_PR,  RRG_COMP_PR,  RRG_PSNL_PR,  RRG_HLTH_PR, ";
			sql += " RRG_PYER_CD,  RRG_CMPY_CD,  RRG_PRPY_CD,  RRG_RECE_NO,  RRG_RECE_KD, ";
			sql += " RRG_NHIC_TX,  RRG_RSVN_TX,  RRG_INPT_ID,  RRG_INPT_DTT, RRG_HCV_YN, ";
			sql += " RRG_BLOOD_YN, RRG_ASPL_YN,  RRG_STOOL_YN, RRG_SPSB_CD,  RRG_CVSB_CD, ";
			sql += " RRG_EMSB_CD,  RRG_ETSB_CD,  RRG_SPSB_YN,  RRG_CVSB_YN,  RRG_EMSB_YN, ";
			sql += " RRG_ETSB_YN,  RRG_SPCL_CD,  RRG_SPHT_CD,  RRG_SDMD_YN,  RRG_SPCL_PR, ";
			sql += " RRG_CNCL_YN,  RRG_SMPL_YN,  RRG_STOMA_YN, RRG_COLON_YN, RRG_HLTH_KD, ";
			sql += " RRG_SAFE_YN,  RRG_LUNG_CD,  RRG_LUNG_DR,  RRG_UBEH_YN,  RRG_QUEST_KD, ";
			sql += " RRG_DRUG_DT,  RRG_LOTT_AR,  RRG_OCS_NO,   RRG_OCS_DR,   RRG_OCS_DV) ";
			sql += " Select ";

			sql += SSQL_ADD;

			sql += " From RT_RSVT ";
			sql += " Where RRT_RSVN_NO = '" + SRSVN_NO + "' ";
			sql += " And RowNum = 1 ";
			sql += " Order By RRT_INPT_DTT DESC ";

			argStmtExec.executeUpdate(sql);

		} catch (Exception e) {

			throw new FuncException(e.toString(), sql);
		}

		return sql;
	}
%>
