<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%!
	public String func_uItem_Vldt_mniDelClick_001(Statement argStmtExec, HashMap argHtMethod) throws Exception {

		String sql = "";
		String sql2 = "";
		String sql_disp = "";

		try {

			String IIV_APLY_DT = (String) argHtMethod.get("IIV_APLY_DT");
			String IIV_ITEM_CD = (String) argHtMethod.get("IIV_ITEM_CD");
			String IIV_EXAM_CD = (String) argHtMethod.get("IIV_EXAM_CD");
			String IIV_SEX_CD = (String) argHtMethod.get("IIV_SEX_CD");
			String IIV_AGE_FR = (String) argHtMethod.get("IIV_AGE_FR");
			String IIV_AGE_TO = (String) argHtMethod.get("IIV_AGE_TO");
			String IIV_PANJ_CD = (String) argHtMethod.get("IIV_PANJ_CD");

			//
			if(IIV_APLY_DT == null) { IIV_APLY_DT = ""; }
			if(IIV_ITEM_CD == null) { IIV_ITEM_CD = ""; }
			if(IIV_EXAM_CD == null) { IIV_EXAM_CD = ""; }
			if(IIV_SEX_CD == null) { IIV_SEX_CD = ""; }
			if(IIV_AGE_FR == null) { IIV_AGE_FR = ""; }
			if(IIV_AGE_TO == null) { IIV_AGE_TO = ""; }
			if(IIV_PANJ_CD == null) { IIV_PANJ_CD = ""; }

			//
			IIV_APLY_DT = CTr.Replace(IIV_APLY_DT, "'", "''");
			IIV_ITEM_CD = CTr.Replace(IIV_ITEM_CD, "'", "''");
			IIV_EXAM_CD = CTr.Replace(IIV_EXAM_CD, "'", "''");
			IIV_SEX_CD = CTr.Replace(IIV_SEX_CD, "'", "''");
			IIV_AGE_FR = CTr.Replace(IIV_AGE_FR, "'", "''");
			IIV_AGE_TO = CTr.Replace(IIV_AGE_TO, "'", "''");
			IIV_PANJ_CD = CTr.Replace(IIV_PANJ_CD, "'", "''");

			sql = "DELETE FROM IT_ITEM_VLDT";
			sql += " WHERE IIV_APLY_DT = '" + IIV_APLY_DT + "'";
			sql += " AND IIV_ITEM_CD = '" + IIV_ITEM_CD + "'";
			sql += " AND IIV_EXAM_CD = '" + IIV_EXAM_CD + "'";
			sql += " AND IIV_SEX_CD = '" + IIV_SEX_CD + "'";
			sql += " AND IIV_AGE_FR = '" + IIV_AGE_FR + "'";
			sql += " AND IIV_AGE_TO = '" + IIV_AGE_TO + "'";
			sql += " AND IIV_PANJ_CD = '" + IIV_PANJ_CD + "'";

			argStmtExec.executeUpdate(sql);

		} catch (Exception e) {

			throw new FuncException(e.toString(), sql);
		}

		return sql;
	}
%>
