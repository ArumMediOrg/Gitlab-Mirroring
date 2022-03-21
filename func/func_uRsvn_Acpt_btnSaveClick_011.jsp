<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%!
	public String func_uRsvn_Acpt_btnSaveClick_011(Statement argStmtExec, HashMap argHtMethod) throws Exception {

		String sql = "";
		String sql2 = "";
		String sql_disp = "";

		try {

			String SAVE_KD = (String) argHtMethod.get("SAVE_KD");
			String RSVN_NO = (String) argHtMethod.get("RSVN_NO");
			String ITEM_CD = (String) argHtMethod.get("ITEM_CD");
			String OCS_YN = (String) argHtMethod.get("OCS_YN");
			String OCS_CD = (String) argHtMethod.get("OCS_CD");
			String OSSB_CD = (String) argHtMethod.get("OSSB_CD");
			String OSRL_CD = (String) argHtMethod.get("OSRL_CD");
			String RSVN_DT = (String) argHtMethod.get("RSVN_DT");
			String EXAM_DT = (String) argHtMethod.get("EXAM_DT");
			String CNCL_YN = (String) argHtMethod.get("CNCL_YN");
			String EXAM_TM = (String) argHtMethod.get("EXAM_TM");


			//
			if(SAVE_KD == null) { SAVE_KD = ""; }
			if(RSVN_NO == null) { RSVN_NO = ""; }
			if(ITEM_CD == null) { ITEM_CD = ""; }
			if(OCS_YN == null) { OCS_YN = ""; }
			if(OCS_CD == null) { OCS_CD = ""; }
			if(OSSB_CD == null) { OSSB_CD = ""; }
			if(OSRL_CD == null) { OSRL_CD = ""; }
			if(RSVN_DT == null) { RSVN_DT = ""; }
			if(EXAM_DT == null) { EXAM_DT = ""; }
			if(CNCL_YN == null) { CNCL_YN = ""; }
			if(EXAM_TM == null) { EXAM_TM = ""; }

			//
			RSVN_NO = CTr.Replace(RSVN_NO, "'", "''");
			ITEM_CD = CTr.Replace(ITEM_CD, "'", "''");
			OCS_YN = CTr.Replace(OCS_YN, "'", "''");
			OCS_CD = CTr.Replace(OCS_CD, "'", "''");
			OSSB_CD = CTr.Replace(OSSB_CD, "'", "''");
			OSRL_CD = CTr.Replace(OSRL_CD, "'", "''");
			RSVN_DT = CTr.Replace(RSVN_DT, "'", "''");
			EXAM_DT = CTr.Replace(EXAM_DT, "'", "''");
			CNCL_YN = CTr.Replace(CNCL_YN, "'", "''");
			EXAM_TM = CTr.Replace(EXAM_TM, "'", "''");

			if (SAVE_KD.equals("I")){
				sql = " INSERT INTO RT_RSVT_ITEM ";
				sql += "	(RRI_RSVN_NO, RRI_ITEM_CD, RRI_OCS_YN, ";
				sql += "	 RRI_OCS_CD,  RRI_OSSB_CD, RRI_OSRL_CD, ";
				sql += "	 RRI_RSVN_DT, RRI_EXAM_DT, RRI_CNCL_YN, ";
				sql += "     RRI_EXAM_TM ";
				sql += " ) ";
				sql += " VALUES (";
				sql += "  '" + RSVN_NO + "'";
				sql += ", '" + ITEM_CD + "'";
				sql += ", '" + OCS_YN + "'";
				sql += ", '" + OCS_CD + "'";
				sql += ", '" + OSSB_CD + "'";
				sql += ", '" + OSRL_CD + "'";
				sql += ", '" + RSVN_DT + "'";
				sql += ", '" + EXAM_DT + "'";
				sql += ", '" + CNCL_YN + "'";
				sql += ", '" + EXAM_TM + "'";
				sql += ")";
			} else {
				sql = " UPDATE RT_RSVT_ITEM ";
				sql += "	SET RRI_OCS_YN  = '" + OCS_YN + "', ";
				sql += "		RRI_OCS_CD  = '" + OCS_CD + "', ";
				sql += "		RRI_OSSB_CD = '" + OSSB_CD + "', ";
				sql += "		RRI_OSRL_CD = '" + OSRL_CD + "', ";
				sql += "		RRI_EXAM_DT = '" + EXAM_DT + "', ";
				sql += "		RRI_CNCL_YN = '" + CNCL_YN + "', ";
				sql += "		RRI_EXAM_TM = '" + EXAM_TM + "' ";
				sql += " WHERE RRI_RSVN_NO = '" + RSVN_NO + "' ";
				sql += "	AND RRI_ITEM_CD = '" + ITEM_CD + "' ";
			}

			argStmtExec.executeUpdate(sql);

		} catch (Exception e) {

			throw new FuncException(e.toString(), sql);
		}

		return sql;
	}
%>
