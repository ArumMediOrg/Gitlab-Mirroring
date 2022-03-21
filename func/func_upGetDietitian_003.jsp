<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%!
	public String func_upGetDietitian_003(Statement argStmtExec, HashMap argHtMethod) throws Exception {

		String sql = "";
		String sql2 = "";
		String sql_disp = "";

		try {

			String ADVI_DT = (String) argHtMethod.get("ADVI_DT");
			String BMI_NM = (String) argHtMethod.get("BMI_NM");
			String KCAL_VL = (String) argHtMethod.get("KCAL_VL");
			String SOCK_TX1 = (String) argHtMethod.get("SOCK_TX1");
			String SOCK_TX2 = (String) argHtMethod.get("SOCK_TX2");
			String SOCK_TX3 = (String) argHtMethod.get("SOCK_TX3");
			String SOCK_TX4 = (String) argHtMethod.get("SOCK_TX4");
			String SOCK_TX5 = (String) argHtMethod.get("SOCK_TX5");
			String SOCK_TX6 = (String) argHtMethod.get("SOCK_TX6");
			String SOCK_TX7 = (String) argHtMethod.get("SOCK_TX7");
			String SOCK_TX8 = (String) argHtMethod.get("SOCK_TX8");
			String TRANC_DT = (String) argHtMethod.get("TRANC_DT");
			String USER = (String) argHtMethod.get("USER");
			String EXAM_DT = (String) argHtMethod.get("EXAM_DT");
			String EXAM_SQ = (String) argHtMethod.get("EXAM_SQ");

			//
			if(ADVI_DT == null) { ADVI_DT = ""; }
			if(BMI_NM == null) { BMI_NM = ""; }
			if(KCAL_VL == null) { KCAL_VL = ""; }
			if(SOCK_TX1 == null) { SOCK_TX1 = ""; }
			if(SOCK_TX2 == null) { SOCK_TX2 = ""; }
			if(SOCK_TX3 == null) { SOCK_TX3 = ""; }
			if(SOCK_TX4 == null) { SOCK_TX4 = ""; }
			if(SOCK_TX5 == null) { SOCK_TX5 = ""; }
			if(SOCK_TX6 == null) { SOCK_TX6 = ""; }
			if(SOCK_TX7 == null) { SOCK_TX7 = ""; }
			if(SOCK_TX8 == null) { SOCK_TX8 = ""; }
			if(TRANC_DT == null) { TRANC_DT = ""; }
			if(USER == null) { USER = ""; }
			if(EXAM_DT == null) { EXAM_DT = ""; }
			if(EXAM_SQ == null) { EXAM_SQ = ""; }

			//
			ADVI_DT = CTr.Replace(ADVI_DT, "'", "''");
			BMI_NM = CTr.Replace(BMI_NM, "'", "''");
			KCAL_VL = CTr.Replace(KCAL_VL, "'", "''");
			SOCK_TX1 = CTr.Replace(SOCK_TX1, "'", "''");
			SOCK_TX2 = CTr.Replace(SOCK_TX2, "'", "''");
			SOCK_TX3 = CTr.Replace(SOCK_TX3, "'", "''");
			SOCK_TX4 = CTr.Replace(SOCK_TX4, "'", "''");
			SOCK_TX5 = CTr.Replace(SOCK_TX5, "'", "''");
			SOCK_TX6 = CTr.Replace(SOCK_TX6, "'", "''");
			SOCK_TX7 = CTr.Replace(SOCK_TX7, "'", "''");
			SOCK_TX8 = CTr.Replace(SOCK_TX8, "'", "''");
			TRANC_DT = CTr.Replace(TRANC_DT, "'", "''");
			USER = CTr.Replace(USER, "'", "''");
			EXAM_DT = CTr.Replace(EXAM_DT, "'", "''");
			EXAM_SQ = CTr.Replace(EXAM_SQ, "'", "''");

			sql = "UPDATE HEALTH_DIETITIAN_PANJUNG SET ";
			sql += "  HDP_ADVI_DT = '" + ADVI_DT + "'";
			sql += ", HDP_BMI_NM = '" + BMI_NM + "'";
			sql += ", HDP_KCAL_VL = '" + KCAL_VL + "'";
			sql += ", HDP_SOCK_TX1 = '" + SOCK_TX1 + "'";
			sql += ", HDP_SOCK_TX2 = '" + SOCK_TX2 + "'";
			sql += ", HDP_SOCK_TX3 = '" + SOCK_TX3 + "'";
			sql += ", HDP_SOCK_TX4 = '" + SOCK_TX4 + "'";
			sql += ", HDP_SOCK_TX5 = '" + SOCK_TX5 + "'";
			sql += ", HDP_SOCK_TX6 = '" + SOCK_TX6 + "'";
			sql += ", HDP_SOCK_TX7 = '" + SOCK_TX7 + "'";
			sql += ", HDP_SOCK_TX8 = '" + SOCK_TX8 + "'";
			sql += ", HDP_TRANC_DT = '" + TRANC_DT + "'";
			sql += ", HDP_MODI_ID = '" + USER + "'";
			sql += ", HDP_MODI_DTT = SYSDATE";
			sql += " WHERE HDP_EXAM_DT = '" + EXAM_DT + "'";
			sql += " AND HDP_EXAM_SQ = '" + EXAM_SQ + "'";

			argStmtExec.executeUpdate(sql);

		} catch (Exception e) {

			throw new FuncException(e.toString(), sql);
		}

		return sql;
	}
%>
