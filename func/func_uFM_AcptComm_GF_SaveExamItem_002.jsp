<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%!
	public String func_uFM_AcptComm_GF_SaveExamItem_002(Statement argStmtExec, HashMap argHtMethod) throws Exception {

		String sql = "";
		String sql2 = "";
		String sql_disp = "";

		Connection connect = argStmtExec.getConnection();
		CallableStatement CallStmtExec = null;

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
			String DISC_RT = (String) argHtMethod.get("DISC_RT");
			String DISC_PR = (String) argHtMethod.get("DISC_PR");

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
			if(DISC_RT == null) { DISC_RT = ""; }
			if(DISC_PR == null) { DISC_PR = ""; }

			//

			sql = " INSERT INTO ET_EXAM_ITEM ";
			sql += " 	(EEI_EXAM_DT,    EEI_EXAM_SQ,    EEI_ORDER_DTT,   EEI_ORDER_CD, ";
			sql += " 		EEI_ITEM_CD,    EEI_LINK_NO,    EEI_FST_KD,      EEI_OPTN_KD, ";
			sql += " 		EEI_ADD_KD,     EEI_PRGS_KD,    EEI_HTSB_KD,     EEI_CAN_KD, ";
			sql += " 		EEI_SPSB_KD,    EEI_CVSB_KD,    EEI_EMSB_KD,     EEI_ETSB_KD, ";
			sql += " 		EEI_ORG_PR,     EEI_FST_PR,     EEI_ADD_PR,      EEI_PRGS_PR, ";
			sql += " 		EEI_HTSB_PR,    EEI_CAN_PR,     EEI_SPSB_PR,     EEI_SPHT_PR, ";
			sql += " 		EEI_SPFS_PR,    EEI_CVSB_PR,    EEI_CVFS_PR,     EEI_EMSB_PR, ";
			sql += " 		EEI_EMFS_PR,    EEI_ETSB_PR,    EEI_ETFS_PR, ";
			sql += " 		EEI_INPT_ID,    EEI_INPT_DTT,   EEI_MODI_ID,     EEI_MODI_DTT, ";
			sql += " 		EEI_DISC_RT,   EEI_DISC_PR) ";
			sql += " VALUES ";
			sql += " 	(?,   ?,  TO_DATE('" + ORDER_DTT + "' || TO_CHAR(SYSDATE, 'hh24:mi:ss'), 'yyyy-mm-dd hh24:mi:ss'),   ?, ";
			sql += " 	?,   ?,   ?,     ?, ";
			sql += " 	?,    ?,   ?,    ?, ";
			sql += " 	?,   ?,   ?,    ?, ";
			sql += " 	?,    ?,    ?,     ?, ";
			sql += " 	?,   ?,    ?,    ?, ";
			sql += " 	?,   ?,   ?,    ?, ";
			sql += " 	?,   ?,   ?, ";
			sql += " 	?,   SYSDATE,    ?,    SYSDATE, ";
			sql += " 	?,   ?) ";

			CallStmtExec = connect.prepareCall(sql);

			CallStmtExec.setString(1, EXAM_DT);
			CallStmtExec.setString(2, EXAM_SQ);
			CallStmtExec.setString(3, ORDER_CD);
			CallStmtExec.setString(4, ITEM_CD);
			CallStmtExec.setString(5, LINK_NO);
			CallStmtExec.setString(6, FST_KD);
			CallStmtExec.setString(7, OPTN_KD);
			CallStmtExec.setString(8, ADD_KD);
			CallStmtExec.setString(9, PRGS_KD);
			CallStmtExec.setString(10, HTSB_KD);
			CallStmtExec.setString(11, CAN_KD);
			CallStmtExec.setString(12, SPSB_KD);
			CallStmtExec.setString(13, CVSB_KD);
			CallStmtExec.setString(14, EMSB_KD);
			CallStmtExec.setString(15, ETSB_KD);
			CallStmtExec.setString(16, ORG_PR);
			CallStmtExec.setString(17, FST_PR);
			CallStmtExec.setString(18, ADD_PR);
			CallStmtExec.setString(19, PRGS_PR);
			CallStmtExec.setString(20, HTSB_PR);
			CallStmtExec.setString(21, CAN_PR);
			CallStmtExec.setString(22, SPSB_PR);
			CallStmtExec.setString(23, SPHT_PR);
			CallStmtExec.setString(24, SPFS_PR);
			CallStmtExec.setString(25, CVSB_PR);
			CallStmtExec.setString(26, CVFS_PR);
			CallStmtExec.setString(27, EMSB_PR);
			CallStmtExec.setString(28, EMFS_PR);
			CallStmtExec.setString(29, ETSB_PR);
			CallStmtExec.setString(30, ETFS_PR);
			CallStmtExec.setString(31, INPT_ID);
			CallStmtExec.setString(32, MODI_ID);
			CallStmtExec.setString(33, DISC_RT);
			CallStmtExec.setString(34, DISC_PR);

			CallStmtExec.executeUpdate();

		} catch (Exception e) {

			throw new FuncException(e.toString(), sql);
		}

		return sql;
	}
%>
