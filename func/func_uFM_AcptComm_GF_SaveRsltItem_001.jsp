<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%!
	public String func_uFM_AcptComm_GF_SaveRsltItem_001(Statement argStmtExec, HashMap argHtMethod) throws Exception {

		String sql = "";
		String sql2 = "";
		String sql_disp = "";

		try {

			String SAVE_KD = (String) argHtMethod.get("SAVE_KD");
			String EXAM_DT = (String) argHtMethod.get("EXAM_DT");
			String EXAM_SQ = (String) argHtMethod.get("EXAM_SQ");
			String ITEM_CD = (String) argHtMethod.get("ITEM_CD");
			String HLTH_KD = (String) argHtMethod.get("HLTH_KD");
			String TOTAL_KD = (String) argHtMethod.get("TOTAL_KD");
			String STDT_KD = (String) argHtMethod.get("STDT_KD");
			String EMPY_KD = (String) argHtMethod.get("EMPY_KD");
			String SPCL_KD = (String) argHtMethod.get("SPCL_KD");
			String DETL_KD = (String) argHtMethod.get("DETL_KD");
			String BLOOD_KD = (String) argHtMethod.get("BLOOD_KD");
			String EACH_KD = (String) argHtMethod.get("EACH_KD");
			String CVCL_KD = (String) argHtMethod.get("CVCL_KD");
			String ETC_KD = (String) argHtMethod.get("ETC_KD");
			String ADD_KD = (String) argHtMethod.get("ADD_KD");
			String SORT_SQ = (String) argHtMethod.get("SORT_SQ");
			String CFRM_YN = (String) argHtMethod.get("CFRM_YN");
			String CNCL_YN = (String) argHtMethod.get("CNCL_YN");
			String OCS_CD = (String) argHtMethod.get("OCS_CD");
			String OSSB_CD = (String) argHtMethod.get("OSSB_CD");
			String OSRL_CD = (String) argHtMethod.get("OSRL_CD");
			String SPMIGUM_YN = (String) argHtMethod.get("SPMIGUM_YN");
			String INPT_ID = (String) argHtMethod.get("INPT_ID");
			String MODI_ID = (String) argHtMethod.get("MODI_ID");

			//
			if(SAVE_KD == null) { SAVE_KD = ""; }
			if(EXAM_DT == null) { EXAM_DT = ""; }
			if(EXAM_SQ == null) { EXAM_SQ = ""; }
			if(ITEM_CD == null) { ITEM_CD = ""; }
			if(HLTH_KD == null) { HLTH_KD = ""; }
			if(TOTAL_KD == null) { TOTAL_KD = ""; }
			if(STDT_KD == null) { STDT_KD = ""; }
			if(EMPY_KD == null) { EMPY_KD = ""; }
			if(SPCL_KD == null) { SPCL_KD = ""; }
			if(DETL_KD == null) { DETL_KD = ""; }
			if(BLOOD_KD == null) { BLOOD_KD = ""; }
			if(EACH_KD == null) { EACH_KD = ""; }
			if(CVCL_KD == null) { CVCL_KD = ""; }
			if(ETC_KD == null) { ETC_KD = ""; }
			if(ADD_KD == null) { ADD_KD = ""; }
			if(SORT_SQ == null) { SORT_SQ = ""; }
			if(CFRM_YN == null) { CFRM_YN = ""; }
			if(CNCL_YN == null) { CNCL_YN = ""; }
			if(OCS_CD == null) { OCS_CD = ""; }
			if(OSSB_CD == null) { OSSB_CD = ""; }
			if(OSRL_CD == null) { OSRL_CD = ""; }
			if(SPMIGUM_YN == null) { SPMIGUM_YN = ""; }
			if(INPT_ID == null) { INPT_ID = ""; }
			if(MODI_ID == null) { MODI_ID = ""; }

			//
			SAVE_KD = CTr.Replace(SAVE_KD, "'", "''");
			EXAM_DT = CTr.Replace(EXAM_DT, "'", "''");
			EXAM_SQ = CTr.Replace(EXAM_SQ, "'", "''");
			ITEM_CD = CTr.Replace(ITEM_CD, "'", "''");
			HLTH_KD = CTr.Replace(HLTH_KD, "'", "''");
			TOTAL_KD = CTr.Replace(TOTAL_KD, "'", "''");
			STDT_KD = CTr.Replace(STDT_KD, "'", "''");
			EMPY_KD = CTr.Replace(EMPY_KD, "'", "''");
			SPCL_KD = CTr.Replace(SPCL_KD, "'", "''");
			DETL_KD = CTr.Replace(DETL_KD, "'", "''");
			BLOOD_KD = CTr.Replace(BLOOD_KD, "'", "''");
			EACH_KD = CTr.Replace(EACH_KD, "'", "''");
			CVCL_KD = CTr.Replace(CVCL_KD, "'", "''");
			ETC_KD = CTr.Replace(ETC_KD, "'", "''");
			ADD_KD = CTr.Replace(ADD_KD, "'", "''");
			SORT_SQ = CTr.Replace(SORT_SQ, "'", "''");
			CFRM_YN = CTr.Replace(CFRM_YN, "'", "''");
			CNCL_YN = CTr.Replace(CNCL_YN, "'", "''");
			OCS_CD = CTr.Replace(OCS_CD, "'", "''");
			OSSB_CD = CTr.Replace(OSSB_CD, "'", "''");
			OSRL_CD = CTr.Replace(OSRL_CD, "'", "''");
			SPMIGUM_YN = CTr.Replace(SPMIGUM_YN, "'", "''");
			INPT_ID = CTr.Replace(INPT_ID, "'", "''");
			MODI_ID = CTr.Replace(MODI_ID, "'", "''");

			if(SAVE_KD.equals("I")) {

				sql = "INSERT INTO ET_RSLT_ITEM (ERI_EXAM_DT, ERI_EXAM_SQ, ERI_ITEM_CD, ERI_HLTH_KD, ERI_TOTAL_KD, ERI_STDT_KD, ERI_EMPY_KD, ERI_SPCL_KD, ERI_DETL_KD, ERI_BLOOD_KD, ERI_EACH_KD, ERI_CVCL_KD, ERI_ETC_KD, ERI_ADD_KD, ERI_SORT_SQ, ERI_CFRM_YN, ERI_CNCL_YN, ERI_INPUT_DTT, ERI_OCS_CD, ERI_OSSB_CD, ERI_OSRL_CD, ERI_SPMIGUM_YN, ERI_INPT_ID, ERI_INPT_DTT, ERI_MODI_ID, ERI_MODI_DTT) VALUES (";
				sql += "  '" + EXAM_DT + "'";
				sql += ", '" + EXAM_SQ + "'";
				sql += ", '" + ITEM_CD + "'";
				sql += ", '" + HLTH_KD + "'";
				sql += ", '" + TOTAL_KD + "'";
				sql += ", '" + STDT_KD + "'";
				sql += ", '" + EMPY_KD + "'";
				sql += ", '" + SPCL_KD + "'";
				sql += ", '" + DETL_KD + "'";
				sql += ", '" + BLOOD_KD + "'";
				sql += ", '" + EACH_KD + "'";
				sql += ", '" + CVCL_KD + "'";
				sql += ", '" + ETC_KD + "'";
				sql += ", '" + ADD_KD + "'";
				sql += ", '" + SORT_SQ + "'";
				sql += ", '" + CFRM_YN + "'";
				sql += ", '" + CNCL_YN + "'";
				sql += ", NULL";
				sql += ", '" + OCS_CD + "'";
				sql += ", '" + OSSB_CD + "'";
				sql += ", '" + OSRL_CD + "'";
				sql += ", '" + SPMIGUM_YN + "'";
				sql += ", '" + INPT_ID + "'";
				sql += ", SYSDATE";
				sql += ", '" + MODI_ID + "'";
				sql += ", SYSDATE";
				sql += ")";

				argStmtExec.executeUpdate(sql);
			} else {
			
				sql = "UPDATE ET_RSLT_ITEM SET ";
				sql += "  ERI_HLTH_KD = '" + HLTH_KD + "'";
				sql += ", ERI_TOTAL_KD = '" + TOTAL_KD + "'";
				sql += ", ERI_STDT_KD = '" + STDT_KD + "'";
				sql += ", ERI_EMPY_KD = '" + EMPY_KD + "'";
				sql += ", ERI_SPCL_KD = '" + SPCL_KD + "'";
				sql += ", ERI_DETL_KD = '" + DETL_KD + "'";
				sql += ", ERI_BLOOD_KD = '" + BLOOD_KD + "'";
				sql += ", ERI_EACH_KD = '" + EACH_KD + "'";
				sql += ", ERI_CVCL_KD = '" + CVCL_KD + "'";
				sql += ", ERI_ETC_KD = '" + ETC_KD + "'";
				sql += ", ERI_ADD_KD = '" + ADD_KD + "'";
				sql += ", ERI_OCS_CD = '" + OCS_CD + "'";
				sql += ", ERI_OSSB_CD = '" + OSSB_CD + "'";
				sql += ", ERI_OSRL_CD = '" + OSRL_CD + "'";
				sql += ", ERI_SORT_SQ = '" + SORT_SQ + "'";
				sql += ", ERI_CNCL_YN = '" + CNCL_YN + "'";
				sql += ", ERI_SPMIGUM_YN = '" + SPMIGUM_YN + "'";
				sql += ", ERI_MODI_ID = '" + MODI_ID + "'";
				sql += ", ERI_MODI_DTT = SYSDATE";
				sql += " WHERE ERI_EXAM_DT = '" + EXAM_DT + "'";
				sql += " AND ERI_EXAM_SQ = '" + EXAM_SQ + "'";
				sql += " AND ERI_ITEM_CD = '" + ITEM_CD + "'";

				argStmtExec.executeUpdate(sql);
			}

		} catch (Exception e) {

			throw new FuncException(e.toString(), sql);
		}

		return sql;
	}
%>
