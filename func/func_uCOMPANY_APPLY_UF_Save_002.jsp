<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%!
	public String func_uCOMPANY_APPLY_UF_Save_002(Statement argStmtExec, HashMap argHtMethod) throws Exception {

		String sql = "";
		String sql2 = "";
		String sql_disp = "";

		try {

			String USER_ID = (String) argHtMethod.get("USER_ID");
			String COMP_CD = (String) argHtMethod.get("COMP_CD");
			String APLY_DT = (String) argHtMethod.get("APLY_DT");

			//
			if(USER_ID == null) { USER_ID = ""; }
			if(COMP_CD == null) { COMP_CD = ""; }
			if(APLY_DT == null) { APLY_DT = ""; }

			//
			USER_ID = CTr.Replace(USER_ID, "'", "''");
			COMP_CD = CTr.Replace(COMP_CD, "'", "''");
			APLY_DT = CTr.Replace(APLY_DT, "'", "''");

			sql = "INSERT INTO IT_COMPANY_REC ( ";
			sql += " ICY_COMP_CD, ICY_APLY_DT, ICY_COMP_NO, ICY_COMP_SQ, ICY_COKD_CD, ";
			sql += " ICY_COMP_NM, ICY_INDO_NO, ICY_INDD_NO, ICY_INDD_SQ, ICY_CORE_NO, ";
			sql += " ICY_COTK_CD, ICY_SUTK_YN, ICY_DEPT_CD, ICY_TKGJ_CD, ICY_TKJJ_CD, ";
			sql += " ICY_PRES_NM, ICY_LABO_CD, ICY_JIDO_CD, ICY_ZIPKD_CD, ICY_ZIP_CD, ";
			sql += " ICY_ZIP_SQ, ICY_ZIP_AR, ICY_ROAD_AR, ICY_TEL_NO, ICY_FAX_NO, ";
			sql += " ICY_JMOB_NO, ICY_JEMAIL, ICY_JTEL_NO, ICY_J_NM, ICY_TMOB_NO, ";
			sql += " ICY_TEMAIL, ICY_TTEL_NO, ICY_T_NM, ICY_CBIR_DT, ICY_LUNR_KD, ";
			sql += " ICY_SALE_ID, ICY_SSUB_ID, ICY_PYER_CD, ICY_SPRT_PR, ICY_CMPY_CD, ";
			sql += " ICY_PRPY_CD, ICY_TKCG_CD, ICY_TKDE_CD, ICY_TBAS_CD, ICY_DISC_RT, ";
			sql += " ICY_CLAS_CD, ICY_FAMI_CD, ICY_COMP_TX, ICY_PAST_CD, ICY_STRT_YR, ";
			sql += " ICY_PROD_NM, ICY_SMPL_YN, ICY_USE_YN, ICY_NUSE_ID, ICY_NUSE_DTT, ";
			sql += " ICY_NUSE_TX, ICY_INPT_ID, ICY_INPT_DTT, ICY_TKGJ_YR, ICY_FREE_YN, ";
			sql += " ICY_SLNS_DELAY, ICY_PRNT_ZIP_CD, ICY_PRNT_ZIP_AR, ICY_PRNT_ROAD_AR ";
			sql += " ) ";
			sql += " SELECT ";
			sql += "  ICY_COMP_CD";
			sql += ", ICY_APLY_DT";
			sql += ", ICY_COMP_NO";
			sql += ", ICY_COMP_SQ";
			sql += ", ICY_COKD_CD";
			sql += ", ICY_COMP_NM";
			sql += ", ICY_INDO_NO";
			sql += ", ICY_INDD_NO";
			sql += ", ICY_INDD_SQ";
			sql += ", ICY_CORE_NO";
			sql += ", ICY_COTK_CD";
			sql += ", ICY_SUTK_YN";
			sql += ", ICY_DEPT_CD";
			sql += ", ICY_TKGJ_CD";
			sql += ", ICY_TKJJ_CD";
			sql += ", ICY_PRES_NM";
			sql += ", ICY_LABO_CD";
			sql += ", ICY_JIDO_CD";
			sql += ", ICY_ZIPKD_CD";
			sql += ", ICY_ZIP_CD";
			sql += ", ICY_ZIP_SQ";
			sql += ", ICY_ZIP_AR";
			sql += ", ICY_ROAD_AR";
			sql += ", ICY_TEL_NO";
			sql += ", ICY_FAX_NO";
			sql += ", ICY_JMOB_NO";
			sql += ", ICY_JEMAIL";
			sql += ", ICY_JTEL_NO";
			sql += ", ICY_J_NM";
			sql += ", ICY_TMOB_NO";
			sql += ", ICY_TEMAIL";
			sql += ", ICY_TTEL_NO";
			sql += ", ICY_T_NM";
			sql += ", ICY_CBIR_DT";
			sql += ", ICY_LUNR_KD";
			sql += ", ICY_SALE_ID";
			sql += ", ICY_SSUB_ID";
			sql += ", ICY_PYER_CD";
			sql += ", ICY_SPRT_PR";
			sql += ", ICY_CMPY_CD";
			sql += ", ICY_PRPY_CD";
			sql += ", ICY_TKCG_CD";
			sql += ", ICY_TKDE_CD";
			sql += ", ICY_TBAS_CD";
			sql += ", ICY_DISC_RT";
			sql += ", ICY_CLAS_CD";
			sql += ", ICY_FAMI_CD";
			sql += ", ICY_COMP_TX";
			sql += ", ICY_PAST_CD";
			sql += ", ICY_STRT_YR";
			sql += ", ICY_PROD_NM";
			sql += ", ICY_SMPL_YN";
			sql += ", ICY_USE_YN";
			sql += ", ICY_NUSE_ID";
			sql += ", ICY_NUSE_DTT";
			sql += ", ICY_NUSE_TX";
			sql += ", '" + USER_ID + "'";
			sql += ", SYSDATE";
			sql += ", ICY_TKGJ_YR";
			sql += ", ICY_FREE_YN ";
			sql += ", ICY_SLNS_DELAY";
			sql += ", ICY_PRNT_ZIP_CD";
			sql += ", ICY_PRNT_ZIP_AR";
			sql += ", ICY_PRNT_ROAD_AR";
			sql += " FROM IT_COMPANY";
			sql += " WHERE ICY_COMP_CD = '" + COMP_CD  + "'";
			sql += " AND ICY_APLY_DT = '" + APLY_DT + "'";

			argStmtExec.executeUpdate(sql);

		} catch (Exception e) {

			throw new FuncException(e.toString(), sql);
		}

		return sql;
	}
%>
