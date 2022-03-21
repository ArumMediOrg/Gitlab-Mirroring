<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%!
	public String func_uManage_Finding_Apply_ufSave_001_V0002(Statement argStmtExec, HashMap argHtMethod) throws Exception {

		String sql = "";
		String sql2 = "";
		String sql_disp = "";

		try {

			String RSLT_CD = (String) argHtMethod.get("RSLT_CD");
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
			String INPT_ID = (String) argHtMethod.get("INPT_ID");
			String RGPIFG_USE_YN = (String) argHtMethod.get("RGPIFG_USE_YN");
			String NUSE_ID = (String) argHtMethod.get("NUSE_ID");

			//
			if(RSLT_CD == null) { RSLT_CD = ""; }
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
			if(INPT_ID == null) { INPT_ID = ""; }
			if(RGPIFG_USE_YN == null) { RGPIFG_USE_YN = ""; }
			if(NUSE_ID == null) { NUSE_ID = ""; }

			//
			RSLT_CD = CTr.Replace(RSLT_CD, "'", "''");
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
			INPT_ID = CTr.Replace(INPT_ID, "'", "''");
			RGPIFG_USE_YN = CTr.Replace(RGPIFG_USE_YN, "'", "''");
			NUSE_ID = CTr.Replace(NUSE_ID, "'", "''");

			sql = "INSERT INTO IT_FINDING (IFG_RSLT_CD, IFG_TITLE_NM, IFG_RSLT_EX, IFG_ERSLT_EX, IFG_CRSLT_EX, IFG_RRSLT_EX, IFG_JRSLT_EX, IFG_ITEM_CD1, IFG_ITEM_CD2, IFG_ITEM_CD3, IFG_ITEM_CD4, IFG_PART_CD, IFG_SUB_CD, IFG_USE_YN, IFG_COMM_YN, IFG_SUB2_CD, IFG_RSLT_PANJ, IFG_INPT_ID, IFG_INPT_DTT, IFG_NUSE_ID, IFG_NUSE_DTT) VALUES (";
			sql += "  '" + RSLT_CD + "'";
			sql += ", '" + TITLE_NM + "'";
			sql += ", '" + RSLT_EX + "'";
			sql += ", '" + ERSLT_EX + "'";
			sql += ", '" + CRSLT_EX + "'";
			sql += ", '" + RRSLT_EX + "'";
			sql += ", '" + JRSLT_EX + "'";
			sql += ", '" + ITEM_CD1 + "'";
			sql += ", '" + ITEM_CD2 + "'";
			sql += ", '" + ITEM_CD3 + "'";
			sql += ", '" + ITEM_CD4 + "'";
			sql += ", '" + PART_CD + "'";
			sql += ", '" + SUB_CD + "'";
			sql += ", '" + USE_YN + "'";
			sql += ", '" + COMM_YN + "'";
			sql += ", '" + SUB2_CD + "'";
			sql += ", '" + RSLT_PANJ + "'";
			sql += ", '" + INPT_ID + "'";
			sql += ", SYSDATE";
			if(RGPIFG_USE_YN.equals("1")) {
				sql += ", '" + NUSE_ID + "'";
				sql += ", SYSDATE)";
			}
			else {
				sql += ", '', NULL)";

			}			

			argStmtExec.executeUpdate(sql);
		} catch (Exception e) {

			throw new FuncException(e.toString(), sql);
		}

		return sql;
	}
%>
