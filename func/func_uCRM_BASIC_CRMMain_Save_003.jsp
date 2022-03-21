<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%!
	public String func_uCRM_BASIC_CRMMain_Save_003(Statement argStmtExec, HashMap argHtMethod) throws Exception {

		String sql = "";
		String sql2 = "";
		String sql_disp = "";

		Connection connect = argStmtExec.getConnection();
		CallableStatement CallStmtExec = null;

		try {

			String SRSVN_NO = (String) argHtMethod.get("SRSVN_NO");
			String SEXAM_DT = (String) argHtMethod.get("SEXAM_DT");
			String SEXAM_SQ = (String) argHtMethod.get("SEXAM_SQ");

			//

			if(SRSVN_NO == null) { SRSVN_NO = ""; }
			if(SEXAM_DT == null) { SEXAM_DT = ""; }
			if(SEXAM_SQ == null) { SEXAM_SQ = ""; }

			//

			sql = " UPDATE ST_ADVICE \n";
			sql += " Set SAE_USE_YN = 'N' \n";
			sql += " Where SAE_ADVI_DT = ? \n";
			sql += " AND SAE_ADVI_SQ = ? \n";
			sql += " AND SAE_CUST_NO = ? \n";

			CallStmtExec = connect.prepareCall(sql);

			CallStmtExec.setString(1, SEXAM_DT);
			CallStmtExec.setString(2, SEXAM_SQ);
			CallStmtExec.setString(3, SRSVN_NO);

			CallStmtExec.executeUpdate();



		} catch (Exception e) {

			throw new FuncException(e.toString(), sql);
		}

		return sql;
	}
%>
