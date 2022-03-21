<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%!
	public String func_uBT_ESTI_PROF_APPLY_UP_Save_001(Statement argStmtExec, HashMap argHtMethod) throws Exception {

		String sql = "";
		String sql2 = "";
		String sql_disp = "";

		try {

			String CHKBOXBEP_USE_YN = (String) argHtMethod.get("CHKBOXBEP_USE_YN");
			String MNGT_YR = (String) argHtMethod.get("MNGT_YR");
			String ESTI_CD = (String) argHtMethod.get("ESTI_CD");
			String PROF_SQ = (String) argHtMethod.get("PROF_SQ");
			String EXAM_CD = (String) argHtMethod.get("EXAM_CD");
			String PROF_NM = (String) argHtMethod.get("PROF_NM");
			String PROF_TL = (String) argHtMethod.get("PROF_TL");
			String SEX_CD = (String) argHtMethod.get("SEX_CD");
			String HTSB_YN = (String) argHtMethod.get("HTSB_YN");
			String SPSB_YN = (String) argHtMethod.get("SPSB_YN");
			String CVSB_YN = (String) argHtMethod.get("CVSB_YN");
			String ETSB_YN = (String) argHtMethod.get("ETSB_YN");
			String EMSB_YN = (String) argHtMethod.get("EMSB_YN");
			String HTPR_CD = (String) argHtMethod.get("HTPR_CD");
			String SPPR_CD = (String) argHtMethod.get("SPPR_CD");
			String CVPR_CD = (String) argHtMethod.get("CVPR_CD");
			String ETPR_CD = (String) argHtMethod.get("ETPR_CD");
			String EMPR_CD = (String) argHtMethod.get("EMPR_CD");
			String CNCL_CD = (String) argHtMethod.get("CNCL_CD");
			String PYER_CD = (String) argHtMethod.get("PYER_CD");
			String COMP_PR = (String) argHtMethod.get("COMP_PR");
			String PERS_PR = (String) argHtMethod.get("PERS_PR");
			String CMPY_CD = (String) argHtMethod.get("CMPY_CD");
			String PRPY_CD = (String) argHtMethod.get("PRPY_CD");
			String OPTN_YN = (String) argHtMethod.get("OPTN_YN");
			String OPTN_CNT = (String) argHtMethod.get("OPTN_CNT");
			String TOTL_PR = (String) argHtMethod.get("TOTL_PR");
			String PROF_PR = (String) argHtMethod.get("PROF_PR");
			String BIND_PR = (String) argHtMethod.get("BIND_PR");
			String OPTN_PR = (String) argHtMethod.get("OPTN_PR");
			String PROF_RT = (String) argHtMethod.get("PROF_RT");
			String CUST_CNT = (String) argHtMethod.get("CUST_CNT");
			String SALE_PR = (String) argHtMethod.get("SALE_PR");
			String PROF_TX = (String) argHtMethod.get("PROF_TX");
			String USE_YN = (String) argHtMethod.get("USE_YN");
			String INPT_ID = (String) argHtMethod.get("INPT_ID");
			String NUSE_ID = (String) argHtMethod.get("NUSE_ID");

			//
			if(CHKBOXBEP_USE_YN == null) { CHKBOXBEP_USE_YN = ""; }
			if(MNGT_YR == null) { MNGT_YR = ""; }
			if(ESTI_CD == null) { ESTI_CD = ""; }
			if(PROF_SQ == null) { PROF_SQ = ""; }
			if(EXAM_CD == null) { EXAM_CD = ""; }
			if(PROF_NM == null) { PROF_NM = ""; }
			if(PROF_TL == null) { PROF_TL = ""; }
			if(SEX_CD == null) { SEX_CD = ""; }
			if(HTSB_YN == null) { HTSB_YN = ""; }
			if(SPSB_YN == null) { SPSB_YN = ""; }
			if(CVSB_YN == null) { CVSB_YN = ""; }
			if(ETSB_YN == null) { ETSB_YN = ""; }
			if(EMSB_YN == null) { EMSB_YN = ""; }
			if(HTPR_CD == null) { HTPR_CD = ""; }
			if(SPPR_CD == null) { SPPR_CD = ""; }
			if(CVPR_CD == null) { CVPR_CD = ""; }
			if(ETPR_CD == null) { ETPR_CD = ""; }
			if(EMPR_CD == null) { EMPR_CD = ""; }
			if(CNCL_CD == null) { CNCL_CD = ""; }
			if(PYER_CD == null) { PYER_CD = ""; }
			if(COMP_PR == null) { COMP_PR = ""; }
			if(PERS_PR == null) { PERS_PR = ""; }
			if(CMPY_CD == null) { CMPY_CD = ""; }
			if(PRPY_CD == null) { PRPY_CD = ""; }
			if(OPTN_YN == null) { OPTN_YN = ""; }
			if(OPTN_CNT == null) { OPTN_CNT = ""; }
			if(TOTL_PR == null) { TOTL_PR = ""; }
			if(PROF_PR == null) { PROF_PR = ""; }
			if(BIND_PR == null) { BIND_PR = ""; }
			if(OPTN_PR == null) { OPTN_PR = ""; }
			if(PROF_RT == null) { PROF_RT = ""; }
			if(CUST_CNT == null) { CUST_CNT = ""; }
			if(SALE_PR == null) { SALE_PR = ""; }
			if(PROF_TX == null) { PROF_TX = ""; }
			if(USE_YN == null) { USE_YN = ""; }
			if(INPT_ID == null) { INPT_ID = ""; }
			if(NUSE_ID == null) { NUSE_ID = ""; }

			//
			CHKBOXBEP_USE_YN = CTr.Replace(CHKBOXBEP_USE_YN, "'", "''");
			MNGT_YR = CTr.Replace(MNGT_YR, "'", "''");
			ESTI_CD = CTr.Replace(ESTI_CD, "'", "''");
			PROF_SQ = CTr.Replace(PROF_SQ, "'", "''");
			EXAM_CD = CTr.Replace(EXAM_CD, "'", "''");
			PROF_NM = CTr.Replace(PROF_NM, "'", "''");
			PROF_TL = CTr.Replace(PROF_TL, "'", "''");
			SEX_CD = CTr.Replace(SEX_CD, "'", "''");
			HTSB_YN = CTr.Replace(HTSB_YN, "'", "''");
			SPSB_YN = CTr.Replace(SPSB_YN, "'", "''");
			CVSB_YN = CTr.Replace(CVSB_YN, "'", "''");
			ETSB_YN = CTr.Replace(ETSB_YN, "'", "''");
			EMSB_YN = CTr.Replace(EMSB_YN, "'", "''");
			HTPR_CD = CTr.Replace(HTPR_CD, "'", "''");
			SPPR_CD = CTr.Replace(SPPR_CD, "'", "''");
			CVPR_CD = CTr.Replace(CVPR_CD, "'", "''");
			ETPR_CD = CTr.Replace(ETPR_CD, "'", "''");
			EMPR_CD = CTr.Replace(EMPR_CD, "'", "''");
			CNCL_CD = CTr.Replace(CNCL_CD, "'", "''");
			PYER_CD = CTr.Replace(PYER_CD, "'", "''");
			COMP_PR = CTr.Replace(COMP_PR, "'", "''");
			PERS_PR = CTr.Replace(PERS_PR, "'", "''");
			CMPY_CD = CTr.Replace(CMPY_CD, "'", "''");
			PRPY_CD = CTr.Replace(PRPY_CD, "'", "''");
			OPTN_YN = CTr.Replace(OPTN_YN, "'", "''");
			OPTN_CNT = CTr.Replace(OPTN_CNT, "'", "''");
			TOTL_PR = CTr.Replace(TOTL_PR, "'", "''");
			PROF_PR = CTr.Replace(PROF_PR, "'", "''");
			BIND_PR = CTr.Replace(BIND_PR, "'", "''");
			OPTN_PR = CTr.Replace(OPTN_PR, "'", "''");
			PROF_RT = CTr.Replace(PROF_RT, "'", "''");
			CUST_CNT = CTr.Replace(CUST_CNT, "'", "''");
			SALE_PR = CTr.Replace(SALE_PR, "'", "''");
			PROF_TX = CTr.Replace(PROF_TX, "'", "''");
			USE_YN = CTr.Replace(USE_YN, "'", "''");
			INPT_ID = CTr.Replace(INPT_ID, "'", "''");
			NUSE_ID = CTr.Replace(NUSE_ID, "'", "''");

			if(CHKBOXBEP_USE_YN.equals("Y")) {
				sql = "INSERT INTO BT_ESTI_PROF (BEP_MNGT_YR,BEP_ESTI_CD,BEP_PROF_SQ,BEP_EXAM_CD,BEP_PROF_NM,BEP_PROF_TL ,BEP_SEX_CD,BEP_HTSB_YN,BEP_SPSB_YN,BEP_CVSB_YN,BEP_ETSB_YN,BEP_EMSB_YN,BEP_HTPR_CD ,BEP_SPPR_CD,BEP_CVPR_CD,BEP_ETPR_CD,BEP_EMPR_CD,BEP_CNCL_CD,BEP_PYER_CD,BEP_COMP_PR ,BEP_PERS_PR,BEP_CMPY_CD,BEP_PRPY_CD,BEP_OPTN_YN,BEP_OPTN_CNT,BEP_TOTL_PR ,BEP_PROF_PR,BEP_BIND_PR,BEP_OPTN_PR,BEP_PROF_RT,BEP_CUST_CNT,BEP_SALE_PR,BEP_PROF_TX,BEP_USE_YN ,BEP_INPT_ID,BEP_INPT_DTT) VALUES (";
				sql += "  '" + MNGT_YR + "'";
				sql += ", '" + ESTI_CD + "'";
				sql += ", '" + PROF_SQ + "'";
				sql += ", '" + EXAM_CD + "'";
				sql += ", '" + PROF_NM + "'";
				sql += ", '" + PROF_TL + "'";
				sql += ", '" + SEX_CD + "'";
				sql += ", '" + HTSB_YN + "'";
				sql += ", '" + SPSB_YN + "'";
				sql += ", '" + CVSB_YN + "'";
				sql += ", '" + ETSB_YN + "'";
				sql += ", '" + EMSB_YN + "'";
				sql += ", '" + HTPR_CD + "'";
				sql += ", '" + SPPR_CD + "'";
				sql += ", '" + CVPR_CD + "'";
				sql += ", '" + ETPR_CD + "'";
				sql += ", '" + EMPR_CD + "'";
				sql += ", '" + CNCL_CD + "'";
				sql += ", '" + PYER_CD + "'";
				sql += ", '" + COMP_PR + "'";
				sql += ", '" + PERS_PR + "'";
				sql += ", '" + CMPY_CD + "'";
				sql += ", '" + PRPY_CD + "'";
				sql += ", '" + OPTN_YN + "'";
				sql += ", '" + OPTN_CNT + "'";
				sql += ", '" + TOTL_PR + "'";
				sql += ", '" + PROF_PR + "'";
				sql += ", '" + BIND_PR + "'";
				sql += ", '" + OPTN_PR + "'";
				sql += ", '" + PROF_RT + "'";
				sql += ", '" + CUST_CNT + "'";
				sql += ", '" + SALE_PR + "'";
				sql += ", '" + PROF_TX + "'";
				sql += ", '" + USE_YN + "'";
				sql += ", '" + INPT_ID + "'";
				sql += ", SYSDATE";
				sql += ")";

				argStmtExec.executeUpdate(sql);
			} else {
				sql = "INSERT INTO BT_ESTI_PROF (BEP_MNGT_YR,BEP_ESTI_CD,BEP_PROF_SQ,BEP_EXAM_CD,BEP_PROF_NM,BEP_PROF_TL ,BEP_SEX_CD,BEP_HTSB_YN,BEP_SPSB_YN,BEP_CVSB_YN,BEP_ETSB_YN,BEP_EMSB_YN,BEP_HTPR_CD ,BEP_SPPR_CD,BEP_CVPR_CD,BEP_ETPR_CD,BEP_EMPR_CD,BEP_CNCL_CD,BEP_PYER_CD,BEP_COMP_PR ,BEP_PERS_PR,BEP_CMPY_CD,BEP_PRPY_CD,BEP_OPTN_YN,BEP_OPTN_CNT,BEP_TOTL_PR ,BEP_PROF_PR,BEP_BIND_PR,BEP_OPTN_PR,BEP_PROF_RT,BEP_CUST_CNT,BEP_SALE_PR,BEP_PROF_TX,BEP_USE_YN ,BEP_NUSE_ID,BEP_NUSE_DTT,BEP_INPT_ID,BEP_INPT_DTT) VALUES (";
				sql += "  '" + MNGT_YR + "'";
				sql += ", '" + ESTI_CD + "'";
				sql += ", '" + PROF_SQ + "'";
				sql += ", '" + EXAM_CD + "'";
				sql += ", '" + PROF_NM + "'";
				sql += ", '" + PROF_TL + "'";
				sql += ", '" + SEX_CD + "'";
				sql += ", '" + HTSB_YN + "'";
				sql += ", '" + SPSB_YN + "'";
				sql += ", '" + CVSB_YN + "'";
				sql += ", '" + ETSB_YN + "'";
				sql += ", '" + EMSB_YN + "'";
				sql += ", '" + HTPR_CD + "'";
				sql += ", '" + SPPR_CD + "'";
				sql += ", '" + CVPR_CD + "'";
				sql += ", '" + ETPR_CD + "'";
				sql += ", '" + EMPR_CD + "'";
				sql += ", '" + CNCL_CD + "'";
				sql += ", '" + PYER_CD + "'";
				sql += ", '" + COMP_PR + "'";
				sql += ", '" + PERS_PR + "'";
				sql += ", '" + CMPY_CD + "'";
				sql += ", '" + PRPY_CD + "'";
				sql += ", '" + OPTN_YN + "'";
				sql += ", '" + OPTN_CNT + "'";
				sql += ", '" + TOTL_PR + "'";
				sql += ", '" + PROF_PR + "'";
				sql += ", '" + BIND_PR + "'";
				sql += ", '" + OPTN_PR + "'";
				sql += ", '" + PROF_RT + "'";
				sql += ", '" + CUST_CNT + "'";
				sql += ", '" + SALE_PR + "'";
				sql += ", '" + PROF_TX + "'";
				sql += ", '" + USE_YN + "'";
				sql += ", '" + NUSE_ID + "'";
				sql += ", SYSDATE";
				sql += ", '" + INPT_ID + "'";
				sql += ", SYSDATE";
				sql += ")";

				argStmtExec.executeUpdate(sql);
			}
		} catch (Exception e) {

			throw new FuncException(e.toString(), sql);
		}

		return sql;
	}
%>
