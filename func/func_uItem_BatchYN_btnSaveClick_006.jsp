<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%!
	public String func_uItem_BatchYN_btnSaveClick_006(Statement argStmtExec, HashMap argHtMethod) throws Exception {

		String sql = "";
		String sql2 = "";
		String sql_disp = "";

		Connection connect = argStmtExec.getConnection();
		CallableStatement CallStmtExec = null;

		try {
			String EXAM_DT = (String) argHtMethod.get("EXAM_DT");
			String EXAM_SQ = (String) argHtMethod.get("EXAM_SQ");
			String ITEM_CD = (String) argHtMethod.get("ITEM_CD");
			String USER_ID = (String) argHtMethod.get("USER_ID");


			//

			if(EXAM_DT == null) { EXAM_DT = ""; }
			if(EXAM_SQ == null) { EXAM_SQ = ""; }
			if(ITEM_CD == null) { ITEM_CD = ""; }
			if(USER_ID == null) { USER_ID = ""; }

			//
			sql += " INSERT INTO ET_EXAM_ITEM ";
			sql += " 	(EEI_EXAM_DT,  EEI_EXAM_SQ,  EEI_ORDER_DTT, EEI_ORDER_CD, ";
			sql += " 	EEI_ITEM_CD,  EEI_LINK_NO,  EEI_FST_KD,    EEI_OPTN_KD, ";
			sql += " 	EEI_ADD_KD,   EEI_PRGS_KD,  EEI_HTSB_KD,   EEI_CAN_KD, ";
			sql += " 	EEI_SPSB_KD,  EEI_CVSB_KD,  EEI_EMSB_KD,   EEI_ETSB_KD, ";
			sql += " 	EEI_ORG_PR,   EEI_FST_PR,   EEI_ADD_PR,    EEI_PRGS_PR, ";
			sql += " 	EEI_HTSB_PR,  EEI_CAN_PR,   EEI_SPSB_PR,   EEI_SPHT_PR, ";
			sql += " 	EEI_SPFS_PR,  EEI_CVSB_PR,  EEI_CVFS_PR,   EEI_EMSB_PR, ";
			sql += " 	EEI_EMFS_PR,  EEI_ETSB_PR,  EEI_ETFS_PR, ";
			sql += " 	EEI_INPT_ID,  EEI_INPT_DTT, EEI_MODI_ID,   EEI_MODI_DTT, EEI_DISC_RT, EEI_DISC_PR) ";
			sql += " SELECT EEI_EXAM_DT,  EEI_EXAM_SQ,  EEI_ORDER_DTT+0.01, '22', ";
			sql += " 	EEI_ITEM_CD,  EEI_LINK_NO,  EEI_FST_KD,    EEI_OPTN_KD, ";
			sql += " 	EEI_ADD_KD,   EEI_PRGS_KD,  EEI_HTSB_KD,   EEI_CAN_KD, ";
			sql += " 	EEI_SPSB_KD,  EEI_CVSB_KD,  EEI_EMSB_KD,   EEI_ETSB_KD, ";
			sql += " 	EEI_ORG_PR,   0,            0,             0, ";
			sql += " 	0,            0,            0,             0, ";
			sql += " 	0,            0,            0,             0, ";
			sql += " 	0,            0,            0, ";
			sql += " 	EEI_INPT_ID,  EEI_INPT_DTT, ?, SYSDATE, 0, 0 ";
			sql += " FROM ET_EXAM_ITEM ";
			sql += " WHERE EEI_EXAM_DT  = ? ";
			sql += " AND EEI_EXAM_SQ  = ? ";
			sql += " AND EEI_ITEM_CD  = ? ";
			sql += " AND EEI_ORDER_CD = '11' ";

			CallStmtExec = connect.prepareCall(sql);

			CallStmtExec.setString(1, USER_ID);
			CallStmtExec.setString(2, EXAM_DT);
			CallStmtExec.setString(3, EXAM_SQ);
			CallStmtExec.setString(4, ITEM_CD);

			CallStmtExec.executeUpdate();

		} catch (Exception e) {

			throw new FuncException(e.toString(), sql);
		}

		return sql;
	}
%>
