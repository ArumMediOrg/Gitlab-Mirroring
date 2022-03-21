<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%!
	public String func_uKUMC_Point_Management_usePointNew_001(Statement argStmtExec, HashMap argHtMethod) throws Exception {

		String sql = "";
		String sql2 = "";
		String sql_disp = "";

		Connection connect = argStmtExec.getConnection();
		CallableStatement CallStmtExec = null;

		try {

			String RECE_NO = (String) argHtMethod.get("RECE_NO");
			String RECE_SEQ = (String) argHtMethod.get("RECE_SEQ");
			String USE_YYYYMM = (String) argHtMethod.get("USE_YYYYMM");
			String EMPL_NO = (String) argHtMethod.get("EMPL_NO");
			String LOCAL_NM = (String) argHtMethod.get("LOCAL_NM");
			String EMPL_NM = (String) argHtMethod.get("EMPL_NM");
			String DEPT_NM = (String) argHtMethod.get("DEPT_NM");

			//

			if(RECE_NO == null) { RECE_NO = ""; }
			if(RECE_SEQ == null) { RECE_SEQ = ""; }
			if(USE_YYYYMM == null) { USE_YYYYMM = ""; }
			if(EMPL_NO == null) { EMPL_NO = ""; }
			if(LOCAL_NM == null) { LOCAL_NM = ""; }
			if(EMPL_NM == null) { EMPL_NM = ""; }
			if(DEPT_NM == null) { DEPT_NM = ""; }

			//


			sql = " INSERT INTO RT_KUMC_POINT_NEW (RKP_RECE_NO, RKP_RECE_SEQ, RKP_USE_YYYYMM, RKP_EMPL_NO, RKP_LOCAL_NM, RKP_EMPL_NM, RKP_DEPT_NM) ";
			sql += " VALUES ( ";
			sql += "  ? ";
			sql += ", ? ";
			sql += ", ? ";
			sql += ", ? ";
			sql += ", ? ";
			sql += ", ? ";
			sql += ", ? ";
			sql += " ) ";

			CallStmtExec = connect.prepareCall(sql);

			CallStmtExec.setString(1, RECE_NO);
			CallStmtExec.setString(2, RECE_SEQ);
			CallStmtExec.setString(3, USE_YYYYMM);
			CallStmtExec.setString(4, EMPL_NO);
			CallStmtExec.setString(5, LOCAL_NM);
			CallStmtExec.setString(6, EMPL_NM);
			CallStmtExec.setString(7, DEPT_NM);

			CallStmtExec.executeUpdate();

		} catch (Exception e) {

			throw new FuncException(e.toString(), sql);
		}

		return sql;
	}
%>
