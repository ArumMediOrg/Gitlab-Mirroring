<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%!
	public String func_uStdt_Acpt_btnSave_RsvnClick_005(Statement argStmtExec, HashMap argHtMethod) throws Exception {

		String sql = "";
		String sql2 = "";
		String sql_disp = "";

		Connection connect = argStmtExec.getConnection();
		CallableStatement CallStmtExec = null;

		try {

			String PQRYTYPE = (String) argHtMethod.get("PQRYTYPE");
			String PCUST_NO = (String) argHtMethod.get("PCUST_NO");
			String PPID = (String) argHtMethod.get("PPID");
			String PPSNL_NM = (String) argHtMethod.get("PPSNL_NM");
			String PSEX_CD = (String) argHtMethod.get("PSEX_CD");
			String PCOMP_CD = (String) argHtMethod.get("PCOMP_CD");
			String PBIRH_DT = (String) argHtMethod.get("PBIRH_DT");
			String PTEL_NO = (String) argHtMethod.get("PTEL_NO");
			String PMOBL_NO = (String) argHtMethod.get("PMOBL_NO");
			String PEMAI_AR = (String) argHtMethod.get("PEMAI_AR");
			String PZIP_CD = (String) argHtMethod.get("PZIP_CD");
			String PZIP_AR = (String) argHtMethod.get("PZIP_AR");
			String PROAD_AR = (String) argHtMethod.get("PROAD_AR");
			String PDIVI_KD = (String) argHtMethod.get("PDIVI_KD");
			String PDIVI_CS = (String) argHtMethod.get("PDIVI_CS");
			String PCLSS_KD = (String) argHtMethod.get("PCLSS_KD");
			String PDIVI_NO = (String) argHtMethod.get("PDIVI_NO");
			String PPID_EN = (String) argHtMethod.get("PPID_EN");
			String PUSER = (String) argHtMethod.get("PUSER");

			//
			if(PQRYTYPE == null) { PQRYTYPE = ""; }
			if(PCUST_NO == null) { PCUST_NO = ""; }
			if(PPID == null) { PPID = ""; }
			if(PPSNL_NM == null) { PPSNL_NM = ""; }
			if(PSEX_CD == null) { PSEX_CD = ""; }
			if(PCOMP_CD == null) { PCOMP_CD = ""; }
			if(PBIRH_DT == null) { PBIRH_DT = ""; }
			if(PTEL_NO == null) { PTEL_NO = ""; }
			if(PMOBL_NO == null) { PMOBL_NO = ""; }
			if(PEMAI_AR == null) { PEMAI_AR = ""; }
			if(PZIP_CD == null) { PZIP_CD = ""; }
			if(PZIP_AR == null) { PZIP_AR = ""; }
			if(PROAD_AR == null) { PROAD_AR = ""; }
			if(PDIVI_KD == null) { PDIVI_KD = ""; }
			if(PDIVI_CS == null) { PDIVI_CS = ""; }
			if(PCLSS_KD == null) { PCLSS_KD = ""; }
			if(PDIVI_NO == null) { PDIVI_NO = ""; }
			if(PPID_EN == null) { PPID_EN = ""; }
			if(PUSER == null) { PUSER = ""; }

			if (PQRYTYPE.equals("INS")){
				sql = " INSERT INTO IT_CUSTOMER ";
				sql += " 	(ICR_CUST_NO, ICR_PENL_ID,  ICR_PENL_SQ, ICR_PENL_NM, ICR_SEX_KD, ";
				sql += " 	ICR_MANA_KD, ICR_CUST_KD,  ICR_NTNA_CD, ICR_COMP_CD, ICR_ENTR_DT, ";
				sql += " 	ICR_BIRH_KD, ICR_BIRH_DT,  ICR_MARY_KD, ICR_MARY_DT, ICR_TEL_NO,  ICR_MOBL_NO, ICR_EMAI_AR, ";
				sql += " 	ICR_ADDR_KD, ICR_ZIP_CD,   ICR_ZIP_SQ,  ICR_ZIP_AR,  ICR_ROAD_AR, ICR_BLDG_NO, ICR_CHART_NO, ";
				sql += " 	ICR_INFO_YN, ICR_RECV_YN, ";
				sql += " 	ICR_DIVI_KD, ICR_DIVI_CS,  ICR_CLSS_KD, ICR_DIVI_NO, ICR_PID_EN,  ICR_USE_YN, ";
				sql += " 	ICR_INPT_ID, ICR_INPT_DTT, ICR_MODI_ID, ICR_MODI_DTT) ";
				sql += " VALUES ";
				sql += " 	(?, ?, '0', ?, ?, ";
				sql += " 	'11', '11',   'KR',       ?, NULL, ";
				sql += " 	'0',  ?,      '0',            NULL, ?, ?, ?, ";
				sql += " 	'1',  ?,  '', ?, ?, '', '', ";
				sql += " 	'1', '1', ";
				sql += " 	?, ?, ?, ?, ?, 'Y', ";
				sql += " 	?, SYSDATE, ?, SYSDATE ) ";

				CallStmtExec = connect.prepareCall(sql);

				CallStmtExec.setString(1,  PCUST_NO);
				CallStmtExec.setString(2,  PPID);
				CallStmtExec.setString(3,  PPSNL_NM);
				CallStmtExec.setString(4,  PSEX_CD);
				CallStmtExec.setString(5,  PCOMP_CD);
				CallStmtExec.setString(6,  PBIRH_DT);
				CallStmtExec.setString(7,  PTEL_NO);
				CallStmtExec.setString(8,  PMOBL_NO);
				CallStmtExec.setString(9,  PEMAI_AR);
				CallStmtExec.setString(10, PZIP_CD);
				CallStmtExec.setString(11, PZIP_AR);
				CallStmtExec.setString(12, PROAD_AR);
				CallStmtExec.setString(13, PDIVI_KD);
				CallStmtExec.setString(14, PDIVI_CS);
				CallStmtExec.setString(15, PCLSS_KD);
				CallStmtExec.setString(16, PDIVI_NO);
				CallStmtExec.setString(17, PPID_EN);
				CallStmtExec.setString(18, PUSER);
				CallStmtExec.setString(19, PUSER);

				CallStmtExec.executeUpdate();

			} else if (PQRYTYPE.equals("UPD")){

				sql = " UPDATE IT_CUSTOMER ";
				sql += " SET ICR_PENL_ID  = ?, ";
				sql += " 	ICR_COMP_CD  = ?, ";
				sql += " 	ICR_TEL_NO  = ?, ";
				sql += " 	ICR_MOBL_NO  = ?, ";
				sql += " 	ICR_EMAI_AR  = ?, ";
				sql += " 	ICR_ZIP_CD   = ?, ";
				sql += " 	ICR_ZIP_SQ   = '', ";
				sql += " 	ICR_ZIP_AR   = ?, ";
				sql += " 	ICR_ROAD_AR  = ?, ";
				sql += " 	ICR_BLDG_NO  = '', ";
				sql += " 	ICR_DIVI_NM  = '', ";
				sql += " 	ICR_DIVI_KD  = ?, ";
				sql += " 	ICR_DIVI_CS  = ?, ";
				sql += " 	ICR_CLSS_KD  = ?, ";
				sql += " 	ICR_DIVI_NO  = ?, ";
				sql += " 	ICR_INFO_YN  = '1', ";
				sql += " 	ICR_RECV_YN  = '1', ";
				sql += " 	ICR_PID_EN   = ?, ";
				sql += " 	ICR_MODI_ID  = ?, ";
				sql += " 	ICR_MODI_DTT = SYSDATE ";
				sql += " WHERE ICR_CUST_NO  = ? ";

				CallStmtExec = connect.prepareCall(sql);

				CallStmtExec.setString(1,  PPID);
				CallStmtExec.setString(2,  PCOMP_CD);
				CallStmtExec.setString(3,  PTEL_NO);
				CallStmtExec.setString(4,  PMOBL_NO);
				CallStmtExec.setString(5,  PEMAI_AR);
				CallStmtExec.setString(6,  PZIP_CD);
				CallStmtExec.setString(7,  PZIP_AR);
				CallStmtExec.setString(8,  PROAD_AR);
				CallStmtExec.setString(9,  PDIVI_KD);
				CallStmtExec.setString(10, PDIVI_CS);
				CallStmtExec.setString(11, PCLSS_KD);
				CallStmtExec.setString(12, PDIVI_NO);
				CallStmtExec.setString(13, PPID_EN);
				CallStmtExec.setString(14, PUSER);
				CallStmtExec.setString(15, PCUST_NO);

				CallStmtExec.executeUpdate();

			}

		} catch (Exception e) {

			throw new FuncException(e.toString(), sql);
		}

		return sql;
	}
%>
