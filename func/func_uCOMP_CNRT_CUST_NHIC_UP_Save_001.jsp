<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%!
	public String func_uCOMP_CNRT_CUST_NHIC_UP_Save_001(Statement argStmtExec, HashMap argHtMethod) throws Exception {

		String sql = "";
		String sql2 = "";
		String sql_disp = "";

		try {

			String NHIC_TX = (String) argHtMethod.get("NHIC_TX");
			String HLTH_KD = (String) argHtMethod.get("HLTH_KD");
			String USER_ID = (String) argHtMethod.get("USER_ID");
			String COMP_CD = (String) argHtMethod.get("COMP_CD");
			String MNGT_YR = (String) argHtMethod.get("MNGT_YR");
			String CNRT_SQ = (String) argHtMethod.get("CNRT_SQ");
			String CUST_SQ = (String) argHtMethod.get("CUST_SQ");

			//
			if(NHIC_TX == null) { NHIC_TX = ""; }
			if(HLTH_KD == null) { HLTH_KD = ""; }
			if(USER_ID == null) { USER_ID = ""; }
			if(COMP_CD == null) { COMP_CD = ""; }
			if(MNGT_YR == null) { MNGT_YR = ""; }
			if(CNRT_SQ == null) { CNRT_SQ = ""; }
			if(CUST_SQ == null) { CUST_SQ = ""; }

			//
			NHIC_TX = CTr.Replace(NHIC_TX, "'", "''");
			HLTH_KD = CTr.Replace(HLTH_KD, "'", "''");
			USER_ID = CTr.Replace(USER_ID, "'", "''");
			COMP_CD = CTr.Replace(COMP_CD, "'", "''");
			MNGT_YR = CTr.Replace(MNGT_YR, "'", "''");
			CNRT_SQ = CTr.Replace(CNRT_SQ, "'", "''");
			CUST_SQ = CTr.Replace(CUST_SQ, "'", "''");

			sql = "UPDATE ET_COMP_CNRT_CUST SET ";
			sql += "  ECT_NHIC_TX = '" + NHIC_TX + "'";
			sql += ", ECT_HLTH_KD = '" + HLTH_KD + "'";
			sql += ", ECT_MODI_ID = '" + USER_ID + "'";
			sql += ", ECT_MODI_DTT = SYSDATE";
			sql += " WHERE ECT_COMP_CD = '" + COMP_CD + "'";
			sql += " AND ECT_MNGT_YR = '" + MNGT_YR + "'";
			sql += " AND ECT_CNRT_SQ = '" + CNRT_SQ + "'";
			sql += " AND ECT_CUST_SQ = '" + CUST_SQ + "'";

			argStmtExec.executeUpdate(sql);

		} catch (Exception e) {

			throw new FuncException(e.toString(), sql);
		}

		return sql;
	}
%>
