<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%!
	public String func_uIT_SPChungGU_Chk_CHK_CANCEL_003(Statement argStmtExec, HashMap argHtMethod) throws Exception {

		String sql = "";
		String sql2 = "";
		String sql_disp = "";

		try {

			String EXAM_DT = (String) argHtMethod.get("EXAM_DT");
			String EXAM_SQ = (String) argHtMethod.get("EXAM_SQ");
			String SBCD_CD = (String) argHtMethod.get("SBCD_CD");
			String CANC_LT = (String) argHtMethod.get("CANC_LT");

			//
			if(EXAM_DT == null) { EXAM_DT = ""; }
			if(EXAM_SQ == null) { EXAM_SQ = ""; }
			if(SBCD_CD == null) { SBCD_CD = ""; }
			if(CANC_LT == null) { CANC_LT = ""; }

			//
			EXAM_DT = CTr.Replace(EXAM_DT, "'", "''");
			EXAM_SQ = CTr.Replace(EXAM_SQ, "'", "''");
			SBCD_CD = CTr.Replace(SBCD_CD, "'", "''");
			CANC_LT = CTr.Replace(CANC_LT, "'", "''");

			sql = "DELETE FROM ST_ITEM_CANCEL";
			sql += " WHERE SIC_EXAM_DT = '" + EXAM_DT + "'";
			sql += " AND SIC_EXAM_SQ = '" + EXAM_SQ + "'";
			sql += " AND SIC_SBCD_CD = '" + SBCD_CD + "'";
			if(! CANC_LT.equals("")) {
				sql += " AND SIC_CANC_LT = '" + CANC_LT + "'";
			}

			argStmtExec.executeUpdate(sql);

		} catch (Exception e) {

			throw new FuncException(e.toString(), sql);
		}

		return sql;
	}
%>
