<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%!
	public String func_ubT_Rece_XML_COM_SUIN_002(Statement argStmtExec, HashMap argHtMethod) throws Exception {

		String sql = "";
		String sql2 = "";
		String sql_disp = "";

		try {

			String RECE_SEQ = (String) argHtMethod.get("RECE_SEQ");
			String RECE_DT = (String) argHtMethod.get("RECE_DT");
			String OCCU_KD = (String) argHtMethod.get("OCCU_KD");
			String CARD_NO = (String) argHtMethod.get("CARD_NO");
			String ALLOT_MM = (String) argHtMethod.get("ALLOT_MM");
			String APPR_NO = (String) argHtMethod.get("APPR_NO");
			String APPR_DT = (String) argHtMethod.get("APPR_DT");
			String CARD_NM = (String) argHtMethod.get("CARD_NM");
			String USER_ID = (String) argHtMethod.get("USER_ID");
			String SRECE_NO = (String) argHtMethod.get("SRECE_NO");
			String SRECE_SEQ = (String) argHtMethod.get("SRECE_SEQ");

			//
			if(RECE_SEQ == null) { RECE_SEQ = ""; }
			if(RECE_DT == null) { RECE_DT = ""; }
			if(OCCU_KD == null) { OCCU_KD = ""; }
			if(CARD_NO == null) { CARD_NO = ""; }
			if(ALLOT_MM == null) { ALLOT_MM = ""; }
			if(APPR_NO == null) { APPR_NO = ""; }
			if(APPR_DT == null) { APPR_DT = ""; }
			if(CARD_NM == null) { CARD_NM = ""; }
			if(USER_ID == null) { USER_ID = ""; }
			if(SRECE_NO == null) { SRECE_NO = ""; }
			if(SRECE_SEQ == null) { SRECE_SEQ = ""; }

			//
			RECE_SEQ = CTr.Replace(RECE_SEQ, "'", "''");
			RECE_DT = CTr.Replace(RECE_DT, "'", "''");
			OCCU_KD = CTr.Replace(OCCU_KD, "'", "''");
			CARD_NO = CTr.Replace(CARD_NO, "'", "''");
			ALLOT_MM = CTr.Replace(ALLOT_MM, "'", "''");
			APPR_NO = CTr.Replace(APPR_NO, "'", "''");
			APPR_DT = CTr.Replace(APPR_DT, "'", "''");
			CARD_NM = CTr.Replace(CARD_NM, "'", "''");
			USER_ID = CTr.Replace(USER_ID, "'", "''");
			SRECE_NO = CTr.Replace(SRECE_NO, "'", "''");
			SRECE_SEQ = CTr.Replace(SRECE_SEQ, "'", "''");

			sql = "INSERT INTO RT_RECE_MEDICHK ( RRM_RECE_NO ,RRM_RECE_SEQ ,RRM_RECE_DT ,RRM_OCCU_KD ,RRM_CUST_NO ,RRM_CUST_NM ,RRM_EXAM_CD ,RRM_CHARGE_PR ,RRM_RETURN_PR ,RRM_RETURN_RECE_SEQ ,RRM_RECE_PR ,RRM_PAY_KD ,RRM_CARD_NO ,RRM_ALLOT_MM ,RRM_APPR_NO ,RRM_APPR_DT ,RRM_CARD_NM ,RRM_INPUT_ID ,RRM_INPUT_DTT ,RRM_MODI_ID ,RRM_MODI_DTT )";
			sql += " SELECT ";
			sql += "  RRM_RECE_NO";
			sql += ", '" + RECE_SEQ + "'";
			sql += ", '" + RECE_DT + "'";
			sql += ", '" + OCCU_KD + "'";
			sql += ", RRM_CUST_NO";
			sql += ", RRM_CUST_NM";
			sql += ", RRM_EXAM_CD";
			sql += ", 0";
			sql += ", CASE WHEN TRIM(RRM_OCCU_KD) = '10' THEN RRM_RESER_PR ELSE RRM_RECE_PR END AS RECE_PR";
			sql += ", RRM_RECE_SEQ";
			sql += ", 0";
			sql += ", RRM_PAY_KD";
			sql += ", '" + CARD_NO + "'";
			sql += ", '" + ALLOT_MM + "'";
			sql += ", '" + APPR_NO + "'";
			sql += ", '" + APPR_DT + "'";
			sql += ", '" + CARD_NM + "'";
			sql += ", '" + USER_ID + "'";
			sql += ", SYSDATE";
			sql += ", '" + USER_ID + "'";
			sql += ", SYSDATE";
			sql += " FROM RT_RECE_MEDICHK";
			sql += " WHERE RRM_RECE_NO = '" + SRECE_NO  + "'";
			sql += " AND RRM_RECE_SEQ = '" + SRECE_SEQ + "'";

			argStmtExec.executeUpdate(sql);

		} catch (Exception e) {

			throw new FuncException(e.toString(), sql);
		}

		return sql;
	}
%>
