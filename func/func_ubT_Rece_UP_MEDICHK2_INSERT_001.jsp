<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%!
	public String func_ubT_Rece_UP_MEDICHK2_INSERT_001(Statement argStmtExec, HashMap argHtMethod) throws Exception {

		String sql = "";
		String sql2 = "";
		String sql_disp = "";

		try {

			String RECE_NO = (String) argHtMethod.get("RECE_NO");
			String RECE_SEQ = (String) argHtMethod.get("RECE_SEQ");
			String RECE_DT = (String) argHtMethod.get("RECE_DT");
			String OCCU_KD = (String) argHtMethod.get("OCCU_KD");
			String PER_CNT = (String) argHtMethod.get("PER_CNT");
			String CUST_NO = (String) argHtMethod.get("CUST_NO");
			String CUST_NM = (String) argHtMethod.get("CUST_NM");
			String EXAM_CD = (String) argHtMethod.get("EXAM_CD");
			String CHARGE_PR = (String) argHtMethod.get("CHARGE_PR");
			String PAY_KD = (String) argHtMethod.get("PAY_KD");
			String PAYEND_KD = (String) argHtMethod.get("PAYEND_KD");
			String SALE_KD = (String) argHtMethod.get("SALE_KD");
			String SALE_PR = (String) argHtMethod.get("SALE_PR");
			String TRUNC_KD = (String) argHtMethod.get("TRUNC_KD");
			String TRUNC_PR = (String) argHtMethod.get("TRUNC_PR");
			String RECE_PR = (String) argHtMethod.get("RECE_PR");
			String RESER_PR = (String) argHtMethod.get("RESER_PR");
			String RESEREPL_PR = (String) argHtMethod.get("RESEREPL_PR");
			String OVERPAY_PR = (String) argHtMethod.get("OVERPAY_PR");
			String MEMO = (String) argHtMethod.get("MEMO");
			String CARD_NO = (String) argHtMethod.get("CARD_NO");
			String ISSUE_CD = (String) argHtMethod.get("ISSUE_CD");
			String ALLOT_MM = (String) argHtMethod.get("ALLOT_MM");
			String APPR_NO = (String) argHtMethod.get("APPR_NO");
			String APPR_DT = (String) argHtMethod.get("APPR_DT");
			String CARD_NM = (String) argHtMethod.get("CARD_NM");
			String INPUT_ID = (String) argHtMethod.get("INPUT_ID");
			String MODI_ID = (String) argHtMethod.get("MODI_ID");
			String RECE_TD_PR = (String) argHtMethod.get("RECE_TD_PR");
			String SALE_TD_PR = (String) argHtMethod.get("SALE_TD_PR");
			String TRUNC_TD_PR = (String) argHtMethod.get("TRUNC_TD_PR");
			String RECE_AF_PR = (String) argHtMethod.get("RECE_AF_PR");
			String SALE_AF_PR = (String) argHtMethod.get("SALE_AF_PR");
			String TRUNC_AF_PR = (String) argHtMethod.get("TRUNC_AF_PR");

			//
			if(RECE_NO == null) { RECE_NO = ""; }
			if(RECE_SEQ == null) { RECE_SEQ = ""; }
			if(RECE_DT == null) { RECE_DT = ""; }
			if(OCCU_KD == null) { OCCU_KD = ""; }
			if(PER_CNT == null) { PER_CNT = ""; }
			if(CUST_NO == null) { CUST_NO = ""; }
			if(CUST_NM == null) { CUST_NM = ""; }
			if(EXAM_CD == null) { EXAM_CD = ""; }
			if(CHARGE_PR == null) { CHARGE_PR = ""; }
			if(PAY_KD == null) { PAY_KD = ""; }
			if(PAYEND_KD == null) { PAYEND_KD = ""; }
			if(SALE_KD == null) { SALE_KD = ""; }
			if(SALE_PR == null) { SALE_PR = ""; }
			if(TRUNC_KD == null) { TRUNC_KD = ""; }
			if(TRUNC_PR == null) { TRUNC_PR = ""; }
			if(RECE_PR == null) { RECE_PR = ""; }
			if(RESER_PR == null) { RESER_PR = ""; }
			if(RESEREPL_PR == null) { RESEREPL_PR = ""; }
			if(OVERPAY_PR == null) { OVERPAY_PR = ""; }
			if(MEMO == null) { MEMO = ""; }
			if(CARD_NO == null) { CARD_NO = ""; }
			if(ISSUE_CD == null) { ISSUE_CD = ""; }
			if(ALLOT_MM == null) { ALLOT_MM = ""; }
			if(APPR_NO == null) { APPR_NO = ""; }
			if(APPR_DT == null) { APPR_DT = ""; }
			if(CARD_NM == null) { CARD_NM = ""; }
			if(INPUT_ID == null) { INPUT_ID = ""; }
			if(MODI_ID == null) { MODI_ID = ""; }
			if(RECE_TD_PR == null) { RECE_TD_PR = ""; }
			if(SALE_TD_PR == null) { SALE_TD_PR = ""; }
			if(TRUNC_TD_PR == null) { TRUNC_TD_PR = ""; }
			if(RECE_AF_PR == null) { RECE_AF_PR = ""; }
			if(SALE_AF_PR == null) { SALE_AF_PR = ""; }
			if(TRUNC_AF_PR == null) { TRUNC_AF_PR = ""; }

			//
			RECE_NO = CTr.Replace(RECE_NO, "'", "''");
			RECE_SEQ = CTr.Replace(RECE_SEQ, "'", "''");
			RECE_DT = CTr.Replace(RECE_DT, "'", "''");
			OCCU_KD = CTr.Replace(OCCU_KD, "'", "''");
			PER_CNT = CTr.Replace(PER_CNT, "'", "''");
			CUST_NO = CTr.Replace(CUST_NO, "'", "''");
			CUST_NM = CTr.Replace(CUST_NM, "'", "''");
			EXAM_CD = CTr.Replace(EXAM_CD, "'", "''");
			CHARGE_PR = CTr.Replace(CHARGE_PR, "'", "''");
			PAY_KD = CTr.Replace(PAY_KD, "'", "''");
			PAYEND_KD = CTr.Replace(PAYEND_KD, "'", "''");
			SALE_KD = CTr.Replace(SALE_KD, "'", "''");
			SALE_PR = CTr.Replace(SALE_PR, "'", "''");
			TRUNC_KD = CTr.Replace(TRUNC_KD, "'", "''");
			TRUNC_PR = CTr.Replace(TRUNC_PR, "'", "''");
			RECE_PR = CTr.Replace(RECE_PR, "'", "''");
			RESER_PR = CTr.Replace(RESER_PR, "'", "''");
			RESEREPL_PR = CTr.Replace(RESEREPL_PR, "'", "''");
			OVERPAY_PR = CTr.Replace(OVERPAY_PR, "'", "''");
			MEMO = CTr.Replace(MEMO, "'", "''");
			CARD_NO = CTr.Replace(CARD_NO, "'", "''");
			ISSUE_CD = CTr.Replace(ISSUE_CD, "'", "''");
			ALLOT_MM = CTr.Replace(ALLOT_MM, "'", "''");
			APPR_NO = CTr.Replace(APPR_NO, "'", "''");
			APPR_DT = CTr.Replace(APPR_DT, "'", "''");
			CARD_NM = CTr.Replace(CARD_NM, "'", "''");
			INPUT_ID = CTr.Replace(INPUT_ID, "'", "''");
			MODI_ID = CTr.Replace(MODI_ID, "'", "''");
			RECE_TD_PR = CTr.Replace(RECE_TD_PR, "'", "''");
			SALE_TD_PR = CTr.Replace(SALE_TD_PR, "'", "''");
			TRUNC_TD_PR = CTr.Replace(TRUNC_TD_PR, "'", "''");
			RECE_AF_PR = CTr.Replace(RECE_AF_PR, "'", "''");
			SALE_AF_PR = CTr.Replace(SALE_AF_PR, "'", "''");
			TRUNC_AF_PR = CTr.Replace(TRUNC_AF_PR, "'", "''");

			sql = "INSERT INTO RT_RECE_MEDICHK2 ( RRM_RECE_NO , RRM_RECE_SEQ , RRM_RECE_DT ,RRM_OCCU_KD , RRM_PER_CNT ,RRM_CUST_NO , RRM_CUST_NM , RRM_EXAM_CD ,RRM_CHARGE_PR , RRM_PAY_KD ,RRM_PAYEND_KD , RRM_SALE_KD , RRM_SALE_PR ,RRM_TRUNC_KD , RRM_TRUNC_PR ,RRM_RECE_PR , RRM_RESER_PR , RRM_RESEREPL_PR ,RRM_OVERPAY_PR, RRM_MEMO ,RRM_CARD_NO , RRM_ISSUE_CD , RRM_ALLOT_MM ,RRM_APPR_NO , RRM_APPR_DT , RRM_CARD_NM ,RRM_INPUT_ID , RRM_INPUT_DTT ,RRM_MODI_ID , RRM_MODI_DTT ,RRM_RECE_TD_PR, RRM_SALE_TD_PR, RRM_TRUNC_TD_PR ,RRM_RECE_AF_PR, RRM_SALE_AF_PR, RRM_TRUNC_AF_PR ) VALUES (";
			sql += "  '" + RECE_NO + "'";
			sql += ", '" + RECE_SEQ + "'";
			sql += ", '" + RECE_DT + "'";
			sql += ", '" + OCCU_KD + "'";
			sql += ", '" + PER_CNT + "'";
			sql += ", '" + CUST_NO + "'";
			sql += ", '" + CUST_NM + "'";
			sql += ", '" + EXAM_CD + "'";
			sql += ", '" + CHARGE_PR + "'";
			sql += ", '" + PAY_KD + "'";
			sql += ", '" + PAYEND_KD + "'";
			sql += ", '" + SALE_KD + "'";
			sql += ", '" + SALE_PR + "'";
			sql += ", '" + TRUNC_KD + "'";
			sql += ", '" + TRUNC_PR + "'";
			sql += ", '" + RECE_PR + "'";
			sql += ", '" + RESER_PR + "'";
			sql += ", '" + RESEREPL_PR + "'";
			sql += ", '" + OVERPAY_PR + "'";
			sql += ", '" + MEMO + "'";
			sql += ", '" + CARD_NO + "'";
			sql += ", '" + ISSUE_CD + "'";
			sql += ", '" + ALLOT_MM + "'";
			sql += ", '" + APPR_NO + "'";
			sql += ", '" + APPR_DT + "'";
			sql += ", '" + CARD_NM + "'";
			sql += ", '" + INPUT_ID + "'";
			sql += ", SYSDATE";
			sql += ", '" + MODI_ID + "'";
			sql += ", SYSDATE";
			sql += ", '" + RECE_TD_PR + "'";
			sql += ", '" + SALE_TD_PR + "'";
			sql += ", '" + TRUNC_TD_PR + "'";
			sql += ", '" + RECE_AF_PR + "'";
			sql += ", '" + SALE_AF_PR + "'";
			sql += ", '" + TRUNC_AF_PR + "'";
			sql += ")";

			argStmtExec.executeUpdate(sql);

		} catch (Exception e) {

			throw new FuncException(e.toString(), sql);
		}

		return sql;
	}
%>
