<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%!
	public String func_uSP_HEALTH_PM_BtnPrintClick_002(Statement argStmtExec, HashMap argHtMethod) throws Exception {

		String sql = "";
		String sql2 = "";
		String sql_disp = "";

		try {

			String DTEDTTONGBO = (String) argHtMethod.get("DTEDTTONGBO");
			String EXAM_DT = (String) argHtMethod.get("EXAM_DT");
			String EXAM_SQ = (String) argHtMethod.get("EXAM_SQ");

			//
			if(DTEDTTONGBO == null) { DTEDTTONGBO = ""; }
			if(EXAM_DT == null) { EXAM_DT = ""; }
			if(EXAM_SQ == null) { EXAM_SQ = ""; }

			//
			DTEDTTONGBO = CTr.Replace(DTEDTTONGBO, "'", "''");
			EXAM_DT = CTr.Replace(EXAM_DT, "'", "''");
			EXAM_SQ = CTr.Replace(EXAM_SQ, "'", "''");

			sql = "UPDATE PT_SED_PANJUNG SET ";
			sql += "  PSP_TRANC_DATE = '" + DTEDTTONGBO + "'";
			sql += " WHERE PSP_EXAM_DT = '" + EXAM_DT + "'";
			sql += " AND PSP_EXAM_SQ = '" + EXAM_SQ + "'";
			sql += " AND NVL(PSP_TRANC_DATE, ' ') <> '" + DTEDTTONGBO + "'";

			argStmtExec.executeUpdate(sql);

		} catch (Exception e) {

			throw new FuncException(e.toString(), sql);
		}

		return sql;
	}
%>
