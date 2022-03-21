<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%!
	public String func_uPostManagement_NEWCustList_APPLY_UP_Save_003(Statement argStmtExec, HashMap argHtMethod) throws Exception {

		String sql = "";
		String sql2 = "";
		String sql_disp = "";

		try {

			String EXAM_DT = (String) argHtMethod.get("EXAM_DT");
			String EXAM_SQ = (String) argHtMethod.get("EXAM_SQ");
			String FLAG = (String) argHtMethod.get("FLAG");
			String ID = (String) argHtMethod.get("ID");
			String IP = (String) argHtMethod.get("IP");

			//
			if(EXAM_DT == null) { EXAM_DT = ""; }
			if(EXAM_SQ == null) { EXAM_SQ = ""; }
			if(FLAG == null) { FLAG = ""; }
			if(ID == null) { ID = ""; }
			if(IP == null) { IP = ""; }

			//
			EXAM_DT = CTr.Replace(EXAM_DT, "'", "''");
			EXAM_SQ = CTr.Replace(EXAM_SQ, "'", "''");
			FLAG = CTr.Replace(FLAG, "'", "''");
			ID = CTr.Replace(ID, "'", "''");
			IP = CTr.Replace(IP, "'", "''");

			sql = "INSERT INTO ST_ADVICE_LOG (EXAM_DT, EXAM_SQ, FLAG, ID, DTT, IP) VALUES (";
			sql += "  '" + EXAM_DT + "'";
			sql += ", '" + EXAM_SQ + "'";
			sql += ", '" + FLAG + "'";
			sql += ", '" + ID + "'";
			sql += ", SYSDATE";
			sql += ", '" + IP + "'";
			sql += ")";

			argStmtExec.executeUpdate(sql);

		} catch (Exception e) {

			throw new FuncException(e.toString(), sql);
		}

		return sql;
	}
%>
