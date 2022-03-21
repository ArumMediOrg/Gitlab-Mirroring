<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%!
	public String func_uExam_Result_upGetRcpt_003(Statement argStmtExec, HashMap argHtMethod) throws Exception {

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

			sql = "INSERT INTO ET_CANCER_HEADER ( ECH_EXAM_DT, ECH_EXAM_SQ, ECH_CFRM_CD ";
			sql += "  )";
			sql += "";
			sql += " SELECT EEA_EXAM_DT, EEA_EXAM_SQ, '1'";
			sql += " FROM ET_EXAM_ACPT";
			sql += " WHERE EEA_EXAM_DT = '" + EXAM_DT + "'";
			sql += " AND EEA_EXAM_SQ = '" + EXAM_SQ + "'";
			sql += " AND EEA_ORDER_YN <> 'C'";
			sql += " AND NVL(EEA_HTSB_CD, ' ') <> ' '";
			sql += " AND (EEA_STOMA_CD > '0'";
			sql += " OR EEA_COLON_CD > '0'";
			sql += " OR EEA_LIVER_CD > '0'";
			sql += " OR EEA_BAST_CD > '0'";
			sql += " OR EEA_UTER_CD > '0'";
			sql += " OR EEA_LUNG_CD > '0')";
			sql += " AND NOT EXISTS ( SELECT ECH_EXAM_DT, ECH_EXAM_SQ";
			sql += " FROM ET_CANCER_HEADER";
			sql += " WHERE ECH_EXAM_DT = EEA_EXAM_DT";
			sql += " AND ECH_EXAM_SQ = EEA_EXAM_SQ )";

			argStmtExec.executeUpdate(sql);

		} catch (Exception e) {

			throw new FuncException(e.toString(), sql);
		}

		return sql;
	}
%>
