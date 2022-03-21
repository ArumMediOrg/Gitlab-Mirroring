<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%!
	public String func_uFM_AcptComm_GF_SaveExamPrice_002(Statement argStmtExec, HashMap argHtMethod) throws Exception {

		String sql = "";
		String sql2 = "";
		String sql_disp = "";

		try {

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
			String DISC_PR = (String) argHtMethod.get("DISC_PR");
			String DISC_CPR = (String) argHtMethod.get("DISC_CPR");

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
			if(DISC_PR == null) { DISC_PR = ""; }
			if(DISC_CPR == null) { DISC_CPR = ""; }

			//
			EXAM_DT = CTr.Replace(EXAM_DT, "'", "''");
			EXAM_SQ = CTr.Replace(EXAM_SQ, "'", "''");
			ORDER_DT = CTr.Replace(ORDER_DT, "'", "''");
			ORDER_CD = CTr.Replace(ORDER_CD, "'", "''");
			CUST_NO = CTr.Replace(CUST_NO, "'", "''");
			COMP_CD = CTr.Replace(COMP_CD, "'", "''");
			FST_PR = CTr.Replace(FST_PR, "'", "''");
			ADD_PR = CTr.Replace(ADD_PR, "'", "''");
			PRGS_PR = CTr.Replace(PRGS_PR, "'", "''");
			HTSB_PR = CTr.Replace(HTSB_PR, "'", "''");
			CAN_PR = CTr.Replace(CAN_PR, "'", "''");
			SPSB_PR = CTr.Replace(SPSB_PR, "'", "''");
			CVSB_PR = CTr.Replace(CVSB_PR, "'", "''");
			EMSB_PR = CTr.Replace(EMSB_PR, "'", "''");
			ETSB_PR = CTr.Replace(ETSB_PR, "'", "''");
			EXAM_PR = CTr.Replace(EXAM_PR, "'", "''");
			HDMD_PR = CTr.Replace(HDMD_PR, "'", "''");
			SDMD_PR = CTr.Replace(SDMD_PR, "'", "''");
			COMP_PR = CTr.Replace(COMP_PR, "'", "''");
			COMPS_PR = CTr.Replace(COMPS_PR, "'", "''");
			PSNL_PR = CTr.Replace(PSNL_PR, "'", "''");
			PSNLP_PR = CTr.Replace(PSNLP_PR, "'", "''");
			DMD_PR = CTr.Replace(DMD_PR, "'", "''");
			INPT_ID = CTr.Replace(INPT_ID, "'", "''");
			DISC_PR = CTr.Replace(DISC_PR, "'", "''");
			DISC_CPR = CTr.Replace(DISC_CPR, "'", "''");

			sql = "INSERT INTO ET_EXAM_PRICE ";
			sql += " (EEP_EXAM_DT, EEP_EXAM_SQ, EEP_ORDER_SQ, EEP_ORDER_DT, EEP_ORDER_CD, EEP_CUST_NO, EEP_COMP_CD, EEP_FST_PR, ";
			sql += "  EEP_ADD_PR, EEP_PRGS_PR, EEP_HTSB_PR, EEP_CAN_PR, EEP_SPSB_PR, EEP_CVSB_PR, EEP_EMSB_PR, EEP_ETSB_PR, EEP_EXAM_PR, ";
			sql += "  EEP_HDMD_PR, EEP_SDMD_PR, EEP_COMP_PR, EEP_COMPS_PR, EEP_PSNL_PR, EEP_PSNLP_PR, EEP_DMD_PR, EEP_HDMD_DT, EEP_SDMD_DT, ";
			sql += "  EEP_CDMD_DT, EEP_CDMDS_DT, EEP_PSNLP_DT, EEP_INPT_ID, EEP_INPT_DTT, EEP_DISC_PR, EEP_DISC_CPR) ";
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
			sql += ", '" + DISC_PR + "'";
			sql += ", '" + DISC_CPR + "'";
			sql += " FROM ET_EXAM_PRICE";
			sql += " WHERE EEP_EXAM_DT = '" + EXAM_DT  + "'";
			sql += " AND EEP_EXAM_SQ = '" + EXAM_SQ + "'";

			argStmtExec.executeUpdate(sql);

		} catch (Exception e) {

			throw new FuncException(e.toString(), sql);
		}

		return sql;
	}
%>
