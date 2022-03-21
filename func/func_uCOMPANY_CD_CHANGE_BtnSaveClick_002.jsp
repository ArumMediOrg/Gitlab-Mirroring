<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%!
	public String func_uCOMPANY_CD_CHANGE_BtnSaveClick_002(Statement argStmtExec, HashMap argHtMethod) throws Exception {

		String sql = "";
		String sql2 = "";
		String sql_disp = "";

		try {

			String SNEW_COMP = (String) argHtMethod.get("SNEW_COMP");
			String EDCOMP_CDA = (String) argHtMethod.get("EDCOMP_CDA");
			String SCOMP_SQ = (String) argHtMethod.get("SCOMP_SQ");
			String EDCOMP_CDB = (String) argHtMethod.get("EDCOMP_CDB");

			//
			if(SNEW_COMP == null) { SNEW_COMP = ""; }
			if(EDCOMP_CDA == null) { EDCOMP_CDA = ""; }
			if(SCOMP_SQ == null) { SCOMP_SQ = ""; }
			if(EDCOMP_CDB == null) { EDCOMP_CDB = ""; }

			//
			SNEW_COMP = CTr.Replace(SNEW_COMP, "'", "''");
			EDCOMP_CDA = CTr.Replace(EDCOMP_CDA, "'", "''");
			SCOMP_SQ = CTr.Replace(SCOMP_SQ, "'", "''");
			EDCOMP_CDB = CTr.Replace(EDCOMP_CDB, "'", "''");

			sql = "UPDATE IT_COMPANY SET ";
			sql += "  ICY_COMP_CD = '" + SNEW_COMP + "'";
			sql += ", ICY_COMP_NO = '" + EDCOMP_CDA + "'";
			sql += ", ICY_COMP_SQ = '" + SCOMP_SQ + "'";
			sql += " WHERE ICY_COMP_CD = '" + EDCOMP_CDB + "'";

			argStmtExec.executeUpdate(sql);

			sql = "UPDATE IT_COMPANY_REC SET ";
			sql += "  ICY_COMP_CD = '" + SNEW_COMP + "'";
			sql += ", ICY_COMP_NO = '" + EDCOMP_CDA + "'";
			sql += ", ICY_COMP_SQ = '" + SCOMP_SQ + "'";
			sql += " WHERE ICY_COMP_CD = '" + EDCOMP_CDB + "'";

			argStmtExec.executeUpdate(sql);

		} catch (Exception e) {

			throw new FuncException(e.toString(), sql);
		}

		return sql;
	}
%>
