<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%!
	public String func_uCancer_Rslt_2020_ufCancerLoadResult_011(Statement argStmtExec, HashMap argHtMethod) throws Exception {

		String sql = "";
		String sql2 = "";
		String sql_disp = "";


		try {

			String SRSLTCD = (String) argHtMethod.get("SRSLTCD");
			String SRSLT_NM = (String) argHtMethod.get("SRSLT_NM");
			String SEXAMKD = (String) argHtMethod.get("SEXAMKD");
			String SRSLT1_VL = (String) argHtMethod.get("SRSLT1_VL");
			String SRSLT2_VL = (String) argHtMethod.get("SRSLT2_VL");
			String SRSLT3_VL = (String) argHtMethod.get("SRSLT3_VL");
			String SRSLT4_VL = (String) argHtMethod.get("SRSLT4_VL");

			//
			if(SRSLTCD == null) { SRSLTCD = ""; }
			if(SRSLT_NM == null) { SRSLT_NM = ""; }
			if(SEXAMKD == null) { SEXAMKD = ""; }
			if(SRSLT1_VL == null) { SRSLT1_VL = ""; }
			if(SRSLT2_VL == null) { SRSLT2_VL = ""; }
			if(SRSLT3_VL == null) { SRSLT3_VL = ""; }
			if(SRSLT4_VL == null) { SRSLT4_VL = ""; }

			//
			SRSLTCD = CTr.Replace(SRSLTCD, "'", "''");
			SRSLT_NM = CTr.Replace(SRSLT_NM, "'", "''");
			SEXAMKD = CTr.Replace(SEXAMKD, "'", "''");
			SRSLT1_VL = CTr.Replace(SRSLT1_VL, "'", "''");
			SRSLT2_VL = CTr.Replace(SRSLT2_VL, "'", "''");
			SRSLT3_VL = CTr.Replace(SRSLT3_VL, "'", "''");
			SRSLT4_VL = CTr.Replace(SRSLT4_VL, "'", "''");

			sql =  "  UPDATE ET_SAVED_RSLT SET ";
			sql += " ESR_RSLT_NM = '" + SRSLT_NM + "'";
			sql += ", ESR_EXAM_KD = '" + SEXAMKD + "'";
			sql += ", ESR_RSLT1_VL = '" + SRSLT1_VL + "'";
			sql += ", ESR_RSLT2_VL = '" + SRSLT2_VL + "'";
			sql += ", ESR_RSLT3_VL = '" + SRSLT3_VL + "'";
			sql += ", ESR_RSLT4_VL = '" + SRSLT4_VL + "'";
			sql += "  WHERE ESR_RSLT_CD = '" + SRSLTCD + "'";

			argStmtExec.executeUpdate(sql);

		} catch (Exception e) {

			throw new FuncException(e.toString(), sql);
		}

		return sql;
	}
%>
