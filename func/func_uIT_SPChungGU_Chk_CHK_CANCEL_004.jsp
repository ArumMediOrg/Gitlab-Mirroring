<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%!
	public String func_uIT_SPChungGU_Chk_CHK_CANCEL_004(Statement argStmtExec, HashMap argHtMethod) throws Exception {

		String sql = "";
		String sql2 = "";
		String sql_disp = "";

		try {

			String EXAM_DT = (String) argHtMethod.get("EXAM_DT");
			String EXAM_SQ = (String) argHtMethod.get("EXAM_SQ");
			String EXAM_CHA = (String) argHtMethod.get("EXAM_CHA");
			String ITEM_CD = (String) argHtMethod.get("ITEM_CD");
			String SBCD_CD = (String) argHtMethod.get("SBCD_CD");
			String CANC_LT = (String) argHtMethod.get("CANC_LT");

			//
			if(EXAM_DT == null) { EXAM_DT = ""; }
			if(EXAM_SQ == null) { EXAM_SQ = ""; }
			if(EXAM_CHA == null) { EXAM_CHA = ""; }
			if(ITEM_CD == null) { ITEM_CD = ""; }
			if(SBCD_CD == null) { SBCD_CD = ""; }
			if(CANC_LT == null) { CANC_LT = ""; }

			//
			EXAM_DT = CTr.Replace(EXAM_DT, "'", "''");
			EXAM_SQ = CTr.Replace(EXAM_SQ, "'", "''");
			EXAM_CHA = CTr.Replace(EXAM_CHA, "'", "''");
			ITEM_CD = CTr.Replace(ITEM_CD, "'", "''");
			SBCD_CD = CTr.Replace(SBCD_CD, "'", "''");
			CANC_LT = CTr.Replace(CANC_LT, "'", "''");

			sql = "INSERT INTO ST_ITEM_CANCEL (SIC_EXAM_DT, SIC_EXAM_SQ, SIC_EXAM_CHA, SIC_ITEM_CD, SIC_SBCD_CD, SIC_CANC_LT, SIC_INPT_ID, SIC_INPT_DTT) VALUES (";
			sql += "  '" + EXAM_DT + "'";
			sql += ", '" + EXAM_SQ + "'";
			sql += ", '" + EXAM_CHA + "'";
			sql += ", '" + ITEM_CD + "'";
			sql += ", '" + SBCD_CD + "'";
			sql += ", '" + CANC_LT + "'";
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
