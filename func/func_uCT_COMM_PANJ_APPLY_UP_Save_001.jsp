<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%!
	public String func_uCT_COMM_PANJ_APPLY_UP_Save_001(Statement argStmtExec, HashMap argHtMethod) throws Exception {

		String sql = "";
		String sql2 = "";
		String sql_disp = "";

		try {

			String CHKBOXCCP_USE_YN = (String) argHtMethod.get("CHKBOXCCP_USE_YN");
			String GUBN_CD = (String) argHtMethod.get("GUBN_CD");
			String MACH_CD = (String) argHtMethod.get("MACH_CD");
			String MACH_SQ = (String) argHtMethod.get("MACH_SQ");
			String MACH_NM = (String) argHtMethod.get("MACH_NM");
			String CMPR_KD = (String) argHtMethod.get("CMPR_KD");
			String ITEM_CD = (String) argHtMethod.get("ITEM_CD");
			String MAN_LOW = (String) argHtMethod.get("MAN_LOW");
			String MAN_HIGH = (String) argHtMethod.get("MAN_HIGH");
			String WOMAN_LOW = (String) argHtMethod.get("WOMAN_LOW");
			String WOMAN_HIGH = (String) argHtMethod.get("WOMAN_HIGH");
			String CHAR_VAL1 = (String) argHtMethod.get("CHAR_VAL1");
			String CHAR_VAL2 = (String) argHtMethod.get("CHAR_VAL2");
			String CHAR_VAL3 = (String) argHtMethod.get("CHAR_VAL3");
			String CHAR_VAL4 = (String) argHtMethod.get("CHAR_VAL4");
			String CHAR_VAL5 = (String) argHtMethod.get("CHAR_VAL5");
			String CHAR_VAL6 = (String) argHtMethod.get("CHAR_VAL6");
			String CHAR_VAL7 = (String) argHtMethod.get("CHAR_VAL7");
			String SOKUN_TX = (String) argHtMethod.get("SOKUN_TX");
			String RMK_TX = (String) argHtMethod.get("RMK_TX");
			String NORM_YN = (String) argHtMethod.get("NORM_YN");
			String INPT_ID = (String) argHtMethod.get("INPT_ID");
			String NUSE_ID = (String) argHtMethod.get("NUSE_ID");

			//
			if(CHKBOXCCP_USE_YN == null) { CHKBOXCCP_USE_YN = ""; }
			if(GUBN_CD == null) { GUBN_CD = ""; }
			if(MACH_CD == null) { MACH_CD = ""; }
			if(MACH_SQ == null) { MACH_SQ = ""; }
			if(MACH_NM == null) { MACH_NM = ""; }
			if(CMPR_KD == null) { CMPR_KD = ""; }
			if(ITEM_CD == null) { ITEM_CD = ""; }
			if(MAN_LOW == null) { MAN_LOW = ""; }
			if(MAN_HIGH == null) { MAN_HIGH = ""; }
			if(WOMAN_LOW == null) { WOMAN_LOW = ""; }
			if(WOMAN_HIGH == null) { WOMAN_HIGH = ""; }
			if(CHAR_VAL1 == null) { CHAR_VAL1 = ""; }
			if(CHAR_VAL2 == null) { CHAR_VAL2 = ""; }
			if(CHAR_VAL3 == null) { CHAR_VAL3 = ""; }
			if(CHAR_VAL4 == null) { CHAR_VAL4 = ""; }
			if(CHAR_VAL5 == null) { CHAR_VAL5 = ""; }
			if(CHAR_VAL6 == null) { CHAR_VAL6 = ""; }
			if(CHAR_VAL7 == null) { CHAR_VAL7 = ""; }
			if(SOKUN_TX == null) { SOKUN_TX = ""; }
			if(RMK_TX == null) { RMK_TX = ""; }
			if(NORM_YN == null) { NORM_YN = ""; }
			if(INPT_ID == null) { INPT_ID = ""; }
			if(NUSE_ID == null) { NUSE_ID = ""; }

			//
			CHKBOXCCP_USE_YN = CTr.Replace(CHKBOXCCP_USE_YN, "'", "''");
			GUBN_CD = CTr.Replace(GUBN_CD, "'", "''");
			MACH_CD = CTr.Replace(MACH_CD, "'", "''");
			MACH_SQ = CTr.Replace(MACH_SQ, "'", "''");
			MACH_NM = CTr.Replace(MACH_NM, "'", "''");
			CMPR_KD = CTr.Replace(CMPR_KD, "'", "''");
			ITEM_CD = CTr.Replace(ITEM_CD, "'", "''");
			MAN_LOW = CTr.Replace(MAN_LOW, "'", "''");
			MAN_HIGH = CTr.Replace(MAN_HIGH, "'", "''");
			WOMAN_LOW = CTr.Replace(WOMAN_LOW, "'", "''");
			WOMAN_HIGH = CTr.Replace(WOMAN_HIGH, "'", "''");
			CHAR_VAL1 = CTr.Replace(CHAR_VAL1, "'", "''");
			CHAR_VAL2 = CTr.Replace(CHAR_VAL2, "'", "''");
			CHAR_VAL3 = CTr.Replace(CHAR_VAL3, "'", "''");
			CHAR_VAL4 = CTr.Replace(CHAR_VAL4, "'", "''");
			CHAR_VAL5 = CTr.Replace(CHAR_VAL5, "'", "''");
			CHAR_VAL6 = CTr.Replace(CHAR_VAL6, "'", "''");
			CHAR_VAL7 = CTr.Replace(CHAR_VAL7, "'", "''");
			SOKUN_TX = CTr.Replace(SOKUN_TX, "'", "''");
			RMK_TX = CTr.Replace(RMK_TX, "'", "''");
			NORM_YN = CTr.Replace(NORM_YN, "'", "''");
			INPT_ID = CTr.Replace(INPT_ID, "'", "''");
			NUSE_ID = CTr.Replace(NUSE_ID, "'", "''");

			if(CHKBOXCCP_USE_YN.equals("1")) {
				sql = "INSERT INTO CT_COMM_PANJ (CCP_GUBN_CD,CCP_MACH_CD,CCP_MACH_SQ,CCP_MACH_NM,CCP_CMPR_KD,CCP_ITEM_CD, CCP_MAN_LOW,CCP_MAN_HIGH,CCP_WOMAN_LOW,CCP_WOMAN_HIGH, CCP_CHAR_VAL1,CCP_CHAR_VAL2,CCP_CHAR_VAL3,CCP_CHAR_VAL4,CCP_CHAR_VAL5,CCP_CHAR_VAL6,CCP_CHAR_VAL7, CCP_SOKUN_TX,CCP_RMK_TX,CCP_NORM_YN,CCP_USE_YN, CCP_INPT_ID,CCP_INPT_DTT) VALUES (";
				sql += "  '" + GUBN_CD + "'";
				sql += ", '" + MACH_CD + "'";
				sql += ", '" + MACH_SQ + "'";
				sql += ", '" + MACH_NM + "'";
				sql += ", '" + CMPR_KD + "'";
				sql += ", '" + ITEM_CD + "'";
				sql += ", '" + MAN_LOW + "'";
				sql += ", '" + MAN_HIGH + "'";
				sql += ", '" + WOMAN_LOW + "'";
				sql += ", '" + WOMAN_HIGH + "'";
				sql += ", '" + CHAR_VAL1 + "'";
				sql += ", '" + CHAR_VAL2 + "'";
				sql += ", '" + CHAR_VAL3 + "'";
				sql += ", '" + CHAR_VAL4 + "'";
				sql += ", '" + CHAR_VAL5 + "'";
				sql += ", '" + CHAR_VAL6 + "'";
				sql += ", '" + CHAR_VAL7 + "'";
				sql += ", '" + SOKUN_TX + "'";
				sql += ", '" + RMK_TX + "'";
				sql += ", '" + NORM_YN + "'";
				sql += ", 'Y'";
				sql += ", '" + INPT_ID + "'";
				sql += ", SYSDATE";
				sql += ")";

				argStmtExec.executeUpdate(sql);

			} else {
				sql = "INSERT INTO CT_COMM_PANJ (CCP_GUBN_CD,CCP_MACH_CD,CCP_MACH_SQ,CCP_MACH_NM,CCP_CMPR_KD,CCP_ITEM_CD, CCP_MAN_LOW,CCP_MAN_HIGH,CCP_WOMAN_LOW,CCP_WOMAN_HIGH, CCP_CHAR_VAL1,CCP_CHAR_VAL2,CCP_CHAR_VAL3,CCP_CHAR_VAL4,CCP_CHAR_VAL5,CCP_CHAR_VAL6,CCP_CHAR_VAL7, CCP_SOKUN_TX,CCP_RMK_TX,CCP_NORM_YN,CCP_USE_YN, CCP_NUSE_ID,CCP_NUSE_DTT,CCP_INPT_ID,CCP_INPT_DTT) VALUES (";
				sql += "  '" + GUBN_CD + "'";
				sql += ", '" + MACH_CD + "'";
				sql += ", '" + MACH_SQ + "'";
				sql += ", '" + MACH_NM + "'";
				sql += ", '" + CMPR_KD + "'";
				sql += ", '" + ITEM_CD + "'";
				sql += ", '" + MAN_LOW + "'";
				sql += ", '" + MAN_HIGH + "'";
				sql += ", '" + WOMAN_LOW + "'";
				sql += ", '" + WOMAN_HIGH + "'";
				sql += ", '" + CHAR_VAL1 + "'";
				sql += ", '" + CHAR_VAL2 + "'";
				sql += ", '" + CHAR_VAL3 + "'";
				sql += ", '" + CHAR_VAL4 + "'";
				sql += ", '" + CHAR_VAL5 + "'";
				sql += ", '" + CHAR_VAL6 + "'";
				sql += ", '" + CHAR_VAL7 + "'";
				sql += ", '" + SOKUN_TX + "'";
				sql += ", '" + RMK_TX + "'";
				sql += ", '" + NORM_YN + "'";
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
