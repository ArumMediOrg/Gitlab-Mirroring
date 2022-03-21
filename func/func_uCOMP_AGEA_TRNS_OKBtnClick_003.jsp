<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%!
	public String func_uCOMP_AGEA_TRNS_OKBtnClick_003(Statement argStmtExec, HashMap argHtMethod) throws Exception {

		String sql = "";
		String sql2 = "";
		String sql_disp = "";

		try {

			String AGEA_PR = (String) argHtMethod.get("AGEA_PR");
			String ITEM_PR = (String) argHtMethod.get("ITEM_PR");
			String REF1_NM = (String) argHtMethod.get("REF1_NM");
			String REF1_TX = (String) argHtMethod.get("REF1_TX");
			String USER_ID = (String) argHtMethod.get("USER_ID");
			String COMP_CD = (String) argHtMethod.get("COMP_CD");
			String MNGT_YR = (String) argHtMethod.get("MNGT_YR");
			String ITEM_CD = (String) argHtMethod.get("ITEM_CD");

			//
			if(AGEA_PR == null) { AGEA_PR = ""; }
			if(ITEM_PR == null) { ITEM_PR = ""; }
			if(REF1_NM == null) { REF1_NM = ""; }
			if(REF1_TX == null) { REF1_TX = ""; }
			if(USER_ID == null) { USER_ID = ""; }
			if(COMP_CD == null) { COMP_CD = ""; }
			if(MNGT_YR == null) { MNGT_YR = ""; }
			if(ITEM_CD == null) { ITEM_CD = ""; }

			//
			AGEA_PR = CTr.Replace(AGEA_PR, "'", "''");
			ITEM_PR = CTr.Replace(ITEM_PR, "'", "''");
			REF1_NM = CTr.Replace(REF1_NM, "'", "''");
			REF1_TX = CTr.Replace(REF1_TX, "'", "''");
			USER_ID = CTr.Replace(USER_ID, "'", "''");
			COMP_CD = CTr.Replace(COMP_CD, "'", "''");
			MNGT_YR = CTr.Replace(MNGT_YR, "'", "''");
			ITEM_CD = CTr.Replace(ITEM_CD, "'", "''");

			sql = "UPDATE ET_COMP_AGEA SET ";
			sql += "  ECA_AGEA_PR = '" + AGEA_PR + "'";
			sql += ", ECA_ITEM_PR = '" + ITEM_PR + "'";
			sql += ", ECA_REF1_NM = '" + REF1_NM + "'";
			sql += ", ECA_REF1_TX = '" + REF1_TX + "'";
			sql += ", ECA_USE_YN = 'Y'";
			sql += ", ECA_MODI_ID = '" + USER_ID + "'";
			sql += ", ECA_MODI_DTT = SYSDATE";
			sql += ", ECA_TRNS_ID = '" + USER_ID + "'";
			sql += ", ECA_TRNS_DTT = SYSDATE";
			sql += " WHERE ECA_COMP_CD = '" + COMP_CD + "'";
			sql += " AND ECA_MNGT_YR = '" + MNGT_YR + "'";
			sql += " AND ECA_ITEM_CD = '" + ITEM_CD + "'";

			argStmtExec.executeUpdate(sql);

		} catch (Exception e) {

			throw new FuncException(e.toString(), sql);
		}

		return sql;
	}
%>
