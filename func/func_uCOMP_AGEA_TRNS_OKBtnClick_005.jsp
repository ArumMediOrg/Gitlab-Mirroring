<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%!
	public String func_uCOMP_AGEA_TRNS_OKBtnClick_005(Statement argStmtExec, HashMap argHtMethod) throws Exception {

		String sql = "";
		String sql2 = "";
		String sql_disp = "";

		try {

			String VCOMP_CD = (String) argHtMethod.get("VCOMP_CD");
			String VMNGT_YR = (String) argHtMethod.get("VMNGT_YR");
			String USER_ID = (String) argHtMethod.get("USER_ID");
			String COMP_CD = (String) argHtMethod.get("COMP_CD");
			String MNGT_YR = (String) argHtMethod.get("MNGT_YR");
			String USE_YN = (String) argHtMethod.get("USE_YN");

			//
			if(VCOMP_CD == null) { VCOMP_CD = ""; }
			if(VMNGT_YR == null) { VMNGT_YR = ""; }
			if(USER_ID == null) { USER_ID = ""; }
			if(COMP_CD == null) { COMP_CD = ""; }
			if(MNGT_YR == null) { MNGT_YR = ""; }
			if(USE_YN == null) { USE_YN = ""; }

			//
			VCOMP_CD = CTr.Replace(VCOMP_CD, "'", "''");
			VMNGT_YR = CTr.Replace(VMNGT_YR, "'", "''");
			USER_ID = CTr.Replace(USER_ID, "'", "''");
			COMP_CD = CTr.Replace(COMP_CD, "'", "''");
			MNGT_YR = CTr.Replace(MNGT_YR, "'", "''");
			USE_YN = CTr.Replace(USE_YN, "'", "''");

			sql = "INSERT INTO ET_COMP_AGEA (ECA_COMP_CD, ECA_MNGT_YR, ECA_AGEA_KD, ECA_ITEM_CD, ECA_AGEA_PR, ECA_ITEM_PR, ECA_REF1_NM ,ECA_REF1_TX, ECA_USE_YN, ECA_INPT_ID, ECA_INPT_DTT, ECA_TRNS_ID, ECA_TRNS_DTT)";
			sql += " SELECT ";
			sql += "  '" + VCOMP_CD + "'";
			sql += ", '" + VMNGT_YR + "'";
			sql += ", ECA_AGEA_KD";
			sql += ", ECA_ITEM_CD";
			sql += ", ECA_AGEA_PR";
			sql += ", ECA_ITEM_PR";
			sql += ", ECA_REF1_NM";
			sql += ", ECA_REF1_TX";
			sql += ", ECA_USE_YN";
			sql += ", '" + USER_ID + "'";
			sql += ", SYSDATE";
			sql += ", '" + USER_ID + "'";
			sql += ", SYSDATE";
			sql += " FROM ET_COMP_AGEA";
			sql += " WHERE ECA_COMP_CD = '" + COMP_CD  + "'";
			sql += " AND ECA_MNGT_YR = '" + MNGT_YR  + "'";
			sql += " AND ECA_USE_YN = '" + USE_YN + "'";

			argStmtExec.executeUpdate(sql);

		} catch (Exception e) {

			throw new FuncException(e.toString(), sql);
		}

		return sql;
	}
%>
