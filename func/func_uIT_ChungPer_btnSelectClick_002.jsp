<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%!
	public String func_uIT_ChungPer_btnSelectClick_002(Statement argStmtExec, HashMap argHtMethod) throws Exception {

		String sql = "";
		String sql2 = "";
		String sql_disp = "";

		try {

			String CHUNG_NO = (String) argHtMethod.get("CHUNG_NO");
			String EXAM_DT = (String) argHtMethod.get("EXAM_DT");
			String EXAM_SQ = (String) argHtMethod.get("EXAM_SQ");
			String BILL_FL = (String) argHtMethod.get("BILL_FL");

			//
			if(CHUNG_NO == null) { CHUNG_NO = ""; }
			if(EXAM_DT == null) { EXAM_DT = ""; }
			if(EXAM_SQ == null) { EXAM_SQ = ""; }
			if(BILL_FL == null) { BILL_FL = ""; }

			//
			CHUNG_NO = CTr.Replace(CHUNG_NO, "'", "''");
			EXAM_DT = CTr.Replace(EXAM_DT, "'", "''");
			EXAM_SQ = CTr.Replace(EXAM_SQ, "'", "''");
			BILL_FL = CTr.Replace(BILL_FL, "'", "''");

			sql = "UPDATE BT_BILLHN_PR SET ";
			sql += "  BBP_CHUNG_NO = '" + CHUNG_NO + "'";
			sql += ", BBP_RETURN_KD = '0'";
			sql += ", BBP_BILLE_DT = ''";
			sql += " WHERE BBP_EXAM_DT = '" + EXAM_DT + "'";
			sql += " AND BBP_EXAM_SQ = '" + EXAM_SQ + "'";
			sql += " AND BBP_BILL_FL = '" + BILL_FL + "'";

			argStmtExec.executeUpdate(sql);

		} catch (Exception e) {

			throw new FuncException(e.toString(), sql);
		}

		return sql;
	}
%>
