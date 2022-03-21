<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%!
	public String func_uCOMP_CNRT_BtnAllDelClick_001(Statement argStmtExec, HashMap argHtMethod) throws Exception {

		String sql = "";
		String sql2 = "";
		String sql_disp = "";

		try {

			String COMP_CD = (String) argHtMethod.get("COMP_CD");
			String MNGT_YR = (String) argHtMethod.get("MNGT_YR");
			String CNRT_SQ = (String) argHtMethod.get("CNRT_SQ");
			String CHKBOX_SUGUM = (String) argHtMethod.get("CHKBOX_SUGUM");

			//
			if(COMP_CD == null) { COMP_CD = ""; }
			if(MNGT_YR == null) { MNGT_YR = ""; }
			if(CNRT_SQ == null) { CNRT_SQ = ""; }
			if(CHKBOX_SUGUM == null) { CHKBOX_SUGUM = ""; }

			//
			COMP_CD = CTr.Replace(COMP_CD, "'", "''");
			MNGT_YR = CTr.Replace(MNGT_YR, "'", "''");
			CNRT_SQ = CTr.Replace(CNRT_SQ, "'", "''");
			CHKBOX_SUGUM = CTr.Replace(CHKBOX_SUGUM, "'", "''");

			sql = "DELETE FROM ET_COMP_CNRT_CUST";
			sql += " WHERE ECT_COMP_CD = '" + COMP_CD + "'";
			sql += " AND ECT_MNGT_YR = '" + MNGT_YR + "'";
			sql += " AND ECT_CNRT_SQ = '" + CNRT_SQ + "'";
			if(!CHKBOX_SUGUM.equals("")) {
				sql += "AND NVL(ECT_EXAM_DT, ' ') = ' '";
				sql += "AND NVL(ECT_EXAM_SQ, ' ') = ' '";

			}

			argStmtExec.executeUpdate(sql);
		} catch (Exception e) {

			throw new FuncException(e.toString(), sql);
		}

		return sql;
	}
%>
