<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%!
	public String func_uItem_ufRsltAutoCalc_004(Statement argStmtExec, HashMap argHtMethod) throws Exception {

		String sql = "";
		String sql2 = "";
		String sql_disp = "";

		Connection connect = argStmtExec.getConnection();
		CallableStatement CallStmtExec = null;

		try {

			String RSLT_VL = (String) argHtMethod.get("RSLT_VL");
			String RSLT_KD = (String) argHtMethod.get("RSLT_KD");
			String MODI_ID = (String) argHtMethod.get("MODI_ID");
			String EXAM_DT = (String) argHtMethod.get("EXAM_DT");
			String EXAM_SQ = (String) argHtMethod.get("EXAM_SQ");
			String ITEM_CD = (String) argHtMethod.get("ITEM_CD");

			//
			if(RSLT_VL == null) { RSLT_VL = ""; }
			if(RSLT_KD == null) { RSLT_KD = ""; }
			if(MODI_ID == null) { MODI_ID = ""; }
			if(EXAM_DT == null) { EXAM_DT = ""; }
			if(EXAM_SQ == null) { EXAM_SQ = ""; }
			if(ITEM_CD == null) { ITEM_CD = ""; }

			//

			sql = " UPDATE ET_RSLT_ITEM ";
			sql += " SET ERI_RSLT_VL = ? ";
			sql += " 	, ERI_RSLT_KD = ? ";
			sql += " 	, ERI_MODI_DTT = sysdate ";
			sql += " 	, ERI_MODI_ID = ? ";
			sql += " 	, ERI_OCS_VL = ? ";
			sql += " WHERE ERI_EXAM_DT = ? ";
			sql += " AND ERI_EXAM_SQ = ? ";
			sql += " AND ERI_ITEM_CD = ? ";

			CallStmtExec = connect.prepareCall(sql);

			CallStmtExec.setString(1, RSLT_VL);
			CallStmtExec.setString(2, RSLT_KD);
			CallStmtExec.setString(3, MODI_ID);
			CallStmtExec.setString(4, RSLT_VL);
			CallStmtExec.setString(5, EXAM_DT);
			CallStmtExec.setString(6, EXAM_SQ);
			CallStmtExec.setString(7, ITEM_CD);

			CallStmtExec.executeUpdate();

		} catch (Exception e) {

			throw new FuncException(e.toString(), sql);
		}

		return sql;
	}
%>
