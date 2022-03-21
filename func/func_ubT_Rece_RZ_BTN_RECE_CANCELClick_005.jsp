<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%!
	public String func_ubT_Rece_RZ_BTN_RECE_CANCELClick_005(Statement argStmtExec, HashMap argHtMethod) throws Exception {

		String sql = "";
		String sql2 = "";
		String sql_disp = "";

		try {

			String RECE_NO = (String) argHtMethod.get("RECE_NO");
			String RECE_SEQ = (String) argHtMethod.get("RECE_SEQ");
			String OCCU_KD = (String) argHtMethod.get("OCCU_KD");

			//
			if(RECE_NO == null) { RECE_NO = ""; }
			if(RECE_SEQ == null) { RECE_SEQ = ""; }
			if(OCCU_KD == null) { OCCU_KD = ""; }

			//
			RECE_NO = CTr.Replace(RECE_NO, "'", "''");
			RECE_SEQ = CTr.Replace(RECE_SEQ, "'", "''");
			OCCU_KD = CTr.Replace(OCCU_KD, "'", "''");

			sql = "DELETE RT_RECE_MEDICHK";
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
