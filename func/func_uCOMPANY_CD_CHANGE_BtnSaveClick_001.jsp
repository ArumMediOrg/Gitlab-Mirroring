<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%!
	public String func_uCOMPANY_CD_CHANGE_BtnSaveClick_001(Statement argStmtExec, HashMap argHtMethod) throws Exception {

		String sql = "";
		String sql2 = "";
		String sql_disp = "";

		try {

			String SNEW_COMP = (String) argHtMethod.get("SNEW_COMP");
			String SUSE_YN = (String) argHtMethod.get("SUSE_YN");
			String USER_ID = (String) argHtMethod.get("USER_ID");
			String EDCOMP_CDB = (String) argHtMethod.get("EDCOMP_CDB");

			//
			if(SNEW_COMP == null) { SNEW_COMP = ""; }
			if(SUSE_YN == null) { SUSE_YN = ""; }
			if(USER_ID == null) { USER_ID = ""; }
			if(EDCOMP_CDB == null) { EDCOMP_CDB = ""; }

			//
			SNEW_COMP = CTr.Replace(SNEW_COMP, "'", "''");
			SUSE_YN = CTr.Replace(SUSE_YN, "'", "''");
			USER_ID = CTr.Replace(USER_ID, "'", "''");
			EDCOMP_CDB = CTr.Replace(EDCOMP_CDB, "'", "''");

			sql = "UPDATE IT_COMPANY SET ";
			sql += "  ICY_USE_YN = 'Y'";
			sql += ", ICY_NUSE_ID = ''";
			sql += ", ICY_NUSE_DTT = ''";
			sql += " WHERE ICY_COMP_CD = '" + SNEW_COMP + "'";
			sql += " AND ICY_USE_YN = 'N'";

			argStmtExec.executeUpdate(sql);

			sql = "UPDATE IT_COMPANY_REC SET ";
			sql += "  ICY_USE_YN = 'Y'";
			sql += ", ICY_NUSE_ID = ''";
			sql += ", ICY_NUSE_DTT = ''";
			sql += " WHERE ICY_COMP_CD = '" + SNEW_COMP + "'";
			sql += " AND ICY_USE_YN = 'N'";

			argStmtExec.executeUpdate(sql);

			if(SUSE_YN.equals("Y")) {
				sql = "UPDATE IT_COMPANY SET ";
				sql += "  ICY_USE_YN = 'N'";
				sql += ", ICY_NUSE_ID = '" + USER_ID + "'";
				sql += ", ICY_NUSE_DTT = SYSDATE";
				sql += ", ICY_NUSE_TX = '" + SNEW_COMP + "'||'로 변경'";
				sql += " WHERE ICY_COMP_CD = '" + EDCOMP_CDB + "'";

				argStmtExec.executeUpdate(sql);

				sql = "UPDATE IT_COMPANY_REC SET ";
				sql += "  ICY_USE_YN = 'N'";
				sql += ", ICY_NUSE_ID = '" + USER_ID + "'";
				sql += ", ICY_NUSE_DTT = SYSDATE";
				sql += ", ICY_NUSE_TX = '" + SNEW_COMP + "'||'로 변경'";
				sql += " WHERE ICY_COMP_CD = '" + EDCOMP_CDB + "'";

				argStmtExec.executeUpdate(sql);

			}
		} catch (Exception e) {

			throw new FuncException(e.toString(), sql);
		}

		return sql;
	}
%>
