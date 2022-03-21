<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%!
	public String func_uCOMP_CNRT_PROF_TRNS_UP_Save_001(Statement argStmtExec, HashMap argHtMethod) throws Exception {

		String sql = "";
		String sql2 = "";
		String sql_disp = "";

		try {

			String MNGT_YR = (String) argHtMethod.get("MNGT_YR");
			String CNRT_SQ = (String) argHtMethod.get("CNRT_SQ");
			String PROF_SQ = (String) argHtMethod.get("PROF_SQ");
			String SORT_SQ = (String) argHtMethod.get("SORT_SQ");
			String USER_ID = (String) argHtMethod.get("USER_ID");
			String SCOMP_CD = (String) argHtMethod.get("SCOMP_CD");
			String SMNGT_YR = (String) argHtMethod.get("SMNGT_YR");
			String SCNRT_SQ = (String) argHtMethod.get("SCNRT_SQ");
			String SPROF_SQ = (String) argHtMethod.get("SPROF_SQ");

			//
			if(MNGT_YR == null) { MNGT_YR = ""; }
			if(CNRT_SQ == null) { CNRT_SQ = ""; }
			if(PROF_SQ == null) { PROF_SQ = ""; }
			if(SORT_SQ == null) { SORT_SQ = ""; }
			if(USER_ID == null) { USER_ID = ""; }
			if(SCOMP_CD == null) { SCOMP_CD = ""; }
			if(SMNGT_YR == null) { SMNGT_YR = ""; }
			if(SCNRT_SQ == null) { SCNRT_SQ = ""; }
			if(SPROF_SQ == null) { SPROF_SQ = ""; }

			//
			MNGT_YR = CTr.Replace(MNGT_YR, "'", "''");
			CNRT_SQ = CTr.Replace(CNRT_SQ, "'", "''");
			PROF_SQ = CTr.Replace(PROF_SQ, "'", "''");
			SORT_SQ = CTr.Replace(SORT_SQ, "'", "''");
			USER_ID = CTr.Replace(USER_ID, "'", "''");
			SCOMP_CD = CTr.Replace(SCOMP_CD, "'", "''");
			SMNGT_YR = CTr.Replace(SMNGT_YR, "'", "''");
			SCNRT_SQ = CTr.Replace(SCNRT_SQ, "'", "''");
			SPROF_SQ = CTr.Replace(SPROF_SQ, "'", "''");

			sql = "INSERT INTO ET_COMP_CNRT_PROF (ECP_COMP_CD ,ECP_MNGT_YR ,ECP_CNRT_SQ ,ECP_PROF_SQ ,ECP_SORT_SQ ,ECP_EXAM_CD ,ECP_PROF_NM ,ECP_PROF_TL ,ECP_SEX_CD ,ECP_CALC_CD, ECP_BIND_PR, ECP_OPTN_PR, ECP_CALC_PR, ECP_CALC_RT ,ECP_ITKD_CD ,ECP_CNRT_PR ,ECP_HTSB_YN ,ECP_SPSB_YN ,ECP_CVSB_YN ,ECP_SPPR_CD ,ECP_CVPR_CD ,ECP_HTPR_CD ,ECP_CNCL_CD ,ECP_PYER_CD ,ECP_SPRT_PR ,ECP_COMP_PR ,ECP_PERS_PR ,ECP_CMPY_CD ,ECP_PRPY_CD ,ECP_OPTN_YN ,ECP_OPTN_CNT ,ECP_PROF_TX ,ECP_USE_YN ,ECP_INPT_ID ,ECP_INPT_DTT, ECP_TRNS_ID, ECP_TRNS_DTT, ECP_PROF_ENM)";
			sql += " SELECT ";
			sql += "  ECP_COMP_CD";
			sql += ", '" + MNGT_YR + "'";
			sql += ", '" + CNRT_SQ + "'";
			sql += ", '" + PROF_SQ + "'";
			sql += ", '" + SORT_SQ + "'";
			sql += ", ECP_EXAM_CD";
			sql += ", ECP_PROF_NM";
			sql += ", ECP_PROF_TL";
			sql += ", ECP_SEX_CD";
			sql += ", ECP_CALC_CD";
			sql += ", ECP_BIND_PR";
			sql += ", ECP_OPTN_PR";
			sql += ", ECP_CALC_PR";
			sql += ", ECP_CALC_RT";
			sql += ", ECP_ITKD_CD";
			sql += ", ECP_CNRT_PR";
			sql += ", ECP_HTSB_YN";
			sql += ", ECP_SPSB_YN";
			sql += ", ECP_CVSB_YN";
			sql += ", ECP_SPPR_CD";
			sql += ", ECP_CVPR_CD";
			sql += ", ECP_HTPR_CD";
			sql += ", ECP_CNCL_CD";
			sql += ", ECP_PYER_CD";
			sql += ", ECP_SPRT_PR";
			sql += ", ECP_COMP_PR";
			sql += ", ECP_PERS_PR";
			sql += ", ECP_CMPY_CD";
			sql += ", ECP_PRPY_CD";
			sql += ", ECP_OPTN_YN";
			sql += ", ECP_OPTN_CNT";
			sql += ", ECP_PROF_TX";
			sql += ", 'Y'";
			sql += ", '" + USER_ID + "'";
			sql += ", SYSDATE";
			sql += ", '" + USER_ID + "'";
			sql += ", SYSDATE";
			sql += ", ECP_PROF_ENM";
			sql += " FROM ET_COMP_CNRT_PROF";
			sql += " WHERE ECP_COMP_CD = '" + SCOMP_CD  + "'";
			sql += " AND ECP_MNGT_YR = '" + SMNGT_YR  + "'";
			sql += " AND ECP_CNRT_SQ = '" + SCNRT_SQ  + "'";
			sql += " AND ECP_PROF_SQ = '" + SPROF_SQ + "'";

			argStmtExec.executeUpdate(sql);

		} catch (Exception e) {

			throw new FuncException(e.toString(), sql);
		}

		return sql;
	}
%>
