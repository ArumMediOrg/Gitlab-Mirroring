<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%!
	public String func_SubkumcASResultUpd_001(Statement argStmtExec, HashMap argHtMethod) throws Exception {

		String sql = "";
		String sql2 = "";
		String sql_disp = "";

		Connection connect = argStmtExec.getConnection();
		CallableStatement CallStmtExec = null;

		try {

			String RSLT_VL = (String) argHtMethod.get("RSLT_VL");
			String CHAR_CD = (String) argHtMethod.get("CHAR_CD");
			String PACS_RSLT = (String) argHtMethod.get("PACS_RSLT");
			String PRCH_VL = (String) argHtMethod.get("PRCH_VL");
			String PRNM_VL = (String) argHtMethod.get("PRNM_VL");
			String RSLT_KD = (String) argHtMethod.get("RSLT_KD");
			String MODI_ID = (String) argHtMethod.get("MODI_ID");
			String EXAM_DT = (String) argHtMethod.get("EXAM_DT");
			String EXAM_SQ = (String) argHtMethod.get("EXAM_SQ");
			String OSRL_CD = (String) argHtMethod.get("OSRL_CD");

			//
			if(RSLT_VL == null) { RSLT_VL = ""; }
			if(CHAR_CD == null) { CHAR_CD = ""; }
			if(PACS_RSLT == null) { PACS_RSLT = ""; }
			if(PRCH_VL == null) { PRCH_VL = ""; }
			if(PRNM_VL == null) { PRNM_VL = ""; }
			if(RSLT_KD == null) { RSLT_KD = ""; }
			if(MODI_ID == null) { MODI_ID = ""; }
			if(EXAM_DT == null) { EXAM_DT = ""; }
			if(EXAM_SQ == null) { EXAM_SQ = ""; }
			if(OSRL_CD == null) { OSRL_CD = ""; }


			sql += " UPDATE ET_RSLT_ITEM ";
			sql += " SET ERI_RSLT_VL    = ? ";
			sql += " 	, ERI_CHAR_CD   = ? ";
			sql += " 	, ERI_PACS_RSLT = ? ";
			sql += " 	, ERI_PRCH_VL   = ? ";
			sql += " 	, ERI_PRNM_VL   = ? ";
			sql += " 	, ERI_RSLT_KD   = ? ";
			sql += " 	, ERI_MODI_ID   = ? ";
			sql += " 	, ERI_MODI_DTT  = SYSDATE ";
			sql += " WHERE ERI_EXAM_DT  = ? ";
			sql += " AND ERI_EXAM_SQ   = ? ";
			//sql += " AND (ERI_OCS_CD   = ? OR ERI_OSRL_CD = ?) ";
			sql += " AND ERI_ITEM_CD = ? ";

			CallStmtExec = connect.prepareCall(sql);

			CallStmtExec.setString(1, RSLT_VL);
			CallStmtExec.setString(2, CHAR_CD);
			CallStmtExec.setString(3, PACS_RSLT);
			CallStmtExec.setString(4, PRCH_VL);
			CallStmtExec.setString(5, PRNM_VL);
			CallStmtExec.setString(6, RSLT_KD);
			CallStmtExec.setString(7, MODI_ID);
			CallStmtExec.setString(8, EXAM_DT);
			CallStmtExec.setString(9, EXAM_SQ);
			CallStmtExec.setString(10, OSRL_CD);
			//CallStmtExec.setString(11, OSRL_CD);

			CallStmtExec.executeUpdate();

		} catch (Exception e) {

			throw new FuncException(e.toString(), sql);
		}

		return sql;
	}
%>
