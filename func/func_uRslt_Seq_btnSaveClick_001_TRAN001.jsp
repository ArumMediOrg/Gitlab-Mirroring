<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%!
	public String func_uRslt_Seq_btnSaveClick_001_TRAN001(Statement argStmtExec, HashMap argHtMethod) throws Exception {

		String sql = "";
		String sql2 = "";
		String sql_disp = "";

		try {

			String EXAM_KD = (String) argHtMethod.get("EXAM_KD");

			//
			if(EXAM_KD == null) { EXAM_KD = ""; }

			//
			EXAM_KD = CTr.Replace(EXAM_KD, "'", "''");

			sql = "DELETE FROM IT_HTSB_SEQ";
			sql += " WHERE IHS_EXAM_KD = '" + EXAM_KD + "'";

			argStmtExec.executeUpdate(sql);

		} catch (Exception e) {

			throw new FuncException(e.toString(), sql);
		}

		return sql;
	}
%>
