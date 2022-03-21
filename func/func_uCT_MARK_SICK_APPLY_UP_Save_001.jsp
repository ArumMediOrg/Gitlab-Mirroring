<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%!
	public String func_uCT_MARK_SICK_APPLY_UP_Save_001(Statement argStmtExec, HashMap argHtMethod) throws Exception {

		String sql = "";
		String sql2 = "";
		String sql_disp = "";

		try {

			String CHKBOXCMS_USE_YN = (String) argHtMethod.get("CHKBOXCMS_USE_YN");
			String ITEM_CD = (String) argHtMethod.get("ITEM_CD");
			String HEIG_KD = (String) argHtMethod.get("HEIG_KD");
			String KSCD_CD = (String) argHtMethod.get("KSCD_CD");
			String INPT_ID = (String) argHtMethod.get("INPT_ID");
			String NUSE_ID = (String) argHtMethod.get("NUSE_ID");

			//
			if(CHKBOXCMS_USE_YN == null) { CHKBOXCMS_USE_YN = ""; }
			if(ITEM_CD == null) { ITEM_CD = ""; }
			if(HEIG_KD == null) { HEIG_KD = ""; }
			if(KSCD_CD == null) { KSCD_CD = ""; }
			if(INPT_ID == null) { INPT_ID = ""; }
			if(NUSE_ID == null) { NUSE_ID = ""; }

			//
			CHKBOXCMS_USE_YN = CTr.Replace(CHKBOXCMS_USE_YN, "'", "''");
			ITEM_CD = CTr.Replace(ITEM_CD, "'", "''");
			HEIG_KD = CTr.Replace(HEIG_KD, "'", "''");
			KSCD_CD = CTr.Replace(KSCD_CD, "'", "''");
			INPT_ID = CTr.Replace(INPT_ID, "'", "''");
			NUSE_ID = CTr.Replace(NUSE_ID, "'", "''");

			if(CHKBOXCMS_USE_YN.equals("1")) {

				sql = "INSERT INTO CT_MARK_SICK (CMS_ITEM_CD, CMS_HEIG_KD, CMS_KSCD_CD, CMS_USE_YN, CMS_INPT_ID, CMS_INPT_DTT) VALUES (";
				sql += "  '" + ITEM_CD + "'";
				sql += ", '" + HEIG_KD + "'";
				sql += ", '" + KSCD_CD + "'";
				sql += ", 'Y'";
				sql += ", '" + INPT_ID + "'";
				sql += ", SYSDATE";
				sql += ")";

				argStmtExec.executeUpdate(sql);

			} else {

				sql = "INSERT INTO CT_MARK_SICK (CMS_ITEM_CD, CMS_HEIG_KD, CMS_KSCD_CD, CMS_USE_YN, CMS_NUSE_ID, CMS_NUSE_DTT, CMS_INPT_ID, CMS_INPT_DTT) VALUES (";
				sql += "  '" + ITEM_CD + "'";
				sql += ", '" + HEIG_KD + "'";
				sql += ", '" + KSCD_CD + "'";
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
