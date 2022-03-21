<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%!
	public String func_uCOMP_CNRT_PROF_APPLY_UP_Save_001(Statement argStmtExec, HashMap argHtMethod) throws Exception {

		String sql = "";
		String sql2 = "";
		String sql_disp = "";

		try {

			String SMODE = (String) argHtMethod.get("SMODE");
			String COMP_CD = (String) argHtMethod.get("COMP_CD");
			String MNGT_YR = (String) argHtMethod.get("MNGT_YR");
			String CNRT_SQ = (String) argHtMethod.get("CNRT_SQ");
			String PROF_SQ = (String) argHtMethod.get("PROF_SQ");
			String SORT_SQ = (String) argHtMethod.get("SORT_SQ");
			String EXAM_CD = (String) argHtMethod.get("EXAM_CD");
			String PROF_NM = (String) argHtMethod.get("PROF_NM");
			String PROF_TL = (String) argHtMethod.get("PROF_TL");
			String SEX_CD = (String) argHtMethod.get("SEX_CD");
			String ITEM_LT = (String) argHtMethod.get("ITEM_LT");
			String CALC_CD = (String) argHtMethod.get("CALC_CD");
			String ITKD_CD = (String) argHtMethod.get("ITKD_CD");
			String CNRT_PR = (String) argHtMethod.get("CNRT_PR");
			String BIND_PR = (String) argHtMethod.get("BIND_PR");
			String OPTN_PR = (String) argHtMethod.get("OPTN_PR");
			String CALC_PR = (String) argHtMethod.get("CALC_PR");
			String CALC_RT = (String) argHtMethod.get("CALC_RT");
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
			String SPRT_PR = (String) argHtMethod.get("SPRT_PR");
			String COMP_PR = (String) argHtMethod.get("COMP_PR");
			String PERS_PR = (String) argHtMethod.get("PERS_PR");
			String CMPY_CD = (String) argHtMethod.get("CMPY_CD");
			String PRPY_CD = (String) argHtMethod.get("PRPY_CD");
			String OPTN_YN = (String) argHtMethod.get("OPTN_YN");
			String OPTN_CNT = (String) argHtMethod.get("OPTN_CNT");
			String PROF_TX = (String) argHtMethod.get("PROF_TX");
			String USE_YN = (String) argHtMethod.get("USE_YN");
			String USER_ID = (String) argHtMethod.get("USER_ID");
			String PROF_ENM = (String) argHtMethod.get("PROF_ENM");

			//
			if(SMODE == null) { SMODE = ""; }
			if(COMP_CD == null) { COMP_CD = ""; }
			if(MNGT_YR == null) { MNGT_YR = ""; }
			if(CNRT_SQ == null) { CNRT_SQ = ""; }
			if(PROF_SQ == null) { PROF_SQ = ""; }
			if(SORT_SQ == null) { SORT_SQ = ""; }
			if(EXAM_CD == null) { EXAM_CD = ""; }
			if(PROF_NM == null) { PROF_NM = ""; }
			if(PROF_TL == null) { PROF_TL = ""; }
			if(SEX_CD == null) { SEX_CD = ""; }
			if(ITEM_LT == null) { ITEM_LT = ""; }
			if(CALC_CD == null) { CALC_CD = ""; }
			if(ITKD_CD == null) { ITKD_CD = ""; }
			if(CNRT_PR == null) { CNRT_PR = ""; }
			if(BIND_PR == null) { BIND_PR = ""; }
			if(OPTN_PR == null) { OPTN_PR = ""; }
			if(CALC_PR == null) { CALC_PR = ""; }
			if(CALC_RT == null) { CALC_RT = ""; }
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
			if(SPRT_PR == null) { SPRT_PR = ""; }
			if(COMP_PR == null) { COMP_PR = ""; }
			if(PERS_PR == null) { PERS_PR = ""; }
			if(CMPY_CD == null) { CMPY_CD = ""; }
			if(PRPY_CD == null) { PRPY_CD = ""; }
			if(OPTN_YN == null) { OPTN_YN = ""; }
			if(OPTN_CNT == null) { OPTN_CNT = ""; }
			if(PROF_TX == null) { PROF_TX = ""; }
			if(USE_YN == null) { USE_YN = ""; }
			if(USER_ID == null) { USER_ID = ""; }
			if(PROF_ENM == null) { PROF_ENM = ""; }

			//
			SMODE = CTr.Replace(SMODE, "'", "''");
			COMP_CD = CTr.Replace(COMP_CD, "'", "''");
			MNGT_YR = CTr.Replace(MNGT_YR, "'", "''");
			CNRT_SQ = CTr.Replace(CNRT_SQ, "'", "''");
			PROF_SQ = CTr.Replace(PROF_SQ, "'", "''");
			SORT_SQ = CTr.Replace(SORT_SQ, "'", "''");
			EXAM_CD = CTr.Replace(EXAM_CD, "'", "''");
			PROF_NM = CTr.Replace(PROF_NM, "'", "''");
			PROF_TL = CTr.Replace(PROF_TL, "'", "''");
			SEX_CD = CTr.Replace(SEX_CD, "'", "''");
			ITEM_LT = CTr.Replace(ITEM_LT, "'", "''");
			CALC_CD = CTr.Replace(CALC_CD, "'", "''");
			ITKD_CD = CTr.Replace(ITKD_CD, "'", "''");
			CNRT_PR = CTr.Replace(CNRT_PR, "'", "''");
			BIND_PR = CTr.Replace(BIND_PR, "'", "''");
			OPTN_PR = CTr.Replace(OPTN_PR, "'", "''");
			CALC_PR = CTr.Replace(CALC_PR, "'", "''");
			CALC_RT = CTr.Replace(CALC_RT, "'", "''");
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
			SPRT_PR = CTr.Replace(SPRT_PR, "'", "''");
			COMP_PR = CTr.Replace(COMP_PR, "'", "''");
			PERS_PR = CTr.Replace(PERS_PR, "'", "''");
			CMPY_CD = CTr.Replace(CMPY_CD, "'", "''");
			PRPY_CD = CTr.Replace(PRPY_CD, "'", "''");
			OPTN_YN = CTr.Replace(OPTN_YN, "'", "''");
			OPTN_CNT = CTr.Replace(OPTN_CNT, "'", "''");
			PROF_TX = CTr.Replace(PROF_TX, "'", "''");
			USE_YN = CTr.Replace(USE_YN, "'", "''");
			USER_ID = CTr.Replace(USER_ID, "'", "''");
			PROF_ENM = CTr.Replace(PROF_ENM, "'", "''");

			if(SMODE.equals("INSERT")){
				sql = "INSERT INTO ET_COMP_CNRT_PROF (ECP_COMP_CD ,ECP_MNGT_YR ,ECP_CNRT_SQ ,ECP_PROF_SQ ,ECP_SORT_SQ ,ECP_EXAM_CD ,ECP_PROF_NM ,ECP_PROF_TL ,ECP_SEX_CD ,ECP_ITEM_LT ,ECP_CALC_CD ,ECP_ITKD_CD ,ECP_CNRT_PR ,ECP_BIND_PR ,ECP_OPTN_PR ,ECP_CALC_PR ,ECP_CALC_RT ,ECP_HTSB_YN ,ECP_SPSB_YN ,ECP_CVSB_YN ,ECP_ETSB_YN ,ECP_EMSB_YN ,ECP_HTPR_CD ,ECP_SPPR_CD ,ECP_CVPR_CD ,ECP_ETPR_CD ,ECP_EMPR_CD ,ECP_CNCL_CD ,ECP_PYER_CD ,ECP_SPRT_PR ,ECP_COMP_PR ,ECP_PERS_PR ,ECP_CMPY_CD ,ECP_PRPY_CD ,ECP_OPTN_YN ,ECP_OPTN_CNT ,ECP_PROF_TX ,ECP_USE_YN ,ECP_INPT_ID ,ECP_INPT_DTT, ECP_PROF_ENM) VALUES (";
				sql += "  '" + COMP_CD + "'";
				sql += ", '" + MNGT_YR + "'";
				sql += ", '" + CNRT_SQ + "'";
				sql += ", '" + PROF_SQ + "'";
				sql += ", '" + SORT_SQ + "'";
				sql += ", '" + EXAM_CD + "'";
				sql += ", '" + PROF_NM + "'";
				sql += ", '" + PROF_TL + "'";
				sql += ", '" + SEX_CD + "'";
				sql += ", '" + ITEM_LT + "'";
				sql += ", '" + CALC_CD + "'";
				sql += ", '" + ITKD_CD + "'";
				sql += ", '" + CNRT_PR + "'";
				sql += ", '" + BIND_PR + "'";
				sql += ", '" + OPTN_PR + "'";
				sql += ", '" + CALC_PR + "'";
				sql += ", '" + CALC_RT + "'";
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
				sql += ", '" + SPRT_PR + "'";
				sql += ", '" + COMP_PR + "'";
				sql += ", '" + PERS_PR + "'";
				sql += ", '" + CMPY_CD + "'";
				sql += ", '" + PRPY_CD + "'";
				sql += ", '" + OPTN_YN + "'";
				sql += ", '" + OPTN_CNT + "'";
				sql += ", '" + PROF_TX + "'";
				sql += ", '" + USE_YN + "'";
				sql += ", '" + USER_ID + "'";
				sql += ", SYSDATE";
				sql += ", '" + PROF_ENM + "'";
				sql += ")";

				argStmtExec.executeUpdate(sql);
			}
			else{
				sql = "UPDATE ET_COMP_CNRT_PROF SET ";
				sql += "  ECP_EXAM_CD = '" + EXAM_CD + "'";
				sql += ", ECP_PROF_NM = '" + PROF_NM + "'";
				sql += ", ECP_PROF_TL = '" + PROF_TL + "'";
				sql += ", ECP_SEX_CD = '" + SEX_CD + "'";
				sql += ", ECP_ITEM_LT = '" + ITEM_LT + "'";
				sql += ", ECP_CALC_CD = '" + CALC_CD + "'";
				sql += ", ECP_ITKD_CD = '" + ITKD_CD + "'";
				sql += ", ECP_CNRT_PR = '" + CNRT_PR + "'";
				sql += ", ECP_BIND_PR = '" + BIND_PR + "'";
				sql += ", ECP_OPTN_PR = '" + OPTN_PR + "'";
				sql += ", ECP_CALC_PR = '" + CALC_PR + "'";
				sql += ", ECP_CALC_RT = '" + CALC_RT + "'";
				sql += ", ECP_HTSB_YN = '" + HTSB_YN + "'";
				sql += ", ECP_SPSB_YN = '" + SPSB_YN + "'";
				sql += ", ECP_CVSB_YN = '" + CVSB_YN + "'";
				sql += ", ECP_ETSB_YN = '" + ETSB_YN + "'";
				sql += ", ECP_EMSB_YN = '" + EMSB_YN + "'";
				sql += ", ECP_HTPR_CD = '" + HTPR_CD + "'";
				sql += ", ECP_SPPR_CD = '" + SPPR_CD + "'";
				sql += ", ECP_CVPR_CD = '" + CVPR_CD + "'";
				sql += ", ECP_ETPR_CD = '" + ETPR_CD + "'";
				sql += ", ECP_EMPR_CD = '" + EMPR_CD + "'";
				sql += ", ECP_CNCL_CD = '" + CNCL_CD + "'";
				sql += ", ECP_PYER_CD = '" + PYER_CD + "'";
				sql += ", ECP_SPRT_PR = '" + SPRT_PR + "'";
				sql += ", ECP_COMP_PR = '" + COMP_PR + "'";
				sql += ", ECP_PERS_PR = '" + PERS_PR + "'";
				sql += ", ECP_CMPY_CD = '" + CMPY_CD + "'";
				sql += ", ECP_PRPY_CD = '" + PRPY_CD + "'";
				sql += ", ECP_OPTN_YN = '" + OPTN_YN + "'";
				sql += ", ECP_OPTN_CNT = '" + OPTN_CNT + "'";
				sql += ", ECP_PROF_TX = '" + PROF_TX + "'";
				sql += ", ECP_USE_YN = '" + USE_YN + "'";
				sql += ", ECP_MODI_ID = '" + USER_ID + "'";
				sql += ", ECP_MODI_DTT = SYSDATE";
				sql += ", ECP_PROF_ENM = '" + PROF_ENM + "'";
				sql += " WHERE ECP_COMP_CD = '" + COMP_CD + "'";
				sql += " AND ECP_MNGT_YR = '" + MNGT_YR + "'";
				sql += " AND ECP_CNRT_SQ = '" + CNRT_SQ + "'";
				sql += " AND ECP_PROF_SQ = '" + PROF_SQ + "'";

				argStmtExec.executeUpdate(sql);
			}
		} catch (Exception e) {

			throw new FuncException(e.toString(), sql);
		}

		return sql;
	}
%>
