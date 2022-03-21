<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%!
	public String func_uCOMPANY_CD_CHANGE_BtnSaveClick_003(Statement argStmtExec, HashMap argHtMethod) throws Exception {

		String sql = "";
		String sql2 = "";
		String sql_disp = "";

		try {

			String SNEW_COMP = (String) argHtMethod.get("SNEW_COMP");
			String EDCOMP_CDB = (String) argHtMethod.get("EDCOMP_CDB");

			//
			if(SNEW_COMP == null) { SNEW_COMP = ""; }
			if(EDCOMP_CDB == null) { EDCOMP_CDB = ""; }

			//
			SNEW_COMP = CTr.Replace(SNEW_COMP, "'", "''");
			EDCOMP_CDB = CTr.Replace(EDCOMP_CDB, "'", "''");

			sql = "UPDATE BT_BILL_COMP SET ";
			sql += "  BBC_COMP_CD = '" + SNEW_COMP + "'";
			sql += " WHERE BBC_COMP_CD = '" + EDCOMP_CDB + "'";
			sql += " AND BBC_COMP_CD <> '" + SNEW_COMP + "'";

			argStmtExec.executeUpdate(sql);

			sql = "UPDATE BT_BILL_COMP_LIST SET ";
			sql += "  BCL_COMP_CD = '" + SNEW_COMP + "'";
			sql += " WHERE BCL_COMP_CD = '" + EDCOMP_CDB + "'";
			sql += " AND BCL_COMP_CD <> '" + SNEW_COMP + "'";

			argStmtExec.executeUpdate(sql);

			sql = "UPDATE BT_ESTIMATE SET ";
			sql += "  BEE_COMP_CD = '" + SNEW_COMP + "'";
			sql += " WHERE BEE_COMP_CD = '" + EDCOMP_CDB + "'";
			sql += " AND BEE_COMP_CD <> '" + SNEW_COMP + "'";

			argStmtExec.executeUpdate(sql);

			sql = "UPDATE CR_ADVICE_LIST SET ";
			sql += "  CAL_COMP_CD = '" + SNEW_COMP + "'";
			sql += " WHERE CAL_COMP_CD = '" + EDCOMP_CDB + "'";
			sql += " AND CAL_COMP_CD <> '" + SNEW_COMP + "'";

			argStmtExec.executeUpdate(sql);

			sql = "UPDATE ET_COMP_AGEA SET ";
			sql += "  ECA_COMP_CD = '" + SNEW_COMP + "'";
			sql += " WHERE ECA_COMP_CD = '" + EDCOMP_CDB + "'";
			sql += " AND ECA_COMP_CD <> '" + SNEW_COMP + "'";

			argStmtExec.executeUpdate(sql);

			sql = "UPDATE ET_COMP_CNRT SET ";
			sql += "  ECC_COMP_CD = '" + SNEW_COMP + "'";
			sql += " WHERE ECC_COMP_CD = '" + EDCOMP_CDB + "'";
			sql += " AND ECC_COMP_CD <> '" + SNEW_COMP + "'";

			argStmtExec.executeUpdate(sql);

			sql = "UPDATE ET_COMP_CNRT_PROF_ITEM SET ";
			sql += "  ECI_COMP_CD = '" + SNEW_COMP + "'";
			sql += " WHERE ECI_COMP_CD = '" + EDCOMP_CDB + "'";
			sql += " AND ECI_COMP_CD <> '" + SNEW_COMP + "'";

			argStmtExec.executeUpdate(sql);

			sql = "UPDATE ET_COMP_CNRT_OPTN SET ";
			sql += "  ECO_COMP_CD = '" + SNEW_COMP + "'";
			sql += " WHERE ECO_COMP_CD = '" + EDCOMP_CDB + "'";
			sql += " AND ECO_COMP_CD <> '" + SNEW_COMP + "'";

			argStmtExec.executeUpdate(sql);

			sql = "UPDATE ET_COMP_CNRT_PROF SET ";
			sql += "  ECP_COMP_CD = '" + SNEW_COMP + "'";
			sql += " WHERE ECP_COMP_CD = '" + EDCOMP_CDB + "'";
			sql += " AND ECP_COMP_CD <> '" + SNEW_COMP + "'";

			argStmtExec.executeUpdate(sql);

			sql = "UPDATE ET_COMP_CNRT_CUST SET ";
			sql += "  ECT_COMP_CD = '" + SNEW_COMP + "'";
			sql += " WHERE ECT_COMP_CD = '" + EDCOMP_CDB + "'";
			sql += " AND ECT_COMP_CD <> '" + SNEW_COMP + "'";

			argStmtExec.executeUpdate(sql);

			sql = "UPDATE ET_EXAM_ACPT SET ";
			sql += "  EEA_COMP_CD = '" + SNEW_COMP + "'";
			sql += " WHERE EEA_COMP_CD = '" + EDCOMP_CDB + "'";
			sql += " AND EEA_COMP_CD <> '" + SNEW_COMP + "'";

			argStmtExec.executeUpdate(sql);

			sql = "UPDATE ET_EXAM_PRICE SET ";
			sql += "  EEP_COMP_CD = '" + SNEW_COMP + "'";
			sql += " WHERE EEP_COMP_CD = '" + EDCOMP_CDB + "'";
			sql += " AND EEP_COMP_CD <> '" + SNEW_COMP + "'";

			argStmtExec.executeUpdate(sql);

			sql = "UPDATE IT_COMP_DEPT SET ";
			sql += "  ICD_COMP_CD = '" + SNEW_COMP + "'";
			sql += " WHERE ICD_COMP_CD = '" + EDCOMP_CDB + "'";
			sql += " AND ICD_COMP_CD <> '" + SNEW_COMP + "'";

			argStmtExec.executeUpdate(sql);

			sql = "UPDATE IT_COMP_DEPT_ITEM SET ";
			sql += "  ICI_COMP_CD = '" + SNEW_COMP + "'";
			sql += " WHERE ICI_COMP_CD = '" + EDCOMP_CDB + "'";
			sql += " AND ICI_COMP_CD <> '" + SNEW_COMP + "'";

			argStmtExec.executeUpdate(sql);

			sql = "UPDATE IT_COMPANY_PERS SET ";
			sql += "  ICP_COMP_CD = '" + SNEW_COMP + "'";
			sql += " WHERE ICP_COMP_CD = '" + EDCOMP_CDB + "'";
			sql += " AND ICP_COMP_CD <> '" + SNEW_COMP + "'";

			argStmtExec.executeUpdate(sql);

			sql = "UPDATE IT_CUSTOMER SET ";
			sql += "  ICR_COMP_CD = '" + SNEW_COMP + "'";
			sql += " WHERE ICR_COMP_CD = '" + EDCOMP_CDB + "'";
			sql += " AND ICR_COMP_CD <> '" + SNEW_COMP + "'";

			argStmtExec.executeUpdate(sql);

			sql = "UPDATE RT_RECE_MEDICHK SET ";
			sql += "  RRM_CUST_NO = '" + SNEW_COMP + "'";
			sql += " WHERE RRM_CUST_NO = '" + EDCOMP_CDB + "'";
			sql += " AND RRM_CUST_NO <> '" + SNEW_COMP + "'";

			argStmtExec.executeUpdate(sql);

			sql = "UPDATE RT_RSVT SET ";
			sql += "  RRT_COMP_CD = '" + SNEW_COMP + "'";
			sql += " WHERE RRT_COMP_CD = '" + EDCOMP_CDB + "'";
			sql += " AND RRT_COMP_CD <> '" + SNEW_COMP + "'";

			argStmtExec.executeUpdate(sql);

			sql = "UPDATE RT_RSVT_LOG SET ";
			sql += "  RRG_COMP_CD = '" + SNEW_COMP + "'";
			sql += " WHERE RRG_COMP_CD = '" + EDCOMP_CDB + "'";
			sql += " AND RRG_COMP_CD <> '" + SNEW_COMP + "'";

			argStmtExec.executeUpdate(sql);

			sql = "UPDATE ST_BILLHN_PR SET ";
			sql += "  SPB_COMP_CD = '" + SNEW_COMP + "'";
			sql += " WHERE SPB_COMP_CD = '" + EDCOMP_CDB + "'";
			sql += " AND SPB_COMP_CD <> '" + SNEW_COMP + "'";

			argStmtExec.executeUpdate(sql);

			sql = "UPDATE IT_SHARE_MEMO SET ";
			sql += "  ISM_COMP_CD = '" + SNEW_COMP + "'";
			sql += " WHERE ISM_COMP_CD = '" + EDCOMP_CDB + "'";
			sql += " AND ISM_COMP_CD <> '" + SNEW_COMP + "'";

			argStmtExec.executeUpdate(sql);

		} catch (Exception e) {

			throw new FuncException(e.toString(), sql);
		}

		return sql;
	}
%>
