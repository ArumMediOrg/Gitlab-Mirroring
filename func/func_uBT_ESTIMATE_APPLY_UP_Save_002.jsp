<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%!
	public String func_uBT_ESTIMATE_APPLY_UP_Save_002(Statement argStmtExec, HashMap argHtMethod) throws Exception {

		String sql = "";
		String sql2 = "";
		String sql_disp = "";

		try {

			String CHKBOXBEE_USE_YN = (String) argHtMethod.get("CHKBOXBEE_USE_YN");
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
			String MODI_ID = (String) argHtMethod.get("MODI_ID");
			String MNGT_YR = (String) argHtMethod.get("MNGT_YR");
			String ESTI_CD = (String) argHtMethod.get("ESTI_CD");
			String NUSE_ID = (String) argHtMethod.get("NUSE_ID");

			//
			if(CHKBOXBEE_USE_YN == null) { CHKBOXBEE_USE_YN = ""; }
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
			if(MODI_ID == null) { MODI_ID = ""; }
			if(MNGT_YR == null) { MNGT_YR = ""; }
			if(ESTI_CD == null) { ESTI_CD = ""; }
			if(NUSE_ID == null) { NUSE_ID = ""; }

			//
			CHKBOXBEE_USE_YN = CTr.Replace(CHKBOXBEE_USE_YN, "'", "''");
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
			MODI_ID = CTr.Replace(MODI_ID, "'", "''");
			MNGT_YR = CTr.Replace(MNGT_YR, "'", "''");
			ESTI_CD = CTr.Replace(ESTI_CD, "'", "''");
			NUSE_ID = CTr.Replace(NUSE_ID, "'", "''");

			if(CHKBOXBEE_USE_YN.equals("Y")) {
				sql = "UPDATE BT_ESTIMATE SET ";
				sql += "  BEE_ESTI_NM = '" + ESTI_NM + "'";
				sql += ", BEE_COMP_CD = '" + COMP_CD + "'";
				sql += ", BEE_SALE_CD = '" + SALE_CD + "'";
				sql += ", BEE_ESTI_SDT = '" + ESTI_SDT + "'";
				sql += ", BEE_ESTI_EDT = '" + ESTI_EDT + "'";
				sql += ", BEE_PRES_DT = '" + PRES_DT + "'";
				sql += ", BEE_CALC_CD = '" + CALC_CD + "'";
				sql += ", BEE_ITKD_CD = '" + ITKD_CD + "'";
				sql += ", BEE_TBAS_CD = '" + TBAS_CD + "'";
				sql += ", BEE_ESTI_TX = '" + ESTI_TX + "'";
				sql += ", BEE_MODI_ID = '" + MODI_ID + "'";
				sql += ", BEE_MODI_DTT = SYSDATE";
				sql += ", BEE_USE_YN = 'Y'";
				sql += " WHERE BEE_MNGT_YR = '" + MNGT_YR + "'";
				sql += " AND BEE_ESTI_CD = '" + ESTI_CD + "'";

				argStmtExec.executeUpdate(sql);

			} else {
				sql = "UPDATE BT_ESTIMATE SET ";
				sql += "  BEE_ESTI_NM = '" + ESTI_NM + "'";
				sql += ", BEE_COMP_CD = '" + COMP_CD + "'";
				sql += ", BEE_SALE_CD = '" + SALE_CD + "'";
				sql += ", BEE_ESTI_SDT = '" + ESTI_SDT + "'";
				sql += ", BEE_ESTI_EDT = '" + ESTI_EDT + "'";
				sql += ", BEE_PRES_DT = '" + PRES_DT + "'";
				sql += ", BEE_CALC_CD = '" + CALC_CD + "'";
				sql += ", BEE_ITKD_CD = '" + ITKD_CD + "'";
				sql += ", BEE_TBAS_CD = '" + TBAS_CD + "'";
				sql += ", BEE_ESTI_TX = '" + ESTI_TX + "'";
				sql += ", BEE_MODI_ID = '" + MODI_ID + "'";
				sql += ", BEE_MODI_DTT = SYSDATE";
				sql += ", BEE_USE_YN = 'N'";
				sql += ", BEE_NUSE_ID = '" + NUSE_ID + "'";
				sql += ", BEE_NUSE_DTT = SYSDATE";
				sql += " WHERE BEE_MNGT_YR = '" + MNGT_YR + "'";
				sql += " AND BEE_ESTI_CD = '" + ESTI_CD + "'";

				argStmtExec.executeUpdate(sql);

			}
		} catch (Exception e) {

			throw new FuncException(e.toString(), sql);
		}

		return sql;
	}
%>
