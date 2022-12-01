<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%!
	public String func_uDT_CCDT_PANJ_UP_Save_JB_001(Statement argStmtExec, HashMap argHtMethod) throws Exception {

		String sql = "";
		String sql2 = "";
		String sql_disp = "";

		try {

			String EXAM_DT = (String) argHtMethod.get("EXAM_DT");
			String EXAM_SQ = (String) argHtMethod.get("EXAM_SQ");
			String JCB_JOB = (String) argHtMethod.get("JCB_JOB");
			String QUEST1 = (String) argHtMethod.get("QUEST1");
			String QUEST2 = (String) argHtMethod.get("QUEST2");
			String QUEST3 = (String) argHtMethod.get("QUEST3");
			String QUEST4 = (String) argHtMethod.get("QUEST4");
			String QUEST5 = (String) argHtMethod.get("QUEST5");
			String QUEST6 = (String) argHtMethod.get("QUEST6");
			String QUEST7 = (String) argHtMethod.get("QUEST7");
			String QUEST8_1 = (String) argHtMethod.get("QUEST8_1");
			String QUEST8_2 = (String) argHtMethod.get("QUEST8_2");
			String QUEST9 = (String) argHtMethod.get("QUEST9");
			String QUEST10 = (String) argHtMethod.get("QUEST10");
			String QUEST11 = (String) argHtMethod.get("QUEST11");
			String QUEST12_1 = (String) argHtMethod.get("QUEST12_1");
			String QUEST12_2 = (String) argHtMethod.get("QUEST12_2");
			String QUEST12_YN = (String) argHtMethod.get("QUEST12_YN");
			String QUEST13_1 = (String) argHtMethod.get("QUEST13_1");
			String QUEST13_2 = (String) argHtMethod.get("QUEST13_2");
			String QUEST13_YN = (String) argHtMethod.get("QUEST13_YN");
			String QUEST14_1 = (String) argHtMethod.get("QUEST14_1");
			String QUEST14_2 = (String) argHtMethod.get("QUEST14_2");
			String QUEST14_3 = (String) argHtMethod.get("QUEST14_3");
			String QUEST14_4 = (String) argHtMethod.get("QUEST14_4");
			String QUEST14_YN = (String) argHtMethod.get("QUEST14_YN");
			String QUEST15 = (String) argHtMethod.get("QUEST15");
			String QUEST16 = (String) argHtMethod.get("QUEST16");
			String QUEST17 = (String) argHtMethod.get("QUEST17");
			String QUEST18 = (String) argHtMethod.get("QUEST18");
			String QUEST19 = (String) argHtMethod.get("QUEST19");
			String QUEST20 = (String) argHtMethod.get("QUEST20");
			String QUEST21 = (String) argHtMethod.get("QUEST21");
			String QUEST22_NM = (String) argHtMethod.get("QUEST22_NM");
			String QUEST22 = (String) argHtMethod.get("QUEST22");
			String QUEST23_NM = (String) argHtMethod.get("QUEST23_NM");
			String QUEST23 = (String) argHtMethod.get("QUEST23");
			String QUEST24_NM = (String) argHtMethod.get("QUEST24_NM");
			String QUEST24 = (String) argHtMethod.get("QUEST24");
			String RESULT1 = (String) argHtMethod.get("RESULT1");
			String RESULT2 = (String) argHtMethod.get("RESULT2");
			String RESULT3 = (String) argHtMethod.get("RESULT3");
			String RESULT = (String) argHtMethod.get("RESULT");
			String SOKYUN = (String) argHtMethod.get("SOKYUN");


			//
			if(EXAM_DT == null) { EXAM_DT = ""; }
			if(EXAM_SQ == null) { EXAM_SQ = ""; }
			if(JCB_JOB == null) { JCB_JOB = ""; }
			if(QUEST1 == null) { QUEST1 = ""; }
			if(QUEST2 == null) { QUEST2 = ""; }
			if(QUEST3 == null) { QUEST3 = ""; }
			if(QUEST4 == null) { QUEST4 = ""; }
			if(QUEST5 == null) { QUEST5 = ""; }
			if(QUEST6 == null) { QUEST6 = ""; }
			if(QUEST7 == null) { QUEST7 = ""; }
			if(QUEST8_1 == null) { QUEST8_1 = ""; }
			if(QUEST8_2 == null) { QUEST8_2 = ""; }
			if(QUEST9 == null) { QUEST9 = ""; }
			if(QUEST10 == null) { QUEST10 = ""; }
			if(QUEST11 == null) { QUEST11 = ""; }
			if(QUEST12_1 == null) { QUEST12_1 = ""; }
			if(QUEST12_2 == null) { QUEST12_2 = ""; }
			if(QUEST12_YN == null) { QUEST12_YN = ""; }
			if(QUEST13_1 == null) { QUEST13_1 = ""; }
			if(QUEST13_2 == null) { QUEST13_2 = ""; }
			if(QUEST13_YN == null) { QUEST13_YN = ""; }
			if(QUEST14_1 == null) { QUEST14_1 = ""; }
			if(QUEST14_2 == null) { QUEST14_2 = ""; }
			if(QUEST14_3 == null) { QUEST14_3 = ""; }
			if(QUEST14_4 == null) { QUEST14_4 = ""; }
			if(QUEST14_YN == null) { QUEST14_YN = ""; }
			if(QUEST15 == null) { QUEST15 = ""; }
			if(QUEST16 == null) { QUEST16 = ""; }
			if(QUEST17 == null) { QUEST17 = ""; }
			if(QUEST18 == null) { QUEST18 = ""; }
			if(QUEST19 == null) { QUEST19 = ""; }
			if(QUEST20 == null) { QUEST20 = ""; }
			if(QUEST21 == null) { QUEST21 = ""; }
			if(QUEST22_NM == null) { QUEST22_NM = ""; }
			if(QUEST22 == null) { QUEST22 = ""; }
			if(QUEST23_NM == null) { QUEST23_NM = ""; }
			if(QUEST23 == null) { QUEST23 = ""; }
			if(QUEST24_NM == null) { QUEST24_NM = ""; }
			if(QUEST24 == null) { QUEST24 = ""; }
			if(RESULT1 == null) { RESULT1 = ""; }
			if(RESULT2 == null) { RESULT2 = ""; }
			if(RESULT3 == null) { RESULT3 = ""; }
			if(RESULT == null) { RESULT = ""; }
			if(SOKYUN == null) { SOKYUN = ""; }

			//
			EXAM_DT = CTr.Replace(EXAM_DT, "'", "''");
			EXAM_SQ = CTr.Replace(EXAM_SQ, "'", "''");
			JCB_JOB = CTr.Replace(JCB_JOB, "'", "''");
			QUEST1 = CTr.Replace(QUEST1, "'", "''");
			QUEST2 = CTr.Replace(QUEST2, "'", "''");
			QUEST3 = CTr.Replace(QUEST3, "'", "''");
			QUEST4 = CTr.Replace(QUEST4, "'", "''");
			QUEST5 = CTr.Replace(QUEST5, "'", "''");
			QUEST6 = CTr.Replace(QUEST6, "'", "''");
			QUEST7 = CTr.Replace(QUEST7, "'", "''");
			QUEST8_1 = CTr.Replace(QUEST8_1, "'", "''");
			QUEST8_2 = CTr.Replace(QUEST8_2, "'", "''");
			QUEST9 = CTr.Replace(QUEST9, "'", "''");
			QUEST10 = CTr.Replace(QUEST10, "'", "''");
			QUEST11 = CTr.Replace(QUEST11, "'", "''");
			QUEST12_1 = CTr.Replace(QUEST12_1, "'", "''");
			QUEST12_2 = CTr.Replace(QUEST12_2, "'", "''");
			QUEST12_YN = CTr.Replace(QUEST12_YN, "'", "''");
			QUEST13_1 = CTr.Replace(QUEST13_1, "'", "''");
			QUEST13_2 = CTr.Replace(QUEST13_2, "'", "''");
			QUEST13_YN = CTr.Replace(QUEST13_YN, "'", "''");
			QUEST14_1 = CTr.Replace(QUEST14_1, "'", "''");
			QUEST14_2 = CTr.Replace(QUEST14_2, "'", "''");
			QUEST14_3 = CTr.Replace(QUEST14_3, "'", "''");
			QUEST14_4 = CTr.Replace(QUEST14_4, "'", "''");
			QUEST14_YN = CTr.Replace(QUEST14_YN, "'", "''");
			QUEST15 = CTr.Replace(QUEST15, "'", "''");
			QUEST16 = CTr.Replace(QUEST16, "'", "''");
			QUEST17 = CTr.Replace(QUEST17, "'", "''");
			QUEST18 = CTr.Replace(QUEST18, "'", "''");
			QUEST19 = CTr.Replace(QUEST19, "'", "''");
			QUEST20 = CTr.Replace(QUEST20, "'", "''");
			QUEST21 = CTr.Replace(QUEST21, "'", "''");
			QUEST22_NM = CTr.Replace(QUEST22_NM, "'", "''");
			QUEST22 = CTr.Replace(QUEST22, "'", "''");
			QUEST23_NM = CTr.Replace(QUEST23_NM, "'", "''");
			QUEST23 = CTr.Replace(QUEST23, "'", "''");
			QUEST24_NM = CTr.Replace(QUEST24_NM, "'", "''");
			QUEST24 = CTr.Replace(QUEST24, "'", "''");
			RESULT1 = CTr.Replace(RESULT1, "'", "''");
			RESULT2 = CTr.Replace(RESULT2, "'", "''");
			RESULT3 = CTr.Replace(RESULT3, "'", "''");
			RESULT = CTr.Replace(RESULT, "'", "''");
			SOKYUN = CTr.Replace(SOKYUN, "'", "''");

			//
			sql = " INSERT INTO JB_CMPB";
			sql += " (JCB_EXAM_DT, JCB_EXAM_SQ, JCB_JOB, JCB_QUEST1, ";
			sql += " JCB_QUEST2, JCB_QUEST3, JCB_QUEST4, JCB_QUEST5, ";
			sql += " JCB_QUEST6, JCB_QUEST7, JCB_QUEST8_1, JCB_QUEST8_2, ";
			sql += " JCB_QUEST9, JCB_QUEST10, JCB_QUEST11, JCB_QUEST12_1, ";
			sql += " JCB_QUEST12_2, JCB_QUEST12_YN, JCB_QUEST13_1, JCB_QUEST13_2, ";
			sql += " JCB_QUEST13_YN, JCB_QUEST14_1, JCB_QUEST14_2, JCB_QUEST14_3, ";
			sql += " JCB_QUEST14_4, JCB_QUEST14_YN, JCB_QUEST15, JCB_QUEST16, ";
			sql += " JCB_QUEST17, JCB_QUEST18, JCB_QUEST19, JCB_QUEST20, ";
			sql += " JCB_QUEST21, JCB_QUEST22_NM, JCB_QUEST22, JCB_QUEST23_NM, ";
			sql += " JCB_QUEST23, JCB_QUEST24_NM, JCB_QUEST24, JCB_CHECK_RESULT1, ";
			sql += " JCB_CHECK_RESULT2, JCB_CHECK_RESULT3, JCB_TOTAL_RESULT, JCB_TOTAL_SOKYUN) VALUES ( ";
			sql += "  '" + EXAM_DT + "'";
			sql += ", '" + EXAM_SQ + "'";
			sql += ", '" + JCB_JOB + "'";
			sql += ", '" + QUEST1 + "'";
			sql += ", '" + QUEST2 + "'";
			sql += ", '" + QUEST3 + "'";
			sql += ", '" + QUEST4 + "'";
			sql += ", '" + QUEST5 + "'";
			sql += ", '" + QUEST6 + "'";
			sql += ", '" + QUEST7 + "'";
			sql += ", '" + QUEST8_1 + "'";
			sql += ", '" + QUEST8_2 + "'";
			sql += ", '" + QUEST9 + "'";
			sql += ", '" + QUEST10 + "'";
			sql += ", '" + QUEST11 + "'";
			sql += ", '" + QUEST12_1 + "'";
			sql += ", '" + QUEST12_2 + "'";
			sql += ", '" + QUEST12_YN + "'";
			sql += ", '" + QUEST13_1 + "'";
			sql += ", '" + QUEST13_2 + "'";
			sql += ", '" + QUEST13_YN + "'";
			sql += ", '" + QUEST14_1 + "'";
			sql += ", '" + QUEST14_2 + "'";
			sql += ", '" + QUEST14_3 + "'";
			sql += ", '" + QUEST14_4 + "'";
			sql += ", '" + QUEST14_YN + "'";
			sql += ", '" + QUEST15 + "'";
			sql += ", '" + QUEST16 + "'";
			sql += ", '" + QUEST17 + "'";
			sql += ", '" + QUEST18 + "'";
			sql += ", '" + QUEST19 + "'";
			sql += ", '" + QUEST20 + "'";
			sql += ", '" + QUEST21 + "'";
			sql += ", '" + QUEST22_NM + "'";
			sql += ", '" + QUEST22 + "'";
			sql += ", '" + QUEST23_NM + "'";
			sql += ", '" + QUEST23 + "'";
			sql += ", '" + QUEST24_NM + "'";
			sql += ", '" + QUEST24 + "'";
			sql += ", '" + RESULT1 + "'";
			sql += ", '" + RESULT2 + "'";
			sql += ", '" + RESULT3 + "'";
			sql += ", '" + RESULT + "'";
			sql += ", '" + SOKYUN + "'";
			sql += ")";

			argStmtExec.executeUpdate(sql);

		} catch (Exception e) {

			throw new FuncException(e.toString(), sql);
		}

		return sql;
	}
%>
