<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%!
	public String func_uCOMPANY_PERS_APPLY_UP_Save_001(Statement argStmtExec, HashMap argHtMethod) throws Exception {

		String sql = "";
		String sql2 = "";
		String sql_disp = "";

		try {

			String SMODE = (String) argHtMethod.get("SMODE");
			String COMP_CD = (String) argHtMethod.get("COMP_CD");
			String MNGT_YR = (String) argHtMethod.get("MNGT_YR");
			String TOT_M = (String) argHtMethod.get("TOT_M");
			String TOT_F = (String) argHtMethod.get("TOT_F");
			String PROD_M = (String) argHtMethod.get("PROD_M");
			String PROD_F = (String) argHtMethod.get("PROD_F");
			String BUSI_M = (String) argHtMethod.get("BUSI_M");
			String BUSI_F = (String) argHtMethod.get("BUSI_F");
			String USER_ID = (String) argHtMethod.get("USER_ID");

			//
			if(SMODE == null) { SMODE = ""; }
			if(COMP_CD == null) { COMP_CD = ""; }
			if(MNGT_YR == null) { MNGT_YR = ""; }
			if(TOT_M == null) { TOT_M = ""; }
			if(TOT_F == null) { TOT_F = ""; }
			if(PROD_M == null) { PROD_M = ""; }
			if(PROD_F == null) { PROD_F = ""; }
			if(BUSI_M == null) { BUSI_M = ""; }
			if(BUSI_F == null) { BUSI_F = ""; }
			if(USER_ID == null) { USER_ID = ""; }

			//
			SMODE = CTr.Replace(SMODE, "'", "''");
			COMP_CD = CTr.Replace(COMP_CD, "'", "''");
			MNGT_YR = CTr.Replace(MNGT_YR, "'", "''");
			TOT_M = CTr.Replace(TOT_M, "'", "''");
			TOT_F = CTr.Replace(TOT_F, "'", "''");
			PROD_M = CTr.Replace(PROD_M, "'", "''");
			PROD_F = CTr.Replace(PROD_F, "'", "''");
			BUSI_M = CTr.Replace(BUSI_M, "'", "''");
			BUSI_F = CTr.Replace(BUSI_F, "'", "''");
			USER_ID = CTr.Replace(USER_ID, "'", "''");

			if(SMODE.equals("INSERT")) {
				sql = "INSERT INTO IT_COMPANY_PERS (ICP_COMP_CD, ICP_MNGT_YR, ICP_TOT_M, ICP_TOT_F, ICP_PROD_M, ICP_PROD_F, ICP_BUSI_M, ICP_BUSI_F, ICP_USE_YN, ICP_INPT_ID, ICP_INPT_DTT) VALUES (";
				sql += "  '" + COMP_CD + "'";
				sql += ", '" + MNGT_YR + "'";
				sql += ", '" + TOT_M + "'";
				sql += ", '" + TOT_F + "'";
				sql += ", '" + PROD_M + "'";
				sql += ", '" + PROD_F + "'";
				sql += ", '" + BUSI_M + "'";
				sql += ", '" + BUSI_F + "'";
				sql += ", 'Y'";
				sql += ", '" + USER_ID + "'";
				sql += ", SYSDATE";
				sql += ")";

				argStmtExec.executeUpdate(sql);
			}
			else {
				sql = "UPDATE IT_COMPANY_PERS SET ";
				sql += "  ICP_TOT_M = '" + TOT_M + "'";
				sql += ", ICP_TOT_F = '" + TOT_F + "'";
				sql += ", ICP_PROD_M = '" + PROD_M + "'";
				sql += ", ICP_PROD_F = '" + PROD_F + "'";
				sql += ", ICP_BUSI_M = '" + BUSI_M + "'";
				sql += ", ICP_BUSI_F = '" + BUSI_F + "'";
				sql += ", ICP_MODI_ID = '" + USER_ID + "'";
				sql += ", ICP_MODI_DTT = SYSDATE";
				sql += " WHERE ICP_COMP_CD = '" + COMP_CD + "'";
				sql += " AND ICP_MNGT_YR = '" + MNGT_YR + "'";

				argStmtExec.executeUpdate(sql);
			}
		} catch (Exception e) {

			throw new FuncException(e.toString(), sql);
		}

		return sql;
	}
%>
