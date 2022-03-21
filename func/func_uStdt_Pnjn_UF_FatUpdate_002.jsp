<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%!
	public String func_uStdt_Pnjn_UF_FatUpdate_002(Statement argStmtExec, HashMap argHtMethod) throws Exception {

		String sql = "";
		String sql2 = "";
		String sql_disp = "";

		try {

			String FOOD_YN = (String) argHtMethod.get("FOOD_YN");
			String EXAM_LT = (String) argHtMethod.get("EXAM_LT");
			String HLTH_PR = (String) argHtMethod.get("HLTH_PR");
			String COMP_PR = (String) argHtMethod.get("COMP_PR");
			String USER_ID = (String) argHtMethod.get("USER_ID");
			String EXAM_DT = (String) argHtMethod.get("EXAM_DT");
			String EXAM_SQ = (String) argHtMethod.get("EXAM_SQ");

			//
			if(FOOD_YN == null) { FOOD_YN = ""; }
			if(EXAM_LT == null) { EXAM_LT = ""; }
			if(HLTH_PR == null) { HLTH_PR = ""; }
			if(COMP_PR == null) { COMP_PR = ""; }
			if(USER_ID == null) { USER_ID = ""; }
			if(EXAM_DT == null) { EXAM_DT = ""; }
			if(EXAM_SQ == null) { EXAM_SQ = ""; }

			//
			FOOD_YN = CTr.Replace(FOOD_YN, "'", "''");
			EXAM_LT = CTr.Replace(EXAM_LT, "'", "''");
			HLTH_PR = CTr.Replace(HLTH_PR, "'", "''");
			COMP_PR = CTr.Replace(COMP_PR, "'", "''");
			USER_ID = CTr.Replace(USER_ID, "'", "''");
			EXAM_DT = CTr.Replace(EXAM_DT, "'", "''");
			EXAM_SQ = CTr.Replace(EXAM_SQ, "'", "''");

			sql = "UPDATE ET_EXAM_ACPT SET ";
			sql += "  EEA_FOOD_YN = '" + FOOD_YN + "'";
			sql += ", EEA_EXAM_LT = '" + EXAM_LT + "'";
			sql += ", EEA_HLTHR_PR = '" + HLTH_PR + "'";
			sql += ", EEA_COMPR_PR = '" + COMP_PR + "'";
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
