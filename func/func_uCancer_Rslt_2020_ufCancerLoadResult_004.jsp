<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%!
	public String func_uCancer_Rslt_2020_ufCancerLoadResult_004(Statement argStmtExec, HashMap argHtMethod) throws Exception {

		String sql = "";
		String sql2 = "";
		String sql_disp = "";

		try {

			String STABLE_KD = (String) argHtMethod.get("STABLE_KD");
			String SMS_SQL = (String) argHtMethod.get("SMS_SQL");
			String EXAM_DT = (String) argHtMethod.get("EXAM_DT");
			String EXAM_SQ = (String) argHtMethod.get("EXAM_SQ");

			//
			if(STABLE_KD == null) { STABLE_KD = ""; }
			if(SMS_SQL == null) { SMS_SQL = ""; }
			if(EXAM_DT == null) { EXAM_DT = ""; }
			if(EXAM_SQ == null) { EXAM_SQ = ""; }

			//
			STABLE_KD = CTr.Replace(STABLE_KD, "'", "''");
			SMS_SQL = CTr.Replace(SMS_SQL, "'", "''");
			EXAM_DT = CTr.Replace(EXAM_DT, "'", "''");
			EXAM_SQ = CTr.Replace(EXAM_SQ, "'", "''");

			if(STABLE_KD.equals("STMC")) {
				sql = "UPDATE ET_CANCER_STMC + '" + SMS_SQL + "' + ";
				sql += "  WHERE ECS_EXAM_DT = '" + EXAM_DT + "'";
				sql += " AND ECS_EXAM_SQ = '" + EXAM_SQ + "'";

				argStmtExec.executeUpdate(sql);
			}
			else if(STABLE_KD.equals("COLO")) {
				sql = "UPDATE ET_CANCER_COLO + '" + SMS_SQL + "' + ";
				sql += "  WHERE ECC_EXAM_DT = '" + EXAM_DT + "'";
				sql += " AND ECC_EXAM_SQ = '" + EXAM_SQ + "'";

				argStmtExec.executeUpdate(sql);
			}
			else if(STABLE_KD.equals("LIVER")) {
				sql = "UPDATE ET_CANCER_LIVER + '" + SMS_SQL + "' + ";
				sql += "  WHERE ECL_EXAM_DT = '" + EXAM_DT + "'";
				sql += " AND ECL_EXAM_SQ = '" + EXAM_SQ + "'";

				argStmtExec.executeUpdate(sql);
			}
			else if(STABLE_KD.equals("BRST")) {
				sql = "UPDATE ET_CANCER_BRST + '" + SMS_SQL + "' + ";
				sql += "  WHERE ECB_EXAM_DT = '" + EXAM_DT + "'";
				sql += " AND ECB_EXAM_SQ = '" + EXAM_SQ + "'";

				argStmtExec.executeUpdate(sql);
			}
			else if(STABLE_KD.equals("CRVC")) {
				sql = "UPDATE ET_CANCER_CRVC + '" + SMS_SQL + "' + ";
				sql += "  WHERE ECV_EXAM_DT = '" + EXAM_DT + "'";
				sql += " AND ECV_EXAM_SQ = '" + EXAM_SQ + "'";

				argStmtExec.executeUpdate(sql);
			}
			else if(STABLE_KD.equals("LUNG")) {
				sql = "UPDATE ET_CANCER_LUNG + '" + SMS_SQL + "' + ";
				sql += "  WHERE ECG_EXAM_DT = '" + EXAM_DT + "'";
				sql += " AND ECG_EXAM_SQ = '" + EXAM_SQ + "'";

				argStmtExec.executeUpdate(sql);
			}

		} catch (Exception e) {

			throw new FuncException(e.toString(), sql);
		}

		return sql;
	}
%>
