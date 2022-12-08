<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%!
	public String func_uExam_Result_upGetRcpt_004(Statement argStmtExec, HashMap argHtMethod) throws Exception {

		String sql = "";
		String sql2 = "";
		String sql_disp = "";

		try {

			String EXAM_DT = (String) argHtMethod.get("EXAM_DT");
			String EXAM_SQ = (String) argHtMethod.get("EXAM_SQ");

			//
			if(EXAM_DT == null) { EXAM_DT = ""; }
			if(EXAM_SQ == null) { EXAM_SQ = ""; }

			//
			EXAM_DT = CTr.Replace(EXAM_DT, "'", "''");
			EXAM_SQ = CTr.Replace(EXAM_SQ, "'", "''");

			sql += " INSERT INTO ST_SYTH_VIEW ( SSV_EXAM_DT, SSV_EXAM_SQ, SSV_PACK_CD )";
			sql += " SELECT EEA_EXAM_DT, EEA_EXAM_SQ, '00'";
			sql += " FROM ET_EXAM_ACPT ";
			sql += " WHERE EEA_EXAM_DT = '" + EXAM_DT  + "'";
			sql += " AND EEA_EXAM_SQ = '" + EXAM_SQ  + "'";
			sql += " AND EEA_ORDER_YN <> 'C' ";
			sql += " AND NOT EXISTS ( SELECT SSV_EXAM_DT, SSV_EXAM_SQ ";
			sql += " FROM ST_SYTH_VIEW ";
			sql += " WHERE SSV_EXAM_DT = EEA_EXAM_DT AND SSV_EXAM_SQ = EEA_EXAM_SQ ) ";

			argStmtExec.executeUpdate(sql);

		} catch (Exception e) {

			throw new FuncException(e.toString(), sql);
		}

		return sql;
	}
%>
