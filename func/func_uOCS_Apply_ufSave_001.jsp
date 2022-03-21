<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%!
	public String func_uOCS_Apply_ufSave_001(Statement argStmtExec, HashMap argHtMethod) throws Exception {

		String sql = "";
		String sql2 = "";
		String sql_disp = "";

		try {

			String IOC_ITEM_CD = (String) argHtMethod.get("IOC_ITEM_CD");
			String IOC_OCS_CD = (String) argHtMethod.get("IOC_OCS_CD");
			String IOC_OSSB_CD = (String) argHtMethod.get("IOC_OSSB_CD");
			String IOC_OSRL_CD = (String) argHtMethod.get("IOC_OSRL_CD");
			String IOC_ALIS_CD = (String) argHtMethod.get("IOC_ALIS_CD");
			String USER = (String) argHtMethod.get("USER");
			String IOC_ITEM_SQ = (String) argHtMethod.get("IOC_ITEM_SQ");

			//
			if(IOC_ITEM_CD == null) { IOC_ITEM_CD = ""; }
			if(IOC_OCS_CD == null) { IOC_OCS_CD = ""; }
			if(IOC_OSSB_CD == null) { IOC_OSSB_CD = ""; }
			if(IOC_OSRL_CD == null) { IOC_OSRL_CD = ""; }
			if(IOC_ALIS_CD == null) { IOC_ALIS_CD = ""; }
			if(USER == null) { USER = ""; }
			if(IOC_ITEM_SQ == null) { IOC_ITEM_SQ = ""; }

			//
			IOC_ITEM_CD = CTr.Replace(IOC_ITEM_CD, "'", "''");
			IOC_OCS_CD = CTr.Replace(IOC_OCS_CD, "'", "''");
			IOC_OSSB_CD = CTr.Replace(IOC_OSSB_CD, "'", "''");
			IOC_OSRL_CD = CTr.Replace(IOC_OSRL_CD, "'", "''");
			IOC_ALIS_CD = CTr.Replace(IOC_ALIS_CD, "'", "''");
			USER = CTr.Replace(USER, "'", "''");
			IOC_ITEM_SQ = CTr.Replace(IOC_ITEM_SQ, "'", "''");

			sql = "INSERT INTO IT_OCS_CODE ( IOC_ITEM_CD , IOC_OCS_CD , IOC_OSSB_CD , IOC_OSRL_CD , IOC_ALIS_CD , IOC_INPT_ID , IOC_INPT_DTT ,IOC_ITEM_SQ ) VALUES (";
			sql += "  '" + IOC_ITEM_CD + "'";
			sql += ", '" + IOC_OCS_CD + "'";
			sql += ", '" + IOC_OSSB_CD + "'";
			sql += ", '" + IOC_OSRL_CD + "'";
			sql += ", '" + IOC_ALIS_CD + "'";
			sql += ", '" + USER + "'";
			sql += ", SYSDATE";
			sql += ", '" + IOC_ITEM_SQ + "'";
			sql += ")";

			argStmtExec.executeUpdate(sql);

		} catch (Exception e) {

			throw new FuncException(e.toString(), sql);
		}

		return sql;
	}
%>
