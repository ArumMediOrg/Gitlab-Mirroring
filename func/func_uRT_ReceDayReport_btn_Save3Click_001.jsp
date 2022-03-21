<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%!
	public String func_uRT_ReceDayReport_btn_Save3Click_001(Statement argStmtExec, HashMap argHtMethod) throws Exception {

		String sql = "";
		String sql2 = "";
		String sql_disp = "";

		try {

			String MAGAM_DT = (String) argHtMethod.get("MAGAM_DT");
			String MAGAM_KD = (String) argHtMethod.get("MAGAM_KD");
			String MAGAM_TX = (String) argHtMethod.get("MAGAM_TX");
			String INPT_ID = (String) argHtMethod.get("INPT_ID");

			//
			if(MAGAM_DT == null) { MAGAM_DT = ""; }
			if(MAGAM_KD == null) { MAGAM_KD = ""; }
			if(MAGAM_TX == null) { MAGAM_TX = ""; }
			if(INPT_ID == null) { INPT_ID = ""; }

			//
			MAGAM_DT = CTr.Replace(MAGAM_DT, "'", "''");
			MAGAM_KD = CTr.Replace(MAGAM_KD, "'", "''");
			MAGAM_TX = CTr.Replace(MAGAM_TX, "'", "''");
			INPT_ID = CTr.Replace(INPT_ID, "'", "''");

			sql = "INSERT INTO RT_RECE_MAGAM (RMG_INPUT_DTT, RMG_MAGAM_DT, RMG_MAGAM_KD, RMG_MAGAM_TX, RMG_INPT_ID) VALUES (";
			sql += "  SYSDATE";
			sql += ", '" + MAGAM_DT + "'";
			sql += ", '" + MAGAM_KD + "'";
			sql += ", '" + MAGAM_TX + "'";
			sql += ", '" + INPT_ID + "'";
			sql += ")";

			argStmtExec.executeUpdate(sql);

		} catch (Exception e) {

			throw new FuncException(e.toString(), sql);
		}

		return sql;
	}
%>
