<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%!
	public String func_uSP_Health_BtnPANJUNG_SaveClick_003(Statement argStmtExec, HashMap argHtMethod) throws Exception {

		String sql = "";
		String sql2 = "";
		String sql_disp = "";

		try {

			String EXAM_DT = (String) argHtMethod.get("EXAM_DT");
			String EXAM_SQ = (String) argHtMethod.get("EXAM_SQ");
			String ITEM_CD = (String) argHtMethod.get("ITEM_CD");

			//
			if(EXAM_DT == null) { EXAM_DT = ""; }
			if(EXAM_SQ == null) { EXAM_SQ = ""; }
			if(ITEM_CD == null) { ITEM_CD = ""; }

			//
			EXAM_DT = CTr.Replace(EXAM_DT, "'", "''");
			EXAM_SQ = CTr.Replace(EXAM_SQ, "'", "''");
			ITEM_CD = CTr.Replace(ITEM_CD, "'", "''");

			sql = "UPDATE ST_ITEM_CANCEL SET ";
			sql += "  SIC_SBCD_CD = '0607'";
			sql += ", SIC_CANC_LT = '남성근로자'";
			sql += ", SIC_MODI_ID = '관리자'";
			sql += ", SIC_MODI_DTT = SYSDATE";
			sql += " WHERE SIC_EXAM_DT = '" + EXAM_DT + "'";
			sql += " AND SIC_EXAM_SQ = '" + EXAM_SQ + "'";
			sql += " AND SIC_EXAM_CHA = '1'";
			sql += " AND SIC_ITEM_CD = '" + ITEM_CD + "'";

			argStmtExec.executeUpdate(sql);

		} catch (Exception e) {

			throw new FuncException(e.toString(), sql);
		}

		return sql;
	}
%>
