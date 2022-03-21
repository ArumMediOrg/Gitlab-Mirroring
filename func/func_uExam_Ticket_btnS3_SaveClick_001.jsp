<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%!
	public String func_uExam_Ticket_btnS3_SaveClick_001(Statement argStmtExec, HashMap argHtMethod) throws Exception {

		String sql = "";
		String sql2 = "";
		String sql_disp = "";

		try {

			String SMODE = (String) argHtMethod.get("SMODE");
			String COMP_CD = (String) argHtMethod.get("COMP_CD");
			String COMP_NM = (String) argHtMethod.get("COMP_NM");
			String TYPE1_YN = (String) argHtMethod.get("TYPE1_YN");
			String TYPE2_YN = (String) argHtMethod.get("TYPE2_YN");
			String TYPE3_YN = (String) argHtMethod.get("TYPE3_YN");
			String TYPE4_YN = (String) argHtMethod.get("TYPE4_YN");
			String TYPE5_YN = (String) argHtMethod.get("TYPE5_YN");
			String TYPE6_YN = (String) argHtMethod.get("TYPE6_YN");
			String TYPE7_YN = (String) argHtMethod.get("TYPE7_YN");
			String TYPE8_YN = (String) argHtMethod.get("TYPE8_YN");
			String TYPE9_YN = (String) argHtMethod.get("TYPE9_YN");
			String TYPE10_YN = (String) argHtMethod.get("TYPE10_YN");
			String TYPE11_YN = (String) argHtMethod.get("TYPE11_YN");
			String TYPE12_YN = (String) argHtMethod.get("TYPE12_YN");
			String USER_ID = (String) argHtMethod.get("USER_ID");

			//
			if(SMODE == null) { SMODE = ""; }
			if(COMP_CD == null) { COMP_CD = ""; }
			if(COMP_NM == null) { COMP_NM = ""; }
			if(TYPE1_YN == null) { TYPE1_YN = ""; }
			if(TYPE2_YN == null) { TYPE2_YN = ""; }
			if(TYPE3_YN == null) { TYPE3_YN = ""; }
			if(TYPE4_YN == null) { TYPE4_YN = ""; }
			if(TYPE5_YN == null) { TYPE5_YN = ""; }
			if(TYPE6_YN == null) { TYPE6_YN = ""; }
			if(TYPE7_YN == null) { TYPE7_YN = ""; }
			if(TYPE8_YN == null) { TYPE8_YN = ""; }
			if(TYPE9_YN == null) { TYPE9_YN = ""; }
			if(TYPE10_YN == null) { TYPE10_YN = ""; }
			if(TYPE11_YN == null) { TYPE11_YN = ""; }
			if(TYPE12_YN == null) { TYPE12_YN = ""; }
			if(USER_ID == null) { USER_ID = ""; }

			//
			SMODE = CTr.Replace(SMODE, "'", "''");
			COMP_CD = CTr.Replace(COMP_CD, "'", "''");
			COMP_NM = CTr.Replace(COMP_NM, "'", "''");
			TYPE1_YN = CTr.Replace(TYPE1_YN, "'", "''");
			TYPE2_YN = CTr.Replace(TYPE2_YN, "'", "''");
			TYPE3_YN = CTr.Replace(TYPE3_YN, "'", "''");
			TYPE4_YN = CTr.Replace(TYPE4_YN, "'", "''");
			TYPE5_YN = CTr.Replace(TYPE5_YN, "'", "''");
			TYPE6_YN = CTr.Replace(TYPE6_YN, "'", "''");
			TYPE7_YN = CTr.Replace(TYPE7_YN, "'", "''");
			TYPE8_YN = CTr.Replace(TYPE8_YN, "'", "''");
			TYPE9_YN = CTr.Replace(TYPE9_YN, "'", "''");
			TYPE10_YN = CTr.Replace(TYPE10_YN, "'", "''");
			TYPE11_YN = CTr.Replace(TYPE11_YN, "'", "''");
			TYPE12_YN = CTr.Replace(TYPE12_YN, "'", "''");
			USER_ID = CTr.Replace(USER_ID, "'", "''");

			if(SMODE.equals("I")) {

				sql = "INSERT INTO IT_TICKET_COMP (ITC_COMP_CD, ITC_COMP_NM, ITC_TYPE1_YN, ITC_TYPE2_YN, ITC_TYPE3_YN, ITC_TYPE4_YN, ITC_TYPE5_YN, ITC_TYPE6_YN, ITC_TYPE7_YN, ITC_TYPE8_YN, ITC_TYPE9_YN, ITC_TYPE10_YN, ITC_TYPE11_YN, ITC_TYPE12_YN, ITC_INPT_ID, ITC_INPT_DTT) VALUES (";
				sql += "  '" + COMP_CD + "'";
				sql += ", '" + COMP_NM + "'";
				sql += ", '" + TYPE1_YN + "'";
				sql += ", '" + TYPE2_YN + "'";
				sql += ", '" + TYPE3_YN + "'";
				sql += ", '" + TYPE4_YN + "'";
				sql += ", '" + TYPE5_YN + "'";
				sql += ", '" + TYPE6_YN + "'";
				sql += ", '" + TYPE7_YN + "'";
				sql += ", '" + TYPE8_YN + "'";
				sql += ", '" + TYPE9_YN + "'";
				sql += ", '" + TYPE10_YN + "'";
				sql += ", '" + TYPE11_YN + "'";
				sql += ", '" + TYPE12_YN + "'";
				sql += ", '" + USER_ID + "'";
				sql += ", SYSDATE";
				sql += ")";

				argStmtExec.executeUpdate(sql);
			} else if(SMODE.equals("U")) {
			
				sql = "UPDATE IT_TICKET_COMP SET ";
				sql += "  ITC_COMP_NM = '" + COMP_NM + "'";
				sql += ", ITC_TYPE1_YN = '" + TYPE1_YN + "'";
				sql += ", ITC_TYPE2_YN = '" + TYPE2_YN + "'";
				sql += ", ITC_TYPE3_YN = '" + TYPE3_YN + "'";
				sql += ", ITC_TYPE4_YN = '" + TYPE4_YN + "'";
				sql += ", ITC_TYPE5_YN = '" + TYPE5_YN + "'";
				sql += ", ITC_TYPE6_YN = '" + TYPE6_YN + "'";
				sql += ", ITC_TYPE7_YN = '" + TYPE7_YN + "'";
				sql += ", ITC_TYPE8_YN = '" + TYPE8_YN + "'";
				sql += ", ITC_TYPE9_YN = '" + TYPE9_YN + "'";
				sql += ", ITC_TYPE10_YN = '" + TYPE10_YN + "'";
				sql += ", ITC_TYPE11_YN = '" + TYPE11_YN + "'";
				sql += ", ITC_TYPE12_YN = '" + TYPE12_YN + "'";
				sql += ", ITC_MODI_ID = '" + USER_ID + "'";
				sql += ", ITC_MODI_DTT = SYSDATE";
				sql += " WHERE ITC_COMP_CD = '" + COMP_CD + "'";

				argStmtExec.executeUpdate(sql);
			}

		} catch (Exception e) {

			throw new FuncException(e.toString(), sql);
		}

		return sql;
	}
%>
