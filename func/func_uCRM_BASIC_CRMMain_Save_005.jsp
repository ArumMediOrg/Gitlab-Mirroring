<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%!
	public String func_uCRM_BASIC_CRMMain_Save_005(Statement argStmtExec, HashMap argHtMethod) throws Exception {

		String sql = "";
		String sql2 = "";
		String sql_disp = "";

		Connection connect = argStmtExec.getConnection();
		CallableStatement CallStmtExec = null;

		try {

			String SSQL_ADD1 = (String) argHtMethod.get("SSQL_ADD1");
			String SEXAM_DT = (String) argHtMethod.get("SEXAM_DT");
			String SEXAM_SQ = (String) argHtMethod.get("SEXAM_SQ");
			String SRSVN_NO = (String) argHtMethod.get("SRSVN_NO");

			//
			if(SSQL_ADD1 == null) { SSQL_ADD1 = ""; }
			if(SEXAM_DT == null) { SEXAM_DT = ""; }
			if(SEXAM_SQ == null) { SEXAM_SQ = ""; }
			if(SRSVN_NO == null) { SRSVN_NO = ""; }

			//

			sql = " UPDATE ST_ADVICE Set \n";
			//sql += " ? \n";
			sql += SSQL_ADD1;
			sql += " WHERE SAE_ADVI_DT = ? \n";
			sql += " AND SAE_CUST_NO  = ? \n";
			sql += " AND SAE_ADVI_SQ = ? \n";


			CallStmtExec = connect.prepareCall(sql);

			//CallStmtExec.setString(1, SSQL_ADD1);
			CallStmtExec.setString(1, SEXAM_DT);
			CallStmtExec.setString(2, SRSVN_NO);
			CallStmtExec.setString(3, SEXAM_SQ);



			CallStmtExec.executeUpdate();



		} catch (Exception e) {

			throw new FuncException(e.toString(), sql);
		}

		return sql;
	}
%>
