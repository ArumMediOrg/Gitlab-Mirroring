<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%!
	public String func_uStdt_Acpt_btnSave_RsvnClick_008(Statement argStmtExec, HashMap argHtMethod) throws Exception {

		String sql = "";
		String sql2 = "";
		String sql_disp = "";

		Connection connect = argStmtExec.getConnection();
		CallableStatement CallStmtExec = null;

		try {

			String PQRYTYPE = (String) argHtMethod.get("PQRYTYPE");
			String PRSVN_DT = (String) argHtMethod.get("PRSVN_DT");
			String PRSVN_SQ = (String) argHtMethod.get("PRSVN_SQ");
			String PRSVN_NO = (String) argHtMethod.get("PRSVN_NO");
			String PPSNL_NM = (String) argHtMethod.get("PPSNL_NM");
			String PPSNL_ID = (String) argHtMethod.get("PPSNL_ID");
			String PCOMP_CD = (String) argHtMethod.get("PCOMP_CD");
			String PZIP_CD = (String) argHtMethod.get("PZIP_CD");
			String PZIP_AR = (String) argHtMethod.get("PZIP_AR");
			String PROAD_AR = (String) argHtMethod.get("PROAD_AR");
			String PTEL_NO = (String) argHtMethod.get("PTEL_NO");
			String PMOBL_NO = (String) argHtMethod.get("PMOBL_NO");
			String PEMAI_AR = (String) argHtMethod.get("PEMAI_AR");
			String PDIVI_KD = (String) argHtMethod.get("PDIVI_KD");
			String PDIVI_CS = (String) argHtMethod.get("PDIVI_CS");
			String PCLSS_KD = (String) argHtMethod.get("PCLSS_KD");
			String PDIVI_NO = (String) argHtMethod.get("PDIVI_NO");
			String PUSER = (String) argHtMethod.get("PUSER");
			String PSEX_CD = (String) argHtMethod.get("PSEX_CD");
			String PPID_EN = (String) argHtMethod.get("PPID_EN");
			String PORAL_KD = (String) argHtMethod.get("PORAL_KD");
			String PDEPT_NM = (String) argHtMethod.get("PDEPT_NM");
			String PPRNT_NM = (String) argHtMethod.get("PPRNT_NM");
			String PPRNT_NO = (String) argHtMethod.get("PPRNT_NO");
			String PCUST_NO = (String) argHtMethod.get("PCUST_NO");
			String PMEMO_TX = (String) argHtMethod.get("PMEMO_TX");
			String PSEND_CD = (String) argHtMethod.get("PSEND_CD");

			//
			if(PQRYTYPE == null) { PQRYTYPE = ""; }
			if(PRSVN_DT == null) { PRSVN_DT = ""; }
			if(PRSVN_SQ == null) { PRSVN_SQ = ""; }
			if(PRSVN_NO == null) { PRSVN_NO = ""; }
			if(PPSNL_NM == null) { PPSNL_NM = ""; }
			if(PPSNL_ID == null) { PPSNL_ID = ""; }
			if(PCOMP_CD == null) { PCOMP_CD = ""; }
			if(PZIP_CD == null) { PZIP_CD = ""; }
			if(PZIP_AR == null) { PZIP_AR = ""; }
			if(PROAD_AR == null) { PROAD_AR = ""; }
			if(PTEL_NO == null) { PTEL_NO = ""; }
			if(PMOBL_NO == null) { PMOBL_NO = ""; }
			if(PEMAI_AR == null) { PEMAI_AR = ""; }
			if(PDIVI_KD == null) { PDIVI_KD = ""; }
			if(PDIVI_CS == null) { PDIVI_CS = ""; }
			if(PCLSS_KD == null) { PCLSS_KD = ""; }
			if(PDIVI_NO == null) { PDIVI_NO = ""; }
			if(PUSER == null) { PUSER = ""; }
			if(PSEX_CD == null) { PSEX_CD = ""; }
			if(PPID_EN == null) { PPID_EN = ""; }
			if(PORAL_KD == null) { PORAL_KD = ""; }
			if(PDEPT_NM == null) { PDEPT_NM = ""; }
			if(PPRNT_NM == null) { PPRNT_NM = ""; }
			if(PPRNT_NO == null) { PPRNT_NO = ""; }
			if(PCUST_NO == null) { PCUST_NO = ""; }
			if(PMEMO_TX == null) { PMEMO_TX = ""; }
			if(PSEND_CD == null) { PSEND_CD = ""; }

			if (PQRYTYPE.equals("INS")){

				sql = " INSERT INTO REVER ";
				sql += " 	(REQUEST_DATE,  EXAM_NO,       RSVN_NO,      PERSON_NAME, ";
				sql += " 		PERSONAL_ID,   COMPANY_CODE,  ZIP,          ZIP_AR, ";
				sql += " 		ROAD_AR,       PHONE,         PCS,          EMAIL, ";
				sql += " 		PANG1,         SCHOOL_GROUP,  SCHOOL_CLASS, SCHOOL_NO, ";
				sql += " 		INPT_ID,       INPT_DTT,      SEX,          P_ID, ";
				sql += " 		ORAL_KD,       DEPT_NM, ";
				sql += " 		PARENT_NAME,  PARENT_PCS,     CUSTOMER_ID,  ETC, SEND_CD) ";
				sql += " VALUES (?, ?, ?, ?, ";
				sql += " 		?, ?, ?, ?, ";
				sql += " 		?, ?, ?, ?, ";
				sql += " 		?, ?, ?, ?, ";
				sql += " 		?, SYSDATE, ?, ?, ";
				sql += " 		?, ?, ";
				sql += " 		?, ?, ?, ?, ?) ";

				CallStmtExec = connect.prepareCall(sql);

				CallStmtExec.setString(1,  PRSVN_DT);
				CallStmtExec.setString(2,  PRSVN_SQ);
				CallStmtExec.setString(3,  PRSVN_NO);
				CallStmtExec.setString(4,  PPSNL_NM);
				CallStmtExec.setString(5,  PPSNL_ID);
				CallStmtExec.setString(6,  PCOMP_CD);
				CallStmtExec.setString(7,  PZIP_CD);
				CallStmtExec.setString(8,  PZIP_AR);
				CallStmtExec.setString(9,  PROAD_AR);
				CallStmtExec.setString(10, PTEL_NO);
				CallStmtExec.setString(11, PMOBL_NO);
				CallStmtExec.setString(12, PEMAI_AR);
				CallStmtExec.setString(13, PDIVI_KD);
				CallStmtExec.setString(14, PDIVI_CS);
				CallStmtExec.setString(15, PCLSS_KD);
				CallStmtExec.setString(16, PDIVI_NO);
				CallStmtExec.setString(17, PUSER);
				CallStmtExec.setString(18, PSEX_CD);
				CallStmtExec.setString(19, PPID_EN);
				CallStmtExec.setString(20, PORAL_KD);
				CallStmtExec.setString(21, PDEPT_NM);
				CallStmtExec.setString(22, PPRNT_NM);
				CallStmtExec.setString(23, PPRNT_NO);
				CallStmtExec.setString(24, PCUST_NO);
				CallStmtExec.setString(25, PMEMO_TX);
				CallStmtExec.setString(26, PSEND_CD);

				CallStmtExec.executeUpdate();

			} else if (PQRYTYPE.equals("UPD")){

				sql = " UPDATE REVER SET ";
				sql += " COMPANY_CODE = ?, ";
				sql += " ZIP          = ?, ";
				sql += " ZIP_AR       = ?, ";
				sql += " ROAD_AR      = ?, ";
				sql += " PHONE        = ?, ";
				sql += " PCS          = ?, ";
				sql += " EMAIL        = ?, ";
				sql += " PANG1        = ?, ";
				sql += " SCHOOL_GROUP = ?, ";
				sql += " SCHOOL_CLASS = ?, ";
				sql += " SCHOOL_NO    = ?, ";
				sql += " ORAL_KD      = ?, ";
				sql += " DEPT_NM      = ?, ";
				sql += " MODI_ID      = ?, ";
				sql += " MODI_DTT     = SYSDATE, ";
				sql += " PARENT_NAME  = ?, ";
				sql += " PARENT_PCS   = ?, ";
				sql += " ETC          = ?, ";
				sql += " SEND_CD      = ? ";
				sql += " WHERE RSVN_NO = ? ";

				CallStmtExec = connect.prepareCall(sql);

				CallStmtExec.setString(1,  PCOMP_CD);
				CallStmtExec.setString(2,  PZIP_CD);
				CallStmtExec.setString(3,  PZIP_AR);
				CallStmtExec.setString(4,  PROAD_AR);
				CallStmtExec.setString(5,  PTEL_NO);
				CallStmtExec.setString(6,  PMOBL_NO);
				CallStmtExec.setString(7,  PEMAI_AR);
				CallStmtExec.setString(8,  PDIVI_KD);
				CallStmtExec.setString(9,  PDIVI_CS);
				CallStmtExec.setString(10, PCLSS_KD);
				CallStmtExec.setString(11, PDIVI_NO);
				CallStmtExec.setString(12, PORAL_KD);
				CallStmtExec.setString(13, PDEPT_NM);
				CallStmtExec.setString(14, PUSER);
				CallStmtExec.setString(15, PPRNT_NM);
				CallStmtExec.setString(16, PPRNT_NO);
				CallStmtExec.setString(17, PMEMO_TX);
				CallStmtExec.setString(18, PSEND_CD);
				CallStmtExec.setString(19, PRSVN_NO);

				CallStmtExec.executeUpdate();

			}

		} catch (Exception e) {

			throw new FuncException(e.toString(), sql);
		}

		return sql;
	}
%>
