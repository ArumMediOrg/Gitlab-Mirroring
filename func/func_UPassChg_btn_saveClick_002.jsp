<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%!
	public String func_UPassChg_btn_saveClick_002(Statement argStmtExec, HashMap argHtMethod) throws Exception {

		String sql = "";
		String sql2 = "";
		String sql_disp = "";

		try {

			String PASS_WD = (String) argHtMethod.get("PASS_WD");
			String EMP_NO = (String) argHtMethod.get("EMP_NO");

			//
			if(PASS_WD == null) { PASS_WD = ""; }
			if(EMP_NO == null) { EMP_NO = ""; }

			//
			PASS_WD = CTr.Replace(PASS_WD, "'", "''");
			EMP_NO = CTr.Replace(EMP_NO, "'", "''");

			sql = "UPDATE IT_AUTH_USER SET ";
			sql += "  IAU_PASS_WD ='" + PASS_WD + "'";
			sql += ", IAU_ENCRYP_GB = '1'";
			sql += ", IAU_MODI_DTT = SYSDATE";
			sql += " WHERE IAU_EMP_NO='" + EMP_NO + "'";

			argStmtExec.executeUpdate(sql);

		} catch (Exception e) {

			throw new FuncException(e.toString(), sql);
		}

		return sql;
	}
%>
