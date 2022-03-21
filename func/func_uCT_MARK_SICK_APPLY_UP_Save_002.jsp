<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%!
	public String func_uCT_MARK_SICK_APPLY_UP_Save_002(Statement argStmtExec, HashMap argHtMethod) throws Exception {

		String sql = "";
		String sql2 = "";
		String sql_disp = "";

		try {

			String MODI_ID = (String) argHtMethod.get("MODI_ID");
			String ITEM_CD = (String) argHtMethod.get("ITEM_CD");
			String HEIG_KD = (String) argHtMethod.get("HEIG_KD");
			String KSCD_CD = (String) argHtMethod.get("KSCD_CD");
			String NUSE_ID = (String) argHtMethod.get("NUSE_ID");
			String CHKBOXCMS_USE_YN = (String) argHtMethod.get("CHKBOXCMS_USE_YN");

			//
			if(MODI_ID == null) { MODI_ID = ""; }
			if(ITEM_CD == null) { ITEM_CD = ""; }
			if(HEIG_KD == null) { HEIG_KD = ""; }
			if(KSCD_CD == null) { KSCD_CD = ""; }
			if(NUSE_ID == null) { NUSE_ID = ""; }
			if(CHKBOXCMS_USE_YN == null) { CHKBOXCMS_USE_YN = ""; }

			//
			MODI_ID = CTr.Replace(MODI_ID, "'", "''");
			ITEM_CD = CTr.Replace(ITEM_CD, "'", "''");
			HEIG_KD = CTr.Replace(HEIG_KD, "'", "''");
			KSCD_CD = CTr.Replace(KSCD_CD, "'", "''");
			NUSE_ID = CTr.Replace(NUSE_ID, "'", "''");
			CHKBOXCMS_USE_YN = CTr.Replace(CHKBOXCMS_USE_YN, "'", "''");

			if(CHKBOXCMS_USE_YN.equals("1")) {
				sql = "UPDATE CT_MARK_SICK SET ";
				sql += "  CMS_MODI_ID = '" + MODI_ID + "'";
				sql += ", CMS_USE_YN = 'Y'";
				sql += ", CMS_MODI_DTT = SYSDATE";
				sql += " WHERE CMS_ITEM_CD = '" + ITEM_CD + "'";
				sql += " AND CMS_HEIG_KD = '" + HEIG_KD + "'";
				sql += " AND CMS_KSCD_CD = '" + KSCD_CD + "'";	

				argStmtExec.executeUpdate(sql);

			} else {
				sql = "UPDATE CT_MARK_SICK SET ";
				sql += "  CMS_MODI_ID = '" + MODI_ID + "'";
				sql += ", CMS_USE_YN = 'N'";
				sql += ", CMS_MODI_DTT = SYSDATE";
				sql += ", CMS_NUSE_ID = '" + NUSE_ID + "'";
				sql += ", CMS_NUSE_DTT = SYSDATE";
				sql += " WHERE CMS_ITEM_CD = '" + ITEM_CD + "'";
				sql += " AND CMS_HEIG_KD = '" + HEIG_KD + "'";
				sql += " AND CMS_KSCD_CD = '" + KSCD_CD + "'";

				argStmtExec.executeUpdate(sql);

			}
		} catch (Exception e) {

			throw new FuncException(e.toString(), sql);
		}

		return sql;
	}
%>
