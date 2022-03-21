<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%!
	public String func_uItem_Vldt_Apply_ufSaveCommonInfo_001(Statement argStmtExec, HashMap argHtMethod) throws Exception {

		String sql = "";
		String sql2 = "";
		String sql_disp = "";

		try {

			String IIV_TREF_CD = (String) argHtMethod.get("IIV_TREF_CD");
			String IIV_RSLT_UNIT = (String) argHtMethod.get("IIV_RSLT_UNIT");
			String IIV_RSPT_CNT = (String) argHtMethod.get("IIV_RSPT_CNT");
			String IIV_RSZR_KD = (String) argHtMethod.get("IIV_RSZR_KD");
			String IIV_ITEM_CD = (String) argHtMethod.get("IIV_ITEM_CD");
			String IIV_APLY_DT = (String) argHtMethod.get("IIV_APLY_DT");
			String IIV_EXAM_CD = (String) argHtMethod.get("IIV_EXAM_CD");

			//
			if(IIV_TREF_CD == null) { IIV_TREF_CD = ""; }
			if(IIV_RSLT_UNIT == null) { IIV_RSLT_UNIT = ""; }
			if(IIV_RSPT_CNT == null) { IIV_RSPT_CNT = ""; }
			if(IIV_RSZR_KD == null) { IIV_RSZR_KD = ""; }
			if(IIV_ITEM_CD == null) { IIV_ITEM_CD = ""; }
			if(IIV_APLY_DT == null) { IIV_APLY_DT = ""; }
			if(IIV_EXAM_CD == null) { IIV_EXAM_CD = ""; }

			//
			IIV_TREF_CD = CTr.Replace(IIV_TREF_CD, "'", "''");
			IIV_RSLT_UNIT = CTr.Replace(IIV_RSLT_UNIT, "'", "''");
			IIV_RSPT_CNT = CTr.Replace(IIV_RSPT_CNT, "'", "''");
			IIV_RSZR_KD = CTr.Replace(IIV_RSZR_KD, "'", "''");
			IIV_ITEM_CD = CTr.Replace(IIV_ITEM_CD, "'", "''");
			IIV_APLY_DT = CTr.Replace(IIV_APLY_DT, "'", "''");
			IIV_EXAM_CD = CTr.Replace(IIV_EXAM_CD, "'", "''");

			sql = "UPDATE IT_ITEM_VLDT SET ";
			sql += "  IIV_TREF_CD = '" + IIV_TREF_CD + "'";
			sql += ", IIV_RSLT_UNIT = '" + IIV_RSLT_UNIT + "'";
			sql += ", IIV_RSPT_CNT = '" + IIV_RSPT_CNT + "'";
			sql += ", IIV_RSZR_KD = '" + IIV_RSZR_KD + "'";
			sql += " WHERE IIV_ITEM_CD = '" + IIV_ITEM_CD + "'";
			sql += " AND IIV_APLY_DT = '" + IIV_APLY_DT + "'";
			sql += " AND IIV_EXAM_CD = '" + IIV_EXAM_CD + "'";

			argStmtExec.executeUpdate(sql);

		} catch (Exception e) {

			throw new FuncException(e.toString(), sql);
		}

		return sql;
	}
%>
