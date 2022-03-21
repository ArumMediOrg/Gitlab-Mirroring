<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%!
	public String func_uSP_COMMON_APPLY_UP_Save_001(Statement argStmtExec, HashMap argHtMethod) throws Exception {

		String sql = "";
		String sql2 = "";
		String sql_disp = "";

		try {

			String CHKBOXCSC_USE_YN = (String) argHtMethod.get("CHKBOXCSC_USE_YN");
			String LARGE = (String) argHtMethod.get("LARGE");
			String SMALL = (String) argHtMethod.get("SMALL");
			String LEVEL = (String) argHtMethod.get("LEVEL");
			String FULL_NM = (String) argHtMethod.get("FULL_NM");
			String CODE_EX = (String) argHtMethod.get("CODE_EX");
			String ETC1_NM = (String) argHtMethod.get("ETC1_NM");
			String ETC1_CD = (String) argHtMethod.get("ETC1_CD");
			String ETC2_NM = (String) argHtMethod.get("ETC2_NM");
			String ETC2_CD = (String) argHtMethod.get("ETC2_CD");
			String ETC3_NM = (String) argHtMethod.get("ETC3_NM");
			String ETC3_CD = (String) argHtMethod.get("ETC3_CD");
			String ETC4_NM = (String) argHtMethod.get("ETC4_NM");
			String ETC4_CD = (String) argHtMethod.get("ETC4_CD");
			String ETC5_NM = (String) argHtMethod.get("ETC5_NM");
			String ETC5_CD = (String) argHtMethod.get("ETC5_CD");
			String CODE_ST = (String) argHtMethod.get("CODE_ST");
			String CODE_GR = (String) argHtMethod.get("CODE_GR");
			String INPT_ID = (String) argHtMethod.get("INPT_ID");
			String NUSE_ID = (String) argHtMethod.get("NUSE_ID");

			//
			if(CHKBOXCSC_USE_YN == null) { CHKBOXCSC_USE_YN = ""; }
			if(LARGE == null) { LARGE = ""; }
			if(SMALL == null) { SMALL = ""; }
			if(LEVEL == null) { LEVEL = ""; }
			if(FULL_NM == null) { FULL_NM = ""; }
			if(CODE_EX == null) { CODE_EX = ""; }
			if(ETC1_NM == null) { ETC1_NM = ""; }
			if(ETC1_CD == null) { ETC1_CD = ""; }
			if(ETC2_NM == null) { ETC2_NM = ""; }
			if(ETC2_CD == null) { ETC2_CD = ""; }
			if(ETC3_NM == null) { ETC3_NM = ""; }
			if(ETC3_CD == null) { ETC3_CD = ""; }
			if(ETC4_NM == null) { ETC4_NM = ""; }
			if(ETC4_CD == null) { ETC4_CD = ""; }
			if(ETC5_NM == null) { ETC5_NM = ""; }
			if(ETC5_CD == null) { ETC5_CD = ""; }
			if(CODE_ST == null) { CODE_ST = ""; }
			if(CODE_GR == null) { CODE_GR = ""; }
			if(INPT_ID == null) { INPT_ID = ""; }
			if(NUSE_ID == null) { NUSE_ID = ""; }

			//
			CHKBOXCSC_USE_YN = CTr.Replace(CHKBOXCSC_USE_YN, "'", "''");
			LARGE = CTr.Replace(LARGE, "'", "''");
			SMALL = CTr.Replace(SMALL, "'", "''");
			LEVEL = CTr.Replace(LEVEL, "'", "''");
			FULL_NM = CTr.Replace(FULL_NM, "'", "''");
			CODE_EX = CTr.Replace(CODE_EX, "'", "''");
			ETC1_NM = CTr.Replace(ETC1_NM, "'", "''");
			ETC1_CD = CTr.Replace(ETC1_CD, "'", "''");
			ETC2_NM = CTr.Replace(ETC2_NM, "'", "''");
			ETC2_CD = CTr.Replace(ETC2_CD, "'", "''");
			ETC3_NM = CTr.Replace(ETC3_NM, "'", "''");
			ETC3_CD = CTr.Replace(ETC3_CD, "'", "''");
			ETC4_NM = CTr.Replace(ETC4_NM, "'", "''");
			ETC4_CD = CTr.Replace(ETC4_CD, "'", "''");
			ETC5_NM = CTr.Replace(ETC5_NM, "'", "''");
			ETC5_CD = CTr.Replace(ETC5_CD, "'", "''");
			CODE_ST = CTr.Replace(CODE_ST, "'", "''");
			CODE_GR = CTr.Replace(CODE_GR, "'", "''");
			INPT_ID = CTr.Replace(INPT_ID, "'", "''");
			NUSE_ID = CTr.Replace(NUSE_ID, "'", "''");

	if(CHKBOXCSC_USE_YN.equals("1")) {
			sql = "INSERT INTO CT_SP_COMMON (CSC_LARGE,CSC_SMALL,CSC_LEVEL,CSC_FULL_NM,CSC_CODE_EX,CSC_ETC1_NM,CSC_ETC1_CD,CSC_ETC2_NM,CSC_ETC2_CD,CSC_ETC3_NM,CSC_ETC3_CD,CSC_ETC4_NM,CSC_ETC4_CD,CSC_ETC5_NM,CSC_ETC5_CD, CSC_CODE_ST,CSC_CODE_GR,CSC_USE_YN,CSC_INPT_ID,CSC_INPT_DTT) VALUES (";
			sql += "  '" + LARGE + "'";
			sql += ", '" + SMALL + "'";
			sql += ", '" + LEVEL + "'";
			sql += ", '" + FULL_NM + "'";
			sql += ", '" + CODE_EX + "'";
			sql += ", '" + ETC1_NM + "'";
			sql += ", '" + ETC1_CD + "'";
			sql += ", '" + ETC2_NM + "'";
			sql += ", '" + ETC2_CD + "'";
			sql += ", '" + ETC3_NM + "'";
			sql += ", '" + ETC3_CD + "'";
			sql += ", '" + ETC4_NM + "'";
			sql += ", '" + ETC4_CD + "'";
			sql += ", '" + ETC5_NM + "'";
			sql += ", '" + ETC5_CD + "'";
			sql += ", '" + CODE_ST + "'";
			sql += ", '" + CODE_GR + "'";
			sql += ", 'Y'";
			sql += ", '" + INPT_ID + "'";
			sql += ", SYSDATE";
			sql += ")";

			argStmtExec.executeUpdate(sql);

	} else {
			sql = "INSERT INTO CT_SP_COMMON (CSC_LARGE,CSC_SMALL,CSC_LEVEL,CSC_FULL_NM,CSC_CODE_EX,CSC_ETC1_NM,CSC_ETC1_CD,CSC_ETC2_NM,CSC_ETC2_CD,CSC_ETC3_NM,CSC_ETC3_CD,CSC_ETC4_NM,CSC_ETC4_CD,CSC_ETC5_NM,CSC_ETC5_CD, CSC_CODE_ST,CSC_CODE_GR,CSC_USE_YN,CSC_NUSE_ID,CSC_NUSE_DTT,CSC_INPT_ID,CSC_INPT_DTT) VALUES (";
			sql += "  '" + LARGE + "'";
			sql += ", '" + SMALL + "'";
			sql += ", '" + LEVEL + "'";
			sql += ", '" + FULL_NM + "'";
			sql += ", '" + CODE_EX + "'";
			sql += ", '" + ETC1_NM + "'";
			sql += ", '" + ETC1_CD + "'";
			sql += ", '" + ETC2_NM + "'";
			sql += ", '" + ETC2_CD + "'";
			sql += ", '" + ETC3_NM + "'";
			sql += ", '" + ETC3_CD + "'";
			sql += ", '" + ETC4_NM + "'";
			sql += ", '" + ETC4_CD + "'";
			sql += ", '" + ETC5_NM + "'";
			sql += ", '" + ETC5_CD + "'";
			sql += ", '" + CODE_ST + "'";
			sql += ", '" + CODE_GR + "'";
			sql += ", 'N'";
			sql += ", '" + NUSE_ID + "'";
			sql += ", SYSDATE";
			sql += ", '" + INPT_ID + "'";
			sql += ", SYSDATE";
			sql += ")";

			argStmtExec.executeUpdate(sql);

	}

		} catch (Exception e) {

			throw new FuncException(e.toString(), sql);
		}

		return sql;
	}
%>
