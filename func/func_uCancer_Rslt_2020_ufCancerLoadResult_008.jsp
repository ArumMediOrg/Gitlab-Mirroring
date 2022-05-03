<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%!
	public String func_uCancer_Rslt_2020_ufCancerLoadResult_008(Statement argStmtExec, HashMap argHtMethod) throws Exception {

		String sql = "";
		String sql2 = "";
		String sql_disp = "";


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

			sRsltCd = CTr.Replace(sRsltCd, "'", "''");
			sRSLT_NM = CTr.Replace(sRSLT_NM, "'", "''");
			sExamKd = CTr.Replace(sExamKd, "'", "''");
			sRSLT1_VL = CTr.Replace(sRSLT1_VL, "'", "''");
			sRSLT2_VL = CTr.Replace(sRSLT2_VL, "'", "''");
			sRSLT3_VL = CTr.Replace(sRSLT3_VL, "'", "''");
			sRSLT4_VL = CTr.Replace(sRSLT4_VL, "'", "''");

			sql = " INSERT INTO ET_SAVED_RSLT ";
			sql += "(ESR_RSLT_CD, ESR_RSLT_NM, ESR_EXAM_KD, ESR_RSLT1_VL, ESR_RSLT2_VL, ESR_RSLT3_VL, ESR_RSLT4_VL, ESR_USE_YN ) VALUES (";
			sql += " ?, ";
			sql += " ?, ";
			sql += " ?, ";
			sql += " ?, ";
			sql += " ?, ";
			sql += " ?, ";
			sql += " ?, ";
			sql += "'Y') ";


			argStmtExec.executeUpdate(sql);

		} catch (Exception e) {

			throw new FuncException(e.toString(), sql);
		}

		return sql;
	}
%>
