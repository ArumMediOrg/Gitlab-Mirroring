<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%!
	public String func_uExam_Memo_UP_btnSaveClick_002(Statement argStmtExec, HashMap argHtMethod) throws Exception {

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
			String EMAIL_AR = (String) argHtMethod.get("EMAIL_AR");
			String SEND_CD = (String) argHtMethod.get("SEND_CD");
			String ACPT_TX = (String) argHtMethod.get("ACPT_TX");
			String EXAM_DT = (String) argHtMethod.get("EXAM_DT");
			String EXAM_SQ = (String) argHtMethod.get("EXAM_SQ");

			//
			if(ZIP_CD == null) { ZIP_CD = ""; }
			if(ZIP_SQ == null) { ZIP_SQ = ""; }
			if(ZIP_AR == null) { ZIP_AR = ""; }
			if(ROAD_AR == null) { ROAD_AR = ""; }
			if(BLDG_NO == null) { BLDG_NO = ""; }
			if(TEL_NO == null) { TEL_NO = ""; }
			if(MOBL_NO == null) { MOBL_NO = ""; }
			if(EMAIL_AR == null) { EMAIL_AR = ""; }
			if(SEND_CD == null) { SEND_CD = ""; }
			if(ACPT_TX == null) { ACPT_TX = ""; }
			if(EXAM_DT == null) { EXAM_DT = ""; }
			if(EXAM_SQ == null) { EXAM_SQ = ""; }

			//
			ZIP_CD = CTr.Replace(ZIP_CD, "'", "''");
			ZIP_SQ = CTr.Replace(ZIP_SQ, "'", "''");
			ZIP_AR = CTr.Replace(ZIP_AR, "'", "''");
			ROAD_AR = CTr.Replace(ROAD_AR, "'", "''");
			BLDG_NO = CTr.Replace(BLDG_NO, "'", "''");
			TEL_NO = CTr.Replace(TEL_NO, "'", "''");
			MOBL_NO = CTr.Replace(MOBL_NO, "'", "''");
			EMAIL_AR = CTr.Replace(EMAIL_AR, "'", "''");
			SEND_CD = CTr.Replace(SEND_CD, "'", "''");
			ACPT_TX = CTr.Replace(ACPT_TX, "'", "''");
			EXAM_DT = CTr.Replace(EXAM_DT, "'", "''");
			EXAM_SQ = CTr.Replace(EXAM_SQ, "'", "''");

			sql = "UPDATE ET_EXAM_ACPT SET ";
			sql += "  EEA_ZIP_CD = '" + ZIP_CD + "'";
			sql += ", EEA_ZIP_SQ = '" + ZIP_SQ + "'";
			sql += ", EEA_ZIP_AR = '" + ZIP_AR + "'";
			sql += ", EEA_ROAD_AR = '" + ROAD_AR + "'";
			sql += ", EEA_BLDG_NO = '" + BLDG_NO + "'";
			sql += ", EEA_TEL_NO = '" + TEL_NO + "'";
			sql += ", EEA_MOBL_NO = '" + MOBL_NO + "'";
			sql += ", EEA_EMAIL_AR = '" + EMAIL_AR + "'";
			sql += ", EEA_SEND_CD = '" + SEND_CD + "'";
			sql += ", EEA_ACPT_TX = '" + ACPT_TX + "'";
			sql += " WHERE EEA_EXAM_DT = '" + EXAM_DT + "'";
			sql += " AND EEA_EXAM_SQ = '" + EXAM_SQ + "'";

			argStmtExec.executeUpdate(sql);

		} catch (Exception e) {

			throw new FuncException(e.toString(), sql);
		}

		return sql;
	}
%>
