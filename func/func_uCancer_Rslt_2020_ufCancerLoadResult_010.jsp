<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%!
	public String func_uCancer_Rslt_2020_ufCancerLoadResult_010(Statement argStmtExec, HashMap argHtMethod) throws Exception {

		String sql = "";
		String sql2 = "";
		String sql_disp = "";

		Connection connect = argStmtExec.getConnection();
		CallableStatement CallStmtExec = null;

		try {

			String sRSLT_CD = (String) argHtMethod.get("sRSLT_CD");

			//
			if(sRSLT_CD == null) { sRSLT_CD = ""; }

			//
			sRSLT_CD = Ctr.Replace(sRSLT_CD, "'", "''");


			sql = " UPDATE ET_SAVED_RSLT ";
			sql += " SET ESR_USE_YN = 'N' ";
			sql += " WHERE ESR_RSLT_CD = '" + sR SLT_CD + "'";

			argStmtExec.executeUpdate(sql);


		} catch (Exception e) {

			throw new FuncException(e.toString(), sql);
		}

		return sql;
	}
%>