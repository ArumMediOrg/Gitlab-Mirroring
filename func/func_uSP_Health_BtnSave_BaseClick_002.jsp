<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%!
	public String func_uSP_Health_BtnSave_BaseClick_002(Statement argStmtExec, HashMap argHtMethod) throws Exception {

		String sql = "";
		String sql2 = "";
		String sql_disp = "";

		try {

			String BUSI_CD = (String) argHtMethod.get("BUSI_CD");
			String EXAM_DT = (String) argHtMethod.get("EXAM_DT");
			String EXAM_SQ = (String) argHtMethod.get("EXAM_SQ");
			String MATT_CD = (String) argHtMethod.get("MATT_CD");
			String MATT_SQ = (String) argHtMethod.get("MATT_SQ");

			//
			if(BUSI_CD == null) { BUSI_CD = ""; }
			if(EXAM_DT == null) { EXAM_DT = ""; }
			if(EXAM_SQ == null) { EXAM_SQ = ""; }
			if(MATT_CD == null) { MATT_CD = ""; }
			if(MATT_SQ == null) { MATT_SQ = ""; }

			//
			BUSI_CD = CTr.Replace(BUSI_CD, "'", "''");
			EXAM_DT = CTr.Replace(EXAM_DT, "'", "''");
			EXAM_SQ = CTr.Replace(EXAM_SQ, "'", "''");
			MATT_CD = CTr.Replace(MATT_CD, "'", "''");
			MATT_SQ = CTr.Replace(MATT_SQ, "'", "''");

			sql = "UPDATE ST_PANJUNG SET ";
			sql += "  SPG_BUSI_CD = '" + BUSI_CD + "'";
			sql += " WHERE SPG_EXAM_DT = '" + EXAM_DT + "'";
			sql += " AND SPG_EXAM_SQ = '" + EXAM_SQ + "'";
			sql += " AND SPG_MATT_CD = '" + MATT_CD + "'";
			sql += " AND SPG_MATT_SQ = '" + MATT_SQ + "'";

			argStmtExec.executeUpdate(sql);

		} catch (Exception e) {

			throw new FuncException(e.toString(), sql);
		}

		return sql;
	}
%>
