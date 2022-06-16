<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%!
	public String func_uItem_Apply_ufSave_001(Statement argStmtExec, HashMap argHtMethod) throws Exception {

		String sql = "";
		String sql2 = "";
		String sql_disp = "";

		try {

			String SMODE = (String) argHtMethod.get("SMODE");
			String IIM_ITEM_CD = (String) argHtMethod.get("IIM_ITEM_CD");
			String IIM_NITEM_CD = (String) argHtMethod.get("IIM_NITEM_CD");
			String IIM_KNME_NM = (String) argHtMethod.get("IIM_KNME_NM");
			String IIM_ENME_NM = (String) argHtMethod.get("IIM_ENME_NM");
			String IIM_CNME_NM = (String) argHtMethod.get("IIM_CNME_NM");
			String IIM_RNME_NM = (String) argHtMethod.get("IIM_RNME_NM");
			String IIM_JNME_NM = (String) argHtMethod.get("IIM_JNME_NM");
			String IIM_SNME_NM = (String) argHtMethod.get("IIM_SNME_NM");
			String IIM_OSCD_CD = (String) argHtMethod.get("IIM_OSCD_CD");
			String IIM_GBCD_CD = (String) argHtMethod.get("IIM_GBCD_CD");
			String IIM_SBCD_CD = (String) argHtMethod.get("IIM_SBCD_CD");
			String IIM_EXGN_CD = (String) argHtMethod.get("IIM_EXGN_CD");
			String IIM_RSLT_KD = (String) argHtMethod.get("IIM_RSLT_KD");
			String IIM_SORT_SQ = (String) argHtMethod.get("IIM_SORT_SQ");
			String IIM_BLPT_CD = (String) argHtMethod.get("IIM_BLPT_CD");
			String IIM_REJH_EX = (String) argHtMethod.get("IIM_REJH_EX");
			String IIM_OSSB_CD = (String) argHtMethod.get("IIM_OSSB_CD");
			String IIM_OSRL_CD = (String) argHtMethod.get("IIM_OSRL_CD");
			String IIM_ACAL_YN = (String) argHtMethod.get("IIM_ACAL_YN");
			String IIM_SAMP_CD = (String) argHtMethod.get("IIM_SAMP_CD");
			String IIM_CANCER_CD = (String) argHtMethod.get("IIM_CANCER_CD");
			String IIM_CNIT_CD = (String) argHtMethod.get("IIM_CNIT_CD");
			String IIM_SUTK_YN = (String) argHtMethod.get("IIM_SUTK_YN");
			String IIM_SUTK_CD = (String) argHtMethod.get("IIM_SUTK_CD");
			String IIM_PNUM_CD = (String) argHtMethod.get("IIM_PNUM_CD");
			String IIM_TUSE_YN = (String) argHtMethod.get("IIM_TUSE_YN");
			String IIM_TPRT_CD = (String) argHtMethod.get("IIM_TPRT_CD");
			String IIM_TRTP_CD = (String) argHtMethod.get("IIM_TRTP_CD");
			String IIM_TRLT_CD = (String) argHtMethod.get("IIM_TRLT_CD");
			String IIM_TRNM_CD = (String) argHtMethod.get("IIM_TRNM_CD");
			String IIM_TXRAY_YN = (String) argHtMethod.get("IIM_TXRAY_YN");
			String IIM_TBIO_YN = (String) argHtMethod.get("IIM_TBIO_YN");
			String IIM_TSND_YN = (String) argHtMethod.get("IIM_TSND_YN");
			String IIM_TETC_YN = (String) argHtMethod.get("IIM_TETC_YN");
			String IIM_THPR_YN = (String) argHtMethod.get("IIM_THPR_YN");
			String IIM_THPR1_CD = (String) argHtMethod.get("IIM_THPR1_CD");
			String IIM_THPR2_CD = (String) argHtMethod.get("IIM_THPR2_CD");
			String IIM_TEDT_YR = (String) argHtMethod.get("IIM_TEDT_YR");
			String IIM_MIN_VL = (String) argHtMethod.get("IIM_MIN_VL");
			String IIM_MAX_VL = (String) argHtMethod.get("IIM_MAX_VL");
			String IIM_DFLT_VL = (String) argHtMethod.get("IIM_DFLT_VL");
			String IIM_SANBO_KD = (String) argHtMethod.get("IIM_SANBO_KD");
			String IIM_SANBO_CD = (String) argHtMethod.get("IIM_SANBO_CD");
			String IIM_SANBO_CAL = (String) argHtMethod.get("IIM_SANBO_CAL");
			String IIM_USE_YN = (String) argHtMethod.get("IIM_USE_YN");
			String IIM_INPT_ID = (String) argHtMethod.get("IIM_INPT_ID");
			String IIM_MODI_ID = (String) argHtMethod.get("IIM_MODI_ID");
			String IIM_ETONME_NM = (String) argHtMethod.get("IIM_ETONME_NM");
			String IIM_SPSORT_SQ = (String) argHtMethod.get("IIM_SPSORT_SQ");

			//
			if(SMODE == null) { SMODE = ""; }
			if(IIM_ITEM_CD == null) { IIM_ITEM_CD = ""; }
			if(IIM_NITEM_CD == null) { IIM_NITEM_CD = ""; }
			if(IIM_KNME_NM == null) { IIM_KNME_NM = ""; }
			if(IIM_ENME_NM == null) { IIM_ENME_NM = ""; }
			if(IIM_CNME_NM == null) { IIM_CNME_NM = ""; }
			if(IIM_RNME_NM == null) { IIM_RNME_NM = ""; }
			if(IIM_JNME_NM == null) { IIM_JNME_NM = ""; }
			if(IIM_SNME_NM == null) { IIM_SNME_NM = ""; }
			if(IIM_OSCD_CD == null) { IIM_OSCD_CD = ""; }
			if(IIM_GBCD_CD == null) { IIM_GBCD_CD = ""; }
			if(IIM_SBCD_CD == null) { IIM_SBCD_CD = ""; }
			if(IIM_EXGN_CD == null) { IIM_EXGN_CD = ""; }
			if(IIM_RSLT_KD == null) { IIM_RSLT_KD = ""; }
			if(IIM_SORT_SQ == null) { IIM_SORT_SQ = ""; }
			if(IIM_BLPT_CD == null) { IIM_BLPT_CD = ""; }
			if(IIM_REJH_EX == null) { IIM_REJH_EX = ""; }
			if(IIM_OSSB_CD == null) { IIM_OSSB_CD = ""; }
			if(IIM_OSRL_CD == null) { IIM_OSRL_CD = ""; }
			if(IIM_ACAL_YN == null) { IIM_ACAL_YN = ""; }
			if(IIM_SAMP_CD == null) { IIM_SAMP_CD = ""; }
			if(IIM_CANCER_CD == null) { IIM_CANCER_CD = ""; }
			if(IIM_CNIT_CD == null) { IIM_CNIT_CD = ""; }
			if(IIM_SUTK_YN == null) { IIM_SUTK_YN = ""; }
			if(IIM_SUTK_CD == null) { IIM_SUTK_CD = ""; }
			if(IIM_PNUM_CD == null) { IIM_PNUM_CD = ""; }
			if(IIM_TUSE_YN == null) { IIM_TUSE_YN = ""; }
			if(IIM_TPRT_CD == null) { IIM_TPRT_CD = ""; }
			if(IIM_TRTP_CD == null) { IIM_TRTP_CD = ""; }
			if(IIM_TRLT_CD == null) { IIM_TRLT_CD = ""; }
			if(IIM_TRNM_CD == null) { IIM_TRNM_CD = ""; }
			if(IIM_TXRAY_YN == null) { IIM_TXRAY_YN = ""; }
			if(IIM_TBIO_YN == null) { IIM_TBIO_YN = ""; }
			if(IIM_TSND_YN == null) { IIM_TSND_YN = ""; }
			if(IIM_TETC_YN == null) { IIM_TETC_YN = ""; }
			if(IIM_THPR_YN == null) { IIM_THPR_YN = ""; }
			if(IIM_THPR1_CD == null) { IIM_THPR1_CD = ""; }
			if(IIM_THPR2_CD == null) { IIM_THPR2_CD = ""; }
			if(IIM_TEDT_YR == null) { IIM_TEDT_YR = ""; }
			if(IIM_MIN_VL == null) { IIM_MIN_VL = ""; }
			if(IIM_MAX_VL == null) { IIM_MAX_VL = ""; }
			if(IIM_DFLT_VL == null) { IIM_DFLT_VL = ""; }
			if(IIM_SANBO_KD == null) { IIM_SANBO_KD = ""; }
			if(IIM_SANBO_CD == null) { IIM_SANBO_CD = ""; }
			if(IIM_SANBO_CAL == null) { IIM_SANBO_CAL = ""; }
			if(IIM_USE_YN == null) { IIM_USE_YN = ""; }
			if(IIM_INPT_ID == null) { IIM_INPT_ID = ""; }
			if(IIM_MODI_ID == null) { IIM_MODI_ID = ""; }
			if(IIM_ETONME_NM == null) { IIM_ETONME_NM = ""; }
			if(IIM_SPSORT_SQ == null) { IIM_SPSORT_SQ = ""; }

			//
			SMODE = CTr.Replace(SMODE, "'", "''");
			IIM_ITEM_CD = CTr.Replace(IIM_ITEM_CD, "'", "''");
			IIM_NITEM_CD = CTr.Replace(IIM_NITEM_CD, "'", "''");
			IIM_KNME_NM = CTr.Replace(IIM_KNME_NM, "'", "''");
			IIM_ENME_NM = CTr.Replace(IIM_ENME_NM, "'", "''");
			IIM_CNME_NM = CTr.Replace(IIM_CNME_NM, "'", "''");
			IIM_RNME_NM = CTr.Replace(IIM_RNME_NM, "'", "''");
			IIM_JNME_NM = CTr.Replace(IIM_JNME_NM, "'", "''");
			IIM_SNME_NM = CTr.Replace(IIM_SNME_NM, "'", "''");
			IIM_OSCD_CD = CTr.Replace(IIM_OSCD_CD, "'", "''");
			IIM_GBCD_CD = CTr.Replace(IIM_GBCD_CD, "'", "''");
			IIM_SBCD_CD = CTr.Replace(IIM_SBCD_CD, "'", "''");
			IIM_EXGN_CD = CTr.Replace(IIM_EXGN_CD, "'", "''");
			IIM_RSLT_KD = CTr.Replace(IIM_RSLT_KD, "'", "''");
			IIM_SORT_SQ = CTr.Replace(IIM_SORT_SQ, "'", "''");
			IIM_BLPT_CD = CTr.Replace(IIM_BLPT_CD, "'", "''");
			IIM_REJH_EX = CTr.Replace(IIM_REJH_EX, "'", "''");
			IIM_OSSB_CD = CTr.Replace(IIM_OSSB_CD, "'", "''");
			IIM_OSRL_CD = CTr.Replace(IIM_OSRL_CD, "'", "''");
			IIM_ACAL_YN = CTr.Replace(IIM_ACAL_YN, "'", "''");
			IIM_SAMP_CD = CTr.Replace(IIM_SAMP_CD, "'", "''");
			IIM_CANCER_CD = CTr.Replace(IIM_CANCER_CD, "'", "''");
			IIM_CNIT_CD = CTr.Replace(IIM_CNIT_CD, "'", "''");
			IIM_SUTK_YN = CTr.Replace(IIM_SUTK_YN, "'", "''");
			IIM_SUTK_CD = CTr.Replace(IIM_SUTK_CD, "'", "''");
			IIM_PNUM_CD = CTr.Replace(IIM_PNUM_CD, "'", "''");
			IIM_TUSE_YN = CTr.Replace(IIM_TUSE_YN, "'", "''");
			IIM_TPRT_CD = CTr.Replace(IIM_TPRT_CD, "'", "''");
			IIM_TRTP_CD = CTr.Replace(IIM_TRTP_CD, "'", "''");
			IIM_TRLT_CD = CTr.Replace(IIM_TRLT_CD, "'", "''");
			IIM_TRNM_CD = CTr.Replace(IIM_TRNM_CD, "'", "''");
			IIM_TXRAY_YN = CTr.Replace(IIM_TXRAY_YN, "'", "''");
			IIM_TBIO_YN = CTr.Replace(IIM_TBIO_YN, "'", "''");
			IIM_TSND_YN = CTr.Replace(IIM_TSND_YN, "'", "''");
			IIM_TETC_YN = CTr.Replace(IIM_TETC_YN, "'", "''");
			IIM_THPR_YN = CTr.Replace(IIM_THPR_YN, "'", "''");
			IIM_THPR1_CD = CTr.Replace(IIM_THPR1_CD, "'", "''");
			IIM_THPR2_CD = CTr.Replace(IIM_THPR2_CD, "'", "''");
			IIM_TEDT_YR = CTr.Replace(IIM_TEDT_YR, "'", "''");
			IIM_MIN_VL = CTr.Replace(IIM_MIN_VL, "'", "''");
			IIM_MAX_VL = CTr.Replace(IIM_MAX_VL, "'", "''");
			IIM_DFLT_VL = CTr.Replace(IIM_DFLT_VL, "'", "''");
			IIM_SANBO_KD = CTr.Replace(IIM_SANBO_KD, "'", "''");
			IIM_SANBO_CD = CTr.Replace(IIM_SANBO_CD, "'", "''");
			IIM_SANBO_CAL = CTr.Replace(IIM_SANBO_CAL, "'", "''");
			IIM_USE_YN = CTr.Replace(IIM_USE_YN, "'", "''");
			IIM_INPT_ID = CTr.Replace(IIM_INPT_ID, "'", "''");
			IIM_MODI_ID = CTr.Replace(IIM_MODI_ID, "'", "''");
			IIM_ETONME_NM = CTr.Replace(IIM_ETONME_NM, "'", "''");
//			IIM_SPSORT_SQ = CTr.Replace(IIM_SPSORT_SQ, "'", "''");

			if(SMODE.equals("INSERT")) {

				sql = "INSERT INTO IT_ITEM (IIM_ITEM_CD, IIM_NITEM_CD, IIM_KNME_NM, IIM_ENME_NM, IIM_CNME_NM, IIM_RNME_NM, IIM_JNME_NM, IIM_SNME_NM, IIM_OSCD_CD, IIM_GBCD_CD, IIM_SBCD_CD, IIM_EXGN_CD, IIM_RSLT_KD, IIM_SORT_SQ, IIM_BLPT_CD, IIM_REJH_EX, IIM_OSSB_CD, IIM_OSRL_CD, IIM_ACAL_YN, IIM_SAMP_CD, IIM_CANCER_CD, IIM_CNIT_CD, IIM_SUTK_YN, IIM_SUTK_CD, IIM_PNUM_CD, IIM_TUSE_YN, IIM_TPRT_CD, IIM_TRTP_CD, IIM_TRLT_CD, IIM_TRNM_CD, IIM_TXRAY_YN, IIM_TBIO_YN, IIM_TSND_YN, IIM_TETC_YN, IIM_THPR_YN, IIM_THPR1_CD, IIM_THPR2_CD, IIM_TEDT_YR, IIM_MIN_VL, IIM_MAX_VL, IIM_DFLT_VL, IIM_SANBO_KD, IIM_SANBO_CD, IIM_SANBO_CAL, IIM_USE_YN, IIM_INPT_DTT, IIM_INPT_ID, IIM_ETONME_NM, IIM_SPSORT_SQ ) VALUES (";
				sql += "  '" + IIM_ITEM_CD + "'";
				sql += ", '" + IIM_NITEM_CD + "'";
				sql += ", '" + IIM_KNME_NM + "'";
				sql += ", '" + IIM_ENME_NM + "'";
				sql += ", '" + IIM_CNME_NM + "'";
				sql += ", '" + IIM_RNME_NM + "'";
				sql += ", '" + IIM_JNME_NM + "'";
				sql += ", '" + IIM_SNME_NM + "'";
				sql += ", '" + IIM_OSCD_CD + "'";
				sql += ", '" + IIM_GBCD_CD + "'";
				sql += ", '" + IIM_SBCD_CD + "'";
				sql += ", '" + IIM_EXGN_CD + "'";
				sql += ", '" + IIM_RSLT_KD + "'";
				sql += ", '" + IIM_SORT_SQ + "'";
				sql += ", '" + IIM_BLPT_CD + "'";
				sql += ", '" + IIM_REJH_EX + "'";
				sql += ", '" + IIM_OSSB_CD + "'";
				sql += ", '" + IIM_OSRL_CD + "'";
				sql += ", '" + IIM_ACAL_YN + "'";
				sql += ", '" + IIM_SAMP_CD + "'";
				sql += ", '" + IIM_CANCER_CD + "'";
				sql += ", '" + IIM_CNIT_CD + "'";
				sql += ", '" + IIM_SUTK_YN + "'";
				sql += ", '" + IIM_SUTK_CD + "'";
				sql += ", '" + IIM_PNUM_CD + "'";
				sql += ", '" + IIM_TUSE_YN + "'";
				sql += ", '" + IIM_TPRT_CD + "'";
				sql += ", '" + IIM_TRTP_CD + "'";
				sql += ", '" + IIM_TRLT_CD + "'";
				sql += ", '" + IIM_TRNM_CD + "'";
				sql += ", '" + IIM_TXRAY_YN + "'";
				sql += ", '" + IIM_TBIO_YN + "'";
				sql += ", '" + IIM_TSND_YN + "'";
				sql += ", '" + IIM_TETC_YN + "'";
				sql += ", '" + IIM_THPR_YN + "'";
				sql += ", '" + IIM_THPR1_CD + "'";
				sql += ", '" + IIM_THPR2_CD + "'";
				sql += ", '" + IIM_TEDT_YR + "'";
				sql += ", '" + IIM_MIN_VL + "'";
				sql += ", '" + IIM_MAX_VL + "'";
				sql += ", '" + IIM_DFLT_VL + "'";
				sql += ", '" + IIM_SANBO_KD + "'";
				sql += ", '" + IIM_SANBO_CD + "'";
				sql += ", '" + IIM_SANBO_CAL + "'";
				sql += ", '" + IIM_USE_YN + "'";
				sql += ", SYSDATE";
				sql += ", '" + IIM_INPT_ID + "'";
				sql += ", '" + IIM_ETONME_NM + "'";
				sql += ", '" + IIM_SPSORT_SQ + "'";
				sql += ")";

				argStmtExec.executeUpdate(sql);
			} else {

				sql = "UPDATE IT_ITEM SET ";
				sql += "  IIM_NITEM_CD = '" + IIM_NITEM_CD + "'";
				sql += ", IIM_KNME_NM = '" + IIM_KNME_NM + "'";
				sql += ", IIM_ENME_NM = '" + IIM_ENME_NM + "'";
				sql += ", IIM_CNME_NM = '" + IIM_CNME_NM + "'";
				sql += ", IIM_RNME_NM = '" + IIM_RNME_NM + "'";
				sql += ", IIM_JNME_NM = '" + IIM_JNME_NM + "'";
				sql += ", IIM_SNME_NM = '" + IIM_SNME_NM + "'";
				sql += ", IIM_OSCD_CD = '" + IIM_OSCD_CD + "'";
				sql += ", IIM_GBCD_CD = '" + IIM_GBCD_CD + "'";
				sql += ", IIM_SBCD_CD = '" + IIM_SBCD_CD + "'";
				sql += ", IIM_EXGN_CD = '" + IIM_EXGN_CD + "'";
				sql += ", IIM_RSLT_KD = '" + IIM_RSLT_KD + "'";
				sql += ", IIM_SORT_SQ = '" + IIM_SORT_SQ + "'";
				sql += ", IIM_BLPT_CD = '" + IIM_BLPT_CD + "'";
				sql += ", IIM_REJH_EX = '" + IIM_REJH_EX + "'";
				sql += ", IIM_OSSB_CD = '" + IIM_OSSB_CD + "'";
				sql += ", IIM_OSRL_CD = '" + IIM_OSRL_CD + "'";
				sql += ", IIM_ACAL_YN = '" + IIM_ACAL_YN + "'";
				sql += ", IIM_SAMP_CD = '" + IIM_SAMP_CD + "'";
				sql += ", IIM_CANCER_CD = '" + IIM_CANCER_CD + "'";
				sql += ", IIM_CNIT_CD = '" + IIM_CNIT_CD + "'";
				sql += ", IIM_SUTK_YN = '" + IIM_SUTK_YN + "'";
				sql += ", IIM_SUTK_CD = '" + IIM_SUTK_CD + "'";
				sql += ", IIM_PNUM_CD = '" + IIM_PNUM_CD + "'";
				sql += ", IIM_TUSE_YN = '" + IIM_TUSE_YN + "'";
				sql += ", IIM_TPRT_CD = '" + IIM_TPRT_CD + "'";
				sql += ", IIM_TRTP_CD = '" + IIM_TRTP_CD + "'";
				sql += ", IIM_TRLT_CD = '" + IIM_TRLT_CD + "'";
				sql += ", IIM_TRNM_CD = '" + IIM_TRNM_CD + "'";
				sql += ", IIM_TXRAY_YN = '" + IIM_TXRAY_YN + "'";
				sql += ", IIM_TBIO_YN = '" + IIM_TBIO_YN + "'";
				sql += ", IIM_TSND_YN = '" + IIM_TSND_YN + "'";
				sql += ", IIM_TETC_YN = '" + IIM_TETC_YN + "'";
				sql += ", IIM_THPR_YN = '" + IIM_THPR_YN + "'";
				sql += ", IIM_THPR1_CD = '" + IIM_THPR1_CD + "'";
				sql += ", IIM_THPR2_CD = '" + IIM_THPR2_CD + "'";
				sql += ", IIM_TEDT_YR = '" + IIM_TEDT_YR + "'";
				sql += ", IIM_MIN_VL = '" + IIM_MIN_VL + "'";
				sql += ", IIM_MAX_VL = '" + IIM_MAX_VL + "'";
				sql += ", IIM_DFLT_VL = '" + IIM_DFLT_VL + "'";
				sql += ", IIM_SANBO_KD = '" + IIM_SANBO_KD + "'";
				sql += ", IIM_SANBO_CD = '" + IIM_SANBO_CD + "'";
				sql += ", IIM_SANBO_CAL = '" + IIM_SANBO_CAL + "'";
				sql += ", IIM_USE_YN = '" + IIM_USE_YN + "'";
				sql += ", IIM_MODI_DTT = SYSDATE";
				sql += ", IIM_MODI_ID = '" + IIM_MODI_ID + "'";
				sql += ", IIM_ETONME_NM = '" + IIM_ETONME_NM + "'";
				sql += ", IIM_SPSORT_SQ = '" + IIM_SPSORT_SQ + "'";
				sql += " WHERE IIM_ITEM_CD = '" + IIM_ITEM_CD + "'";

				argStmtExec.executeUpdate(sql);
			}

		} catch (Exception e) {

			throw new FuncException(e.toString(), sql);
		}

		return sql;
	}
%>
