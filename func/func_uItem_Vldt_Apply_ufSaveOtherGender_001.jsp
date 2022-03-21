<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%!
	public String func_uItem_Vldt_Apply_ufSaveOtherGender_001(Statement argStmtExec, HashMap argHtMethod) throws Exception {

		String sql = "";
		String sql2 = "";
		String sql_disp = "";

		try {

			String ASEX_CD = (String) argHtMethod.get("ASEX_CD");
			String IIV_INPT_ID = (String) argHtMethod.get("IIV_INPT_ID");
			String IIV_APLY_DT = (String) argHtMethod.get("IIV_APLY_DT");
			String IIV_ITEM_CD = (String) argHtMethod.get("IIV_ITEM_CD");
			String IIV_SEX_CD = (String) argHtMethod.get("IIV_SEX_CD");
			String IIV_AGE_FR = (String) argHtMethod.get("IIV_AGE_FR");
			String IIV_AGE_TO = (String) argHtMethod.get("IIV_AGE_TO");
			String IIV_EXAM_CD = (String) argHtMethod.get("IIV_EXAM_CD");

			//
			if(ASEX_CD == null) { ASEX_CD = ""; }
			if(IIV_INPT_ID == null) { IIV_INPT_ID = ""; }
			if(IIV_APLY_DT == null) { IIV_APLY_DT = ""; }
			if(IIV_ITEM_CD == null) { IIV_ITEM_CD = ""; }
			if(IIV_SEX_CD == null) { IIV_SEX_CD = ""; }
			if(IIV_AGE_FR == null) { IIV_AGE_FR = ""; }
			if(IIV_AGE_TO == null) { IIV_AGE_TO = ""; }
			if(IIV_EXAM_CD == null) { IIV_EXAM_CD = ""; }

			//
			ASEX_CD = CTr.Replace(ASEX_CD, "'", "''");
			IIV_INPT_ID = CTr.Replace(IIV_INPT_ID, "'", "''");
			IIV_APLY_DT = CTr.Replace(IIV_APLY_DT, "'", "''");
			IIV_ITEM_CD = CTr.Replace(IIV_ITEM_CD, "'", "''");
			IIV_SEX_CD = CTr.Replace(IIV_SEX_CD, "'", "''");
			IIV_AGE_FR = CTr.Replace(IIV_AGE_FR, "'", "''");
			IIV_AGE_TO = CTr.Replace(IIV_AGE_TO, "'", "''");
			IIV_EXAM_CD = CTr.Replace(IIV_EXAM_CD, "'", "''");

			sql = "INSERT INTO IT_ITEM_VLDT ( IIV_APLY_DT, IIV_ITEM_CD, IIV_SEX_CD, IIV_AGE_FR, IIV_AGE_TO , IIV_EXAM_CD, IIV_PANJ_CD, IIV_LOW_KD, IIV_RSLT_LOW, IIV_HIGH_KD , IIV_RSLT_HIGH, IIV_TREF_CD, IIV_RSLT_UNIT, IIV_RSPT_CNT, IIV_RSZR_KD , IIV_USE_YN, IIV_INPT_ID, IIV_INPT_DTT )";
			sql += " SELECT ";
			sql += "  IIV_APLY_DT";
			sql += ", IIV_ITEM_CD";
			sql += ", '" + ASEX_CD + "'";
			sql += ", IIV_AGE_FR";
			sql += ", IIV_AGE_TO";
			sql += ", IIV_EXAM_CD";
			sql += ", IIV_PANJ_CD";
			sql += ", IIV_LOW_KD";
			sql += ", IIV_RSLT_LOW";
			sql += ", IIV_HIGH_KD";
			sql += ", IIV_RSLT_HIGH";
			sql += ", IIV_TREF_CD";
			sql += ", IIV_RSLT_UNIT";
			sql += ", IIV_RSPT_CNT";
			sql += ", IIV_RSZR_KD";
			sql += ", IIV_USE_YN";
			sql += ", '" + IIV_INPT_ID + "'";
			sql += ", SYSDATE";
			sql += " FROM IT_ITEM_VLDT";
			sql += " WHERE IIV_APLY_DT = '" + IIV_APLY_DT  + "'";
			sql += " AND IIV_ITEM_CD = '" + IIV_ITEM_CD  + "'";
			sql += " AND IIV_SEX_CD = '" + IIV_SEX_CD  + "'";
			sql += " AND IIV_AGE_FR = '" + IIV_AGE_FR  + "'";
			sql += " AND IIV_AGE_TO = '" + IIV_AGE_TO  + "'";
			sql += " AND IIV_EXAM_CD = '" + IIV_EXAM_CD  + "'";
			sql += " AND IIV_PANJ_CD IN ('A', 'R1')";

			argStmtExec.executeUpdate(sql);

		} catch (Exception e) {

			throw new FuncException(e.toString(), sql);
		}

		return sql;
	}
%>
