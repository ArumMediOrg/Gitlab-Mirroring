<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%!
	public String func_uCOMP_AGEA_TRNS_OKBtnClick_004(Statement argStmtExec, HashMap argHtMethod) throws Exception {

		String sql = "";
		String sql2 = "";
		String sql_disp = "";

		try {

			String COMP_CD = (String) argHtMethod.get("COMP_CD");
			String MNGT_YR = (String) argHtMethod.get("MNGT_YR");
			String AGEA_KD = (String) argHtMethod.get("AGEA_KD");
			String ITEM_CD = (String) argHtMethod.get("ITEM_CD");
			String AGEA_PR = (String) argHtMethod.get("AGEA_PR");
			String ITEM_PR = (String) argHtMethod.get("ITEM_PR");
			String REF1_NM = (String) argHtMethod.get("REF1_NM");
			String REF1_TX = (String) argHtMethod.get("REF1_TX");
			String USE_YN = (String) argHtMethod.get("USE_YN");
			String USER_ID = (String) argHtMethod.get("USER_ID");

			//
			if(COMP_CD == null) { COMP_CD = ""; }
			if(MNGT_YR == null) { MNGT_YR = ""; }
			if(AGEA_KD == null) { AGEA_KD = ""; }
			if(ITEM_CD == null) { ITEM_CD = ""; }
			if(AGEA_PR == null) { AGEA_PR = ""; }
			if(ITEM_PR == null) { ITEM_PR = ""; }
			if(REF1_NM == null) { REF1_NM = ""; }
			if(REF1_TX == null) { REF1_TX = ""; }
			if(USE_YN == null) { USE_YN = ""; }
			if(USER_ID == null) { USER_ID = ""; }

			//
			COMP_CD = CTr.Replace(COMP_CD, "'", "''");
			MNGT_YR = CTr.Replace(MNGT_YR, "'", "''");
			AGEA_KD = CTr.Replace(AGEA_KD, "'", "''");
			ITEM_CD = CTr.Replace(ITEM_CD, "'", "''");
			AGEA_PR = CTr.Replace(AGEA_PR, "'", "''");
			ITEM_PR = CTr.Replace(ITEM_PR, "'", "''");
			REF1_NM = CTr.Replace(REF1_NM, "'", "''");
			REF1_TX = CTr.Replace(REF1_TX, "'", "''");
			USE_YN = CTr.Replace(USE_YN, "'", "''");
			USER_ID = CTr.Replace(USER_ID, "'", "''");

			sql = "INSERT INTO ET_COMP_AGEA (ECA_COMP_CD, ECA_MNGT_YR, ECA_AGEA_KD, ECA_ITEM_CD, ECA_AGEA_PR, ECA_ITEM_PR, ECA_REF1_NM ,ECA_REF1_TX, ECA_USE_YN, ECA_INPT_ID, ECA_INPT_DTT, ECA_TRNS_ID, ECA_TRNS_DTT) VALUES (";
			sql += "  '" + COMP_CD + "'";
			sql += ", '" + MNGT_YR + "'";
			sql += ", '" + AGEA_KD + "'";
			sql += ", '" + ITEM_CD + "'";
			sql += ", '" + AGEA_PR + "'";
			sql += ", '" + ITEM_PR + "'";
			sql += ", '" + REF1_NM + "'";
			sql += ", '" + REF1_TX + "'";
			sql += ", '" + USE_YN + "'";
			sql += ", '" + USER_ID + "'";
			sql += ", SYSDATE";
			sql += ", '" + USER_ID + "'";
			sql += ", SYSDATE";
			sql += ")";

			argStmtExec.executeUpdate(sql);

		} catch (Exception e) {

			throw new FuncException(e.toString(), sql);
		}

		return sql;
	}
%>
