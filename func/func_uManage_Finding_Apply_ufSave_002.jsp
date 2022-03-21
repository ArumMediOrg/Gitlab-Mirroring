<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%!
	public String func_uManage_Finding_Apply_ufSave_002(Statement argStmtExec, HashMap argHtMethod) throws Exception {

		String sql = "";
		String sql2 = "";
		String sql_disp = "";

		try {

			String TITLE_NM = (String) argHtMethod.get("TITLE_NM");
			String RSLT_EX = (String) argHtMethod.get("RSLT_EX");
			String ERSLT_EX = (String) argHtMethod.get("ERSLT_EX");
			String CRSLT_EX = (String) argHtMethod.get("CRSLT_EX");
			String RRSLT_EX = (String) argHtMethod.get("RRSLT_EX");
			String JRSLT_EX = (String) argHtMethod.get("JRSLT_EX");
			String ITEM_CD1 = (String) argHtMethod.get("ITEM_CD1");
			String ITEM_CD2 = (String) argHtMethod.get("ITEM_CD2");
			String ITEM_CD3 = (String) argHtMethod.get("ITEM_CD3");
			String ITEM_CD4 = (String) argHtMethod.get("ITEM_CD4");
			String PART_CD = (String) argHtMethod.get("PART_CD");
			String SUB_CD = (String) argHtMethod.get("SUB_CD");
			String USE_YN = (String) argHtMethod.get("USE_YN");
			String COMM_YN = (String) argHtMethod.get("COMM_YN");
			String SUB2_CD = (String) argHtMethod.get("SUB2_CD");
			String RSLT_PANJ = (String) argHtMethod.get("RSLT_PANJ");
			String MODI_ID = (String) argHtMethod.get("MODI_ID");
			String RGPIFG_USE_YN = (String) argHtMethod.get("RGPIFG_USE_YN");
			String NUSE_ID = (String) argHtMethod.get("NUSE_ID");
			String RSLT_CD = (String) argHtMethod.get("RSLT_CD");

			//
			if(TITLE_NM == null) { TITLE_NM = ""; }
			if(RSLT_EX == null) { RSLT_EX = ""; }
			if(ERSLT_EX == null) { ERSLT_EX = ""; }
			if(CRSLT_EX == null) { CRSLT_EX = ""; }
			if(RRSLT_EX == null) { RRSLT_EX = ""; }
			if(JRSLT_EX == null) { JRSLT_EX = ""; }
			if(ITEM_CD1 == null) { ITEM_CD1 = ""; }
			if(ITEM_CD2 == null) { ITEM_CD2 = ""; }
			if(ITEM_CD3 == null) { ITEM_CD3 = ""; }
			if(ITEM_CD4 == null) { ITEM_CD4 = ""; }
			if(PART_CD == null) { PART_CD = ""; }
			if(SUB_CD == null) { SUB_CD = ""; }
			if(USE_YN == null) { USE_YN = ""; }
			if(COMM_YN == null) { COMM_YN = ""; }
			if(SUB2_CD == null) { SUB2_CD = ""; }
			if(RSLT_PANJ == null) { RSLT_PANJ = ""; }
			if(MODI_ID == null) { MODI_ID = ""; }
			if(RGPIFG_USE_YN == null) { RGPIFG_USE_YN = ""; }
			if(NUSE_ID == null) { NUSE_ID = ""; }
			if(RSLT_CD == null) { RSLT_CD = ""; }

			//
			TITLE_NM = CTr.Replace(TITLE_NM, "'", "''");
			RSLT_EX = CTr.Replace(RSLT_EX, "'", "''");
			ERSLT_EX = CTr.Replace(ERSLT_EX, "'", "''");
			CRSLT_EX = CTr.Replace(CRSLT_EX, "'", "''");
			RRSLT_EX = CTr.Replace(RRSLT_EX, "'", "''");
			JRSLT_EX = CTr.Replace(JRSLT_EX, "'", "''");
			ITEM_CD1 = CTr.Replace(ITEM_CD1, "'", "''");
			ITEM_CD2 = CTr.Replace(ITEM_CD2, "'", "''");
			ITEM_CD3 = CTr.Replace(ITEM_CD3, "'", "''");
			ITEM_CD4 = CTr.Replace(ITEM_CD4, "'", "''");
			PART_CD = CTr.Replace(PART_CD, "'", "''");
			SUB_CD = CTr.Replace(SUB_CD, "'", "''");
			USE_YN = CTr.Replace(USE_YN, "'", "''");
			COMM_YN = CTr.Replace(COMM_YN, "'", "''");
			SUB2_CD = CTr.Replace(SUB2_CD, "'", "''");
			RSLT_PANJ = CTr.Replace(RSLT_PANJ, "'", "''");
			MODI_ID = CTr.Replace(MODI_ID, "'", "''");
			RGPIFG_USE_YN = CTr.Replace(RGPIFG_USE_YN, "'", "''");
			NUSE_ID = CTr.Replace(NUSE_ID, "'", "''");
			RSLT_CD = CTr.Replace(RSLT_CD, "'", "''");

			sql = "UPDATE IT_FINDING SET ";
			sql += "  IFG_TITLE_NM = '" + TITLE_NM + "'";
			sql += ", IFG_RSLT_EX = '" + RSLT_EX + "'";
			sql += ", IFG_ERSLT_EX = '" + ERSLT_EX + "'";
			sql += ", IFG_CRSLT_EX = '" + CRSLT_EX + "'";
			sql += ", IFG_RRSLT_EX = '" + RRSLT_EX + "'";
			sql += ", IFG_JRSLT_EX = '" + JRSLT_EX + "'";
			sql += ", IFG_ITEM_CD1 = '" + ITEM_CD1 + "'";
			sql += ", IFG_ITEM_CD2 = '" + ITEM_CD2 + "'";
			sql += ", IFG_ITEM_CD3 = '" + ITEM_CD3 + "'";
			sql += ", IFG_ITEM_CD4 = '" + ITEM_CD4 + "'";
			sql += ", IFG_PART_CD = '" + PART_CD + "'";
			sql += ", IFG_SUB_CD = '" + SUB_CD + "'";
			sql += ", IFG_USE_YN = '" + USE_YN + "'";
			sql += ", IFG_COMM_YN = '" + COMM_YN + "'";
			sql += ", IFG_SUB2_CD = '" + SUB2_CD + "'";
			sql += ", IFG_RSLT_PANJ = '" + RSLT_PANJ + "'";
			sql += ", IFG_MODI_ID = '" + MODI_ID + "'";
			sql += ", IFG_MODI_DTT = SYSDATE";

			if(RGPIFG_USE_YN.equals("1")) {
    			sql += ", IFG_NUSE_ID = '" + NUSE_ID + "'";
    			sql += ", IFG_NUSE_DTT = SYSDATE";
			} else {
    			sql += ", IFG_NUSE_ID = ''";
    			sql += ", IFG_NUSE_DTT = NULL";
			}

			sql += " WHERE IFG_RSLT_CD = '" + RSLT_CD + "'";

			argStmtExec.executeUpdate(sql);

		} catch (Exception e) {

			throw new FuncException(e.toString(), sql);
		}

		return sql;
	}
%>
