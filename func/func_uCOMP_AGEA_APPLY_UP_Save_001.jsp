<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%!
	public String func_uCOMP_AGEA_APPLY_UP_Save_001(Statement argStmtExec, HashMap argHtMethod) throws Exception {

		String sql = "";
		String sql2 = "";
		String sql_disp = "";

		try {

			String SMODE = (String) argHtMethod.get("SMODE");
			String AGEA_PR = (String) argHtMethod.get("AGEA_PR");
			String ITEM_PR = (String) argHtMethod.get("ITEM_PR");
			String REF1_NM = (String) argHtMethod.get("REF1_NM");
			String REF1_TX = (String) argHtMethod.get("REF1_TX");
			String USE_YN = (String) argHtMethod.get("USE_YN");
			String USER_ID = (String) argHtMethod.get("USER_ID");
			String COMP_CD = (String) argHtMethod.get("COMP_CD");
			String MNGT_YR = (String) argHtMethod.get("MNGT_YR");
			String ITEM_CD = (String) argHtMethod.get("ITEM_CD");
			String SORT_SQ = (String) argHtMethod.get("SORT_SQ");

			//
			if(SMODE == null) { SMODE = ""; }
			if(AGEA_PR == null) { AGEA_PR = ""; }
			if(ITEM_PR == null) { ITEM_PR = ""; }
			if(REF1_NM == null) { REF1_NM = ""; }
			if(REF1_TX == null) { REF1_TX = ""; }
			if(USE_YN == null) { USE_YN = ""; }
			if(USER_ID == null) { USER_ID = ""; }
			if(COMP_CD == null) { COMP_CD = ""; }
			if(MNGT_YR == null) { MNGT_YR = ""; }
			if(ITEM_CD == null) { ITEM_CD = ""; }
			if(SORT_SQ == null) { SORT_SQ = ""; }

			//
			SMODE = CTr.Replace(SMODE, "'", "''");
			AGEA_PR = CTr.Replace(AGEA_PR, "'", "''");
			ITEM_PR = CTr.Replace(ITEM_PR, "'", "''");
			REF1_NM = CTr.Replace(REF1_NM, "'", "''");
			REF1_TX = CTr.Replace(REF1_TX, "'", "''");
			USE_YN = CTr.Replace(USE_YN, "'", "''");
			USER_ID = CTr.Replace(USER_ID, "'", "''");
			COMP_CD = CTr.Replace(COMP_CD, "'", "''");
			MNGT_YR = CTr.Replace(MNGT_YR, "'", "''");
			ITEM_CD = CTr.Replace(ITEM_CD, "'", "''");
			SORT_SQ = CTr.Replace(SORT_SQ, "'", "''");

			if(SMODE.equals("Q")) {
				sql = "UPDATE ET_COMP_AGEA SET ";
				sql += "  ECA_AGEA_PR = '" + AGEA_PR + "'";
				sql += ", ECA_ITEM_PR = '" + ITEM_PR + "'";
				sql += ", ECA_REF1_NM = '" + REF1_NM + "'";
				sql += ", ECA_REF1_TX = '" + REF1_TX + "'";
				sql += ", ECA_USE_YN = '" + USE_YN + "'";
				sql += ", ECA_NUSE_ID = '" + USER_ID + "'";
				sql += ", ECA_NUSE_DTT = SYSDATE";
				sql += ", ECA_MODI_ID = '" + USER_ID + "'";
				sql += ", ECA_MODI_DTT = SYSDATE";
				sql += ", ECA_SORT_SQ = '" + SORT_SQ + "'";
				sql += " WHERE ECA_COMP_CD = '" + COMP_CD + "'";
				sql += " AND ECA_MNGT_YR = '" + MNGT_YR + "'";
				sql += " AND ECA_AGEA_KD = '1'";
				sql += " AND ECA_ITEM_CD = '" + ITEM_CD + "'";

				argStmtExec.executeUpdate(sql);
			}
			else if(SMODE.equals("I")) {
				sql = "INSERT INTO ET_COMP_AGEA (ECA_COMP_CD, ECA_MNGT_YR, ECA_AGEA_KD, ECA_ITEM_CD, ECA_AGEA_PR, ECA_ITEM_PR, ECA_REF1_NM ,ECA_REF1_TX, ECA_USE_YN, ECA_INPT_ID, ECA_INPT_DTT, ECA_NUSE_ID, ECA_NUSE_DTT, ECA_SORT_SQ) VALUES (";
				sql += "  '" + COMP_CD + "'";
				sql += ", '" + MNGT_YR + "'";
				sql += ", '1'";
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
				sql += ", '" + SORT_SQ + "'";
				sql += ")";

				argStmtExec.executeUpdate(sql);
			}
		} catch (Exception e) {

			throw new FuncException(e.toString(), sql);
		}

		return sql;
	}
%>
