<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%!
	public String func_uSP_PostManagement_CustList_APPLY_UP_Save_001(Statement argStmtExec, HashMap argHtMethod) throws Exception {

		String sql = "";
		String sql2 = "";
		String sql_disp = "";

		try {

			String SAVE_KD = (String) argHtMethod.get("SAVE_KD");
			String ADVI_DT = (String) argHtMethod.get("ADVI_DT");
			String CUST_NO = (String) argHtMethod.get("CUST_NO");
			String ADVI_SQ = (String) argHtMethod.get("ADVI_SQ");
			String EXAM_DT = (String) argHtMethod.get("EXAM_DT");
			String EXAM_SQ = (String) argHtMethod.get("EXAM_SQ");
			String EXAM_CHA = (String) argHtMethod.get("EXAM_CHA");
			String NEXT_DT = (String) argHtMethod.get("NEXT_DT");
			String ADVI_CD = (String) argHtMethod.get("ADVI_CD");
			String ADVI_TX = (String) argHtMethod.get("ADVI_TX");
			String NURSE_ID = (String) argHtMethod.get("NURSE_ID");
			String DOCT_ID = (String) argHtMethod.get("DOCT_ID");
			String USER_ID = (String) argHtMethod.get("USER_ID");

			//
			if(SAVE_KD == null) { SAVE_KD = ""; }
			if(ADVI_DT == null) { ADVI_DT = ""; }
			if(CUST_NO == null) { CUST_NO = ""; }
			if(ADVI_SQ == null) { ADVI_SQ = ""; }
			if(EXAM_DT == null) { EXAM_DT = ""; }
			if(EXAM_SQ == null) { EXAM_SQ = ""; }
			if(EXAM_CHA == null) { EXAM_CHA = ""; }
			if(NEXT_DT == null) { NEXT_DT = ""; }
			if(ADVI_CD == null) { ADVI_CD = ""; }
			if(ADVI_TX == null) { ADVI_TX = ""; }
			if(NURSE_ID == null) { NURSE_ID = ""; }
			if(DOCT_ID == null) { DOCT_ID = ""; }
			if(USER_ID == null) { USER_ID = ""; }

			//
			SAVE_KD = CTr.Replace(SAVE_KD, "'", "''");
			ADVI_DT = CTr.Replace(ADVI_DT, "'", "''");
			CUST_NO = CTr.Replace(CUST_NO, "'", "''");
			ADVI_SQ = CTr.Replace(ADVI_SQ, "'", "''");
			EXAM_DT = CTr.Replace(EXAM_DT, "'", "''");
			EXAM_SQ = CTr.Replace(EXAM_SQ, "'", "''");
			EXAM_CHA = CTr.Replace(EXAM_CHA, "'", "''");
			NEXT_DT = CTr.Replace(NEXT_DT, "'", "''");
			ADVI_CD = CTr.Replace(ADVI_CD, "'", "''");
			ADVI_TX = CTr.Replace(ADVI_TX, "'", "''");
			NURSE_ID = CTr.Replace(NURSE_ID, "'", "''");
			DOCT_ID = CTr.Replace(DOCT_ID, "'", "''");
			USER_ID = CTr.Replace(USER_ID, "'", "''");

			if(SAVE_KD.equals("I")) {
				sql = "INSERT INTO ST_ADVICE (SAE_ADVI_DT, SAE_CUST_NO, SAE_ADVI_SQ, SAE_EXAM_DT, SAE_EXAM_SQ, SAE_EXAM_CHA, SAE_NEXT_DT, SAE_ADVI_CD, SAE_ADVI_TX, SAE_NURSE_ID, SAE_DOCT_ID, SAE_INPT_ID, SAE_INPT_DTT) VALUES (";
				sql += "  '" + ADVI_DT + "'";
				sql += ", '" + CUST_NO + "'";
				sql += ", '" + ADVI_SQ + "'";
				sql += ", '" + EXAM_DT + "'";
				sql += ", '" + EXAM_SQ + "'";
				sql += ", '" + EXAM_CHA + "'";
				sql += ", '" + NEXT_DT + "'";
				sql += ", '" + ADVI_CD + "'";
				sql += ", '" + ADVI_TX + "'";
				sql += ", '" + NURSE_ID + "'";
				sql += ", '" + DOCT_ID + "'";
				sql += ", '" + USER_ID + "'";
				sql += ", SYSDATE";
				sql += ")";

				argStmtExec.executeUpdate(sql);
			}
			else {
				sql = "UPDATE ST_ADVICE SET ";
				sql += "  SAE_EXAM_DT = '" + EXAM_DT + "'";
				sql += ", SAE_EXAM_SQ = '" + EXAM_SQ + "'";
				sql += ", SAE_EXAM_CHA = '" + EXAM_CHA + "'";
				sql += ", SAE_NEXT_DT = '" + NEXT_DT + "'";
				sql += ", SAE_ADVI_CD = '" + ADVI_CD + "'";
				sql += ", SAE_ADVI_TX = '" + ADVI_TX + "'";
				sql += ", SAE_NURSE_ID = '" + NURSE_ID + "'";
				sql += ", SAE_DOCT_ID = '" + DOCT_ID + "'";
				sql += ", SAE_MODI_ID = '" + USER_ID + "'";
				sql += ", SAE_MODI_DTT = SYSDATE";
				sql += " WHERE SAE_ADVI_DT = '" + ADVI_DT + "'";
				sql += " AND SAE_CUST_NO = '" + CUST_NO + "'";
				sql += " AND SAE_ADVI_SQ = '" + ADVI_SQ + "'";

				argStmtExec.executeUpdate(sql);
			}
		} catch (Exception e) {

			throw new FuncException(e.toString(), sql);
		}

		return sql;
	}
%>
