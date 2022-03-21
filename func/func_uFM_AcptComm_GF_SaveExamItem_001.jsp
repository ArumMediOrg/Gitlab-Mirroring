<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%!
	public String func_uFM_AcptComm_GF_SaveExamItem_001(Statement argStmtExec, HashMap argHtMethod) throws Exception {

		String sql = "";
		String sql2 = "";
		String sql_disp = "";

		try {

			String EXAM_DT = (String) argHtMethod.get("EXAM_DT");
			String EXAM_SQ = (String) argHtMethod.get("EXAM_SQ");
			String ORDER_DTT = (String) argHtMethod.get("ORDER_DTT");
			String ORDER_CD = (String) argHtMethod.get("ORDER_CD");
			String ITEM_CD = (String) argHtMethod.get("ITEM_CD");
			String LINK_NO = (String) argHtMethod.get("LINK_NO");
			String FST_KD = (String) argHtMethod.get("FST_KD");
			String OPTN_KD = (String) argHtMethod.get("OPTN_KD");
			String ADD_KD = (String) argHtMethod.get("ADD_KD");
			String PRGS_KD = (String) argHtMethod.get("PRGS_KD");
			String HTSB_KD = (String) argHtMethod.get("HTSB_KD");
			String CAN_KD = (String) argHtMethod.get("CAN_KD");
			String SPSB_KD = (String) argHtMethod.get("SPSB_KD");
			String CVSB_KD = (String) argHtMethod.get("CVSB_KD");
			String EMSB_KD = (String) argHtMethod.get("EMSB_KD");
			String ETSB_KD = (String) argHtMethod.get("ETSB_KD");
			String ORG_PR = (String) argHtMethod.get("ORG_PR");
			String FST_PR = (String) argHtMethod.get("FST_PR");
			String ADD_PR = (String) argHtMethod.get("ADD_PR");
			String PRGS_PR = (String) argHtMethod.get("PRGS_PR");
			String HTSB_PR = (String) argHtMethod.get("HTSB_PR");
			String CAN_PR = (String) argHtMethod.get("CAN_PR");
			String SPSB_PR = (String) argHtMethod.get("SPSB_PR");
			String SPHT_PR = (String) argHtMethod.get("SPHT_PR");
			String SPFS_PR = (String) argHtMethod.get("SPFS_PR");
			String CVSB_PR = (String) argHtMethod.get("CVSB_PR");
			String CVFS_PR = (String) argHtMethod.get("CVFS_PR");
			String EMSB_PR = (String) argHtMethod.get("EMSB_PR");
			String EMFS_PR = (String) argHtMethod.get("EMFS_PR");
			String ETSB_PR = (String) argHtMethod.get("ETSB_PR");
			String ETFS_PR = (String) argHtMethod.get("ETFS_PR");
			String INPT_ID = (String) argHtMethod.get("INPT_ID");
			String MODI_ID = (String) argHtMethod.get("MODI_ID");

			//
			if(EXAM_DT == null) { EXAM_DT = ""; }
			if(EXAM_SQ == null) { EXAM_SQ = ""; }
			if(ORDER_DTT == null) { ORDER_DTT = ""; }
			if(ORDER_CD == null) { ORDER_CD = ""; }
			if(ITEM_CD == null) { ITEM_CD = ""; }
			if(LINK_NO == null) { LINK_NO = ""; }
			if(FST_KD == null) { FST_KD = ""; }
			if(OPTN_KD == null) { OPTN_KD = ""; }
			if(ADD_KD == null) { ADD_KD = ""; }
			if(PRGS_KD == null) { PRGS_KD = ""; }
			if(HTSB_KD == null) { HTSB_KD = ""; }
			if(CAN_KD == null) { CAN_KD = ""; }
			if(SPSB_KD == null) { SPSB_KD = ""; }
			if(CVSB_KD == null) { CVSB_KD = ""; }
			if(EMSB_KD == null) { EMSB_KD = ""; }
			if(ETSB_KD == null) { ETSB_KD = ""; }
			if(ORG_PR == null) { ORG_PR = ""; }
			if(FST_PR == null) { FST_PR = ""; }
			if(ADD_PR == null) { ADD_PR = ""; }
			if(PRGS_PR == null) { PRGS_PR = ""; }
			if(HTSB_PR == null) { HTSB_PR = ""; }
			if(CAN_PR == null) { CAN_PR = ""; }
			if(SPSB_PR == null) { SPSB_PR = ""; }
			if(SPHT_PR == null) { SPHT_PR = ""; }
			if(SPFS_PR == null) { SPFS_PR = ""; }
			if(CVSB_PR == null) { CVSB_PR = ""; }
			if(CVFS_PR == null) { CVFS_PR = ""; }
			if(EMSB_PR == null) { EMSB_PR = ""; }
			if(EMFS_PR == null) { EMFS_PR = ""; }
			if(ETSB_PR == null) { ETSB_PR = ""; }
			if(ETFS_PR == null) { ETFS_PR = ""; }
			if(INPT_ID == null) { INPT_ID = ""; }
			if(MODI_ID == null) { MODI_ID = ""; }

			//
			EXAM_DT = CTr.Replace(EXAM_DT, "'", "''");
			EXAM_SQ = CTr.Replace(EXAM_SQ, "'", "''");
			ORDER_DTT = CTr.Replace(ORDER_DTT, "'", "''");
			ORDER_CD = CTr.Replace(ORDER_CD, "'", "''");
			ITEM_CD = CTr.Replace(ITEM_CD, "'", "''");
			LINK_NO = CTr.Replace(LINK_NO, "'", "''");
			FST_KD = CTr.Replace(FST_KD, "'", "''");
			OPTN_KD = CTr.Replace(OPTN_KD, "'", "''");
			ADD_KD = CTr.Replace(ADD_KD, "'", "''");
			PRGS_KD = CTr.Replace(PRGS_KD, "'", "''");
			HTSB_KD = CTr.Replace(HTSB_KD, "'", "''");
			CAN_KD = CTr.Replace(CAN_KD, "'", "''");
			SPSB_KD = CTr.Replace(SPSB_KD, "'", "''");
			CVSB_KD = CTr.Replace(CVSB_KD, "'", "''");
			EMSB_KD = CTr.Replace(EMSB_KD, "'", "''");
			ETSB_KD = CTr.Replace(ETSB_KD, "'", "''");
			ORG_PR = CTr.Replace(ORG_PR, "'", "''");
			FST_PR = CTr.Replace(FST_PR, "'", "''");
			ADD_PR = CTr.Replace(ADD_PR, "'", "''");
			PRGS_PR = CTr.Replace(PRGS_PR, "'", "''");
			HTSB_PR = CTr.Replace(HTSB_PR, "'", "''");
			CAN_PR = CTr.Replace(CAN_PR, "'", "''");
			SPSB_PR = CTr.Replace(SPSB_PR, "'", "''");
			SPHT_PR = CTr.Replace(SPHT_PR, "'", "''");
			SPFS_PR = CTr.Replace(SPFS_PR, "'", "''");
			CVSB_PR = CTr.Replace(CVSB_PR, "'", "''");
			CVFS_PR = CTr.Replace(CVFS_PR, "'", "''");
			EMSB_PR = CTr.Replace(EMSB_PR, "'", "''");
			EMFS_PR = CTr.Replace(EMFS_PR, "'", "''");
			ETSB_PR = CTr.Replace(ETSB_PR, "'", "''");
			ETFS_PR = CTr.Replace(ETFS_PR, "'", "''");
			INPT_ID = CTr.Replace(INPT_ID, "'", "''");
			MODI_ID = CTr.Replace(MODI_ID, "'", "''");

			sql = "INSERT INTO ET_EXAM_ITEM (EEI_EXAM_DT, EEI_EXAM_SQ, EEI_ORDER_DTT, EEI_ORDER_CD, EEI_ITEM_CD, EEI_LINK_NO, EEI_FST_KD, EEI_OPTN_KD, EEI_ADD_KD, EEI_PRGS_KD, EEI_HTSB_KD, EEI_CAN_KD, EEI_SPSB_KD, EEI_CVSB_KD, EEI_EMSB_KD, EEI_ETSB_KD, EEI_ORG_PR, EEI_FST_PR, EEI_ADD_PR, EEI_PRGS_PR, EEI_HTSB_PR, EEI_CAN_PR, EEI_SPSB_PR, EEI_SPHT_PR, EEI_SPFS_PR, EEI_CVSB_PR, EEI_CVFS_PR, EEI_EMSB_PR, EEI_EMFS_PR, EEI_ETSB_PR, EEI_ETFS_PR, EEI_INPT_ID, EEI_INPT_DTT, EEI_MODI_ID, EEI_MODI_DTT) VALUES (";
			sql += "  '" + EXAM_DT + "'";
			sql += ", '" + EXAM_SQ + "'";
			sql += ", TO_DATE('" + ORDER_DTT + "' || TO_CHAR(SYSDATE, 'hh24:mi:ss'), 'yyyy-mm-dd hh24:mi:ss')";
			sql += ", '" + ORDER_CD + "'";
			sql += ", '" + ITEM_CD + "'";
			sql += ", '" + LINK_NO + "'";
			sql += ", '" + FST_KD + "'";
			sql += ", '" + OPTN_KD + "'";
			sql += ", '" + ADD_KD + "'";
			sql += ", '" + PRGS_KD + "'";
			sql += ", '" + HTSB_KD + "'";
			sql += ", '" + CAN_KD + "'";
			sql += ", '" + SPSB_KD + "'";
			sql += ", '" + CVSB_KD + "'";
			sql += ", '" + EMSB_KD + "'";
			sql += ", '" + ETSB_KD + "'";
			sql += ", '" + ORG_PR + "'";
			sql += ", '" + FST_PR + "'";
			sql += ", '" + ADD_PR + "'";
			sql += ", '" + PRGS_PR + "'";
			sql += ", '" + HTSB_PR + "'";
			sql += ", '" + CAN_PR + "'";
			sql += ", '" + SPSB_PR + "'";
			sql += ", '" + SPHT_PR + "'";
			sql += ", '" + SPFS_PR + "'";
			sql += ", '" + CVSB_PR + "'";
			sql += ", '" + CVFS_PR + "'";
			sql += ", '" + EMSB_PR + "'";
			sql += ", '" + EMFS_PR + "'";
			sql += ", '" + ETSB_PR + "'";
			sql += ", '" + ETFS_PR + "'";

			sql += ", '" + INPT_ID + "'";
			sql += ", SYSDATE";
			sql += ", '" + MODI_ID + "'";
			sql += ", SYSDATE";
			sql += ")";

			argStmtExec.executeUpdate(sql);
		} catch (Exception e) {

			throw new FuncException(e.toString(), sql);
		}

		return sql;
	}
%>
