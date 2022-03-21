<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%!
	public String func_uIT_User_re_btn_restClick_001(Statement argStmtExec, HashMap argHtMethod) throws Exception {

		String sql = "";
		String sql2 = "";
		String sql_disp = "";

		try {

			String IAU_EMP_NO = (String) argHtMethod.get("IAU_EMP_NO");

			//
			if(IAU_EMP_NO == null) { IAU_EMP_NO = ""; }

			//
			IAU_EMP_NO = CTr.Replace(IAU_EMP_NO, "'", "''");

			sql = "UPDATE IT_AUTH_USER SET ";
			sql += "  IAU_USE_YN = 'Y'";
			sql += " WHERE IAU_EMP_NO = '" + IAU_EMP_NO + "'";

			argStmtExec.executeUpdate(sql);

		} catch (Exception e) {

			throw new FuncException(e.toString(), sql);
		}

		return sql;
	}
%>
