<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%!
	public String func_uSP_COMMON_APPLY_UP_Save_002(Statement argStmtExec, HashMap argHtMethod) throws Exception {

		String sql = "";
		String sql2 = "";
		String sql_disp = "";

		try {

			String STRCHKBOXCSC_USE_YN = (String) argHtMethod.get("STRCHKBOXCSC_USE_YN");
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
			String MODI_ID = (String) argHtMethod.get("MODI_ID");
			String CSC_LARGE = (String) argHtMethod.get("CSC_LARGE");
			String CSC_SMALL = (String) argHtMethod.get("CSC_SMALL");
			String CSC_LEVEL = (String) argHtMethod.get("CSC_LEVEL");
			String NUSE_ID = (String) argHtMethod.get("NUSE_ID");

			//
			if(STRCHKBOXCSC_USE_YN == null) { STRCHKBOXCSC_USE_YN = ""; }
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
			if(MODI_ID == null) { MODI_ID = ""; }
			if(CSC_LARGE == null) { CSC_LARGE = ""; }
			if(CSC_SMALL == null) { CSC_SMALL = ""; }
			if(CSC_LEVEL == null) { CSC_LEVEL = ""; }
			if(NUSE_ID == null) { NUSE_ID = ""; }

			//
			STRCHKBOXCSC_USE_YN = CTr.Replace(STRCHKBOXCSC_USE_YN, "'", "''");
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
			MODI_ID = CTr.Replace(MODI_ID, "'", "''");
			CSC_LARGE = CTr.Replace(CSC_LARGE, "'", "''");
			CSC_SMALL = CTr.Replace(CSC_SMALL, "'", "''");
			CSC_LEVEL = CTr.Replace(CSC_LEVEL, "'", "''");
			NUSE_ID = CTr.Replace(NUSE_ID, "'", "''");

			if(STRCHKBOXCSC_USE_YN.equals("1")) {	
				sql = "UPDATE CT_SP_COMMON SET ";
				sql += "  CSC_FULL_NM = '" + FULL_NM + "'";
				sql += ", CSC_CODE_EX = '" + CODE_EX + "'";
				sql += ", CSC_ETC1_NM = '" + ETC1_NM + "'";
				sql += ", CSC_ETC1_CD = '" + ETC1_CD + "'";
				sql += ", CSC_ETC2_NM = '" + ETC2_NM + "'";
				sql += ", CSC_ETC2_CD = '" + ETC2_CD + "'";
				sql += ", CSC_ETC3_NM = '" + ETC3_NM + "'";
				sql += ", CSC_ETC3_CD = '" + ETC3_CD + "'";
				sql += ", CSC_ETC4_NM = '" + ETC4_NM + "'";
				sql += ", CSC_ETC4_CD = '" + ETC4_CD + "'";
				sql += ", CSC_ETC5_NM = '" + ETC5_NM + "'";
				sql += ", CSC_ETC5_CD = '" + ETC5_CD + "'";
				sql += ", CSC_CODE_ST = '" + CODE_ST + "'";
				sql += ", CSC_CODE_GR = '" + CODE_GR + "'";
				sql += ", CSC_MODI_ID = '" + MODI_ID + "'";
				sql += ", CSC_MODI_DTT = SYSDATE";
				sql += ", CSC_USE_YN = 'Y'";
				sql += " WHERE CSC_LARGE = '" + CSC_LARGE + "'";
				sql += " AND CSC_SMALL = '" + CSC_SMALL + "'";
				sql += " AND CSC_LEVEL = '" + CSC_LEVEL + "'";

				argStmtExec.executeUpdate(sql);
			} else {
				sql = "UPDATE CT_SP_COMMON SET ";
				sql += "  CSC_FULL_NM = '" + FULL_NM + "'";
				sql += ", CSC_CODE_EX = '" + CODE_EX + "'";
				sql += ", CSC_ETC1_NM = '" + ETC1_NM + "'";
				sql += ", CSC_ETC1_CD = '" + ETC1_CD + "'";
				sql += ", CSC_ETC2_NM = '" + ETC2_NM + "'";
				sql += ", CSC_ETC2_CD = '" + ETC2_CD + "'";
				sql += ", CSC_ETC3_NM = '" + ETC3_NM + "'";
				sql += ", CSC_ETC3_CD = '" + ETC3_CD + "'";
				sql += ", CSC_ETC4_NM = '" + ETC4_NM + "'";
				sql += ", CSC_ETC4_CD = '" + ETC4_CD + "'";
				sql += ", CSC_ETC5_NM = '" + ETC5_NM + "'";
				sql += ", CSC_ETC5_CD = '" + ETC5_CD + "'";
				sql += ", CSC_CODE_ST = '" + CODE_ST + "'";
				sql += ", CSC_CODE_GR = '" + CODE_GR + "'";
				sql += ", CSC_MODI_ID = '" + MODI_ID + "'";
				sql += ", CSC_MODI_DTT = SYSDATE";
				sql += ", CSC_USE_YN = 'N'";
				sql += ", CSC_NUSE_ID = '" + NUSE_ID + "'";
				sql += ", CSC_NUSE_DTT = SYSDATE";
				sql += " WHERE CSC_LARGE = '" + CSC_LARGE + "'";
				sql += " AND CSC_SMALL = '" + CSC_SMALL + "'";
				sql += " AND CSC_LEVEL = '" + CSC_LEVEL + "'";

				argStmtExec.executeUpdate(sql);
			}
		} catch (Exception e) {

			throw new FuncException(e.toString(), sql);
		}

		return sql;
	}
%>
