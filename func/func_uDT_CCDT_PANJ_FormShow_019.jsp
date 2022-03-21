<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%!
	public String func_uDT_CCDT_PANJ_FormShow_019(Statement argStmtExec, HashMap argHtMethod) throws Exception {

		String sql = "";
		String sql2 = "";
		String sql_disp = "";

		try {

			String VALUE = (String) argHtMethod.get("VALUE");
			String LARGE = (String) argHtMethod.get("LARGE");
			String LEVEL = (String) argHtMethod.get("LEVEL");
			String USE_YN = (String) argHtMethod.get("USE_YN");
			String SMALL = (String) argHtMethod.get("SMALL");

			//
			if(VALUE == null) { VALUE = ""; }
			if(LARGE == null) { LARGE = ""; }
			if(LEVEL == null) { LEVEL = ""; }
			if(USE_YN == null) { USE_YN = ""; }
			if(SMALL == null) { SMALL = ""; }

			//
			VALUE = CTr.Replace(VALUE, "'", "''");
			LARGE = CTr.Replace(LARGE, "'", "''");
			LEVEL = CTr.Replace(LEVEL, "'", "''");
			USE_YN = CTr.Replace(USE_YN, "'", "''");
			SMALL = CTr.Replace(SMALL, "'", "''");

			sql = "INSERT INTO CT_COMMON (CCN_LARGE, CCN_SMALL, CCN_LEVEL, CCN_FULL_NM, CCN_SHRT_NM, CCN_VALUE, CCN_USE_YN, CCN_NUSE_DTT, CCN_INPT_ID, CCN_INPT_DTT, CCN_MODI_ID, CCN_MODI_DTT) VALUES (";
			sql += "  '0601'";
			sql += ", '22'";
			sql += ", '5'";
			sql += ", 'GFR'";
			sql += ", 'GFR'";
			sql += ", 'S0253|'";
			sql += ", 'Y'";
			sql += ", NULL";
			sql += ", '관리자'";
			sql += ", SYSDATE";
			sql += ", '관리자'";
			sql += ", SYSDATE";
			sql += ")";

			argStmtExec.executeUpdate(sql);

		} catch (Exception e) {

			throw new FuncException(e.toString(), sql);
		}

		return sql;
	}
%>
