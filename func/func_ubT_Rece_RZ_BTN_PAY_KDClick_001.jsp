<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%!
	public String func_ubT_Rece_RZ_BTN_PAY_KDClick_001(Statement argStmtExec, HashMap argHtMethod) throws Exception {

		String sql = "";
		String sql2 = "";
		String sql_disp = "";

		try {

			String PAY_KD = (String) argHtMethod.get("PAY_KD");
			String RECE_NO = (String) argHtMethod.get("RECE_NO");
			String RECE_SEQ = (String) argHtMethod.get("RECE_SEQ");
			String OCCU_KD = (String) argHtMethod.get("OCCU_KD");

			//
			if(PAY_KD == null) { PAY_KD = ""; }
			if(RECE_NO == null) { RECE_NO = ""; }
			if(RECE_SEQ == null) { RECE_SEQ = ""; }
			if(OCCU_KD == null) { OCCU_KD = ""; }

			//
			PAY_KD = CTr.Replace(PAY_KD, "'", "''");
			RECE_NO = CTr.Replace(RECE_NO, "'", "''");
			RECE_SEQ = CTr.Replace(RECE_SEQ, "'", "''");
			OCCU_KD = CTr.Replace(OCCU_KD, "'", "''");

			sql = "UPDATE RT_RECE_MEDICHK SET ";
			sql += "  RRM_PAY_KD = '" + PAY_KD + "'";
			sql += " WHERE RRM_RECE_NO = '" + RECE_NO + "'";
			sql += " AND RRM_RECE_SEQ = '" + RECE_SEQ + "'";
			sql += " AND RRM_OCCU_KD = '" + OCCU_KD + "'";

			argStmtExec.executeUpdate(sql);

		} catch (Exception e) {

			throw new FuncException(e.toString(), sql);
		}

		return sql;
	}
%>
