<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%!
	public String func_uSP_Health_BtnSave_BaseClick_009(Statement argStmtExec, HashMap argHtMethod) throws Exception {

		String sql = "";
		String sql2 = "";
		String sql_disp = "";

		try {

			String DEPT_NM = (String) argHtMethod.get("DEPT_NM");
			String ENTRY_DT = (String) argHtMethod.get("ENTRY_DT");
			String MNGT_SPYM = (String) argHtMethod.get("MNGT_SPYM");
			String NOTE_YN = (String) argHtMethod.get("NOTE_YN");
			String DIVI_NO = (String) argHtMethod.get("DIVI_NO");
			String DIVI_CD = (String) argHtMethod.get("DIVI_CD");
			String USER_ID = (String) argHtMethod.get("USER_ID");
			String EXAM_DT = (String) argHtMethod.get("EXAM_DT");
			String EXAM_SQ = (String) argHtMethod.get("EXAM_SQ");

			//
			if(DEPT_NM == null) { DEPT_NM = ""; }
			if(ENTRY_DT == null) { ENTRY_DT = ""; }
			if(MNGT_SPYM == null) { MNGT_SPYM = ""; }
			if(NOTE_YN == null) { NOTE_YN = ""; }
			if(DIVI_NO == null) { DIVI_NO = ""; }
			if(DIVI_CD == null) { DIVI_CD = ""; }
			if(USER_ID == null) { USER_ID = ""; }
			if(EXAM_DT == null) { EXAM_DT = ""; }
			if(EXAM_SQ == null) { EXAM_SQ = ""; }

			//
			DEPT_NM = CTr.Replace(DEPT_NM, "'", "''");
			ENTRY_DT = CTr.Replace(ENTRY_DT, "'", "''");
			MNGT_SPYM = CTr.Replace(MNGT_SPYM, "'", "''");
			NOTE_YN = CTr.Replace(NOTE_YN, "'", "''");
			DIVI_NO = CTr.Replace(DIVI_NO, "'", "''");
			DIVI_CD = CTr.Replace(DIVI_CD, "'", "''");
			USER_ID = CTr.Replace(USER_ID, "'", "''");
			EXAM_DT = CTr.Replace(EXAM_DT, "'", "''");
			EXAM_SQ = CTr.Replace(EXAM_SQ, "'", "''");

			sql = "UPDATE ET_EXAM_ACPT SET ";
			sql += "  EEA_DEPT_NM = '" + DEPT_NM + "'";
			sql += ", EEA_ENTRY_DT = '" + ENTRY_DT + "'";
			sql += ", EEA_MNGT_SPYM = '" + MNGT_SPYM + "'";
			sql += ", EEA_NOTE_YN = '" + NOTE_YN + "'";
			sql += ", EEA_DIVI_NO = '" + DIVI_NO + "'";
			sql += ", EEA_DIVI_CD = '" + DIVI_CD + "'";
			sql += ", EEA_MODI_ID = '" + USER_ID + "'";
			sql += ", EEA_MODI_DTT = SYSDATE";
			sql += " WHERE EEA_EXAM_DT = '" + EXAM_DT + "'";
			sql += " AND EEA_EXAM_SQ = '" + EXAM_SQ + "'";

			argStmtExec.executeUpdate(sql);

		} catch (Exception e) {

			throw new FuncException(e.toString(), sql);
		}

		return sql;
	}
%>
