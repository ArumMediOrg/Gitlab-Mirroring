<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%!
	public String func_uIT_ChungGU_Move_Up_Insert_chungCmd_004_TRAN003(Statement argStmtExec, HashMap argHtMethod) throws Exception {

		String sql = "";
		String sql2 = "";
		String sql_disp = "";

		try {

			String CHGBN = (String) argHtMethod.get("CHGBN");
			String RZCHGU_DT = (String) argHtMethod.get("RZCHGU_DT");
			String EXAM_DT = (String) argHtMethod.get("EXAM_DT");
			String EXAM_SQ = (String) argHtMethod.get("EXAM_SQ");

			//
			if(CHGBN == null) { CHGBN = ""; }
			if(RZCHGU_DT == null) { RZCHGU_DT = ""; }
			if(EXAM_DT == null) { EXAM_DT = ""; }
			if(EXAM_SQ == null) { EXAM_SQ = ""; }

			//
			CHGBN = CTr.Replace(CHGBN, "'", "''");
			RZCHGU_DT = CTr.Replace(RZCHGU_DT, "'", "''");
			EXAM_DT = CTr.Replace(EXAM_DT, "'", "''");
			EXAM_SQ = CTr.Replace(EXAM_SQ, "'", "''");

			if(CHGBN.equals("31") || CHGBN.equals("90") || CHGBN.equals("99")) {
				sql = "UPDATE ET_EXAM_PRICE";
				sql += " SET EEP_CDMD_DT = '" + RZCHGU_DT + "'";
				sql += " WHERE EEP_EXAM_DT = '" + EXAM_DT + "'";
				sql += " AND EEP_EXAM_SQ = '" + EXAM_SQ + "'";
			
				argStmtExec.executeUpdate(sql);
			}
			else if(CHGBN.equals("32")) {
				sql = "UPDATE ET_EXAM_PRICE";
				sql += " SET EEP_CDMDS_DT = '" + RZCHGU_DT + "'";
				sql += " WHERE EEP_EXAM_DT = '" + EXAM_DT + "'";
				sql += " AND EEP_EXAM_SQ = '" + EXAM_SQ + "'";

				argStmtExec.executeUpdate(sql);
			}


		} catch (Exception e) {

			throw new FuncException(e.toString(), sql);
		}

		return sql;
	}
%>
