<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%!
	public String func_uSP_Health_BtnSave_DentalClick_004(Statement argStmtExec, HashMap argHtMethod) throws Exception {

		String sql = "";
		String sql2 = "";
		String sql_disp = "";

		try {

			String SSAVEMODE = (String) argHtMethod.get("SSAVEMODE");
			String EXAM_DT = (String) argHtMethod.get("EXAM_DT");
			String EXAM_SQ = (String) argHtMethod.get("EXAM_SQ");
			String EXAM_CHA = (String) argHtMethod.get("EXAM_CHA");
			String DDOC_CD = (String) argHtMethod.get("DDOC_CD");
			String USER_ID = (String) argHtMethod.get("USER_ID");

			//
			if(SSAVEMODE == null) { SSAVEMODE = ""; }
			if(EXAM_DT == null) { EXAM_DT = ""; }
			if(EXAM_SQ == null) { EXAM_SQ = ""; }
			if(EXAM_CHA == null) { EXAM_CHA = ""; }
			if(DDOC_CD == null) { DDOC_CD = ""; }
			if(USER_ID == null) { USER_ID = ""; }

			//
			SSAVEMODE = CTr.Replace(SSAVEMODE, "'", "''");
			EXAM_DT = CTr.Replace(EXAM_DT, "'", "''");
			EXAM_SQ = CTr.Replace(EXAM_SQ, "'", "''");
			EXAM_CHA = CTr.Replace(EXAM_CHA, "'", "''");
			DDOC_CD = CTr.Replace(DDOC_CD, "'", "''");
			USER_ID = CTr.Replace(USER_ID, "'", "''");

			if(SSAVEMODE.equals("I")) {
				sql = "INSERT INTO ST_BASE (SBE_EXAM_DT, SBE_EXAM_SQ, SBE_EXAM_CHA ,SBE_DDOC_CD, SBE_INPT_ID, SBE_INPT_DTT) VALUES (";
				sql += "  '" + EXAM_DT + "'";
				sql += ", '" + EXAM_SQ + "'";
				sql += ", '" + EXAM_CHA + "'";
				sql += ", '" + DDOC_CD + "'";
				sql += ", '" + USER_ID + "'";
				sql += ", SYSDATE";
				sql += ")";

				argStmtExec.executeUpdate(sql);
			}
			else {
				sql = "UPDATE ST_BASE SET ";
				sql += "  SBE_DDOC_CD = '" + DDOC_CD + "'";
				sql += ", SBE_MODI_ID = '" + USER_ID + "'";
				sql += ", SBE_MODI_DTT = SYSDATE";
				sql += " WHERE SBE_EXAM_DT = '" + EXAM_DT + "'";
				sql += " AND SBE_EXAM_SQ = '" + EXAM_SQ + "'";
				sql += " AND SBE_EXAM_CHA = '" + EXAM_CHA + "'";

				argStmtExec.executeUpdate(sql);
			}
 
		} catch (Exception e) {

			throw new FuncException(e.toString(), sql);
		}

		return sql;
	}
%>
