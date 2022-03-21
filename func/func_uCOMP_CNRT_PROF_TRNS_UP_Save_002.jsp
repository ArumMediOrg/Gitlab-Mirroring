<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%!
	public String func_uCOMP_CNRT_PROF_TRNS_UP_Save_002(Statement argStmtExec, HashMap argHtMethod) throws Exception {

		String sql = "";
		String sql2 = "";
		String sql_disp = "";

		try {

			String MNGT_YR = (String) argHtMethod.get("MNGT_YR");
			String CNRT_SQ = (String) argHtMethod.get("CNRT_SQ");
			String PROF_SQ = (String) argHtMethod.get("PROF_SQ");
			String USER_ID = (String) argHtMethod.get("USER_ID");
			String SCOMP_CD = (String) argHtMethod.get("SCOMP_CD");
			String SMNGT_YR = (String) argHtMethod.get("SMNGT_YR");
			String SCNRT_SQ = (String) argHtMethod.get("SCNRT_SQ");
			String SPROF_SQ = (String) argHtMethod.get("SPROF_SQ");

			//
			if(MNGT_YR == null) { MNGT_YR = ""; }
			if(CNRT_SQ == null) { CNRT_SQ = ""; }
			if(PROF_SQ == null) { PROF_SQ = ""; }
			if(USER_ID == null) { USER_ID = ""; }
			if(SCOMP_CD == null) { SCOMP_CD = ""; }
			if(SMNGT_YR == null) { SMNGT_YR = ""; }
			if(SCNRT_SQ == null) { SCNRT_SQ = ""; }
			if(SPROF_SQ == null) { SPROF_SQ = ""; }

			//
			MNGT_YR = CTr.Replace(MNGT_YR, "'", "''");
			CNRT_SQ = CTr.Replace(CNRT_SQ, "'", "''");
			PROF_SQ = CTr.Replace(PROF_SQ, "'", "''");
			USER_ID = CTr.Replace(USER_ID, "'", "''");
			SCOMP_CD = CTr.Replace(SCOMP_CD, "'", "''");
			SMNGT_YR = CTr.Replace(SMNGT_YR, "'", "''");
			SCNRT_SQ = CTr.Replace(SCNRT_SQ, "'", "''");
			SPROF_SQ = CTr.Replace(SPROF_SQ, "'", "''");

			sql = "INSERT INTO ET_COMP_CNRT_PROF_ITEM (ECI_COMP_CD ,ECI_MNGT_YR ,ECI_CNRT_SQ ,ECI_PROF_SQ ,ECI_ITEM_CD ,ECI_SORT_SQ ,ECI_ITEM_PR ,ECI_CNRT_PR , ECI_INPT_ID, ECI_INPT_DTT)";
			sql += " SELECT ";
			sql += "  ECI_COMP_CD";
			sql += ", '" + MNGT_YR + "'";
			sql += ", '" + CNRT_SQ + "'";
			sql += ", '" + PROF_SQ + "'";
			sql += ", ECI_ITEM_CD";
			sql += ", ECI_SORT_SQ";
			sql += ", ECI_ITEM_PR";
			sql += ", ECI_CNRT_PR";
			sql += ", '" + USER_ID + "'";
			sql += ", SYSDATE";
			sql += " FROM ET_COMP_CNRT_PROF_ITEM";
			sql += " WHERE ECI_COMP_CD = '" + SCOMP_CD  + "'";
			sql += " AND ECI_MNGT_YR = '" + SMNGT_YR  + "'";
			sql += " AND ECI_CNRT_SQ = '" + SCNRT_SQ  + "'";
			sql += " AND ECI_PROF_SQ = '" + SPROF_SQ + "'";

			argStmtExec.executeUpdate(sql);

		} catch (Exception e) {

			throw new FuncException(e.toString(), sql);
		}

		return sql;
	}
%>
