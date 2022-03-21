<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%!
	public String func_uBT_ESTI_AGEA_APPLY_UP_Save_002(Statement argStmtExec, HashMap argHtMethod) throws Exception {

		String sql = "";
		String sql2 = "";
		String sql_disp = "";

		try {

			String MNGT_YR = (String) argHtMethod.get("MNGT_YR");
			String ESTI_CD = (String) argHtMethod.get("ESTI_CD");
			String ITEM_CD = (String) argHtMethod.get("ITEM_CD");
			String ITEM_PR = (String) argHtMethod.get("ITEM_PR");
			String AGEA_PR = (String) argHtMethod.get("AGEA_PR");
			String INPT_ID = (String) argHtMethod.get("INPT_ID");

			//
			if(MNGT_YR == null) { MNGT_YR = ""; }
			if(ESTI_CD == null) { ESTI_CD = ""; }
			if(ITEM_CD == null) { ITEM_CD = ""; }
			if(ITEM_PR == null) { ITEM_PR = ""; }
			if(AGEA_PR == null) { AGEA_PR = ""; }
			if(INPT_ID == null) { INPT_ID = ""; }

			//
			MNGT_YR = CTr.Replace(MNGT_YR, "'", "''");
			ESTI_CD = CTr.Replace(ESTI_CD, "'", "''");
			ITEM_CD = CTr.Replace(ITEM_CD, "'", "''");
			ITEM_PR = CTr.Replace(ITEM_PR, "'", "''");
			AGEA_PR = CTr.Replace(AGEA_PR, "'", "''");
			INPT_ID = CTr.Replace(INPT_ID, "'", "''");

			sql = "INSERT INTO BT_ESTI_AGEA (BEA_MNGT_YR, BEA_ESTI_CD, BEA_ITEM_CD, BEA_ITEM_PR, BEA_AGEA_PR, BEA_INPT_ID, BEA_INPT_DTT) VALUES (";
			sql += "  '" + MNGT_YR + "'";
			sql += ", '" + ESTI_CD + "'";
			sql += ", '" + ITEM_CD + "'";
			sql += ", '" + ITEM_PR + "'";
			sql += ", '" + AGEA_PR + "'";
			sql += ", '" + INPT_ID + "'";
			sql += ", SYSDATE";
			sql += ")";

			argStmtExec.executeUpdate(sql);

		} catch (Exception e) {

			throw new FuncException(e.toString(), sql);
		}

		return sql;
	}
%>
