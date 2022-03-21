<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%!
	public String func_uIT_User_BitBtn1Click_001(Statement argStmtExec, HashMap argHtMethod) throws Exception {

		String sql = "";
		String sql2 = "";
		String sql_disp = "";

		try {

			String IAU_PASS_WD = (String) argHtMethod.get("IAU_PASS_WD");
			String IAU_EMP_NO = (String) argHtMethod.get("IAU_EMP_NO");

			//
			if(IAU_PASS_WD == null) { IAU_PASS_WD = ""; }
			if(IAU_EMP_NO == null) { IAU_EMP_NO = ""; }

			//
			IAU_PASS_WD = CTr.Replace(IAU_PASS_WD, "'", "''");
			IAU_EMP_NO = CTr.Replace(IAU_EMP_NO, "'", "''");

			sql = "UPDATE IT_AUTH_USER SET ";
			sql += "  IAU_PASS_WD = '" + IAU_PASS_WD + "'";
			sql += ", IAU_ENCRYP_GB = '1'";
			sql += " WHERE IAU_EMP_NO = '" + IAU_EMP_NO + "'";
			sql += " AND (IAU_ENCRYP_GB <> '1' OR IAU_ENCRYP_GB IS NULL)";

			argStmtExec.executeUpdate(sql);

		} catch (Exception e) {

			throw new FuncException(e.toString(), sql);
		}

		return sql;
	}
%>
