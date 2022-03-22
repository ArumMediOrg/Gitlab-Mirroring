<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%!
	public String func_uKUMC_Point_Management_usePoint_001(Statement argStmtExec, HashMap argHtMethod) throws Exception {

		String sql = "";
		String sql2 = "";
		String sql_disp = "";

		Connection connect = argStmtExec.getConnection();
		CallableStatement CallStmtExec = null;

		try {

			String RECE_NO = (String) argHtMethod.get("RECE_NO");
			String USE_YYYYMM = (String) argHtMethod.get("USE_YYYYMM");
			String EMPL_NO = (String) argHtMethod.get("EMPL_NO");
			String LOCAL_NM = (String) argHtMethod.get("LOCAL_NM");
			String EMPL_NM = (String) argHtMethod.get("EMPL_NM");
			String DEPT_NM = (String) argHtMethod.get("DEPT_NM");

			//
			if(RECE_NO == null) { RECE_NO = ""; }
			if(USE_YYYYMM == null) { USE_YYYYMM = ""; }
			if(EMPL_NO == null) { EMPL_NO = ""; }
			if(LOCAL_NM == null) { LOCAL_NM = ""; }
			if(EMPL_NM == null) { EMPL_NM = ""; }
			if(DEPT_NM == null) { DEPT_NM = ""; }

			//


			sql = " INSERT INTO RT_KUMC_POINT (RKP_RECE_NO, RKP_USE_YYYYMM, RKP_EMPL_NO, RKP_LOCAL_NM, RKP_EMPL_NM, RKP_DEPT_NM) ";
			sql += " VALUES ( ";
			sql += "  ? ";
			sql += ", ? ";
			sql += ", ? ";
			sql += ", ? ";
			sql += ", ? ";
			sql += ", ? ";
			sql += " ) ";

			CallStmtExec = connect.prepareCall(sql);

			CallStmtExec.setString(1, RECE_NO);
			CallStmtExec.setString(2, USE_YYYYMM);
			CallStmtExec.setString(3, EMPL_NO);
			CallStmtExec.setString(4, LOCAL_NM);
			CallStmtExec.setString(5, EMPL_NM);
			CallStmtExec.setString(6, DEPT_NM);

			CallStmtExec.executeUpdate();

		} catch (Exception e) {

			throw new FuncException(e.toString(), sql);
		}

		return sql;
	}
%>