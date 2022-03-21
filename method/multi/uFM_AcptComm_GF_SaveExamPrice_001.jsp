<%!
	public String uFM_AcptComm_GF_SaveExamPrice_001(Statement argStmtExec, HashMap argHtMethod) throws Exception {
	
		String sql;

		String EXAM_DT = (String) argHtMethod.get("EXAM_DT");
		String EXAM_SQ = (String) argHtMethod.get("EXAM_SQ");
		String ORDER_DT = (String) argHtMethod.get("ORDER_DT");
		String ORDER_CD = (String) argHtMethod.get("ORDER_CD");
		String CUST_NO = (String) argHtMethod.get("CUST_NO");
		String COMP_CD = (String) argHtMethod.get("COMP_CD");
		String FST_PR = (String) argHtMethod.get("FST_PR");
		String ADD_PR = (String) argHtMethod.get("ADD_PR");
		String PRGS_PR = (String) argHtMethod.get("PRGS_PR");
		String HTSB_PR = (String) argHtMethod.get("HTSB_PR");
		String CAN_PR = (String) argHtMethod.get("CAN_PR");
		String SPSB_PR = (String) argHtMethod.get("SPSB_PR");
		String CVSB_PR = (String) argHtMethod.get("CVSB_PR");
		String EMSB_PR = (String) argHtMethod.get("EMSB_PR");
		String ETSB_PR = (String) argHtMethod.get("ETSB_PR");
		String EXAM_PR = (String) argHtMethod.get("EXAM_PR");
		String HDMD_PR = (String) argHtMethod.get("HDMD_PR");
		String SDMD_PR = (String) argHtMethod.get("SDMD_PR");
		String COMP_PR = (String) argHtMethod.get("COMP_PR");
		String COMPS_PR = (String) argHtMethod.get("COMPS_PR");
		String PSNL_PR = (String) argHtMethod.get("PSNL_PR");
		String PSNLP_PR = (String) argHtMethod.get("PSNLP_PR");
		String DMD_PR = (String) argHtMethod.get("DMD_PR");
		String INPT_ID = (String) argHtMethod.get("INPT_ID");

		//
		if(EXAM_DT == null) { EXAM_DT = ""; }
		if(EXAM_SQ == null) { EXAM_SQ = ""; }
		if(ORDER_DT == null) { ORDER_DT = ""; }
		if(ORDER_CD == null) { ORDER_CD = ""; }
		if(CUST_NO == null) { CUST_NO = ""; }
		if(COMP_CD == null) { COMP_CD = ""; }
		if(FST_PR == null) { FST_PR = ""; }
		if(ADD_PR == null) { ADD_PR = ""; }
		if(PRGS_PR == null) { PRGS_PR = ""; }
		if(HTSB_PR == null) { HTSB_PR = ""; }
		if(CAN_PR == null) { CAN_PR = ""; }
		if(SPSB_PR == null) { SPSB_PR = ""; }
		if(CVSB_PR == null) { CVSB_PR = ""; }
		if(EMSB_PR == null) { EMSB_PR = ""; }
		if(ETSB_PR == null) { ETSB_PR = ""; }
		if(EXAM_PR == null) { EXAM_PR = ""; }
		if(HDMD_PR == null) { HDMD_PR = ""; }
		if(SDMD_PR == null) { SDMD_PR = ""; }
		if(COMP_PR == null) { COMP_PR = ""; }
		if(COMPS_PR == null) { COMPS_PR = ""; }
		if(PSNL_PR == null) { PSNL_PR = ""; }
		if(PSNLP_PR == null) { PSNLP_PR = ""; }
		if(DMD_PR == null) { DMD_PR = ""; }
		if(INPT_ID == null) { INPT_ID = ""; }

		//
		sql = "INSERT INTO ET_EXAM_PRICE (EEP_EXAM_DT, EEP_EXAM_SQ, EEP_ORDER_SQ, EEP_ORDER_DT, EEP_ORDER_CD, EEP_CUST_NO, EEP_COMP_CD, EEP_FST_PR, EEP_ADD_PR, EEP_PRGS_PR, EEP_HTSB_PR, EEP_CAN_PR, EEP_SPSB_PR, EEP_CVSB_PR, EEP_EMSB_PR, EEP_ETSB_PR, EEP_EXAM_PR, EEP_HDMD_PR, EEP_SDMD_PR, EEP_COMP_PR, EEP_COMPS_PR, EEP_PSNL_PR, EEP_PSNLP_PR, EEP_DMD_PR, EEP_HDMD_DT, EEP_SDMD_DT, EEP_CDMD_DT, EEP_CDMDS_DT, EEP_PSNLP_DT, EEP_INPT_ID, EEP_INPT_DTT)";
		sql += " SELECT ";
		sql += "  '" + EXAM_DT + "'";
		sql += ", '" + EXAM_SQ + "'";
		sql += ", NVL(MAX(EEP_ORDER_SQ)";
		sql += ", 0) + 1";
		sql += ", '" + ORDER_DT + "'";
		sql += ", '" + ORDER_CD + "'";
		sql += ", '" + CUST_NO + "'";
		sql += ", '" + COMP_CD + "'";
		sql += ", '" + FST_PR + "'";
		sql += ", '" + ADD_PR + "'";
		sql += ", '" + PRGS_PR + "'";
		sql += ", '" + HTSB_PR + "'";
		sql += ", '" + CAN_PR + "'";
		sql += ", '" + SPSB_PR + "'";
		sql += ", '" + CVSB_PR + "'";
		sql += ", '" + EMSB_PR + "'";
		sql += ", '" + ETSB_PR + "'";
		sql += ", '" + EXAM_PR + "'";
		sql += ", '" + HDMD_PR + "'";
		sql += ", '" + SDMD_PR + "'";
		sql += ", '" + COMP_PR + "'";
		sql += ", '" + COMPS_PR + "'";
		sql += ", '" + PSNL_PR + "'";
		sql += ", '" + PSNLP_PR + "'";
		sql += ", '" + DMD_PR + "'";
		sql += ", NULL";
		sql += ", NULL";
		sql += ", NULL";
		sql += ", NULL";
		sql += ", NULL";
		sql += ", '" + INPT_ID + "'";
		sql += ", SYSDATE";
		sql += " FROM ET_EXAM_PRICE";
		sql += " WHERE EEP_EXAM_DT = '" + EXAM_DT  + "'";
		sql += " AND EEP_EXAM_SQ = '" + EXAM_SQ + "'";

		argStmtExec.executeUpdate(sql);

		return sql;
	}
%>