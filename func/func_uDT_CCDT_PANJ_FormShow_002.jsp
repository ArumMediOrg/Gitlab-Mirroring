<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%!
	public String func_uDT_CCDT_PANJ_FormShow_002(Statement argStmtExec, HashMap argHtMethod) throws Exception {

		String sql = "";
		String sql2 = "";
		String sql_disp = "";

		try {

			String MAN_HIGH = (String) argHtMethod.get("MAN_HIGH");
			String WOMAN_HIGH = (String) argHtMethod.get("WOMAN_HIGH");
			String GUBN_CD = (String) argHtMethod.get("GUBN_CD");
			String MACH_CD = (String) argHtMethod.get("MACH_CD");
			String MACH_SQ = (String) argHtMethod.get("MACH_SQ");

			//
			if(MAN_HIGH == null) { MAN_HIGH = ""; }
			if(WOMAN_HIGH == null) { WOMAN_HIGH = ""; }
			if(GUBN_CD == null) { GUBN_CD = ""; }
			if(MACH_CD == null) { MACH_CD = ""; }
			if(MACH_SQ == null) { MACH_SQ = ""; }

			//
			MAN_HIGH = CTr.Replace(MAN_HIGH, "'", "''");
			WOMAN_HIGH = CTr.Replace(WOMAN_HIGH, "'", "''");
			GUBN_CD = CTr.Replace(GUBN_CD, "'", "''");
			MACH_CD = CTr.Replace(MACH_CD, "'", "''");
			MACH_SQ = CTr.Replace(MACH_SQ, "'", "''");

			sql = "UPDATE CT_COMM_PANJ SET ";
			sql += "  CCP_MAN_HIGH = '" + MAN_HIGH + "'";
			sql += ", CCP_WOMAN_HIGH = '" + WOMAN_HIGH + "'";
			sql += " WHERE CCP_GUBN_CD = '" + GUBN_CD + "'";
			sql += " AND CCP_MACH_CD = '" + MACH_CD + "'";
			sql += " AND CCP_MACH_SQ = '" + MACH_SQ + "'";

			argStmtExec.executeUpdate(sql);

		} catch (Exception e) {

			throw new FuncException(e.toString(), sql);
		}

		return sql;
	}
%>
