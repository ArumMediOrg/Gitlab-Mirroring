<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%!
	public String func_UChungfile2020_JSON_UDP_UINT_CHUNGPER_002(Statement argStmtExec, HashMap argHtMethod) throws Exception {

		String sql = "";
		String sql2 = "";
		String sql_disp = "";

		try {

			String EXAM_DT = (String) argHtMethod.get("EXAM_DT");
			String EXAM_SQ = (String) argHtMethod.get("EXAM_SQ");
			String CHUNG_KD = (String) argHtMethod.get("CHUNG_KD");
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
			String BIAD_KD = (String) argHtMethod.get("BIAD_KD");
			String BILBE_NO = (String) argHtMethod.get("BILBE_NO");
			String USER_ID = (String) argHtMethod.get("USER_ID");
			String ADDSUB_RSN = (String) argHtMethod.get("ADDSUB_RSN");


			//
			if(EXAM_DT == null) { EXAM_DT = ""; }
			if(EXAM_SQ == null) { EXAM_SQ = ""; }
			if(CHUNG_KD == null) { CHUNG_KD = ""; }
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
			if(BIAD_KD == null) { BIAD_KD = ""; }
			if(BILBE_NO == null) { BILBE_NO = ""; }
			if(USER_ID == null) { USER_ID = ""; }
			if(ADDSUB_RSN == null) { ADDSUB_RSN = ""; }


			//
			EXAM_DT = CTr.Replace(EXAM_DT, "'", "''");
			EXAM_SQ = CTr.Replace(EXAM_SQ, "'", "''");
			CHUNG_KD = CTr.Replace(CHUNG_KD, "'", "''");
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
			BIAD_KD = CTr.Replace(BIAD_KD, "'", "''");
			BILBE_NO = CTr.Replace(BILBE_NO, "'", "''");
			USER_ID = CTr.Replace(USER_ID, "'", "''");
			ADDSUB_RSN = CTr.Replace(ADDSUB_RSN, "'", "''");


			sql = "INSERT INTO BT_BILLHN_PR ( BBP_EXAM_DT ,BBP_EXAM_SQ ,BBP_CHUNG_KD ,BBP_CHUNG_DT ,BBP_CHUNG_YY ,BBP_CHUNG_NO ,BBP_RETURN_KD ,BBP_BILL_HC ,BBP_BILL_FL ";
			sql += " ,BBP_BILLOS_PR ,BBP_BILLOSC_PR ,BBP_BILLOSD_PR ,BBP_BILLFIR_PR ,BBP_BILLSED_PR ,BBP_BILLCAN_PR ,BBP_BILLCANFN_PR ,BBP_BILLORAL_PR ,BBP_BILL_NO ";
			sql += " ,BBP_BIAD_KD ,BBP_BILBE_NO ,BBP_INPUT_ID ,BBP_INPUT_DTT ,BBP_MODI_DTT ,BBP_MODI_ID, BBP_ADDSUB_RSN)";
			sql += " VALUES (";
			sql += "  '" + EXAM_DT + "'";
			sql += ", '" + EXAM_SQ + "'";
			sql += ", '" + CHUNG_KD + "'";
			sql += ", '" + CHUNG_DT + "'";
			sql += ", '" + CHUNG_YY + "'";
			sql += ", '" + CHUNG_NO + "'";
			sql += ", '" + RETURN_KD + "'";
			sql += ", '" + BILL_HC + "'";
			sql += ", '" + BILL_FL + "'";
			sql += ", '" + BILLOS_PR + "'";
			sql += ", '" + BILLOSC_PR + "'";
			sql += ", '" + BILLOSD_PR + "'";
			sql += ", '" + BILLFIR_PR + "'";
			sql += ", '" + BILLSED_PR + "'";
			sql += ", '" + BILLCAN_PR + "'";
			sql += ", '" + BILLCANFN_PR + "'";
			sql += ", '" + BILLORAL_PR + "'";
			sql += ", '" + BILL_NO + "'";
			sql += ", '" + BIAD_KD + "'";
			sql += ", '" + BILBE_NO + "'";
			sql += ", '" + USER_ID + "'";
			sql += ", SYSDATE";
			sql += ", SYSDATE";
			sql += ", '" + USER_ID + "'";
			sql += ", '" + ADDSUB_RSN + "'";
			sql += ")";

			argStmtExec.executeUpdate(sql);

		} catch (Exception e) {

			throw new FuncException(e.toString(), sql);
		}

		return sql;
	}
%>
