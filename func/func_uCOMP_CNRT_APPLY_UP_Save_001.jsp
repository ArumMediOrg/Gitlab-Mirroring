<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%!
	public String func_uCOMP_CNRT_APPLY_UP_Save_001(Statement argStmtExec, HashMap argHtMethod) throws Exception {

		String sql = "";
		String sql2 = "";
		String sql_disp = "";

		try {

			String SMODE = (String) argHtMethod.get("SMODE");
			String CHKBOXECC_USE_YN = (String) argHtMethod.get("CHKBOXECC_USE_YN");
			String COMP_CD = (String) argHtMethod.get("COMP_CD");
			String MNGT_YR = (String) argHtMethod.get("MNGT_YR");
			String CNRT_SQ = (String) argHtMethod.get("CNRT_SQ");
			String CNRT_NM = (String) argHtMethod.get("CNRT_NM");
			String CNRT_SDT = (String) argHtMethod.get("CNRT_SDT");
			String CNRT_EDT = (String) argHtMethod.get("CNRT_EDT");
			String SALE_ID = (String) argHtMethod.get("SALE_ID");
			String CNRT_TX = (String) argHtMethod.get("CNRT_TX");
			String USER_ID = (String) argHtMethod.get("USER_ID");

			//
			if(SMODE == null) { SMODE = ""; }
			if(CHKBOXECC_USE_YN == null) { CHKBOXECC_USE_YN = ""; }
			if(COMP_CD == null) { COMP_CD = ""; }
			if(MNGT_YR == null) { MNGT_YR = ""; }
			if(CNRT_SQ == null) { CNRT_SQ = ""; }
			if(CNRT_NM == null) { CNRT_NM = ""; }
			if(CNRT_SDT == null) { CNRT_SDT = ""; }
			if(CNRT_EDT == null) { CNRT_EDT = ""; }
			if(SALE_ID == null) { SALE_ID = ""; }
			if(CNRT_TX == null) { CNRT_TX = ""; }
			if(USER_ID == null) { USER_ID = ""; }

			//
			SMODE = CTr.Replace(SMODE, "'", "''");
			CHKBOXECC_USE_YN = CTr.Replace(CHKBOXECC_USE_YN, "'", "''");
			COMP_CD = CTr.Replace(COMP_CD, "'", "''");
			MNGT_YR = CTr.Replace(MNGT_YR, "'", "''");
			CNRT_SQ = CTr.Replace(CNRT_SQ, "'", "''");
			CNRT_NM = CTr.Replace(CNRT_NM, "'", "''");
			CNRT_SDT = CTr.Replace(CNRT_SDT, "'", "''");
			CNRT_EDT = CTr.Replace(CNRT_EDT, "'", "''");
			SALE_ID = CTr.Replace(SALE_ID, "'", "''");
			CNRT_TX = CTr.Replace(CNRT_TX, "'", "''");
			USER_ID = CTr.Replace(USER_ID, "'", "''");

			if(SMODE.equals("INSERT")) {
				if(CHKBOXECC_USE_YN.equals("1")) {
						sql = "INSERT INTO ET_COMP_CNRT (ECC_COMP_CD, ECC_MNGT_YR, ECC_CNRT_SQ, ECC_CNRT_NM, ECC_CNRT_SDT ,ECC_CNRT_EDT, ECC_SALE_ID, ECC_CNRT_TX, ECC_USE_YN, ECC_INPT_ID ,ECC_INPT_DTT) VALUES (";
						sql += "  '" + COMP_CD + "'";
						sql += ", '" + MNGT_YR + "'";
						sql += ", '" + CNRT_SQ + "'";
						sql += ", '" + CNRT_NM + "'";
						sql += ", '" + CNRT_SDT + "'";
						sql += ", '" + CNRT_EDT + "'";
						sql += ", '" + SALE_ID + "'";
						sql += ", '" + CNRT_TX + "'";
						sql += ", 'Y'";
						sql += ", '" + USER_ID + "'";
						sql += ", SYSDATE";
						sql += ")";

						argStmtExec.executeUpdate(sql);
				}
				else {
						sql = "INSERT INTO ET_COMP_CNRT (ECC_COMP_CD, ECC_MNGT_YR, ECC_CNRT_SQ, ECC_CNRT_NM, ECC_CNRT_SDT ,ECC_CNRT_EDT, ECC_SALE_ID, ECC_CNRT_TX, ECC_USE_YN, ECC_INPT_ID, ECC_INPT_DTT ,ECC_NUSE_ID, ECC_NUSE_DTT) VALUES (";
						sql += "  '" + COMP_CD + "'";
						sql += ", '" + MNGT_YR + "'";
						sql += ", '" + CNRT_SQ + "'";
						sql += ", '" + CNRT_NM + "'";
						sql += ", '" + CNRT_SDT + "'";
						sql += ", '" + CNRT_EDT + "'";
						sql += ", '" + SALE_ID + "'";
						sql += ", '" + CNRT_TX + "'";
						sql += ", 'N'";
						sql += ", '" + USER_ID + "'";
						sql += ", SYSDATE";
						sql += ", '" + USER_ID + "'";
						sql += ", SYSDATE";
						sql += ")";

						argStmtExec.executeUpdate(sql);
				}
			}
			else {
				sql = "UPDATE ET_COMP_CNRT SET ";
				sql += "  ECC_CNRT_NM = '" + CNRT_NM + "'";
				sql += ", ECC_SALE_ID = '" + SALE_ID + "'";
				sql += ", ECC_CNRT_SDT = '" + CNRT_SDT + "'";
				sql += ", ECC_CNRT_EDT = '" + CNRT_EDT + "'";
				sql += ", ECC_CNRT_TX = '" + CNRT_TX + "'";
				sql += ", ECC_MODI_ID = '" + USER_ID + "'";
				sql += ", ECC_MODI_DTT = SYSDATE";

				if(CHKBOXECC_USE_YN.equals("1")) {
						sql += ", ECC_USE_YN = 'Y'";
				}
				else {
						sql += ", ECC_USE_YN = 'N'";
						sql += ", ECC_NUSE_ID = '" + USER_ID + "'";
						sql += ", ECC_NUSE_DTT = SYSDATE";
				}
				sql += "  WHERE ECC_COMP_CD = '" + COMP_CD + "'";
				sql += " AND ECC_MNGT_YR = '" + MNGT_YR + "'";
				sql += " AND ECC_CNRT_SQ = '" + CNRT_SQ + "'";

				argStmtExec.executeUpdate(sql);
			}
		} catch (Exception e) {

			throw new FuncException(e.toString(), sql);
		}

		return sql;
	}
%>
