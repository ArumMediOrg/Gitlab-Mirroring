<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%!
	public String func_uStdt_Pnjn_UP_RsltSave_001(Statement argStmtExec, HashMap argHtMethod) throws Exception {

		String sql = "";
		String sql2 = "";
		String sql_disp = "";

		try {

			String SAVE_KD = (String) argHtMethod.get("SAVE_KD");
			String EXAM_DT = (String) argHtMethod.get("EXAM_DT");
			String EXAM_SQ = (String) argHtMethod.get("EXAM_SQ");
			String ITEM_CD = (String) argHtMethod.get("ITEM_CD");
			String HERT_CD = (String) argHtMethod.get("HERT_CD");
			String RSLT_CD = (String) argHtMethod.get("RSLT_CD");
			String RSLT_VL = (String) argHtMethod.get("RSLT_VL");
			String RSLT_KD = (String) argHtMethod.get("RSLT_KD");
			String VLDT_LH = (String) argHtMethod.get("VLDT_LH");
			String STSB_PJ = (String) argHtMethod.get("STSB_PJ");
			String USER_ID = (String) argHtMethod.get("USER_ID");

			//
			if(SAVE_KD == null) { SAVE_KD = ""; }
			if(EXAM_DT == null) { EXAM_DT = ""; }
			if(EXAM_SQ == null) { EXAM_SQ = ""; }
			if(ITEM_CD == null) { ITEM_CD = ""; }
			if(HERT_CD == null) { HERT_CD = ""; }
			if(RSLT_CD == null) { RSLT_CD = ""; }
			if(RSLT_VL == null) { RSLT_VL = ""; }
			if(RSLT_KD == null) { RSLT_KD = ""; }
			if(VLDT_LH == null) { VLDT_LH = ""; }
			if(STSB_PJ == null) { STSB_PJ = ""; }
			if(USER_ID == null) { USER_ID = ""; }

			//
			SAVE_KD = CTr.Replace(SAVE_KD, "'", "''");
			EXAM_DT = CTr.Replace(EXAM_DT, "'", "''");
			EXAM_SQ = CTr.Replace(EXAM_SQ, "'", "''");
			ITEM_CD = CTr.Replace(ITEM_CD, "'", "''");
			HERT_CD = CTr.Replace(HERT_CD, "'", "''");
			RSLT_CD = CTr.Replace(RSLT_CD, "'", "''");
			RSLT_VL = CTr.Replace(RSLT_VL, "'", "''");
			RSLT_KD = CTr.Replace(RSLT_KD, "'", "''");
			VLDT_LH = CTr.Replace(VLDT_LH, "'", "''");
			STSB_PJ = CTr.Replace(STSB_PJ, "'", "''");
			USER_ID = CTr.Replace(USER_ID, "'", "''");

			if(SAVE_KD.equals("I")) {

				sql = "INSERT INTO ET_RSLT_ITEM (ERI_EXAM_DT, ERI_EXAM_SQ, ERI_ITEM_CD, ERI_HLTH_KD, ERI_TOTAL_KD, ERI_STDT_KD, ERI_EMPY_KD, ERI_SPCL_KD, ERI_DETL_KD, ERI_BLOOD_KD, ERI_EACH_KD, ERI_CVCL_KD, ERI_ETC_KD, ERI_ADD_KD, ERI_HERT_CD, ERI_RSLT_CD, ERI_RSLT_VL, ERI_RSLT_KD, ERI_VLDT_LH, ERI_STSB_PANJ, ERI_CFRM_YN, ERI_CNCL_YN, ERI_OCS_CD, ERI_OSSB_CD, ERI_OSRL_CD, ERI_INPUT_DTT, ERI_INPT_ID, ERI_INPT_DTT, ERI_MODI_ID, ERI_MODI_DTT)";
				sql += " SELECT ";
				sql += "  '" + EXAM_DT + "'";
				sql += ", '" + EXAM_SQ + "'";
				sql += ", '" + ITEM_CD + "'";
				sql += ", '0'";
				sql += ", '0'";
				sql += ", '1'";
				sql += ", '0'";
				sql += ", '0'";
				sql += ", '0'";
				sql += ", '0'";
				sql += ", '0'";
				sql += ", '0'";
				sql += ", '0'";
				sql += ", '0'";
				sql += ", '" + HERT_CD + "'";
				sql += ", '" + RSLT_CD + "'";
				sql += ", '" + RSLT_VL + "'";
				sql += ", '" + RSLT_KD + "'";
				sql += ", '" + VLDT_LH + "'";
				sql += ", '" + STSB_PJ + "'";
				sql += ", CASE WHEN '" + RSLT_VL + "' <> ' ' THEN 'Y' END";
				sql += ", 'N'";
				sql += ", IIM_OSCD_CD";
				sql += ", IIM_OSSB_CD";
				sql += ", IIM_OSRL_CD";
				sql += ", SYSDATE";
				sql += ", '" + USER_ID + "'";
				sql += ", SYSDATE";
				sql += ", '" + USER_ID + "'";
				sql += ", SYSDATE";
				sql += " FROM IT_ITEM";
				sql += " WHERE IIM_ITEM_CD = '" + ITEM_CD + "'";

				argStmtExec.executeUpdate(sql);
			} else {
			
				sql = "UPDATE ET_RSLT_ITEM SET ";
				sql += "  ERI_HERT_CD = '" + HERT_CD + "'";
				sql += ", ERI_RSLT_CD = '" + RSLT_CD + "'";
				sql += ", ERI_RSLT_VL = '" + RSLT_VL + "'";
				sql += ", ERI_RSLT_KD = '" + RSLT_KD + "'";
				sql += ", ERI_VLDT_LH = '" + VLDT_LH + "'";
				sql += ", ERI_STSB_PANJ = '" + STSB_PJ + "'";
				sql += ", ERI_CFRM_YN = CASE WHEN '" + RSLT_VL + "' <> ' ' THEN 'Y' END";
				sql += ", ERI_INPUT_DTT = SYSDATE";
				sql += ", ERI_MODI_ID = '" + USER_ID + "'";
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
