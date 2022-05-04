<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%!
	public String func_uCancer_Rslt_2020_ufCancerLoadResult_008(Statement argStmtExec, HashMap argHtMethod) throws Exception {

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

			sql = " INSERT INTO ET_SAVED_RSLT ";
			sql += "(ESR_RSLT_CD, ESR_RSLT_NM, ESR_EXAM_KD, ESR_RSLT1_VL, ESR_RSLT2_VL, ESR_RSLT3_VL, ESR_RSLT4_VL, ESR_USE_YN ) VALUES (";
			sql += "  '" + SRSLTCD + "'";
			sql += ",  '" + SRSLT_NM + "'";
			sql += ",  '" + SEXAMKD + "'";
			sql += ",  '" + SRSLT1_VL + "'";
			sql += ",  '" + SRSLT2_VL + "'";
			sql += ",  '" + SRSLT3_VL + "'";
			sql += ",  '" + SRSLT4_VL + "'";
			sql += ", 'Y') ";


			argStmtExec.executeUpdate(sql);

		} catch (Exception e) {

			throw new FuncException(e.toString(), sql);
		}

		return sql;
	}
%>
