<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%!
	public String func_uItem_BatchYN_btnSaveClick_013(Statement argStmtExec, HashMap argHtMethod) throws Exception {

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
			sql = " INSERT INTO ET_RSLT_ITEM ";
			sql += " 	(ERI_EXAM_DT, ERI_EXAM_SQ,  ERI_ITEM_CD, ";
			sql += " 	ERI_HLTH_KD, ERI_TOTAL_KD, ERI_STDT_KD,   ERI_EMPY_KD,  ERI_SPCL_KD, ";
			sql += " 	ERI_DETL_KD, ERI_BLOOD_KD, ERI_EACH_KD,   ERI_CVCL_KD,  ERI_ETC_KD,  ERI_ADD_KD, ";
			sql += " 	ERI_OCS_CD,  ERI_SORT_SQ,  ERI_INPUT_DTT, ERI_CFRM_YN,  ERI_CNCL_YN, ";
			sql += " 	ERI_INPT_ID, ERI_INPT_DTT, ERI_MODI_ID,   ERI_MODI_DTT, ERI_OSSB_CD, ERI_OSRL_CD, ERI_SPMIGUM_YN) ";
			sql += " SELECT ?, ?, ?, ";
			sql += " 	'0',       '0',        '0',         '0',       '0', ";
			sql += " 	'0',       '0',        '0',         '0',       '0',        '1', ";
			sql += " 	IIM_OSCD_CD, 9999999,      NULL,          'N',       'N', ";
			sql += " 	? , SYSDATE,  ?, SYSDATE, ";
			sql += " 	IIM_OSSB_CD, IIM_OSRL_CD,  'N' ";
			sql += " FROM IT_ITEM ";
			sql += " WHERE IIM_ITEM_CD = ? ";

			CallStmtExec = connect.prepareCall(sql);

			CallStmtExec.setString(1, EXAM_DT);
			CallStmtExec.setString(2, EXAM_SQ);
			CallStmtExec.setString(3, ITEM_CD);
			CallStmtExec.setString(4, USER_ID);
			CallStmtExec.setString(5, USER_ID);
			CallStmtExec.setString(6, ITEM_CD);

			CallStmtExec.executeUpdate();

		} catch (Exception e) {

			throw new FuncException(e.toString(), sql);
		}

		return sql;
	}
%>
