<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%!
	public String func_uManage_Finding_Apply_ufSave_001(Statement argStmtExec, HashMap argHtMethod) throws Exception {

		String sql = "";
		String sql2 = "";
		String sql_disp = "";

		try {

			String SMODE = (String) argHtMethod.get("SMODE");
			String RSLT_CD = (String) argHtMethod.get("RSLT_CD");
			String TITLE_NM = (String) argHtMethod.get("TITLE_NM");
			String RSLT_EX = (String) argHtMethod.get("RSLT_EX");
			String ITEM_CD1 = (String) argHtMethod.get("ITEM_CD1");
			String ITEM_CD2 = (String) argHtMethod.get("ITEM_CD2");
			String ITEM_CD3 = (String) argHtMethod.get("ITEM_CD3");
			String ITEM_CD4 = (String) argHtMethod.get("ITEM_CD4");
			String PART_CD = (String) argHtMethod.get("PART_CD");
			String SUB_CD = (String) argHtMethod.get("SUB_CD");
			String USE_YN = (String) argHtMethod.get("USE_YN");
			String NUSE_ID = (String) argHtMethod.get("NUSE_ID");
			String USER_ID = (String) argHtMethod.get("USER_ID");

			//
			if(SMODE == null) { SMODE = ""; }
			if(RSLT_CD == null) { RSLT_CD = ""; }
			if(TITLE_NM == null) { TITLE_NM = ""; }
			if(RSLT_EX == null) { RSLT_EX = ""; }
			if(ITEM_CD1 == null) { ITEM_CD1 = ""; }
			if(ITEM_CD2 == null) { ITEM_CD2 = ""; }
			if(ITEM_CD3 == null) { ITEM_CD3 = ""; }
			if(ITEM_CD4 == null) { ITEM_CD4 = ""; }
			if(PART_CD == null) { PART_CD = ""; }
			if(SUB_CD == null) { SUB_CD = ""; }
			if(USE_YN == null) { USE_YN = ""; }
			if(NUSE_ID == null) { NUSE_ID = ""; }
			if(USER_ID == null) { USER_ID = ""; }

			//
			SMODE = CTr.Replace(SMODE, "'", "''");
			RSLT_CD = CTr.Replace(RSLT_CD, "'", "''");
			TITLE_NM = CTr.Replace(TITLE_NM, "'", "''");
			RSLT_EX = CTr.Replace(RSLT_EX, "'", "''");
			ITEM_CD1 = CTr.Replace(ITEM_CD1, "'", "''");
			ITEM_CD2 = CTr.Replace(ITEM_CD2, "'", "''");
			ITEM_CD3 = CTr.Replace(ITEM_CD3, "'", "''");
			ITEM_CD4 = CTr.Replace(ITEM_CD4, "'", "''");
			PART_CD = CTr.Replace(PART_CD, "'", "''");
			SUB_CD = CTr.Replace(SUB_CD, "'", "''");
			USE_YN = CTr.Replace(USE_YN, "'", "''");
			NUSE_ID = CTr.Replace(NUSE_ID, "'", "''");
			USER_ID = CTr.Replace(USER_ID, "'", "''");

			if(SMODE.equals("I")) {
				sql = "INSERT INTO IT_FINDING ( IFG_RSLT_CD , IFG_TITLE_NM , IFG_RSLT_EX , IFG_ITEM_CD1 , IFG_ITEM_CD2 , IFG_ITEM_CD3 , IFG_ITEM_CD4 , IFG_PART_CD , IFG_SUB_CD , IFG_USE_YN , IFG_NUSE_ID , IFG_NUSE_DTT , IFG_INPT_ID , IFG_INPT_DTT ) VALUES (";
				sql += "  '" + RSLT_CD + "'";
				sql += ", '" + TITLE_NM + "'";
				sql += ", '" + RSLT_EX + "'";
				sql += ", '" + ITEM_CD1 + "'";
				sql += ", '" + ITEM_CD2 + "'";
				sql += ", '" + ITEM_CD3 + "'";
				sql += ", '" + ITEM_CD4 + "'";
				sql += ", '" + PART_CD + "'";
				sql += ", '" + SUB_CD + "'";
				sql += ", '" + USE_YN + "'";
				sql += ", '" + NUSE_ID + "'";
				sql += ", SYSDATE";
				sql += ", '" + USER_ID + "'";
				sql += ", SYSDATE";
				sql += ")";

				argStmtExec.executeUpdate(sql);

			} else if(SMODE.equals("M")) {
				sql = "UPDATE IT_FINDING SET ";
				sql += "  IFG_TITLE_NM = '" + TITLE_NM + "'";
				sql += ", IFG_RSLT_EX = '" + RSLT_EX + "'";
				sql += ", IFG_ITEM_CD1 = '" + ITEM_CD1 + "'";
				sql += ", IFG_ITEM_CD2 = '" + ITEM_CD2 + "'";
				sql += ", IFG_ITEM_CD3 = '" + ITEM_CD3 + "'";
				sql += ", IFG_ITEM_CD4 = '" + ITEM_CD4 + "'";
				sql += ", IFG_PART_CD = '" + PART_CD + "'";
				sql += ", IFG_SUB_CD = '" + SUB_CD + "'";
				sql += ", IFG_USE_YN = '" + USE_YN + "'";
				sql += ", IFG_NUSE_ID = '" + NUSE_ID + "'";
				sql += ", IFG_NUSE_DTT = SYSDATE";
				sql += ", IFG_MODI_ID = '" + USER_ID + "'";
				sql += ", IFG_MODI_DTT = SYSDATE";
				sql += " WHERE IFG_RSLT_CD = '" + RSLT_CD + "'";

				argStmtExec.executeUpdate(sql);

			}
		} catch (Exception e) {

			throw new FuncException(e.toString(), sql);
		}

		return sql;
	}
%>
