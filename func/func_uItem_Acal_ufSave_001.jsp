<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%!
	public String func_uItem_Acal_ufSave_001(Statement argStmtExec, HashMap argHtMethod) throws Exception {

		String sql = "";
		String sql2 = "";
		String sql_disp = "";

		try {

			String SMODE = (String) argHtMethod.get("SMODE");
			String APLY_DT = (String) argHtMethod.get("APLY_DT");
			String ITEM_CD = (String) argHtMethod.get("ITEM_CD");
			String AGE_FR = (String) argHtMethod.get("AGE_FR");
			String AGE_TO = (String) argHtMethod.get("AGE_TO");
			String SEX_CD = (String) argHtMethod.get("SEX_CD");
			String PRE_CD1 = (String) argHtMethod.get("PRE_CD1");
			String PRE_CD2 = (String) argHtMethod.get("PRE_CD2");
			String PRE_CD3 = (String) argHtMethod.get("PRE_CD3");
			String PRE_CD4 = (String) argHtMethod.get("PRE_CD4");
			String PRE_CD5 = (String) argHtMethod.get("PRE_CD5");
			String PRE_CD6 = (String) argHtMethod.get("PRE_CD6");
			String ACAL_NM = (String) argHtMethod.get("ACAL_NM");
			String USE_YN = (String) argHtMethod.get("USE_YN");
			String USER = (String) argHtMethod.get("USER");
			String UAPLY_DT = (String) argHtMethod.get("UAPLY_DT");

			//
			if(SMODE == null) { SMODE = ""; }
			if(APLY_DT == null) { APLY_DT = ""; }
			if(ITEM_CD == null) { ITEM_CD = ""; }
			if(AGE_FR == null) { AGE_FR = ""; }
			if(AGE_TO == null) { AGE_TO = ""; }
			if(SEX_CD == null) { SEX_CD = ""; }
			if(PRE_CD1 == null) { PRE_CD1 = ""; }
			if(PRE_CD2 == null) { PRE_CD2 = ""; }
			if(PRE_CD3 == null) { PRE_CD3 = ""; }
			if(PRE_CD4 == null) { PRE_CD4 = ""; }
			if(PRE_CD5 == null) { PRE_CD5 = ""; }
			if(PRE_CD6 == null) { PRE_CD6 = ""; }
			if(ACAL_NM == null) { ACAL_NM = ""; }
			if(USE_YN == null) { USE_YN = ""; }
			if(USER == null) { USER = ""; }
			if(UAPLY_DT == null) { UAPLY_DT = ""; }

			//
			SMODE = CTr.Replace(SMODE, "'", "''");
			APLY_DT = CTr.Replace(APLY_DT, "'", "''");
			ITEM_CD = CTr.Replace(ITEM_CD, "'", "''");
			AGE_FR = CTr.Replace(AGE_FR, "'", "''");
			AGE_TO = CTr.Replace(AGE_TO, "'", "''");
			SEX_CD = CTr.Replace(SEX_CD, "'", "''");
			PRE_CD1 = CTr.Replace(PRE_CD1, "'", "''");
			PRE_CD2 = CTr.Replace(PRE_CD2, "'", "''");
			PRE_CD3 = CTr.Replace(PRE_CD3, "'", "''");
			PRE_CD4 = CTr.Replace(PRE_CD4, "'", "''");
			PRE_CD5 = CTr.Replace(PRE_CD5, "'", "''");
			PRE_CD6 = CTr.Replace(PRE_CD6, "'", "''");
			ACAL_NM = CTr.Replace(ACAL_NM, "'", "''");
			USE_YN = CTr.Replace(USE_YN, "'", "''");
			USER = CTr.Replace(USER, "'", "''");
			UAPLY_DT = CTr.Replace(UAPLY_DT, "'", "''");

			if(SMODE.equals("INSERT")) {

				sql = "INSERT INTO IT_ITEM_ACAL ( IIA_APLY_DT , IIA_ITEM_CD , IIA_AGE_FR , IIA_AGE_TO , IIA_SEX_CD , IIA_PRE_CD1 , IIA_PRE_CD2 , IIA_PRE_CD3 , IIA_PRE_CD4 , IIA_PRE_CD5 , IIA_PRE_CD6 , IIA_ACAL_NM , IIA_USE_YN , IIA_INPT_ID , IIA_INPT_DTT ) VALUES (";
				sql += "  '" + APLY_DT + "'";
				sql += ", '" + ITEM_CD + "'";
				sql += ", '" + AGE_FR + "'";
				sql += ", '" + AGE_TO + "'";
				sql += ", '" + SEX_CD + "'";
				sql += ", '" + PRE_CD1 + "'";
				sql += ", '" + PRE_CD2 + "'";
				sql += ", '" + PRE_CD3 + "'";
				sql += ", '" + PRE_CD4 + "'";
				sql += ", '" + PRE_CD5 + "'";
				sql += ", '" + PRE_CD6 + "'";
				sql += ", '" + ACAL_NM + "'";
				sql += ", '" + USE_YN + "'";
				sql += ", '" + USER + "'";
				sql += ", SYSDATE";
				sql += ")";

				argStmtExec.executeUpdate(sql);
			}

			if(SMODE.equals("MODIFY")) {
			
				sql = "UPDATE IT_ITEM_ACAL SET ";
				sql += "  IIA_PRE_CD1 = '" + PRE_CD1 + "'";
				sql += ", IIA_APLY_DT = '" + UAPLY_DT + "'";
				sql += ", IIA_PRE_CD2 = '" + PRE_CD2 + "'";
				sql += ", IIA_PRE_CD3 = '" + PRE_CD3 + "'";
				sql += ", IIA_PRE_CD4 = '" + PRE_CD4 + "'";
				sql += ", IIA_PRE_CD5 = '" + PRE_CD5 + "'";
				sql += ", IIA_PRE_CD6 = '" + PRE_CD6 + "'";
				sql += ", IIA_ACAL_NM = '" + ACAL_NM + "'";
				sql += ", IIA_USE_YN = '" + USE_YN + "'";
				sql += ", IIA_MODI_ID = '" + USER + "'";
				sql += ", IIA_MODI_DTT = SYSDATE";
				sql += " WHERE IIA_APLY_DT = '" + APLY_DT + "'";
				sql += " AND IIA_ITEM_CD = '" + ITEM_CD + "'";
				sql += " AND IIA_AGE_FR = '" + AGE_FR + "'";
				sql += " AND IIA_AGE_TO = '" + AGE_TO + "'";
				sql += " AND IIA_SEX_CD = '" + SEX_CD + "'";

				argStmtExec.executeUpdate(sql);
			}

		} catch (Exception e) {

			throw new FuncException(e.toString(), sql);
		}

		return sql;
	}
%>
