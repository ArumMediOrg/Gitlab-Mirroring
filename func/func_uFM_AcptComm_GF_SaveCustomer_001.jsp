<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%!
	public String func_uFM_AcptComm_GF_SaveCustomer_001(Statement argStmtExec, HashMap argHtMethod) throws Exception {

		String sql = "";
		String sql2 = "";
		String sql_disp = "";

		try {

			String SAVE_KD = (String) argHtMethod.get("SAVE_KD");
			String CUST_NO = (String) argHtMethod.get("CUST_NO");
			String PENL_ID = (String) argHtMethod.get("PENL_ID");
			String PENL_SQ = (String) argHtMethod.get("PENL_SQ");
			String PENL_NM = (String) argHtMethod.get("PENL_NM");
			String MANA_KD = (String) argHtMethod.get("MANA_KD");
			String CUST_KD = (String) argHtMethod.get("CUST_KD");
			String NTNA_CD = (String) argHtMethod.get("NTNA_CD");
			String SEX_KD = (String) argHtMethod.get("SEX_KD");
			String COMP_CD = (String) argHtMethod.get("COMP_CD");
			String ENTR_DT = (String) argHtMethod.get("ENTR_DT");
			String BIRH_KD = (String) argHtMethod.get("BIRH_KD");
			String BIRH_DT = (String) argHtMethod.get("BIRH_DT");
			String MARY_KD = (String) argHtMethod.get("MARY_KD");
			String MARY_DT = (String) argHtMethod.get("MARY_DT");
			String TEL_NO = (String) argHtMethod.get("TEL_NO");
			String MOBL_NO = (String) argHtMethod.get("MOBL_NO");
			String EMAI_AR = (String) argHtMethod.get("EMAI_AR");
			String ADDR_KD = (String) argHtMethod.get("ADDR_KD");
			String ZIP_CD = (String) argHtMethod.get("ZIP_CD");
			String ZIP_SQ = (String) argHtMethod.get("ZIP_SQ");
			String ZIP_AR = (String) argHtMethod.get("ZIP_AR");
			String LOTT_AR = (String) argHtMethod.get("LOTT_AR");
			String ROAD_AR = (String) argHtMethod.get("ROAD_AR");
			String BLDG_NO = (String) argHtMethod.get("BLDG_NO");
			String INFO_YN = (String) argHtMethod.get("INFO_YN");
			String RECV_YN = (String) argHtMethod.get("RECV_YN");
			String DIVI_NM = (String) argHtMethod.get("DIVI_NM");
			String DIVI_CS = (String) argHtMethod.get("DIVI_CS");
			String DIVI_KD = (String) argHtMethod.get("DIVI_KD");
			String CLSS_KD = (String) argHtMethod.get("CLSS_KD");
			String DIVI_NO = (String) argHtMethod.get("DIVI_NO");
			String PID_EN = (String) argHtMethod.get("PID_EN");
			String NOTE_YN = (String) argHtMethod.get("NOTE_YN");
			String INFORE_YN = (String) argHtMethod.get("INFORE_YN");
			String REGION_CD = (String) argHtMethod.get("REGION_CD");
			String USER_ID = (String) argHtMethod.get("USER_ID");
			String COMPAR_YN = (String) argHtMethod.get("COMPAR_YN");
			String CUST_TX = (String) argHtMethod.get("CUST_TX");

			//
			if(SAVE_KD == null) { SAVE_KD = ""; }
			if(CUST_NO == null) { CUST_NO = ""; }
			if(PENL_ID == null) { PENL_ID = ""; }
			if(PENL_SQ == null) { PENL_SQ = ""; }
			if(PENL_NM == null) { PENL_NM = ""; }
			if(MANA_KD == null) { MANA_KD = ""; }
			if(CUST_KD == null) { CUST_KD = ""; }
			if(NTNA_CD == null) { NTNA_CD = ""; }
			if(SEX_KD == null) { SEX_KD = ""; }
			if(COMP_CD == null) { COMP_CD = ""; }
			if(ENTR_DT == null) { ENTR_DT = ""; }
			if(BIRH_KD == null) { BIRH_KD = ""; }
			if(BIRH_DT == null) { BIRH_DT = ""; }
			if(MARY_KD == null) { MARY_KD = ""; }
			if(MARY_DT == null) { MARY_DT = ""; }
			if(TEL_NO == null) { TEL_NO = ""; }
			if(MOBL_NO == null) { MOBL_NO = ""; }
			if(EMAI_AR == null) { EMAI_AR = ""; }
			if(ADDR_KD == null) { ADDR_KD = ""; }
			if(ZIP_CD == null) { ZIP_CD = ""; }
			if(ZIP_SQ == null) { ZIP_SQ = ""; }
			if(ZIP_AR == null) { ZIP_AR = ""; }
			if(LOTT_AR == null) { LOTT_AR = ""; }
			if(ROAD_AR == null) { ROAD_AR = ""; }
			if(BLDG_NO == null) { BLDG_NO = ""; }
			if(INFO_YN == null) { INFO_YN = ""; }
			if(RECV_YN == null) { RECV_YN = ""; }
			if(DIVI_NM == null) { DIVI_NM = ""; }
			if(DIVI_CS == null) { DIVI_CS = ""; }
			if(DIVI_KD == null) { DIVI_KD = ""; }
			if(CLSS_KD == null) { CLSS_KD = ""; }
			if(DIVI_NO == null) { DIVI_NO = ""; }
			if(PID_EN == null) { PID_EN = ""; }
			if(NOTE_YN == null) { NOTE_YN = ""; }
			if(INFORE_YN == null) { INFORE_YN = ""; }
			if(REGION_CD == null) { REGION_CD = ""; }
			if(USER_ID == null) { USER_ID = ""; }
			if(COMPAR_YN == null) { COMPAR_YN = ""; }
			if(CUST_TX == null) { CUST_TX = ""; }

			//
			SAVE_KD = CTr.Replace(SAVE_KD, "'", "''");
			CUST_NO = CTr.Replace(CUST_NO, "'", "''");
			PENL_ID = CTr.Replace(PENL_ID, "'", "''");
			PENL_SQ = CTr.Replace(PENL_SQ, "'", "''");
			PENL_NM = CTr.Replace(PENL_NM, "'", "''");
			MANA_KD = CTr.Replace(MANA_KD, "'", "''");
			CUST_KD = CTr.Replace(CUST_KD, "'", "''");
			NTNA_CD = CTr.Replace(NTNA_CD, "'", "''");
			SEX_KD = CTr.Replace(SEX_KD, "'", "''");
			COMP_CD = CTr.Replace(COMP_CD, "'", "''");
			ENTR_DT = CTr.Replace(ENTR_DT, "'", "''");
			BIRH_KD = CTr.Replace(BIRH_KD, "'", "''");
			BIRH_DT = CTr.Replace(BIRH_DT, "'", "''");
			MARY_KD = CTr.Replace(MARY_KD, "'", "''");
			MARY_DT = CTr.Replace(MARY_DT, "'", "''");
			TEL_NO = CTr.Replace(TEL_NO, "'", "''");
			MOBL_NO = CTr.Replace(MOBL_NO, "'", "''");
			EMAI_AR = CTr.Replace(EMAI_AR, "'", "''");
			ADDR_KD = CTr.Replace(ADDR_KD, "'", "''");
			ZIP_CD = CTr.Replace(ZIP_CD, "'", "''");
			ZIP_SQ = CTr.Replace(ZIP_SQ, "'", "''");
			ZIP_AR = CTr.Replace(ZIP_AR, "'", "''");
			LOTT_AR = CTr.Replace(LOTT_AR, "'", "''");
			ROAD_AR = CTr.Replace(ROAD_AR, "'", "''");
			BLDG_NO = CTr.Replace(BLDG_NO, "'", "''");
			INFO_YN = CTr.Replace(INFO_YN, "'", "''");
			RECV_YN = CTr.Replace(RECV_YN, "'", "''");
			DIVI_NM = CTr.Replace(DIVI_NM, "'", "''");
			DIVI_CS = CTr.Replace(DIVI_CS, "'", "''");
			DIVI_KD = CTr.Replace(DIVI_KD, "'", "''");
			CLSS_KD = CTr.Replace(CLSS_KD, "'", "''");
			DIVI_NO = CTr.Replace(DIVI_NO, "'", "''");
			PID_EN = CTr.Replace(PID_EN, "'", "''");
			NOTE_YN = CTr.Replace(NOTE_YN, "'", "''");
			INFORE_YN = CTr.Replace(INFORE_YN, "'", "''");
			REGION_CD = CTr.Replace(REGION_CD, "'", "''");
			USER_ID = CTr.Replace(USER_ID, "'", "''");
			COMPAR_YN = CTr.Replace(COMPAR_YN, "'", "''");
			CUST_TX = CTr.Replace(CUST_TX, "'", "''");

			if(SAVE_KD.equals("I")) {

				sql = "INSERT INTO IT_CUSTOMER (ICR_CUST_NO, ICR_PENL_ID, ICR_PENL_SQ, ICR_PENL_NM, ICR_MANA_KD, ICR_CUST_KD, ICR_NTNA_CD, ICR_SEX_KD, ICR_COMP_CD, ICR_ENTR_DT, ICR_BIRH_KD, ICR_BIRH_DT, ICR_MARY_KD, ICR_MARY_DT, ICR_TEL_NO, ICR_MOBL_NO, ICR_EMAI_AR, ICR_ADDR_KD, ICR_ZIP_CD, ICR_ZIP_SQ, ICR_ZIP_AR, ICR_LOTT_AR, ICR_ROAD_AR, ICR_BLDG_NO, ICR_INFO_YN, ICR_RECV_YN, ICR_DIVI_NM, ICR_DIVI_CS, ICR_DIVI_KD, ICR_CLSS_KD, ICR_DIVI_NO, ICR_PID_EN, ICR_USE_YN, ICR_NOTE_YN, ICR_INFORE_YN, ICR_REGION_CD, ICR_CUST_TX, ICR_INPT_ID, ICR_INPT_DTT, ICR_MODI_ID, ICR_MODI_DTT) VALUES (";
				sql += "  '" + CUST_NO + "'";
				sql += ", '" + PENL_ID + "'";
				sql += ", '" + PENL_SQ + "'";
				sql += ", '" + PENL_NM + "'";
				sql += ", '" + MANA_KD + "'";
				sql += ", '" + CUST_KD + "'";
				sql += ", '" + NTNA_CD + "'";
				sql += ", '" + SEX_KD + "'";
				sql += ", '" + COMP_CD + "'";
				sql += ", '" + ENTR_DT + "'";
				sql += ", '" + BIRH_KD + "'";
				sql += ", '" + BIRH_DT + "'";
				sql += ", '" + MARY_KD + "'";
				sql += ", '" + MARY_DT + "'";
				sql += ", '" + TEL_NO + "'";
				sql += ", '" + MOBL_NO + "'";
				sql += ", '" + EMAI_AR + "'";
				sql += ", '" + ADDR_KD + "'";
				sql += ", '" + ZIP_CD + "'";
				sql += ", '" + ZIP_SQ + "'";
				sql += ", '" + ZIP_AR + "'";
				sql += ", '" + LOTT_AR + "'";
				sql += ", '" + ROAD_AR + "'";
				sql += ", '" + BLDG_NO + "'";
				sql += ", '" + INFO_YN + "'";
				sql += ", '" + RECV_YN + "'";
				sql += ", '" + DIVI_NM + "'";
				sql += ", '" + DIVI_CS + "'";
				sql += ", '" + DIVI_KD + "'";
				sql += ", '" + CLSS_KD + "'";
				sql += ", '" + DIVI_NO + "'";
				sql += ", '" + PID_EN + "'";
				sql += ", 'Y'";
				sql += ", '" + NOTE_YN + "'";
				sql += ", '" + INFORE_YN + "'";
				sql += ", '" + REGION_CD + "'";
				sql += ", '" + CUST_TX + "'";
				sql += ", '" + USER_ID + "'";
				sql += ", SYSDATE";
				sql += ", '" + USER_ID + "'";
				sql += ", SYSDATE";
				sql += ")";

				argStmtExec.executeUpdate(sql);
			} else {

				sql = "UPDATE IT_CUSTOMER SET ";
				sql += "  ICR_PENL_ID = '" + PENL_ID + "'";
				sql += ", ICR_PENL_NM = '" + PENL_NM + "'";
				sql += ", ICR_NTNA_CD = '" + NTNA_CD + "'";
				sql += ", ICR_REGION_CD = '" + REGION_CD + "'";
				sql += ", ICR_SEX_KD = '" + SEX_KD + "'";
				sql += ", ICR_COMP_CD = '" + COMP_CD + "'";
				sql += ", ICR_ENTR_DT = '" + ENTR_DT + "'";
				sql += ", ICR_TEL_NO = '" + TEL_NO + "'";
				sql += ", ICR_MOBL_NO = '" + MOBL_NO + "'";
				sql += ", ICR_EMAI_AR = '" + EMAI_AR + "'";
				sql += ", ICR_DIVI_NM = '" + DIVI_NM + "'";
				sql += ", ICR_DIVI_KD = '" + DIVI_KD + "'";
				sql += ", ICR_DIVI_NO = '" + DIVI_NO + "'";
				sql += ", ICR_PID_EN = '" + PID_EN + "'";
				sql += ", ICR_CUST_TX = '" + CUST_TX + "'";

				if(COMPAR_YN.equals("N")) {
						sql += ", ICR_ADDR_KD = '" + ADDR_KD + "'";
						sql += ", ICR_ZIP_CD = '" + ZIP_CD + "'";
						sql += ", ICR_ZIP_SQ = '" + ZIP_SQ + "'";
						sql += ", ICR_ZIP_AR = '" + ZIP_AR + "'";
						sql += ", ICR_LOTT_AR = '" + LOTT_AR + "'";
						sql += ", ICR_ROAD_AR = '" + ROAD_AR + "'";
						sql += ", ICR_BLDG_NO = '" + BLDG_NO + "'";
				}

				if(! DIVI_CS.equals("")) {
						sql += ", ICR_DIVI_CS = '" + DIVI_CS + "'";
				}

				if(! CLSS_KD.equals("")) {
						sql += ", ICR_CLSS_KD = '" + CLSS_KD + "'";
				}

				if(! NOTE_YN.equals("")) {
						sql += ", ICR_NOTE_YN = '" + NOTE_YN + "'";
				}

				if(! INFO_YN.equals("")) {
						sql += ", ICR_INFO_YN = '" + INFO_YN + "'";
				}

				if(! INFORE_YN.equals("")) {
						sql += ", ICR_INFORE_YN = '" + INFORE_YN + "'";
				}

				sql += ", ICR_MODI_ID = '" + USER_ID + "'";
				sql += ", ICR_MODI_DTT = SYSDATE";
				sql += " WHERE ICR_CUST_NO = '" + CUST_NO + "'";

				argStmtExec.executeUpdate(sql);
			}

		} catch (Exception e) {

			throw new FuncException(e.toString(), sql);
		}

		return sql;
	}
%>
