<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%!
	public String func_ubT_Rece_RzBTN_RECEPRTClick_001(Statement argStmtExec, HashMap argHtMethod) throws Exception {

		String sql = "";
		String sql2 = "";
		String sql_disp = "";

		try {

			String RECE_NO = (String) argHtMethod.get("RECE_NO");

			//
			if(RECE_NO == null) { RECE_NO = ""; }

			//
			RECE_NO = CTr.Replace(RECE_NO, "'", "''");

			sql = "UPDATE RT_RECE_MEDICHK SET ";
			sql += "  RRM_PRINT_CNT = NVL(RRM_PRINT_CNT, 0) + 1";
			sql += " WHERE RRM_RECE_NO= '" + RECE_NO + "'";

			argStmtExec.executeUpdate(sql);

		} catch (Exception e) {

			throw new FuncException(e.toString(), sql);
		}

		return sql;
	}
%>
