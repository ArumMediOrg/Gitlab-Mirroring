<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%!
	public String func_uSP_ChungPer_btnSelectClick_002(Statement argStmtExec, HashMap argHtMethod) throws Exception {

		String sql = "";
		String sql2 = "";
		String sql_disp = "";

		try {

			String SCHUNGBENO = (String) argHtMethod.get("SCHUNGBENO");
			String EXAM_DT = (String) argHtMethod.get("EXAM_DT");
			String EXAM_SQ = (String) argHtMethod.get("EXAM_SQ");
			String BILL_FL = (String) argHtMethod.get("BILL_FL");

			//
			if(SCHUNGBENO == null) { SCHUNGBENO = ""; }
			if(EXAM_DT == null) { EXAM_DT = ""; }
			if(EXAM_SQ == null) { EXAM_SQ = ""; }
			if(BILL_FL == null) { BILL_FL = ""; }

			//
			SCHUNGBENO = CTr.Replace(SCHUNGBENO, "'", "''");
			EXAM_DT = CTr.Replace(EXAM_DT, "'", "''");
			EXAM_SQ = CTr.Replace(EXAM_SQ, "'", "''");
			BILL_FL = CTr.Replace(BILL_FL, "'", "''");

			sql = "UPDATE ST_BILLHN_PR SET ";
			sql += "  SBP_CHUNG_NO= '" + SCHUNGBENO + "'";
			sql += ", SBP_RETURN_KD='0'";
			sql += ", SBP_BILLE_DT=''";
			sql += " WHERE SBP_EXAM_DT = '" + EXAM_DT + "'";
			sql += " AND SBP_EXAM_SQ = '" + EXAM_SQ + "'";
			sql += " AND SBP_BILL_FL = '" + BILL_FL + "'";

			argStmtExec.executeUpdate(sql);

		} catch (Exception e) {

			throw new FuncException(e.toString(), sql);
		}

		return sql;
	}
%>
