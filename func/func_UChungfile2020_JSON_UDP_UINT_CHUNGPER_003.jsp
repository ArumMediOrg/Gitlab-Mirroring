<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%!
	public String func_UChungfile2020_JSON_UDP_UINT_CHUNGPER_003(Statement argStmtExec, HashMap argHtMethod) throws Exception {

		String sql = "";
		String sql2 = "";
		String sql_disp = "";

		try {

			String CHUNG_DT = (String) argHtMethod.get("CHUNG_DT");
			String CHUNG_YY = (String) argHtMethod.get("CHUNG_YY");
			String CHUNG_NO = (String) argHtMethod.get("CHUNG_NO");
			String RETURN_KD = (String) argHtMethod.get("RETURN_KD");
			String BILL_HC = (String) argHtMethod.get("BILL_HC");
			String BILL_FL = (String) argHtMethod.get("BILL_FL");
			String BILLOS_PR = (String) argHtMethod.get("BILLOS_PR");
			String BILLOSC_PR = (String) argHtMethod.get("BILLOSC_PR");
			String BILLOSD_PR = (String) argHtMethod.get("BILLOSD_PR");
			String BILLFIR_PR = (String) argHtMethod.get("BILLFIR_PR");
			String BILLSED_PR = (String) argHtMethod.get("BILLSED_PR");
			String BILLCAN_PR = (String) argHtMethod.get("BILLCAN_PR");
			String BILLCANFN_PR = (String) argHtMethod.get("BILLCANFN_PR");
			String BILLORAL_PR = (String) argHtMethod.get("BILLORAL_PR");
			String BILL_NO = (String) argHtMethod.get("BILL_NO");
			String BILBE_NO = (String) argHtMethod.get("BILBE_NO");
			String USER_ID = (String) argHtMethod.get("USER_ID");
			String EXAM_DT = (String) argHtMethod.get("EXAM_DT");
			String EXAM_SQ = (String) argHtMethod.get("EXAM_SQ");
			String CHUNG_KD = (String) argHtMethod.get("CHUNG_KD");
			String ADDSUB_RSN = (String) argHtMethod.get("ADDSUB_RSN");

			//
			if(CHUNG_DT == null) { CHUNG_DT = ""; }
			if(CHUNG_YY == null) { CHUNG_YY = ""; }
			if(CHUNG_NO == null) { CHUNG_NO = ""; }
			if(RETURN_KD == null) { RETURN_KD = ""; }
			if(BILL_HC == null) { BILL_HC = ""; }
			if(BILL_FL == null) { BILL_FL = ""; }
			if(BILLOS_PR == null) { BILLOS_PR = ""; }
			if(BILLOSC_PR == null) { BILLOSC_PR = ""; }
			if(BILLOSD_PR == null) { BILLOSD_PR = ""; }
			if(BILLFIR_PR == null) { BILLFIR_PR = ""; }
			if(BILLSED_PR == null) { BILLSED_PR = ""; }
			if(BILLCAN_PR == null) { BILLCAN_PR = ""; }
			if(BILLCANFN_PR == null) { BILLCANFN_PR = ""; }
			if(BILLORAL_PR == null) { BILLORAL_PR = ""; }
			if(BILL_NO == null) { BILL_NO = ""; }
			if(BILBE_NO == null) { BILBE_NO = ""; }
			if(USER_ID == null) { USER_ID = ""; }
			if(EXAM_DT == null) { EXAM_DT = ""; }
			if(EXAM_SQ == null) { EXAM_SQ = ""; }
			if(CHUNG_KD == null) { CHUNG_KD = ""; }
			if(ADDSUB_RSN == null) { ADDSUB_RSN = ""; }

			//
			CHUNG_DT = CTr.Replace(CHUNG_DT, "'", "''");
			CHUNG_YY = CTr.Replace(CHUNG_YY, "'", "''");
			CHUNG_NO = CTr.Replace(CHUNG_NO, "'", "''");
			RETURN_KD = CTr.Replace(RETURN_KD, "'", "''");
			BILL_HC = CTr.Replace(BILL_HC, "'", "''");
			BILL_FL = CTr.Replace(BILL_FL, "'", "''");
			BILLOS_PR = CTr.Replace(BILLOS_PR, "'", "''");
			BILLOSC_PR = CTr.Replace(BILLOSC_PR, "'", "''");
			BILLOSD_PR = CTr.Replace(BILLOSD_PR, "'", "''");
			BILLFIR_PR = CTr.Replace(BILLFIR_PR, "'", "''");
			BILLSED_PR = CTr.Replace(BILLSED_PR, "'", "''");
			BILLCAN_PR = CTr.Replace(BILLCAN_PR, "'", "''");
			BILLCANFN_PR = CTr.Replace(BILLCANFN_PR, "'", "''");
			BILLORAL_PR = CTr.Replace(BILLORAL_PR, "'", "''");
			BILL_NO = CTr.Replace(BILL_NO, "'", "''");
			BILBE_NO = CTr.Replace(BILBE_NO, "'", "''");
			USER_ID = CTr.Replace(USER_ID, "'", "''");
			EXAM_DT = CTr.Replace(EXAM_DT, "'", "''");
			EXAM_SQ = CTr.Replace(EXAM_SQ, "'", "''");
			CHUNG_KD = CTr.Replace(CHUNG_KD, "'", "''");
			ADDSUB_RSN = CTr.Replace(ADDSUB_RSN, "'", "''");

			sql = "UPDATE BT_BILLHN_PR SET ";
			sql += "  BBP_CHUNG_DT = '" + CHUNG_DT + "'";
			sql += ", BBP_CHUNG_YY = '" + CHUNG_YY + "'";
			sql += ", BBP_CHUNG_NO = '" + CHUNG_NO + "'";
			sql += ", BBP_RETURN_KD = '" + RETURN_KD + "'";
			sql += ", BBP_BILL_HC = '" + BILL_HC + "'";
			sql += ", BBP_BILL_FL = '" + BILL_FL + "'";
			sql += ", BBP_BILLOS_PR = '" + BILLOS_PR + "'";
			sql += ", BBP_BILLOSC_PR = '" + BILLOSC_PR + "'";
			sql += ", BBP_BILLOSD_PR = '" + BILLOSD_PR + "'";
			sql += ", BBP_BILLFIR_PR = '" + BILLFIR_PR + "'";
			sql += ", BBP_BILLSED_PR = '" + BILLSED_PR + "'";
			sql += ", BBP_BILLCAN_PR = '" + BILLCAN_PR + "'";
			sql += ", BBP_BILLCANFN_PR = '" + BILLCANFN_PR + "'";
			sql += ", BBP_BILLORAL_PR = '" + BILLORAL_PR + "'";
			sql += ", BBP_BILL_NO = '" + BILL_NO + "'";
			sql += ", BBP_BILBE_NO = '" + BILBE_NO + "'";
			sql += ", BBP_MODI_DTT = SYSDATE";
			sql += ", BBP_MODI_ID = '" + USER_ID + "'";
			sql += ", BBP_ADDSUB_RSN = '" + ADDSUB_RSN + "'";
			sql += " WHERE BBP_EXAM_DT = '" + EXAM_DT + "'";
			sql += " AND BBP_EXAM_SQ = '" + EXAM_SQ + "'";
			sql += " AND BBP_CHUNG_KD = '" + CHUNG_KD + "'";

			argStmtExec.executeUpdate(sql);

		} catch (Exception e) {

			throw new FuncException(e.toString(), sql);
		}

		return sql;
	}
%>
