<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%!
	public String func_uBT_ESTIMATE_APPLY_UP_Save_001(Statement argStmtExec, HashMap argHtMethod) throws Exception {

		String sql = "";
		String sql2 = "";
		String sql_disp = "";

		try {

			String CHKBOXBEE_USE_YN = (String) argHtMethod.get("CHKBOXBEE_USE_YN");
			String MNGT_YR = (String) argHtMethod.get("MNGT_YR");
			String ESTI_CD = (String) argHtMethod.get("ESTI_CD");
			String ESTI_NM = (String) argHtMethod.get("ESTI_NM");
			String COMP_CD = (String) argHtMethod.get("COMP_CD");
			String SALE_CD = (String) argHtMethod.get("SALE_CD");
			String ESTI_SDT = (String) argHtMethod.get("ESTI_SDT");
			String ESTI_EDT = (String) argHtMethod.get("ESTI_EDT");
			String PRES_DT = (String) argHtMethod.get("PRES_DT");
			String CALC_CD = (String) argHtMethod.get("CALC_CD");
			String ITKD_CD = (String) argHtMethod.get("ITKD_CD");
			String TBAS_CD = (String) argHtMethod.get("TBAS_CD");
			String ESTI_TX = (String) argHtMethod.get("ESTI_TX");
			String INPT_ID = (String) argHtMethod.get("INPT_ID");
			String NUSE_ID = (String) argHtMethod.get("NUSE_ID");

			//
			if(CHKBOXBEE_USE_YN == null) { CHKBOXBEE_USE_YN = ""; }
			if(MNGT_YR == null) { MNGT_YR = ""; }
			if(ESTI_CD == null) { ESTI_CD = ""; }
			if(ESTI_NM == null) { ESTI_NM = ""; }
			if(COMP_CD == null) { COMP_CD = ""; }
			if(SALE_CD == null) { SALE_CD = ""; }
			if(ESTI_SDT == null) { ESTI_SDT = ""; }
			if(ESTI_EDT == null) { ESTI_EDT = ""; }
			if(PRES_DT == null) { PRES_DT = ""; }
			if(CALC_CD == null) { CALC_CD = ""; }
			if(ITKD_CD == null) { ITKD_CD = ""; }
			if(TBAS_CD == null) { TBAS_CD = ""; }
			if(ESTI_TX == null) { ESTI_TX = ""; }
			if(INPT_ID == null) { INPT_ID = ""; }
			if(NUSE_ID == null) { NUSE_ID = ""; }

			//
			CHKBOXBEE_USE_YN = CTr.Replace(CHKBOXBEE_USE_YN, "'", "''");
			MNGT_YR = CTr.Replace(MNGT_YR, "'", "''");
			ESTI_CD = CTr.Replace(ESTI_CD, "'", "''");
			ESTI_NM = CTr.Replace(ESTI_NM, "'", "''");
			COMP_CD = CTr.Replace(COMP_CD, "'", "''");
			SALE_CD = CTr.Replace(SALE_CD, "'", "''");
			ESTI_SDT = CTr.Replace(ESTI_SDT, "'", "''");
			ESTI_EDT = CTr.Replace(ESTI_EDT, "'", "''");
			PRES_DT = CTr.Replace(PRES_DT, "'", "''");
			CALC_CD = CTr.Replace(CALC_CD, "'", "''");
			ITKD_CD = CTr.Replace(ITKD_CD, "'", "''");
			TBAS_CD = CTr.Replace(TBAS_CD, "'", "''");
			ESTI_TX = CTr.Replace(ESTI_TX, "'", "''");
			INPT_ID = CTr.Replace(INPT_ID, "'", "''");
			NUSE_ID = CTr.Replace(NUSE_ID, "'", "''");

			if(CHKBOXBEE_USE_YN.equals("Y")) {
				sql = "INSERT INTO BT_ESTIMATE (BEE_MNGT_YR,BEE_ESTI_CD,BEE_ESTI_NM,BEE_COMP_CD,BEE_SALE_CD, BEE_ESTI_SDT,BEE_ESTI_EDT,BEE_PRES_DT,BEE_CALC_CD,BEE_ITKD_CD, BEE_TBAS_CD,BEE_ESTI_TX,BEE_USE_YN,BEE_INPT_ID,BEE_INPT_DTT) VALUES (";
				sql += "  '" + MNGT_YR + "'";
				sql += ", '" + ESTI_CD + "'";
				sql += ", '" + ESTI_NM + "'";
				sql += ", '" + COMP_CD + "'";
				sql += ", '" + SALE_CD + "'";
				sql += ", '" + ESTI_SDT + "'";
				sql += ", '" + ESTI_EDT + "'";
				sql += ", '" + PRES_DT + "'";
				sql += ", '" + CALC_CD + "'";
				sql += ", '" + ITKD_CD + "'";
				sql += ", '" + TBAS_CD + "'";
				sql += ", '" + ESTI_TX + "'";
				sql += ", 'Y'";
				sql += ", '" + INPT_ID + "'";
				sql += ", SYSDATE";
				sql += ")";

				argStmtExec.executeUpdate(sql);

			} else {
				sql = "INSERT INTO BT_ESTIMATE (BEE_MNGT_YR,BEE_ESTI_CD,BEE_ESTI_NM,BEE_COMP_CD,BEE_SALE_CD, BEE_ESTI_SDT,BEE_ESTI_EDT,BEE_PRES_DT,BEE_CALC_CD,BEE_ITKD_CD, BEE_TBAS_CD,BEE_ESTI_TX,BEE_USE_YN,BEE_NUSE_ID,BEE_NUSE_DTT,BEE_INPT_ID,BEE_INPT_DTT) VALUES (";
				sql += "  '" + MNGT_YR + "'";
				sql += ", '" + ESTI_CD + "'";
				sql += ", '" + ESTI_NM + "'";
				sql += ", '" + COMP_CD + "'";
				sql += ", '" + SALE_CD + "'";
				sql += ", '" + ESTI_SDT + "'";
				sql += ", '" + ESTI_EDT + "'";
				sql += ", '" + PRES_DT + "'";
				sql += ", '" + CALC_CD + "'";
				sql += ", '" + ITKD_CD + "'";
				sql += ", '" + TBAS_CD + "'";
				sql += ", '" + ESTI_TX + "'";
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
