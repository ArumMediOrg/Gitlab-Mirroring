<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%!
	public String func_uDental_Panj_ufDntlSave_002(Statement argStmtExec, HashMap argHtMethod) throws Exception {

		String sql = "";
		String sql2 = "";
		String sql_disp = "";

		try {

			String ICNT = (String) argHtMethod.get("ICNT");
			String MJ01_KD = (String) argHtMethod.get("MJ01_KD");
			String MJ02_KD = (String) argHtMethod.get("MJ02_KD");
			String MJ03_KD = (String) argHtMethod.get("MJ03_KD");
			String MJ04_KD = (String) argHtMethod.get("MJ04_KD");
			String MJ05_KD = (String) argHtMethod.get("MJ05_KD");
			String MJ06_KD = (String) argHtMethod.get("MJ06_KD");
			String DT01_KD = (String) argHtMethod.get("DT01_KD");
			String DT02_KD = (String) argHtMethod.get("DT02_KD");
			String DT03_KD = (String) argHtMethod.get("DT03_KD");
			String DT04_KD = (String) argHtMethod.get("DT04_KD");
			String DJ01_KD = (String) argHtMethod.get("DJ01_KD");
			String DJ02_KD = (String) argHtMethod.get("DJ02_KD");
			String ETAL_EX = (String) argHtMethod.get("ETAL_EX");
			String D401_VAL = (String) argHtMethod.get("D401_VAL");
			String D402_VAL = (String) argHtMethod.get("D402_VAL");
			String D403_VAL = (String) argHtMethod.get("D403_VAL");
			String D404_VAL = (String) argHtMethod.get("D404_VAL");
			String D405_VAL = (String) argHtMethod.get("D405_VAL");
			String D406_VAL = (String) argHtMethod.get("D406_VAL");
			String DTOT_VAL = (String) argHtMethod.get("DTOT_VAL");
			String PANJ_CD = (String) argHtMethod.get("PANJ_CD");
			String IMME_EX = (String) argHtMethod.get("IMME_EX");
			String ACTI_EX = (String) argHtMethod.get("ACTI_EX");
			String DOCT_CD = (String) argHtMethod.get("DOCT_CD");
			String TOBO_DT = (String) argHtMethod.get("TOBO_DT");
			String PANJ_DT = (String) argHtMethod.get("PANJ_DT");
			String PANJ_YN = (String) argHtMethod.get("PANJ_YN");
			String USER_ID = (String) argHtMethod.get("USER_ID");
			String EXAM_DT = (String) argHtMethod.get("EXAM_DT");
			String EXAM_SQ = (String) argHtMethod.get("EXAM_SQ");

			//
			if(ICNT == null) { ICNT = ""; }
			if(MJ01_KD == null) { MJ01_KD = ""; }
			if(MJ02_KD == null) { MJ02_KD = ""; }
			if(MJ03_KD == null) { MJ03_KD = ""; }
			if(MJ04_KD == null) { MJ04_KD = ""; }
			if(MJ05_KD == null) { MJ05_KD = ""; }
			if(MJ06_KD == null) { MJ06_KD = ""; }
			if(DT01_KD == null) { DT01_KD = ""; }
			if(DT02_KD == null) { DT02_KD = ""; }
			if(DT03_KD == null) { DT03_KD = ""; }
			if(DT04_KD == null) { DT04_KD = ""; }
			if(DJ01_KD == null) { DJ01_KD = ""; }
			if(DJ02_KD == null) { DJ02_KD = ""; }
			if(ETAL_EX == null) { ETAL_EX = ""; }
			if(D401_VAL == null) { D401_VAL = ""; }
			if(D402_VAL == null) { D402_VAL = ""; }
			if(D403_VAL == null) { D403_VAL = ""; }
			if(D404_VAL == null) { D404_VAL = ""; }
			if(D405_VAL == null) { D405_VAL = ""; }
			if(D406_VAL == null) { D406_VAL = ""; }
			if(DTOT_VAL == null) { DTOT_VAL = ""; }
			if(PANJ_CD == null) { PANJ_CD = ""; }
			if(IMME_EX == null) { IMME_EX = ""; }
			if(ACTI_EX == null) { ACTI_EX = ""; }
			if(DOCT_CD == null) { DOCT_CD = ""; }
			if(TOBO_DT == null) { TOBO_DT = ""; }
			if(PANJ_DT == null) { PANJ_DT = ""; }
			if(PANJ_YN == null) { PANJ_YN = ""; }
			if(USER_ID == null) { USER_ID = ""; }
			if(EXAM_DT == null) { EXAM_DT = ""; }
			if(EXAM_SQ == null) { EXAM_SQ = ""; }

			//
			ICNT = CTr.Replace(ICNT, "'", "''");
			MJ01_KD = CTr.Replace(MJ01_KD, "'", "''");
			MJ02_KD = CTr.Replace(MJ02_KD, "'", "''");
			MJ03_KD = CTr.Replace(MJ03_KD, "'", "''");
			MJ04_KD = CTr.Replace(MJ04_KD, "'", "''");
			MJ05_KD = CTr.Replace(MJ05_KD, "'", "''");
			MJ06_KD = CTr.Replace(MJ06_KD, "'", "''");
			DT01_KD = CTr.Replace(DT01_KD, "'", "''");
			DT02_KD = CTr.Replace(DT02_KD, "'", "''");
			DT03_KD = CTr.Replace(DT03_KD, "'", "''");
			DT04_KD = CTr.Replace(DT04_KD, "'", "''");
			DJ01_KD = CTr.Replace(DJ01_KD, "'", "''");
			DJ02_KD = CTr.Replace(DJ02_KD, "'", "''");
			ETAL_EX = CTr.Replace(ETAL_EX, "'", "''");
			D401_VAL = CTr.Replace(D401_VAL, "'", "''");
			D402_VAL = CTr.Replace(D402_VAL, "'", "''");
			D403_VAL = CTr.Replace(D403_VAL, "'", "''");
			D404_VAL = CTr.Replace(D404_VAL, "'", "''");
			D405_VAL = CTr.Replace(D405_VAL, "'", "''");
			D406_VAL = CTr.Replace(D406_VAL, "'", "''");
			DTOT_VAL = CTr.Replace(DTOT_VAL, "'", "''");
			PANJ_CD = CTr.Replace(PANJ_CD, "'", "''");
			IMME_EX = CTr.Replace(IMME_EX, "'", "''");
			ACTI_EX = CTr.Replace(ACTI_EX, "'", "''");
			DOCT_CD = CTr.Replace(DOCT_CD, "'", "''");
			TOBO_DT = CTr.Replace(TOBO_DT, "'", "''");
			PANJ_DT = CTr.Replace(PANJ_DT, "'", "''");
			PANJ_YN = CTr.Replace(PANJ_YN, "'", "''");
			USER_ID = CTr.Replace(USER_ID, "'", "''");
			EXAM_DT = CTr.Replace(EXAM_DT, "'", "''");
			EXAM_SQ = CTr.Replace(EXAM_SQ, "'", "''");

			// if(ICNT > 0) {
			if(Integer.parseInt("0" + ICNT) > 0) {
			
				sql = "UPDATE ET_DENTAL_PANJ SET ";
				sql += "  EDP_MJ01_KD = '" + MJ01_KD + "'";
				sql += ", EDP_MJ02_KD = '" + MJ02_KD + "'";
				sql += ", EDP_MJ03_KD = '" + MJ03_KD + "'";
				sql += ", EDP_MJ04_KD = '" + MJ04_KD + "'";
				sql += ", EDP_MJ05_KD = '" + MJ05_KD + "'";
				sql += ", EDP_MJ06_KD = '" + MJ06_KD + "'";
				sql += ", EDP_DT01_KD = '" + DT01_KD + "'";
				sql += ", EDP_DT02_KD = '" + DT02_KD + "'";
				sql += ", EDP_DT03_KD = '" + DT03_KD + "'";
				sql += ", EDP_DT04_KD = '" + DT04_KD + "'";
				sql += ", EDP_DJ01_KD = '" + DJ01_KD + "'";
				sql += ", EDP_DJ02_KD = '" + DJ02_KD + "'";
				sql += ", EDP_ETAL_EX = '" + ETAL_EX + "'";
				sql += ", EDP_D401_VAL = '" + D401_VAL + "'";
				sql += ", EDP_D402_VAL = '" + D402_VAL + "'";
				sql += ", EDP_D403_VAL = '" + D403_VAL + "'";
				sql += ", EDP_D404_VAL = '" + D404_VAL + "'";
				sql += ", EDP_D405_VAL = '" + D405_VAL + "'";
				sql += ", EDP_D406_VAL = '" + D406_VAL + "'";
				sql += ", EDP_DTOT_VAL = '" + DTOT_VAL + "'";
				sql += ", EDP_PANJ_CD = '" + PANJ_CD + "'";
				sql += ", EDP_IMME_EX = '" + IMME_EX + "'";
				sql += ", EDP_ACTI_EX = '" + ACTI_EX + "'";
				sql += ", EDP_DOCT_CD = '" + DOCT_CD + "'";
				sql += ", EDP_TOBO_DT = '" + TOBO_DT + "'";
				sql += ", EDP_PANJ_DT = '" + PANJ_DT + "'";
				sql += ", EDP_PANJ_YN = '" + PANJ_YN + "'";
				sql += ", EDP_MODI_ID = '" + USER_ID + "'";
				sql += ", EDP_MODI_DTT = SYSDATE";
				sql += " WHERE EDP_EXAM_DT = '" + EXAM_DT + "'";
				sql += " AND EDP_EXAM_SQ = '" + EXAM_SQ + "'";

				argStmtExec.executeUpdate(sql);

			} else {
				sql = "INSERT INTO ET_DENTAL_PANJ (EDP_EXAM_DT, EDP_EXAM_SQ, EDP_MJ01_KD, EDP_MJ02_KD, EDP_MJ03_KD, EDP_MJ04_KD, EDP_MJ05_KD, EDP_MJ06_KD, EDP_DT01_KD, EDP_DT02_KD, EDP_DT03_KD, EDP_DT04_KD, EDP_DJ01_KD, EDP_DJ02_KD, EDP_ETAL_EX, EDP_D401_VAL, EDP_D402_VAL, EDP_D403_VAL, EDP_D404_VAL, EDP_D405_VAL, EDP_D406_VAL, EDP_DTOT_VAL, EDP_PANJ_CD, EDP_IMME_EX, EDP_ACTI_EX, EDP_DOCT_CD, EDP_TOBO_DT, EDP_PANJ_DT, EDP_PANJ_YN, EDP_INPT_ID, EDP_INPT_DTT) VALUES (";
				sql += "  '" + EXAM_DT + "'";
				sql += ", '" + EXAM_SQ + "'";
				sql += ", '" + MJ01_KD + "'";
				sql += ", '" + MJ02_KD + "'";
				sql += ", '" + MJ03_KD + "'";
				sql += ", '" + MJ04_KD + "'";
				sql += ", '" + MJ05_KD + "'";
				sql += ", '" + MJ06_KD + "'";
				sql += ", '" + DT01_KD + "'";
				sql += ", '" + DT02_KD + "'";
				sql += ", '" + DT03_KD + "'";
				sql += ", '" + DT04_KD + "'";
				sql += ", '" + DJ01_KD + "'";
				sql += ", '" + DJ02_KD + "'";
				sql += ", '" + ETAL_EX + "'";
				sql += ", '" + D401_VAL + "'";
				sql += ", '" + D402_VAL + "'";
				sql += ", '" + D403_VAL + "'";
				sql += ", '" + D404_VAL + "'";
				sql += ", '" + D405_VAL + "'";
				sql += ", '" + D406_VAL + "'";
				sql += ", '" + DTOT_VAL + "'";
				sql += ", '" + PANJ_CD + "'";
				sql += ", '" + IMME_EX + "'";
				sql += ", '" + ACTI_EX + "'";
				sql += ", '" + DOCT_CD + "'";
				sql += ", '" + TOBO_DT + "'";
				sql += ", '" + PANJ_DT + "'";
				sql += ", '" + PANJ_YN + "'";
				sql += ", '" + USER_ID + "'";
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
