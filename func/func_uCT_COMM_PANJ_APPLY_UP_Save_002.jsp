<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%!
	public String func_uCT_COMM_PANJ_APPLY_UP_Save_002(Statement argStmtExec, HashMap argHtMethod) throws Exception {

		String sql = "";
		String sql2 = "";
		String sql_disp = "";

		try {

			String CHKBOXCCP_USE_YN = (String) argHtMethod.get("CHKBOXCCP_USE_YN");
			String CCP_MACH_NM = (String) argHtMethod.get("CCP_MACH_NM");
			String CCP_CMPR_KD = (String) argHtMethod.get("CCP_CMPR_KD");
			String CCP_ITEM_CD = (String) argHtMethod.get("CCP_ITEM_CD");
			String CCP_MAN_LOW = (String) argHtMethod.get("CCP_MAN_LOW");
			String CCP_MAN_HIGH = (String) argHtMethod.get("CCP_MAN_HIGH");
			String CCP_WOMAN_LOW = (String) argHtMethod.get("CCP_WOMAN_LOW");
			String CCP_WOMAN_HIGH = (String) argHtMethod.get("CCP_WOMAN_HIGH");
			String CCP_CHAR_VAL1 = (String) argHtMethod.get("CCP_CHAR_VAL1");
			String CCP_CHAR_VAL2 = (String) argHtMethod.get("CCP_CHAR_VAL2");
			String CCP_CHAR_VAL3 = (String) argHtMethod.get("CCP_CHAR_VAL3");
			String CCP_CHAR_VAL4 = (String) argHtMethod.get("CCP_CHAR_VAL4");
			String CCP_CHAR_VAL5 = (String) argHtMethod.get("CCP_CHAR_VAL5");
			String CCP_CHAR_VAL6 = (String) argHtMethod.get("CCP_CHAR_VAL6");
			String CCP_CHAR_VAL7 = (String) argHtMethod.get("CCP_CHAR_VAL7");
			String CCP_SOKUN_TX = (String) argHtMethod.get("CCP_SOKUN_TX");
			String CCP_RMK_TX = (String) argHtMethod.get("CCP_RMK_TX");
			String CCP_NORM_YN = (String) argHtMethod.get("CCP_NORM_YN");
			String CCP_MODI_ID = (String) argHtMethod.get("CCP_MODI_ID");
			String CCP_GUBN_CD = (String) argHtMethod.get("CCP_GUBN_CD");
			String CCP_MACH_CD = (String) argHtMethod.get("CCP_MACH_CD");
			String CCP_MACH_SQ = (String) argHtMethod.get("CCP_MACH_SQ");
			String CCP_NUSE_ID = (String) argHtMethod.get("CCP_NUSE_ID");

			//
			if(CHKBOXCCP_USE_YN == null) { CHKBOXCCP_USE_YN = ""; }
			if(CCP_MACH_NM == null) { CCP_MACH_NM = ""; }
			if(CCP_CMPR_KD == null) { CCP_CMPR_KD = ""; }
			if(CCP_ITEM_CD == null) { CCP_ITEM_CD = ""; }
			if(CCP_MAN_LOW == null) { CCP_MAN_LOW = ""; }
			if(CCP_MAN_HIGH == null) { CCP_MAN_HIGH = ""; }
			if(CCP_WOMAN_LOW == null) { CCP_WOMAN_LOW = ""; }
			if(CCP_WOMAN_HIGH == null) { CCP_WOMAN_HIGH = ""; }
			if(CCP_CHAR_VAL1 == null) { CCP_CHAR_VAL1 = ""; }
			if(CCP_CHAR_VAL2 == null) { CCP_CHAR_VAL2 = ""; }
			if(CCP_CHAR_VAL3 == null) { CCP_CHAR_VAL3 = ""; }
			if(CCP_CHAR_VAL4 == null) { CCP_CHAR_VAL4 = ""; }
			if(CCP_CHAR_VAL5 == null) { CCP_CHAR_VAL5 = ""; }
			if(CCP_CHAR_VAL6 == null) { CCP_CHAR_VAL6 = ""; }
			if(CCP_CHAR_VAL7 == null) { CCP_CHAR_VAL7 = ""; }
			if(CCP_SOKUN_TX == null) { CCP_SOKUN_TX = ""; }
			if(CCP_RMK_TX == null) { CCP_RMK_TX = ""; }
			if(CCP_NORM_YN == null) { CCP_NORM_YN = ""; }
			if(CCP_MODI_ID == null) { CCP_MODI_ID = ""; }
			if(CCP_GUBN_CD == null) { CCP_GUBN_CD = ""; }
			if(CCP_MACH_CD == null) { CCP_MACH_CD = ""; }
			if(CCP_MACH_SQ == null) { CCP_MACH_SQ = ""; }
			if(CCP_NUSE_ID == null) { CCP_NUSE_ID = ""; }

			//
			CHKBOXCCP_USE_YN = CTr.Replace(CHKBOXCCP_USE_YN, "'", "''");
			CCP_MACH_NM = CTr.Replace(CCP_MACH_NM, "'", "''");
			CCP_CMPR_KD = CTr.Replace(CCP_CMPR_KD, "'", "''");
			CCP_ITEM_CD = CTr.Replace(CCP_ITEM_CD, "'", "''");
			CCP_MAN_LOW = CTr.Replace(CCP_MAN_LOW, "'", "''");
			CCP_MAN_HIGH = CTr.Replace(CCP_MAN_HIGH, "'", "''");
			CCP_WOMAN_LOW = CTr.Replace(CCP_WOMAN_LOW, "'", "''");
			CCP_WOMAN_HIGH = CTr.Replace(CCP_WOMAN_HIGH, "'", "''");
			CCP_CHAR_VAL1 = CTr.Replace(CCP_CHAR_VAL1, "'", "''");
			CCP_CHAR_VAL2 = CTr.Replace(CCP_CHAR_VAL2, "'", "''");
			CCP_CHAR_VAL3 = CTr.Replace(CCP_CHAR_VAL3, "'", "''");
			CCP_CHAR_VAL4 = CTr.Replace(CCP_CHAR_VAL4, "'", "''");
			CCP_CHAR_VAL5 = CTr.Replace(CCP_CHAR_VAL5, "'", "''");
			CCP_CHAR_VAL6 = CTr.Replace(CCP_CHAR_VAL6, "'", "''");
			CCP_CHAR_VAL7 = CTr.Replace(CCP_CHAR_VAL7, "'", "''");
			CCP_SOKUN_TX = CTr.Replace(CCP_SOKUN_TX, "'", "''");
			CCP_RMK_TX = CTr.Replace(CCP_RMK_TX, "'", "''");
			CCP_NORM_YN = CTr.Replace(CCP_NORM_YN, "'", "''");
			CCP_MODI_ID = CTr.Replace(CCP_MODI_ID, "'", "''");
			CCP_GUBN_CD = CTr.Replace(CCP_GUBN_CD, "'", "''");
			CCP_MACH_CD = CTr.Replace(CCP_MACH_CD, "'", "''");
			CCP_MACH_SQ = CTr.Replace(CCP_MACH_SQ, "'", "''");
			CCP_NUSE_ID = CTr.Replace(CCP_NUSE_ID, "'", "''");

			if(CHKBOXCCP_USE_YN.equals("1")) {
				sql = "UPDATE CT_COMM_PANJ SET ";
				sql += "  CCP_MACH_NM = '" + CCP_MACH_NM + "'";
				sql += ", CCP_CMPR_KD = '" + CCP_CMPR_KD + "'";
				sql += ", CCP_ITEM_CD = '" + CCP_ITEM_CD + "'";
				sql += ", CCP_MAN_LOW = '" + CCP_MAN_LOW + "'";
				sql += ", CCP_MAN_HIGH = '" + CCP_MAN_HIGH + "'";
				sql += ", CCP_WOMAN_LOW = '" + CCP_WOMAN_LOW + "'";
				sql += ", CCP_WOMAN_HIGH = '" + CCP_WOMAN_HIGH + "'";
				sql += ", CCP_CHAR_VAL1 = '" + CCP_CHAR_VAL1 + "'";
				sql += ", CCP_CHAR_VAL2 = '" + CCP_CHAR_VAL2 + "'";
				sql += ", CCP_CHAR_VAL3 = '" + CCP_CHAR_VAL3 + "'";
				sql += ", CCP_CHAR_VAL4 = '" + CCP_CHAR_VAL4 + "'";
				sql += ", CCP_CHAR_VAL5 = '" + CCP_CHAR_VAL5 + "'";
				sql += ", CCP_CHAR_VAL6 = '" + CCP_CHAR_VAL6 + "'";
				sql += ", CCP_CHAR_VAL7 = '" + CCP_CHAR_VAL7 + "'";
				sql += ", CCP_SOKUN_TX = '" + CCP_SOKUN_TX + "'";
				sql += ", CCP_RMK_TX = '" + CCP_RMK_TX + "'";
				sql += ", CCP_NORM_YN = '" + CCP_NORM_YN + "'";
				sql += ", CCP_MODI_ID = '" + CCP_MODI_ID + "'";
				sql += ", CCP_MODI_DTT = SYSDATE";
				sql += ", CCP_USE_YN = 'Y'";
				sql += " WHERE CCP_GUBN_CD = '" + CCP_GUBN_CD + "'";
				sql += " AND CCP_MACH_CD = '" + CCP_MACH_CD + "'";
				sql += " AND CCP_MACH_SQ = '" + CCP_MACH_SQ + "'";

				argStmtExec.executeUpdate(sql);
			}
			else {
				sql = "UPDATE CT_COMM_PANJ SET ";
				sql += "  CCP_MACH_NM = '" + CCP_MACH_NM + "'";
				sql += ", CCP_CMPR_KD = '" + CCP_CMPR_KD + "'";
				sql += ", CCP_ITEM_CD = '" + CCP_ITEM_CD + "'";
				sql += ", CCP_MAN_LOW = '" + CCP_MAN_LOW + "'";
				sql += ", CCP_MAN_HIGH = '" + CCP_MAN_HIGH + "'";
				sql += ", CCP_WOMAN_LOW = '" + CCP_WOMAN_LOW + "'";
				sql += ", CCP_WOMAN_HIGH = '" + CCP_WOMAN_HIGH + "'";
				sql += ", CCP_CHAR_VAL1 = '" + CCP_CHAR_VAL1 + "'";
				sql += ", CCP_CHAR_VAL2 = '" + CCP_CHAR_VAL2 + "'";
				sql += ", CCP_CHAR_VAL3 = '" + CCP_CHAR_VAL3 + "'";
				sql += ", CCP_CHAR_VAL4 = '" + CCP_CHAR_VAL4 + "'";
				sql += ", CCP_CHAR_VAL5 = '" + CCP_CHAR_VAL5 + "'";
				sql += ", CCP_CHAR_VAL6 = '" + CCP_CHAR_VAL6 + "'";
				sql += ", CCP_CHAR_VAL7 = '" + CCP_CHAR_VAL7 + "'";
				sql += ", CCP_SOKUN_TX = '" + CCP_SOKUN_TX + "'";
				sql += ", CCP_RMK_TX = '" + CCP_RMK_TX + "'";
				sql += ", CCP_NORM_YN = '" + CCP_NORM_YN + "'";
				sql += ", CCP_MODI_ID = '" + CCP_MODI_ID + "'";
				sql += ", CCP_MODI_DTT = SYSDATE";
				sql += ", CCP_USE_YN = 'N'";
				sql += ", CCP_NUSE_ID = '" + CCP_NUSE_ID + "'";
				sql += ", CCP_NUSE_DTT = SYSDATE";
				sql += " WHERE CCP_GUBN_CD = '" + CCP_GUBN_CD + "'";
				sql += " AND CCP_MACH_CD = '" + CCP_MACH_CD + "'";
				sql += " AND CCP_MACH_SQ = '" + CCP_MACH_SQ + "'";

				argStmtExec.executeUpdate(sql);
			}
		} catch (Exception e) {

			throw new FuncException(e.toString(), sql);
		}

		return sql;
	}
%>
