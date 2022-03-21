<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%!
	public String func_Uspchungfile2020_UDP_INT_CHUNGPER_002(Statement argStmtExec, HashMap argHtMethod) throws Exception {

		String sql = "";
		String sql2 = "";
		String sql_disp = "";

		try {

			String EXAM_DT = (String) argHtMethod.get("EXAM_DT");
			String EXAM_SQ = (String) argHtMethod.get("EXAM_SQ");
			String CHUNG_KD = (String) argHtMethod.get("CHUNG_KD");
			String COMP_CD = (String) argHtMethod.get("COMP_CD");
			String CHUNG_DT = (String) argHtMethod.get("CHUNG_DT");
			String CHUNG_YY = (String) argHtMethod.get("CHUNG_YY");
			String CHUNG_NO = (String) argHtMethod.get("CHUNG_NO");
			String RETURN_KD = (String) argHtMethod.get("RETURN_KD");
			String BILL_FL = (String) argHtMethod.get("BILL_FL");
			String BILL_PR = (String) argHtMethod.get("BILL_PR");
			String BILL_NO = (String) argHtMethod.get("BILL_NO");
			String BILBE_NO = (String) argHtMethod.get("BILBE_NO");
			String USER_ID = (String) argHtMethod.get("USER_ID");

			//
			if(EXAM_DT == null) { EXAM_DT = ""; }
			if(EXAM_SQ == null) { EXAM_SQ = ""; }
			if(CHUNG_KD == null) { CHUNG_KD = ""; }
			if(COMP_CD == null) { COMP_CD = ""; }
			if(CHUNG_DT == null) { CHUNG_DT = ""; }
			if(CHUNG_YY == null) { CHUNG_YY = ""; }
			if(CHUNG_NO == null) { CHUNG_NO = ""; }
			if(RETURN_KD == null) { RETURN_KD = ""; }
			if(BILL_FL == null) { BILL_FL = ""; }
			if(BILL_PR == null) { BILL_PR = ""; }
			if(BILL_NO == null) { BILL_NO = ""; }
			if(BILBE_NO == null) { BILBE_NO = ""; }
			if(USER_ID == null) { USER_ID = ""; }

			//
			EXAM_DT = CTr.Replace(EXAM_DT, "'", "''");
			EXAM_SQ = CTr.Replace(EXAM_SQ, "'", "''");
			CHUNG_KD = CTr.Replace(CHUNG_KD, "'", "''");
			COMP_CD = CTr.Replace(COMP_CD, "'", "''");
			CHUNG_DT = CTr.Replace(CHUNG_DT, "'", "''");
			CHUNG_YY = CTr.Replace(CHUNG_YY, "'", "''");
			CHUNG_NO = CTr.Replace(CHUNG_NO, "'", "''");
			RETURN_KD = CTr.Replace(RETURN_KD, "'", "''");
			BILL_FL = CTr.Replace(BILL_FL, "'", "''");
			BILL_PR = CTr.Replace(BILL_PR, "'", "''");
			BILL_NO = CTr.Replace(BILL_NO, "'", "''");
			BILBE_NO = CTr.Replace(BILBE_NO, "'", "''");
			USER_ID = CTr.Replace(USER_ID, "'", "''");

			sql = "INSERT INTO ST_BILLHN_PR ( SBP_EXAM_DT, SBP_EXAM_SQ, SBP_CHUNG_KD, SPB_COMP_CD, SBP_CHUNG_DT ,SBP_CHUNG_YY, SBP_CHUNG_NO, SBP_RETURN_KD, SBP_BILL_FL, SBP_BILL_PR ,SBP_BILL_NO, SBP_BILBE_NO, SBP_INPUT_ID, SBP_INPUT_DTT, SBP_MODI_DTT, SBP_MODI_ID ) VALUES (";
			sql += "  '" + EXAM_DT + "'";
			sql += ", '" + EXAM_SQ + "'";
			sql += ", '" + CHUNG_KD + "'";
			sql += ", '" + COMP_CD + "'";
			sql += ", '" + CHUNG_DT + "'";
			sql += ", '" + CHUNG_YY + "'";
			sql += ", '" + CHUNG_NO + "'";
			sql += ", '" + RETURN_KD + "'";
			sql += ", '" + BILL_FL + "'";
			sql += ", '" + BILL_PR + "'";
			sql += ", '" + BILL_NO + "'";
			sql += ", '" + BILBE_NO + "'";
			sql += ", '" + USER_ID + "'";
			sql += ", SYSDATE";
			sql += ", SYSDATE";
			sql += ", '" + USER_ID + "'";
			sql += ")";

			argStmtExec.executeUpdate(sql);

		} catch (Exception e) {

			throw new FuncException(e.toString(), sql);
		}

		return sql;
	}
%>
