<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%!
	public String func_uIT_User_re_Up_Modify_001(Statement argStmtExec, HashMap argHtMethod) throws Exception {

		String sql = "";
		String sql2 = "";
		String sql_disp = "";

		try {

			String MANA_KD = (String) argHtMethod.get("MANA_KD");
			String PENL_ID = (String) argHtMethod.get("PENL_ID");
			String PASS_WD = (String) argHtMethod.get("PASS_WD");
			String PENL_NM = (String) argHtMethod.get("PENL_NM");
			String LICEN1_CD = (String) argHtMethod.get("LICEN1_CD");
			String LICEN1_NO = (String) argHtMethod.get("LICEN1_NO");
			String LICEN2_CD = (String) argHtMethod.get("LICEN2_CD");
			String LICEN2_NO = (String) argHtMethod.get("LICEN2_NO");
			String MOBL_NO = (String) argHtMethod.get("MOBL_NO");
			String EMAI_AR = (String) argHtMethod.get("EMAI_AR");
			String BIRH_DT = (String) argHtMethod.get("BIRH_DT");
			String ENTR_DT = (String) argHtMethod.get("ENTR_DT");
			String RETIR_DT = (String) argHtMethod.get("RETIR_DT");
			String MARY_DT = (String) argHtMethod.get("MARY_DT");
			String ACCP_KD = (String) argHtMethod.get("ACCP_KD");
			String ACCP1_ID = (String) argHtMethod.get("ACCP1_ID");
			String ACCP2_ID = (String) argHtMethod.get("ACCP2_ID");
			String ENTR_ID = (String) argHtMethod.get("ENTR_ID");
			String DEPT_CD = (String) argHtMethod.get("DEPT_CD");
			String POSI_CD = (String) argHtMethod.get("POSI_CD");
			String STOMA_DR = (String) argHtMethod.get("STOMA_DR");
			String COLON_DR = (String) argHtMethod.get("COLON_DR");
			String LIVER_DR = (String) argHtMethod.get("LIVER_DR");
			String BAST_DR = (String) argHtMethod.get("BAST_DR");
			String UTER_DR = (String) argHtMethod.get("UTER_DR");
			String LUNG_DR = (String) argHtMethod.get("LUNG_DR");
			String ZIP_CD = (String) argHtMethod.get("ZIP_CD");
			String ZIP_AR = (String) argHtMethod.get("ZIP_AR");
			String ROAD_AR = (String) argHtMethod.get("ROAD_AR");
			String ENCRYP_GB = (String) argHtMethod.get("ENCRYP_GB");
			String USER_TX = (String) argHtMethod.get("USER_TX");
			String AUTH_GP = (String) argHtMethod.get("AUTH_GP");
			String MODI_ID = (String) argHtMethod.get("MODI_ID");
			String DIVI_CD = (String) argHtMethod.get("DIVI_CD");
			String PLCE_CD = (String) argHtMethod.get("PLCE_CD");
			String SEND_CD = (String) argHtMethod.get("SEND_CD");
			String SIGN_IM = (String) argHtMethod.get("SIGN_IM");
			String CKUP_DR = (String) argHtMethod.get("CKUP_DR");
			String PATH_DR = (String) argHtMethod.get("PATH_DR");
			String DECI_DR = (String) argHtMethod.get("DECI_DR");
			String DPAN_DR = (String) argHtMethod.get("DPAN_DR");
			String COLL_DR = (String) argHtMethod.get("COLL_DR");
			String EMP_NO = (String) argHtMethod.get("EMP_NO");

			//
			if(MANA_KD == null) { MANA_KD = ""; }
			if(PENL_ID == null) { PENL_ID = ""; }
			if(PASS_WD == null) { PASS_WD = ""; }
			if(PENL_NM == null) { PENL_NM = ""; }
			if(LICEN1_CD == null) { LICEN1_CD = ""; }
			if(LICEN1_NO == null) { LICEN1_NO = ""; }
			if(LICEN2_CD == null) { LICEN2_CD = ""; }
			if(LICEN2_NO == null) { LICEN2_NO = ""; }
			if(MOBL_NO == null) { MOBL_NO = ""; }
			if(EMAI_AR == null) { EMAI_AR = ""; }
			if(BIRH_DT == null) { BIRH_DT = ""; }
			if(ENTR_DT == null) { ENTR_DT = ""; }
			if(RETIR_DT == null) { RETIR_DT = ""; }
			if(MARY_DT == null) { MARY_DT = ""; }
			if(ACCP_KD == null) { ACCP_KD = ""; }
			if(ACCP1_ID == null) { ACCP1_ID = ""; }
			if(ACCP2_ID == null) { ACCP2_ID = ""; }
			if(ENTR_ID == null) { ENTR_ID = ""; }
			if(DEPT_CD == null) { DEPT_CD = ""; }
			if(POSI_CD == null) { POSI_CD = ""; }
			if(STOMA_DR == null) { STOMA_DR = ""; }
			if(COLON_DR == null) { COLON_DR = ""; }
			if(LIVER_DR == null) { LIVER_DR = ""; }
			if(BAST_DR == null) { BAST_DR = ""; }
			if(UTER_DR == null) { UTER_DR = ""; }
			if(LUNG_DR == null) { LUNG_DR = ""; }
			if(ZIP_CD == null) { ZIP_CD = ""; }
			if(ZIP_AR == null) { ZIP_AR = ""; }
			if(ROAD_AR == null) { ROAD_AR = ""; }
			if(ENCRYP_GB == null) { ENCRYP_GB = ""; }
			if(USER_TX == null) { USER_TX = ""; }
			if(AUTH_GP == null) { AUTH_GP = ""; }
			if(MODI_ID == null) { MODI_ID = ""; }
			if(DIVI_CD == null) { DIVI_CD = ""; }
			if(PLCE_CD == null) { PLCE_CD = ""; }
			if(SEND_CD == null) { SEND_CD = ""; }
			if(SIGN_IM == null) { SIGN_IM = ""; }
			if(CKUP_DR == null) { CKUP_DR = ""; }
			if(PATH_DR == null) { PATH_DR = ""; }
			if(DECI_DR == null) { DECI_DR = ""; }
			if(DPAN_DR == null) { DPAN_DR = ""; }
			if(COLL_DR == null) { COLL_DR = ""; }
			if(EMP_NO == null) { EMP_NO = ""; }

			//
			MANA_KD = CTr.Replace(MANA_KD, "'", "''");
			PENL_ID = CTr.Replace(PENL_ID, "'", "''");
			PASS_WD = CTr.Replace(PASS_WD, "'", "''");
			PENL_NM = CTr.Replace(PENL_NM, "'", "''");
			LICEN1_CD = CTr.Replace(LICEN1_CD, "'", "''");
			LICEN1_NO = CTr.Replace(LICEN1_NO, "'", "''");
			LICEN2_CD = CTr.Replace(LICEN2_CD, "'", "''");
			LICEN2_NO = CTr.Replace(LICEN2_NO, "'", "''");
			MOBL_NO = CTr.Replace(MOBL_NO, "'", "''");
			EMAI_AR = CTr.Replace(EMAI_AR, "'", "''");
			BIRH_DT = CTr.Replace(BIRH_DT, "'", "''");
			ENTR_DT = CTr.Replace(ENTR_DT, "'", "''");
			RETIR_DT = CTr.Replace(RETIR_DT, "'", "''");
			MARY_DT = CTr.Replace(MARY_DT, "'", "''");
			ACCP_KD = CTr.Replace(ACCP_KD, "'", "''");
			ACCP1_ID = CTr.Replace(ACCP1_ID, "'", "''");
			ACCP2_ID = CTr.Replace(ACCP2_ID, "'", "''");
			ENTR_ID = CTr.Replace(ENTR_ID, "'", "''");
			DEPT_CD = CTr.Replace(DEPT_CD, "'", "''");
			POSI_CD = CTr.Replace(POSI_CD, "'", "''");
			STOMA_DR = CTr.Replace(STOMA_DR, "'", "''");
			COLON_DR = CTr.Replace(COLON_DR, "'", "''");
			LIVER_DR = CTr.Replace(LIVER_DR, "'", "''");
			BAST_DR = CTr.Replace(BAST_DR, "'", "''");
			UTER_DR = CTr.Replace(UTER_DR, "'", "''");
			LUNG_DR = CTr.Replace(LUNG_DR, "'", "''");
			ZIP_CD = CTr.Replace(ZIP_CD, "'", "''");
			ZIP_AR = CTr.Replace(ZIP_AR, "'", "''");
			ROAD_AR = CTr.Replace(ROAD_AR, "'", "''");
			ENCRYP_GB = CTr.Replace(ENCRYP_GB, "'", "''");
			USER_TX = CTr.Replace(USER_TX, "'", "''");
			AUTH_GP = CTr.Replace(AUTH_GP, "'", "''");
			MODI_ID = CTr.Replace(MODI_ID, "'", "''");
			DIVI_CD = CTr.Replace(DIVI_CD, "'", "''");
			PLCE_CD = CTr.Replace(PLCE_CD, "'", "''");
			SEND_CD = CTr.Replace(SEND_CD, "'", "''");
			SIGN_IM = CTr.Replace(SIGN_IM, "'", "''");
			CKUP_DR = CTr.Replace(CKUP_DR, "'", "''");
			PATH_DR = CTr.Replace(PATH_DR, "'", "''");
			DECI_DR = CTr.Replace(DECI_DR, "'", "''");
			DPAN_DR = CTr.Replace(DPAN_DR, "'", "''");
			COLL_DR = CTr.Replace(COLL_DR, "'", "''");
			EMP_NO = CTr.Replace(EMP_NO, "'", "''");

			sql = "UPDATE IT_AUTH_USER SET ";
			sql += "  IAU_MANA_KD = '" + MANA_KD + "'";
			sql += ", IAU_PENL_ID = '" + PENL_ID + "'";
			sql += ", IAU_PASS_WD = '" + PASS_WD + "'";
			sql += ", IAU_PENL_NM = '" + PENL_NM + "'";
			sql += ", IAU_LICEN1_CD = '" + LICEN1_CD + "'";
			sql += ", IAU_LICEN1_NO = '" + LICEN1_NO + "'";
			sql += ", IAU_LICEN2_CD = '" + LICEN2_CD + "'";
			sql += ", IAU_LICEN2_NO = '" + LICEN2_NO + "'";
			sql += ", IAU_MOBL_NO = '" + MOBL_NO + "'";
			sql += ", IAU_EMAI_AR = '" + EMAI_AR + "'";
			sql += ", IAU_BIRH_DT = '" + BIRH_DT + "'";
			sql += ", IAU_ENTR_DT = '" + ENTR_DT + "'";
			sql += ", IAU_RETIR_DT = '" + RETIR_DT + "'";
			sql += ", IAU_MARY_DT = '" + MARY_DT + "'";
			sql += ", IAU_ACCP_KD = '" + ACCP_KD + "'";
			sql += ", IAU_ACCP1_ID = '" + ACCP1_ID + "'";
			sql += ", IAU_ACCP2_ID = '" + ACCP2_ID + "'";
			sql += ", IAU_ENTR_ID = '" + ENTR_ID + "'";
			sql += ", IAU_DEPT_CD = '" + DEPT_CD + "'";
			sql += ", IAU_POSI_CD = '" + POSI_CD + "'";
			sql += ", IAU_STOMA_DR = '" + STOMA_DR + "'";
			sql += ", IAU_COLON_DR = '" + COLON_DR + "'";
			sql += ", IAU_LIVER_DR = '" + LIVER_DR + "'";
			sql += ", IAU_BAST_DR = '" + BAST_DR + "'";
			sql += ", IAU_UTER_DR = '" + UTER_DR + "'";
			sql += ", IAU_LUNG_DR = '" + LUNG_DR + "'";
			sql += ", IAU_ZIP_CD = '" + ZIP_CD + "'";
			sql += ", IAU_ZIP_AR = '" + ZIP_AR + "'";
			sql += ", IAU_ROAD_AR = '" + ROAD_AR + "'";
			sql += ", IAU_ENCRYP_GB = '" + ENCRYP_GB + "'";
			sql += ", IAU_USER_TX = '" + USER_TX + "'";
			sql += ", IAU_AUTH_GP = '" + AUTH_GP + "'";
			sql += ", IAU_MODI_ID = '" + MODI_ID + "'";
			sql += ", IAU_MODI_DTT = SYSDATE";
			sql += ", IAU_DIVI_CD = '" + DIVI_CD + "'";
			sql += ", IAU_PLCE_CD = '" + PLCE_CD + "'";
			sql += ", IAU_SEND_CD = '" + SEND_CD + "'";
			sql += ", IAU_SIGN_IM = '" + SIGN_IM + "'";
			sql += ", IAU_CKUP_DR = '" + CKUP_DR + "'";
			sql += ", IAU_PATH_DR = '" + PATH_DR + "'";
			sql += ", IAU_DECI_DR = '" + DECI_DR + "'";
			sql += ", IAU_DPAN_DR = '" + DPAN_DR + "'";
			sql += ", IAU_COLL_DR = '" + COLL_DR + "'";
			sql += " WHERE IAU_EMP_NO = '" + EMP_NO + "'";

			argStmtExec.executeUpdate(sql);

		} catch (Exception e) {

			throw new FuncException(e.toString(), sql);
		}

		return sql;
	}
%>
