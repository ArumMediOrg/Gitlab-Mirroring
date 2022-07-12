<%!
	public String func_uIT_Hospital_Up_Modify_001(Statement argStmtExec, HashMap argHtMethod) throws Exception {

		String sql = "";
		String sql2 = "";
		String sql_disp = "";

		try {

			String HOSP_NO = (String) argHtMethod.get("HOSP_NO");
			String HOSP_NM = (String) argHtMethod.get("HOSP_NM");
			String BUSI_NO = (String) argHtMethod.get("BUSI_NO");
			String BUCO_NO = (String) argHtMethod.get("BUCO_NO");
			String BUCA_NO = (String) argHtMethod.get("BUCA_NO");
			String PRES_NM = (String) argHtMethod.get("PRES_NM");
			String ZIP_CD = (String) argHtMethod.get("ZIP_CD");
			String ZIP_AR = (String) argHtMethod.get("ZIP_AR");
			String ROAD_AR = (String) argHtMethod.get("ROAD_AR");
			String ASSO_NO = (String) argHtMethod.get("ASSO_NO");
			String ASSO_NM = (String) argHtMethod.get("ASSO_NM");
			String STAN_CD = (String) argHtMethod.get("STAN_CD");
			String HECK_CD = (String) argHtMethod.get("HECK_CD");
			String SYCK_CD = (String) argHtMethod.get("SYCK_CD");
			String SUCK_CD = (String) argHtMethod.get("SUCK_CD");
			String EOCK_CD = (String) argHtMethod.get("EOCK_CD");
			String EBCK_CD = (String) argHtMethod.get("EBCK_CD");
			String SACK_CD = (String) argHtMethod.get("SACK_CD");
			String GUCK_CD = (String) argHtMethod.get("GUCK_CD");
			String HYCK_CD = (String) argHtMethod.get("HYCK_CD");
			String SPCK_CD = (String) argHtMethod.get("SPCK_CD");
			String MACK_CD = (String) argHtMethod.get("MACK_CD");
			String BLCK_CD = (String) argHtMethod.get("BLCK_CD");
			String SECK_CD = (String) argHtMethod.get("SECK_CD");
			String BUSI_CD = (String) argHtMethod.get("BUSI_CD");
			String CHAR_YN = (String) argHtMethod.get("CHAR_YN");
			String SUBO_CD = (String) argHtMethod.get("SUBO_CD");
			String JTEL_NO = (String) argHtMethod.get("JTEL_NO");
			String HOSP_IMG = (String) argHtMethod.get("HOSP_IMG");
			String GTEL_NO = (String) argHtMethod.get("GTEL_NO");
			String STEL_NO = (String) argHtMethod.get("STEL_NO");
			String ACNU1_NO = (String) argHtMethod.get("ACNU1_NO");
			String ACNU2_NO = (String) argHtMethod.get("ACNU2_NO");
			String ACNU3_NO = (String) argHtMethod.get("ACNU3_NO");
			String MODI_ID = (String) argHtMethod.get("MODI_ID");
			String MODI_DTT = (String) argHtMethod.get("MODI_DTT");
			String HOSP_NO2 = (String) argHtMethod.get("HOSP_NO2");
			String HOSP_NM2 = (String) argHtMethod.get("HOSP_NM2");
			String DTTEL_NO = (String) argHtMethod.get("DTTEL_NO");
			String ZIP_CD2 = (String) argHtMethod.get("ZIP_CD2");
			String ZIP_AR2 = (String) argHtMethod.get("ZIP_AR2");
			String ROAD_AR2 = (String) argHtMethod.get("ROAD_AR2");
			String HOSP_IMG2 = (String) argHtMethod.get("HOSP_IMG2");
			String HOSP_CD = (String) argHtMethod.get("HOSP_CD");
			String RTKN_KEY = (String) argHtMethod.get("RTKN_KEY");
			String STKN_KEY = (String) argHtMethod.get("STKN_KEY");
			String NETDOWN_PATH = (String) argHtMethod.get("NETDOWN_PATH");

			//
			if(HOSP_NO == null) { HOSP_NO = ""; }
			if(HOSP_NM == null) { HOSP_NM = ""; }
			if(BUSI_NO == null) { BUSI_NO = ""; }
			if(BUCO_NO == null) { BUCO_NO = ""; }
			if(BUCA_NO == null) { BUCA_NO = ""; }
			if(PRES_NM == null) { PRES_NM = ""; }
			if(ZIP_CD == null) { ZIP_CD = ""; }
			if(ZIP_AR == null) { ZIP_AR = ""; }
			if(ROAD_AR == null) { ROAD_AR = ""; }
			if(ASSO_NO == null) { ASSO_NO = ""; }
			if(ASSO_NM == null) { ASSO_NM = ""; }
			if(STAN_CD == null) { STAN_CD = ""; }
			if(HECK_CD == null) { HECK_CD = ""; }
			if(SYCK_CD == null) { SYCK_CD = ""; }
			if(SUCK_CD == null) { SUCK_CD = ""; }
			if(EOCK_CD == null) { EOCK_CD = ""; }
			if(EBCK_CD == null) { EBCK_CD = ""; }
			if(SACK_CD == null) { SACK_CD = ""; }
			if(GUCK_CD == null) { GUCK_CD = ""; }
			if(HYCK_CD == null) { HYCK_CD = ""; }
			if(SPCK_CD == null) { SPCK_CD = ""; }
			if(MACK_CD == null) { MACK_CD = ""; }
			if(BLCK_CD == null) { BLCK_CD = ""; }
			if(SECK_CD == null) { SECK_CD = ""; }
			if(BUSI_CD == null) { BUSI_CD = ""; }
			if(CHAR_YN == null) { CHAR_YN = ""; }
			if(SUBO_CD == null) { SUBO_CD = ""; }
			if(JTEL_NO == null) { JTEL_NO = ""; }
			if(HOSP_IMG == null) { HOSP_IMG = ""; }
			if(GTEL_NO == null) { GTEL_NO = ""; }
			if(STEL_NO == null) { STEL_NO = ""; }
			if(ACNU1_NO == null) { ACNU1_NO = ""; }
			if(ACNU2_NO == null) { ACNU2_NO = ""; }
			if(ACNU3_NO == null) { ACNU3_NO = ""; }
			if(MODI_ID == null) { MODI_ID = ""; }
			if(MODI_DTT == null) { MODI_DTT = ""; }
			if(HOSP_NO2 == null) { HOSP_NO2 = ""; }
			if(HOSP_NM2 == null) { HOSP_NM2 = ""; }
			if(DTTEL_NO == null) { DTTEL_NO = ""; }
			if(ZIP_CD2 == null) { ZIP_CD2 = ""; }
			if(ZIP_AR2 == null) { ZIP_AR2 = ""; }
			if(ROAD_AR2 == null) { ROAD_AR2 = ""; }
			if(HOSP_IMG2 == null) { HOSP_IMG2 = ""; }
			if(HOSP_CD == null) { HOSP_CD = ""; }
			if(RTKN_KEY == null) { RTKN_KEY = ""; }
			if(STKN_KEY == null) { STKN_KEY = ""; }
			if(NETDOWN_PATH == null) { NETDOWN_PATH = ""; }

			sql = "UPDATE IT_HOSPITAL SET IHL_HOSP_NO = ?, IHL_HOSP_NM = ?, IHL_BUSI_NO = ?, IHL_BUCO_NO = ?, IHL_BUCA_NO = ?, IHL_PRES_NM = ?, IHL_ZIP_CD = ?, IHL_ZIP_AR = ?, IHL_ROAD_AR = ?, IHL_ASSO_NO = ?, IHL_ASSO_NM = ?, IHL_STAN_CD = ?, IHL_HECK_CD = ?, IHL_SYCK_CD = ?, IHL_SUCK_CD = ?, IHL_EOCK_CD = ?, IHL_EBCK_CD = ?, IHL_SACK_CD = ?, IHL_GUCK_CD = ?, IHL_HYCK_CD = ?, IHL_SPCK_CD = ?, IHL_MACK_CD = ?, IHL_BLCK_CD = ?, IHL_SECK_CD = ?, IHL_BUSI_CD = ?, IHL_CHAR_YN = ?, IHL_SUBO_CD = ?, IHL_JTEL_NO = ?, IHL_HOSP_IMG = ?, IHL_GTEL_NO = ?, IHL_STEL_NO = ?, IHL_ACNU1_NO = ?, IHL_ACNU2_NO = ?, IHL_ACNU3_NO = ?, IHL_MODI_ID = ?, IHL_MODI_DTT = ?, IHL_HOSP_NO2 = ?, IHL_HOSP_NM2 = ?, IHL_DTTEL_NO = ?, IHL_ZIP_CD2 = ?, IHL_ZIP_AR2 = ?, IHL_ROAD_AR2 = ?, IHL_HOSP_IMG2 = ?, IHL_HOSP_CD = ?, NETDOWN_PATH = ?";
			if(! RTKN_KEY.equals("")) {
				sql += ", IHL_RTKN_KEY = ?";
			}
			if(! STKN_KEY.equals("")) {
				sql += ", IHL_STKN_KEY = ?";
			}

			pstmt = connect.prepareStatement(sql);

			pstmt.setString(1, HOSP_NO);
			pstmt.setString(2, HOSP_NM);
			pstmt.setString(3, BUSI_NO);
			pstmt.setString(4, BUCO_NO);
			pstmt.setString(5, BUCA_NO);
			pstmt.setString(6, PRES_NM);
			pstmt.setString(7, ZIP_CD);
			pstmt.setString(8, ZIP_AR);
			pstmt.setString(9, ROAD_AR);
			pstmt.setString(10, ASSO_NO);
			pstmt.setString(11, ASSO_NM);
			pstmt.setString(12, STAN_CD);
			pstmt.setString(13, HECK_CD);
			pstmt.setString(14, SYCK_CD);
			pstmt.setString(15, SUCK_CD);
			pstmt.setString(16, EOCK_CD);
			pstmt.setString(17, EBCK_CD);
			pstmt.setString(18, SACK_CD);
			pstmt.setString(19, GUCK_CD);
			pstmt.setString(20, HYCK_CD);
			pstmt.setString(21, SPCK_CD);
			pstmt.setString(22, MACK_CD);
			pstmt.setString(23, BLCK_CD);
			pstmt.setString(24, SECK_CD);
			pstmt.setString(25, BUSI_CD);
			pstmt.setString(26, CHAR_YN);
			pstmt.setString(27, SUBO_CD);
			pstmt.setString(28, JTEL_NO);
			pstmt.setBytes(29, HOSP_IMG.getBytes());
			pstmt.setString(30, GTEL_NO);
			pstmt.setString(31, STEL_NO);
			pstmt.setString(32, ACNU1_NO);
			pstmt.setString(33, ACNU2_NO);
			pstmt.setString(34, ACNU3_NO);
			pstmt.setString(35, MODI_ID);
			// pstmt.setString(36, (MODI_DTT.equals("") ? null : MODI_DTT));
			pstmt.setTimestamp(36, MODI_DTT.equals("") ? null : java.sql.Timestamp.valueOf(MODI_DTT));
			pstmt.setString(37, HOSP_NO2);
			pstmt.setString(38, HOSP_NM2);
			pstmt.setString(39, DTTEL_NO);
			pstmt.setString(40, ZIP_CD2);
			pstmt.setString(41, ZIP_AR2);
			pstmt.setString(42, ROAD_AR2);
			pstmt.setBytes(43, HOSP_IMG2.getBytes());
			pstmt.setString(44, HOSP_CD);
			pstmt.setString(45, NETDOWN_PATH);

			if(! RTKN_KEY.equals("")) {
				pstmt.setString(46, RTKN_KEY);
			}
			if(! STKN_KEY.equals("")) {
				if(! RTKN_KEY.equals("")) {
						pstmt.setString(47, STKN_KEY);
				} else {
						pstmt.setString(46, STKN_KEY);
				}
			}

			pstmt.executeUpdate();
		} catch (Exception e) {

			throw new FuncException(e.toString(), sql);
		}

		return sql;
	}
%>
