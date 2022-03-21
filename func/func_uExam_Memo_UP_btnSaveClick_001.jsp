<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%!
	public String func_uExam_Memo_UP_btnSaveClick_001(Statement argStmtExec, HashMap argHtMethod) throws Exception {

		String sql = "";
		String sql2 = "";
		String sql_disp = "";

		try {

			String ZIP_CD = (String) argHtMethod.get("ZIP_CD");
			String ZIP_SQ = (String) argHtMethod.get("ZIP_SQ");
			String ZIP_AR = (String) argHtMethod.get("ZIP_AR");
			String ROAD_AR = (String) argHtMethod.get("ROAD_AR");
			String BLDG_NO = (String) argHtMethod.get("BLDG_NO");
			String TEL_NO = (String) argHtMethod.get("TEL_NO");
			String MOBL_NO = (String) argHtMethod.get("MOBL_NO");
			String EMAI_AR = (String) argHtMethod.get("EMAI_AR");
			String CUST_NO = (String) argHtMethod.get("CUST_NO");

			//
			if(ZIP_CD == null) { ZIP_CD = ""; }
			if(ZIP_SQ == null) { ZIP_SQ = ""; }
			if(ZIP_AR == null) { ZIP_AR = ""; }
			if(ROAD_AR == null) { ROAD_AR = ""; }
			if(BLDG_NO == null) { BLDG_NO = ""; }
			if(TEL_NO == null) { TEL_NO = ""; }
			if(MOBL_NO == null) { MOBL_NO = ""; }
			if(EMAI_AR == null) { EMAI_AR = ""; }
			if(CUST_NO == null) { CUST_NO = ""; }

			//
			ZIP_CD = CTr.Replace(ZIP_CD, "'", "''");
			ZIP_SQ = CTr.Replace(ZIP_SQ, "'", "''");
			ZIP_AR = CTr.Replace(ZIP_AR, "'", "''");
			ROAD_AR = CTr.Replace(ROAD_AR, "'", "''");
			BLDG_NO = CTr.Replace(BLDG_NO, "'", "''");
			TEL_NO = CTr.Replace(TEL_NO, "'", "''");
			MOBL_NO = CTr.Replace(MOBL_NO, "'", "''");
			EMAI_AR = CTr.Replace(EMAI_AR, "'", "''");
			CUST_NO = CTr.Replace(CUST_NO, "'", "''");

			sql = "UPDATE IT_CUSTOMER SET ";
			sql += "  ICR_ZIP_CD = '" + ZIP_CD + "'";
			sql += ", ICR_ZIP_SQ = '" + ZIP_SQ + "'";
			sql += ", ICR_ZIP_AR = '" + ZIP_AR + "'";
			sql += ", ICR_ROAD_AR = '" + ROAD_AR + "'";
			sql += ", ICR_BLDG_NO = '" + BLDG_NO + "'";
			sql += ", ICR_TEL_NO = '" + TEL_NO + "'";
			sql += ", ICR_MOBL_NO = '" + MOBL_NO + "'";
			sql += ", ICR_EMAI_AR = '" + EMAI_AR + "'";
			sql += " WHERE ICR_CUST_NO = '" + CUST_NO + "'";

			argStmtExec.executeUpdate(sql);

		} catch (Exception e) {

			throw new FuncException(e.toString(), sql);
		}

		return sql;
	}
%>
