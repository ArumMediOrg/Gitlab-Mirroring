<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%!
	public String func_uCOMPANY_APPLY_UF_Save_001(Statement argStmtExec, HashMap argHtMethod) throws Exception {

		String sql = "";
		String sql2 = "";
		String sql_disp = "";

		try {

			String SMODE = (String) argHtMethod.get("SMODE");
			String COMP_CD = (String) argHtMethod.get("COMP_CD");
			String APLY_DT = (String) argHtMethod.get("APLY_DT");
			String COMP_NO = (String) argHtMethod.get("COMP_NO");
			String COMP_SQ = (String) argHtMethod.get("COMP_SQ");
			String COKD_CD = (String) argHtMethod.get("COKD_CD");
			String COMP_NM = (String) argHtMethod.get("COMP_NM");
			String INDO_NO = (String) argHtMethod.get("INDO_NO");
			String INDD_NO = (String) argHtMethod.get("INDD_NO");
			String INDD_SQ = (String) argHtMethod.get("INDD_SQ");
			String CORE_NO = (String) argHtMethod.get("CORE_NO");
			String COTK_CD = (String) argHtMethod.get("COTK_CD");
			String SUTK_YN = (String) argHtMethod.get("SUTK_YN");
			String DEPT_CD = (String) argHtMethod.get("DEPT_CD");
			String TKGJ_CD = (String) argHtMethod.get("TKGJ_CD");
			String TKJJ_CD = (String) argHtMethod.get("TKJJ_CD");
			String PRES_NM = (String) argHtMethod.get("PRES_NM");
			String LABO_CD = (String) argHtMethod.get("LABO_CD");
			String JIDO_CD = (String) argHtMethod.get("JIDO_CD");
			String ZIPKD_CD = (String) argHtMethod.get("ZIPKD_CD");
			String ZIP_CD = (String) argHtMethod.get("ZIP_CD");
			String ZIP_SQ = (String) argHtMethod.get("ZIP_SQ");
			String ZIP_AR = (String) argHtMethod.get("ZIP_AR");
			String ROAD_AR = (String) argHtMethod.get("ROAD_AR");
			String BLDG_NO = (String) argHtMethod.get("BLDG_NO");
			String TEL_NO = (String) argHtMethod.get("TEL_NO");
			String FAX_NO = (String) argHtMethod.get("FAX_NO");
			String JMOB_NO = (String) argHtMethod.get("JMOB_NO");
			String JEMAIL = (String) argHtMethod.get("JEMAIL");
			String JTEL_NO = (String) argHtMethod.get("JTEL_NO");
			String J_NM = (String) argHtMethod.get("J_NM");
			String TMOB_NO = (String) argHtMethod.get("TMOB_NO");
			String TEMAIL = (String) argHtMethod.get("TEMAIL");
			String TTEL_NO = (String) argHtMethod.get("TTEL_NO");
			String T_NM = (String) argHtMethod.get("T_NM");
			String CBIR_DT = (String) argHtMethod.get("CBIR_DT");
			String LUNR_KD = (String) argHtMethod.get("LUNR_KD");
			String SALE_ID = (String) argHtMethod.get("SALE_ID");
			String SSUB_ID = (String) argHtMethod.get("SSUB_ID");
			String PYER_CD = (String) argHtMethod.get("PYER_CD");
			String SPRT_PR = (String) argHtMethod.get("SPRT_PR");
			String CMPY_CD = (String) argHtMethod.get("CMPY_CD");
			String PRPY_CD = (String) argHtMethod.get("PRPY_CD");
			String TKCG_CD = (String) argHtMethod.get("TKCG_CD");
			String TKDE_CD = (String) argHtMethod.get("TKDE_CD");
			String TBAS_CD = (String) argHtMethod.get("TBAS_CD");
			String DISC_RT = (String) argHtMethod.get("DISC_RT");
			String CLAS_CD = (String) argHtMethod.get("CLAS_CD");
			String FAMI_CD = (String) argHtMethod.get("FAMI_CD");
			String COMP_TX = (String) argHtMethod.get("COMP_TX");
			String PAST_CD = (String) argHtMethod.get("PAST_CD");
			String OCS_CD = (String) argHtMethod.get("OCS_CD");
			String STRT_YR = (String) argHtMethod.get("STRT_YR");
			String PROD_NM = (String) argHtMethod.get("PROD_NM");
			String SMPL_YN = (String) argHtMethod.get("SMPL_YN");
			String USE_YN = (String) argHtMethod.get("USE_YN");
			String NUSER_ID = (String) argHtMethod.get("NUSER_ID");
			String NUSE_TX = (String) argHtMethod.get("NUSE_TX");
			String USER_ID = (String) argHtMethod.get("USER_ID");
			String TKGJ_YR = (String) argHtMethod.get("TKGJ_YR");
			String SLNS_DELAY = (String) argHtMethod.get("SLNS_DELAY");
			String PRNT_ZIP_CD = (String) argHtMethod.get("PRNT_ZIP_CD");
			String PRNT_ZIP_AR = (String) argHtMethod.get("PRNT_ZIP_AR");
			String PRNT_ROAD_AR = (String) argHtMethod.get("PRNT_ROAD_AR");

			//
			if(SMODE == null) { SMODE = ""; }
			if(COMP_CD == null) { COMP_CD = ""; }
			if(APLY_DT == null) { APLY_DT = ""; }
			if(COMP_NO == null) { COMP_NO = ""; }
			if(COMP_SQ == null) { COMP_SQ = ""; }
			if(COKD_CD == null) { COKD_CD = ""; }
			if(COMP_NM == null) { COMP_NM = ""; }
			if(INDO_NO == null) { INDO_NO = ""; }
			if(INDD_NO == null) { INDD_NO = ""; }
			if(INDD_SQ == null) { INDD_SQ = ""; }
			if(CORE_NO == null) { CORE_NO = ""; }
			if(COTK_CD == null) { COTK_CD = ""; }
			if(SUTK_YN == null) { SUTK_YN = ""; }
			if(DEPT_CD == null) { DEPT_CD = ""; }
			if(TKGJ_CD == null) { TKGJ_CD = ""; }
			if(TKJJ_CD == null) { TKJJ_CD = ""; }
			if(PRES_NM == null) { PRES_NM = ""; }
			if(LABO_CD == null) { LABO_CD = ""; }
			if(JIDO_CD == null) { JIDO_CD = ""; }
			if(ZIPKD_CD == null) { ZIPKD_CD = ""; }
			if(ZIP_CD == null) { ZIP_CD = ""; }
			if(ZIP_SQ == null) { ZIP_SQ = ""; }
			if(ZIP_AR == null) { ZIP_AR = ""; }
			if(ROAD_AR == null) { ROAD_AR = ""; }
			if(BLDG_NO == null) { BLDG_NO = ""; }
			if(TEL_NO == null) { TEL_NO = ""; }
			if(FAX_NO == null) { FAX_NO = ""; }
			if(JMOB_NO == null) { JMOB_NO = ""; }
			if(JEMAIL == null) { JEMAIL = ""; }
			if(JTEL_NO == null) { JTEL_NO = ""; }
			if(J_NM == null) { J_NM = ""; }
			if(TMOB_NO == null) { TMOB_NO = ""; }
			if(TEMAIL == null) { TEMAIL = ""; }
			if(TTEL_NO == null) { TTEL_NO = ""; }
			if(T_NM == null) { T_NM = ""; }
			if(CBIR_DT == null) { CBIR_DT = ""; }
			if(LUNR_KD == null) { LUNR_KD = ""; }
			if(SALE_ID == null) { SALE_ID = ""; }
			if(SSUB_ID == null) { SSUB_ID = ""; }
			if(PYER_CD == null) { PYER_CD = ""; }
			if(SPRT_PR == null) { SPRT_PR = ""; }
			if(CMPY_CD == null) { CMPY_CD = ""; }
			if(PRPY_CD == null) { PRPY_CD = ""; }
			if(TKCG_CD == null) { TKCG_CD = ""; }
			if(TKDE_CD == null) { TKDE_CD = ""; }
			if(TBAS_CD == null) { TBAS_CD = ""; }
			if(DISC_RT == null) { DISC_RT = ""; }
			if(CLAS_CD == null) { CLAS_CD = ""; }
			if(FAMI_CD == null) { FAMI_CD = ""; }
			if(COMP_TX == null) { COMP_TX = ""; }
			if(PAST_CD == null) { PAST_CD = ""; }
			if(OCS_CD == null) { OCS_CD = ""; }
			if(STRT_YR == null) { STRT_YR = ""; }
			if(PROD_NM == null) { PROD_NM = ""; }
			if(SMPL_YN == null) { SMPL_YN = ""; }
			if(USE_YN == null) { USE_YN = ""; }
			if(NUSER_ID == null) { NUSER_ID = ""; }
			if(NUSE_TX == null) { NUSE_TX = ""; }
			if(USER_ID == null) { USER_ID = ""; }
			if(TKGJ_YR == null) { TKGJ_YR = ""; }
			if(SLNS_DELAY == null) { SLNS_DELAY = ""; }
			if(PRNT_ZIP_CD == null) { PRNT_ZIP_CD = ""; }
			if(PRNT_ZIP_AR == null) { PRNT_ZIP_AR = ""; }
			if(PRNT_ROAD_AR == null) { PRNT_ROAD_AR = ""; }

			//
			SMODE = CTr.Replace(SMODE, "'", "''");
			COMP_CD = CTr.Replace(COMP_CD, "'", "''");
			APLY_DT = CTr.Replace(APLY_DT, "'", "''");
			COMP_NO = CTr.Replace(COMP_NO, "'", "''");
			COMP_SQ = CTr.Replace(COMP_SQ, "'", "''");
			COKD_CD = CTr.Replace(COKD_CD, "'", "''");
			COMP_NM = CTr.Replace(COMP_NM, "'", "''");
			INDO_NO = CTr.Replace(INDO_NO, "'", "''");
			INDD_NO = CTr.Replace(INDD_NO, "'", "''");
			INDD_SQ = CTr.Replace(INDD_SQ, "'", "''");
			CORE_NO = CTr.Replace(CORE_NO, "'", "''");
			COTK_CD = CTr.Replace(COTK_CD, "'", "''");
			SUTK_YN = CTr.Replace(SUTK_YN, "'", "''");
			DEPT_CD = CTr.Replace(DEPT_CD, "'", "''");
			TKGJ_CD = CTr.Replace(TKGJ_CD, "'", "''");
			TKJJ_CD = CTr.Replace(TKJJ_CD, "'", "''");
			PRES_NM = CTr.Replace(PRES_NM, "'", "''");
			LABO_CD = CTr.Replace(LABO_CD, "'", "''");
			JIDO_CD = CTr.Replace(JIDO_CD, "'", "''");
			ZIPKD_CD = CTr.Replace(ZIPKD_CD, "'", "''");
			ZIP_CD = CTr.Replace(ZIP_CD, "'", "''");
			ZIP_SQ = CTr.Replace(ZIP_SQ, "'", "''");
			ZIP_AR = CTr.Replace(ZIP_AR, "'", "''");
			ROAD_AR = CTr.Replace(ROAD_AR, "'", "''");
			BLDG_NO = CTr.Replace(BLDG_NO, "'", "''");
			TEL_NO = CTr.Replace(TEL_NO, "'", "''");
			FAX_NO = CTr.Replace(FAX_NO, "'", "''");
			JMOB_NO = CTr.Replace(JMOB_NO, "'", "''");
			JEMAIL = CTr.Replace(JEMAIL, "'", "''");
			JTEL_NO = CTr.Replace(JTEL_NO, "'", "''");
			J_NM = CTr.Replace(J_NM, "'", "''");
			TMOB_NO = CTr.Replace(TMOB_NO, "'", "''");
			TEMAIL = CTr.Replace(TEMAIL, "'", "''");
			TTEL_NO = CTr.Replace(TTEL_NO, "'", "''");
			T_NM = CTr.Replace(T_NM, "'", "''");
			CBIR_DT = CTr.Replace(CBIR_DT, "'", "''");
			LUNR_KD = CTr.Replace(LUNR_KD, "'", "''");
			SALE_ID = CTr.Replace(SALE_ID, "'", "''");
			SSUB_ID = CTr.Replace(SSUB_ID, "'", "''");
			PYER_CD = CTr.Replace(PYER_CD, "'", "''");
			SPRT_PR = CTr.Replace(SPRT_PR, "'", "''");
			CMPY_CD = CTr.Replace(CMPY_CD, "'", "''");
			PRPY_CD = CTr.Replace(PRPY_CD, "'", "''");
			TKCG_CD = CTr.Replace(TKCG_CD, "'", "''");
			TKDE_CD = CTr.Replace(TKDE_CD, "'", "''");
			TBAS_CD = CTr.Replace(TBAS_CD, "'", "''");
			DISC_RT = CTr.Replace(DISC_RT, "'", "''");
			CLAS_CD = CTr.Replace(CLAS_CD, "'", "''");
			FAMI_CD = CTr.Replace(FAMI_CD, "'", "''");
			COMP_TX = CTr.Replace(COMP_TX, "'", "''");
			PAST_CD = CTr.Replace(PAST_CD, "'", "''");
			OCS_CD = CTr.Replace(OCS_CD, "'", "''");
			STRT_YR = CTr.Replace(STRT_YR, "'", "''");
			PROD_NM = CTr.Replace(PROD_NM, "'", "''");
			SMPL_YN = CTr.Replace(SMPL_YN, "'", "''");
			USE_YN = CTr.Replace(USE_YN, "'", "''");
			NUSER_ID = CTr.Replace(NUSER_ID, "'", "''");
			NUSE_TX = CTr.Replace(NUSE_TX, "'", "''");
			USER_ID = CTr.Replace(USER_ID, "'", "''");
			TKGJ_YR = CTr.Replace(TKGJ_YR, "'", "''");
			SLNS_DELAY = CTr.Replace(SLNS_DELAY, "'", "''");
			PRNT_ZIP_CD = CTr.Replace(PRNT_ZIP_CD, "'", "''");
			PRNT_ZIP_AR = CTr.Replace(PRNT_ZIP_AR, "'", "''");
			PRNT_ROAD_AR = CTr.Replace(PRNT_ROAD_AR, "'", "''");

			if(SMODE.equals("INSERT")) {
				sql = "INSERT INTO IT_COMPANY (";
				sql += " ICY_COMP_CD, ICY_APLY_DT, ICY_COMP_NO, ICY_COMP_SQ, ICY_COKD_CD, ";
				sql += " ICY_COMP_NM, ICY_INDO_NO, ICY_INDD_NO, ICY_INDD_SQ, ICY_CORE_NO, ";
				sql += " ICY_COTK_CD, ICY_SUTK_YN, ICY_DEPT_CD, ICY_TKGJ_CD, ICY_TKJJ_CD, ";
				sql += " ICY_PRES_NM, ICY_LABO_CD, ICY_JIDO_CD, ICY_ZIPKD_CD, ICY_ZIP_CD, ";
				sql += " ICY_ZIP_SQ, ICY_ZIP_AR, ICY_ROAD_AR, ICY_BLDG_NO, ICY_TEL_NO, ";
				sql += " ICY_FAX_NO, ICY_JMOB_NO,ICY_JEMAIL, ICY_JTEL_NO, ICY_J_NM, ";
				sql += " ICY_TMOB_NO, ICY_TEMAIL, ICY_TTEL_NO, ICY_T_NM, ICY_CBIR_DT, ";
				sql += " ICY_LUNR_KD, ICY_SALE_ID, ICY_SSUB_ID, ICY_PYER_CD, ICY_SPRT_PR, ";
				sql += " ICY_CMPY_CD, ICY_PRPY_CD, ICY_TKCG_CD, ICY_TKDE_CD, ICY_TBAS_CD, ";
				sql += " ICY_DISC_RT, ICY_CLAS_CD, ICY_FAMI_CD, ICY_COMP_TX, ICY_PAST_CD, ";
				sql += " ICY_OCS_CD, ICY_STRT_YR, ICY_PROD_NM, ICY_SMPL_YN, ICY_USE_YN, ";
				sql += " ICY_NUSE_ID, ICY_NUSE_DTT, ICY_NUSE_TX, ICY_INPT_ID, ICY_INPT_DTT, ";
				sql += " ICY_TKGJ_YR, ICY_SLNS_DELAY, ICY_PRNT_ZIP_CD, ICY_PRNT_ZIP_AR, ICY_PRNT_ROAD_AR ";
				sql += " ) VALUES (";
				sql += "  '" + COMP_CD + "'";
				sql += ", '" + APLY_DT + "'";
				sql += ", '" + COMP_NO + "'";
				sql += ", '" + COMP_SQ + "'";
				sql += ", '" + COKD_CD + "'";
				sql += ", '" + COMP_NM + "'";
				sql += ", '" + INDO_NO + "'";
				sql += ", '" + INDD_NO + "'";
				sql += ", '" + INDD_SQ + "'";
				sql += ", '" + CORE_NO + "'";
				sql += ", '" + COTK_CD + "'";
				sql += ", '" + SUTK_YN + "'";
				sql += ", '" + DEPT_CD + "'";
				sql += ", '" + TKGJ_CD + "'";
				sql += ", '" + TKJJ_CD + "'";
				sql += ", '" + PRES_NM + "'";
				sql += ", '" + LABO_CD + "'";
				sql += ", '" + JIDO_CD + "'";
				sql += ", '" + ZIPKD_CD + "'";
				sql += ", '" + ZIP_CD + "'";
				sql += ", '" + ZIP_SQ + "'";
				sql += ", '" + ZIP_AR + "'";
				sql += ", '" + ROAD_AR + "'";
				sql += ", '" + BLDG_NO + "'";
				sql += ", '" + TEL_NO + "'";
				sql += ", '" + FAX_NO + "'";
				sql += ", '" + JMOB_NO + "'";
				sql += ", '" + JEMAIL + "'";
				sql += ", '" + JTEL_NO + "'";
				sql += ", '" + J_NM + "'";
				sql += ", '" + TMOB_NO + "'";
				sql += ", '" + TEMAIL + "'";
				sql += ", '" + TTEL_NO + "'";
				sql += ", '" + T_NM + "'";
				sql += ", '" + CBIR_DT + "'";
				sql += ", '" + LUNR_KD + "'";
				sql += ", '" + SALE_ID + "'";
				sql += ", '" + SSUB_ID + "'";
				sql += ", '" + PYER_CD + "'";
				sql += ", '" + SPRT_PR + "'";
				sql += ", '" + CMPY_CD + "'";
				sql += ", '" + PRPY_CD + "'";
				sql += ", '" + TKCG_CD + "'";
				sql += ", '" + TKDE_CD + "'";
				sql += ", '" + TBAS_CD + "'";
				sql += ", '" + DISC_RT + "'";
				sql += ", '" + CLAS_CD + "'";
				sql += ", '" + FAMI_CD + "'";
				sql += ", '" + COMP_TX + "'";
				sql += ", '" + PAST_CD + "'";
				sql += ", '" + OCS_CD + "'";
				sql += ", '" + STRT_YR + "'";
				sql += ", '" + PROD_NM + "'";
				sql += ", '" + SMPL_YN + "'";
				sql += ", '" + USE_YN + "'";
				sql += ", '" + NUSER_ID + "'";
				sql += ", SYSDATE";
				sql += ", '" + NUSE_TX + "'";
				sql += ", '" + USER_ID + "'";
				sql += ", SYSDATE";
				sql += ", '" + TKGJ_YR + "'";
				sql += ", '" + SLNS_DELAY + "'";
				sql += ", '" + PRNT_ZIP_CD + "'";
				sql += ", '" + PRNT_ZIP_AR + "'";
				sql += ", '" + PRNT_ROAD_AR + "'";
				sql += ")";

				argStmtExec.executeUpdate(sql);
			}
			else {
				sql = "UPDATE IT_COMPANY SET ";
				sql += "  ICY_APLY_DT = '" + APLY_DT + "'";
				sql += ", ICY_COMP_NO = '" + COMP_NO + "'";
				sql += ", ICY_COMP_SQ = '" + COMP_SQ + "'";
				sql += ", ICY_COKD_CD = '" + COKD_CD + "'";
				sql += ", ICY_COMP_NM = '" + COMP_NM + "'";
				sql += ", ICY_INDO_NO = '" + INDO_NO + "'";
				sql += ", ICY_INDD_NO = '" + INDD_NO + "'";
				sql += ", ICY_INDD_SQ = '" + INDD_SQ + "'";
				sql += ", ICY_CORE_NO = '" + CORE_NO + "'";
				sql += ", ICY_COTK_CD = '" + COTK_CD + "'";
				sql += ", ICY_SUTK_YN = '" + SUTK_YN + "'";
				sql += ", ICY_DEPT_CD = '" + DEPT_CD + "'";
				sql += ", ICY_TKGJ_CD = '" + TKGJ_CD + "'";
				sql += ", ICY_TKJJ_CD = '" + TKJJ_CD + "'";
				sql += ", ICY_PRES_NM = '" + PRES_NM + "'";
				sql += ", ICY_LABO_CD = '" + LABO_CD + "'";
				sql += ", ICY_JIDO_CD = '" + JIDO_CD + "'";
				sql += ", ICY_ZIPKD_CD = '" + ZIPKD_CD + "'";
				sql += ", ICY_ZIP_CD = '" + ZIP_CD + "'";
				sql += ", ICY_ZIP_SQ = '" + ZIP_SQ + "'";
				sql += ", ICY_ZIP_AR = '" + ZIP_AR + "'";
				sql += ", ICY_ROAD_AR = '" + ROAD_AR + "'";
				sql += ", ICY_BLDG_NO = '" + BLDG_NO + "'";
				sql += ", ICY_TEL_NO = '" + TEL_NO + "'";
				sql += ", ICY_FAX_NO = '" + FAX_NO + "'";
				sql += ", ICY_JMOB_NO = '" + JMOB_NO + "'";
				sql += ", ICY_JEMAIL = '" + JEMAIL + "'";
				sql += ", ICY_JTEL_NO = '" + JTEL_NO + "'";
				sql += ", ICY_J_NM = '" + J_NM + "'";
				sql += ", ICY_TMOB_NO = '" + TMOB_NO + "'";
				sql += ", ICY_TEMAIL = '" + TEMAIL + "'";
				sql += ", ICY_TTEL_NO = '" + TTEL_NO + "'";
				sql += ", ICY_T_NM = '" + T_NM + "'";
				sql += ", ICY_CBIR_DT = '" + CBIR_DT + "'";
				sql += ", ICY_LUNR_KD = '" + LUNR_KD + "'";
				sql += ", ICY_SALE_ID = '" + SALE_ID + "'";
				sql += ", ICY_SSUB_ID = '" + SSUB_ID + "'";
				sql += ", ICY_PYER_CD = '" + PYER_CD + "'";
				sql += ", ICY_SPRT_PR = '" + SPRT_PR + "'";
				sql += ", ICY_CMPY_CD = '" + CMPY_CD + "'";
				sql += ", ICY_PRPY_CD = '" + PRPY_CD + "'";
				sql += ", ICY_TKCG_CD = '" + TKCG_CD + "'";
				sql += ", ICY_TKDE_CD = '" + TKDE_CD + "'";
				sql += ", ICY_TBAS_CD = '" + TBAS_CD + "'";
				sql += ", ICY_DISC_RT = '" + DISC_RT + "'";
				sql += ", ICY_CLAS_CD = '" + CLAS_CD + "'";
				sql += ", ICY_FAMI_CD = '" + FAMI_CD + "'";
				sql += ", ICY_COMP_TX = '" + COMP_TX + "'";
				sql += ", ICY_PAST_CD = '" + PAST_CD + "'";
				sql += ", ICY_OCS_CD = '" + OCS_CD + "'";
				sql += ", ICY_STRT_YR = '" + STRT_YR + "'";
				sql += ", ICY_PROD_NM = '" + PROD_NM + "'";
				sql += ", ICY_SMPL_YN = '" + SMPL_YN + "'";
				sql += ", ICY_MODI_ID = '" + USER_ID + "'";
				sql += ", ICY_MODI_DTT = SYSDATE";
				sql += ", ICY_USE_YN = '" + USE_YN + "'";
				sql += ", ICY_NUSE_ID = '" + NUSER_ID + "'";
				sql += ", ICY_NUSE_DTT = SYSDATE";
				sql += ", ICY_NUSE_TX = '" + NUSE_TX + "'";
				sql += ", ICY_TKGJ_YR = '" + TKGJ_YR + "'";
				sql += ", ICY_SLNS_DELAY = '" + SLNS_DELAY + "'";
				sql += ", ICY_PRNT_ZIP_CD = '" + PRNT_ZIP_CD + "'";
         		sql += ", ICY_PRNT_ZIP_AR = '" + PRNT_ZIP_AR + "'";
         		sql += ", ICY_PRNT_ROAD_AR = '" + PRNT_ROAD_AR + "'";
				sql += " WHERE ICY_COMP_CD = '" + COMP_CD + "'";

				argStmtExec.executeUpdate(sql);
			}
		} catch (Exception e) {

			throw new FuncException(e.toString(), sql);
		}

		return sql;
	}
%>
