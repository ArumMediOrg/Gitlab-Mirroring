<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%!
	public String func_uCancer_Rslt_2020_ufCancerLoadResult_008(Statement argStmtExec, HashMap argHtMethod) throws Exception {

		String sql = "";
		String sql2 = "";
		String sql_disp = "";

		Connection connect = argStmtExec.getConnection();
		CallableStatement CallStmtExec = null;

		try {

			String sRsltCd = (String) argHtMethod.get("sRsltCd");
			String sRSLT_NM = (String) argHtMethod.get("sRSLT_NM");
			String sExamKd = (String) argHtMethod.get("sExamKd");
			String sRSLT1_VL = (String) argHtMethod.get("sRSLT1_VL");
			String sRSLT2_VL = (String) argHtMethod.get("sRSLT2_VL");
			String sRSLT3_VL = (String) argHtMethod.get("sRSLT3_VL");
			String sRSLT4_VL = (String) argHtMethod.get("sRSLT4_VL");

			//
			if(sRsltCd == null) { sRsltCd = ""; }
			if(sRSLT_NM == null) { sRSLT_NM = ""; }
			if(sExamKd == null) { sExamKd = ""; }
			if(sRSLT1_VL == null) { sRSLT1_VL = ""; }
			if(sRSLT2_VL == null) { sRSLT2_VL = ""; }
			if(sRSLT3_VL == null) { sRSLT3_VL = ""; }
			if(sRSLT4_VL == null) { sRSLT4_VL = ""; }

			//
			sRsltCd = Ctr.Replace(sRsltCd, "'", "''");
			sRSLT_NM = Ctr.Replace(sRSLT_NM, "'", "''");
			sExamKd = Ctr.Replace(sExamKd, "'", "''");
			sRSLT1_VL = Ctr.Replace(sRSLT1_VL, "'", "''");
			sRSLT2_VL = Ctr.Replace(sRSLT2_VL, "'", "''");
			sRSLT3_VL = Ctr.Replace(sRSLT3_VL, "'", "''");
			sRSLT4_VL = Ctr.Replace(sRSLT4_VL, "'", "''");


			sql = "INSERT INTO SAVED_RSLT (PDP_EXAM_DT, PDP_EXAM_SQ, PDP_EXAM_KD ,PDP_ETC1_CD, PDP_ETC2_CD, PDP_ETC3_CD ,PDP_ETC4_CD) VALUES (";
			sql += "  '" + sRsltCd + "'";
			sql += ", '" + sRSLT_NM + "'";
			sql += ", '" + sExamKd + "'";
			sql += ", '" + sRSLT1_VL + "'";
			sql += ", '" + sRSLT2_VL + "'";
			sql += ", '" + sRSLT3_VL + "'";
			sql += ", '" + sRSLT4_VL + "'";
			sql += ", 'Y')";

			argStmtExec.executeUpdate(sql);


		} catch (Exception e) {

			throw new FuncException(e.toString(), sql);
		}

		return sql;
	}
%>
