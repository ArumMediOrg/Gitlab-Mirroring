<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%!
	public String func_uExam_Ticket_btnS1_SAVEClick_001(Statement argStmtExec, HashMap argHtMethod) throws Exception {

		String sql = "";
		String sql2 = "";
		String sql_disp = "";

		try {

			String SMODE = (String) argHtMethod.get("SMODE");
			String PUB_CD = (String) argHtMethod.get("PUB_CD");
			String PUB_COMP_CD = (String) argHtMethod.get("PUB_COMP_CD");
			String CUST_NM = (String) argHtMethod.get("CUST_NM");
			String CUST_BIRTH = (String) argHtMethod.get("CUST_BIRTH");
			String CUST_SEX = (String) argHtMethod.get("CUST_SEX");
			String PUB_COMP_NM = (String) argHtMethod.get("PUB_COMP_NM");
			String PUB_NM = (String) argHtMethod.get("PUB_NM");
			String S_DT = (String) argHtMethod.get("S_DT");
			String E_DT = (String) argHtMethod.get("E_DT");
			String USE_YN = (String) argHtMethod.get("USE_YN");
			String USER_ID = (String) argHtMethod.get("USER_ID");
			String ETC = (String) argHtMethod.get("ETC");

			//
			if(SMODE == null) { SMODE = ""; }
			if(PUB_CD == null) { PUB_CD = ""; }
			if(PUB_COMP_CD == null) { PUB_COMP_CD = ""; }
			if(CUST_NM == null) { CUST_NM = ""; }
			if(CUST_BIRTH == null) { CUST_BIRTH = ""; }
			if(CUST_SEX == null) { CUST_SEX = ""; }
			if(PUB_COMP_NM == null) { PUB_COMP_NM = ""; }
			if(PUB_NM == null) { PUB_NM = ""; }
			if(S_DT == null) { S_DT = ""; }
			if(E_DT == null) { E_DT = ""; }
			if(USE_YN == null) { USE_YN = ""; }
			if(USER_ID == null) { USER_ID = ""; }
			if(ETC == null) { ETC = ""; }

			//
			SMODE = CTr.Replace(SMODE, "'", "''");
			PUB_CD = CTr.Replace(PUB_CD, "'", "''");
			PUB_COMP_CD = CTr.Replace(PUB_COMP_CD, "'", "''");
			CUST_NM = CTr.Replace(CUST_NM, "'", "''");
			CUST_BIRTH = CTr.Replace(CUST_BIRTH, "'", "''");
			CUST_SEX = CTr.Replace(CUST_SEX, "'", "''");
			PUB_COMP_NM = CTr.Replace(PUB_COMP_NM, "'", "''");
			PUB_NM = CTr.Replace(PUB_NM, "'", "''");
			S_DT = CTr.Replace(S_DT, "'", "''");
			E_DT = CTr.Replace(E_DT, "'", "''");
			USE_YN = CTr.Replace(USE_YN, "'", "''");
			USER_ID = CTr.Replace(USER_ID, "'", "''");
			ETC = CTr.Replace(ETC, "'", "''");

			if(SMODE.equals("I")) {

				sql = "INSERT INTO IT_TICKET (ITK_PUB_CD, ITK_PUB_COMP_CD, ITK_CUST_NM, ITK_CUST_BIRTH, ITK_CUST_SEX, ITK_PUB_COMP_NM, ITK_PUB_NM, ";
				sql += " ITK_S_DT, ITK_E_DT, ITK_USE_YN, ITK_INPT_ID, ITK_INPT_DTT, ITK_ETC) ";
				sql += " VALUES (";
				sql += "  '" + PUB_CD + "'";
				sql += ", '" + PUB_COMP_CD + "'";
				sql += ", '" + CUST_NM + "'";
				sql += ", '" + CUST_BIRTH + "'";
				sql += ", '" + CUST_SEX + "'";
				sql += ", '" + PUB_COMP_NM + "'";
				sql += ", '" + PUB_NM + "'";
				sql += ", '" + S_DT + "'";
				sql += ", '" + E_DT + "'";
				sql += ", '" + USE_YN + "'";
				sql += ", '" + USER_ID + "'";
				sql += ", SYSDATE";
				sql += ", '" + ETC + "'";
				sql += ")";

				argStmtExec.executeUpdate(sql);
			} else if(SMODE.equals("U")) {

				sql = "UPDATE IT_TICKET SET ";
				sql += "  ITK_CUST_NM = '" + CUST_NM + "'";
				sql += ", ITK_PUB_COMP_CD = '" + PUB_COMP_CD + "'";
				sql += ", ITK_CUST_BIRTH = '" + CUST_BIRTH + "'";
				sql += ", ITK_CUST_SEX = '" + CUST_SEX + "'";
				sql += ", ITK_PUB_COMP_NM = '" + PUB_COMP_NM + "'";
				sql += ", ITK_PUB_NM = '" + PUB_NM + "'";
				sql += ", ITK_S_DT = '" + S_DT + "'";
				sql += ", ITK_E_DT = '" + E_DT + "'";
				sql += ", ITK_USE_YN = '" + USE_YN + "'";
				sql += ", ITK_MODI_ID = '" + USER_ID + "'";
				sql += ", ITK_MODI_DTT = SYSDATE";
				sql += ", ITK_ETC = '" + ETC + "'";
				sql += " WHERE ITK_PUB_CD = '" + PUB_CD + "'";

				argStmtExec.executeUpdate(sql);
			}

		} catch (Exception e) {

			throw new FuncException(e.toString(), sql);
		}

		return sql;
	}
%>
