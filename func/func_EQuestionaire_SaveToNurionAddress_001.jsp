<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%!
	public String func_EQuestionaire_SaveToNurionAddress_001(Statement argStmtExec, HashMap argHtMethod) throws Exception {

		String sql = "";
		String sql2 = "";
		String sql_disp = "";

		try {

			String SZPCD = (String) argHtMethod.get("SZPCD");
			String SZPAR = (String) argHtMethod.get("SZPAR");
			String SRDAR = (String) argHtMethod.get("SRDAR");
			String SBDNO = (String) argHtMethod.get("SBDNO");
			String SPSID = (String) argHtMethod.get("SPSID");
			String SPSNM = (String) argHtMethod.get("SPSNM");

			//
			if(SZPCD == null) { SZPCD = ""; }
			if(SZPAR == null) { SZPAR = ""; }
			if(SRDAR == null) { SRDAR = ""; }
			if(SBDNO == null) { SBDNO = ""; }
			if(SPSID == null) { SPSID = ""; }
			if(SPSNM == null) { SPSNM = ""; }

			//
			SZPCD = CTr.Replace(SZPCD, "'", "''");
			SZPAR = CTr.Replace(SZPAR, "'", "''");
			SRDAR = CTr.Replace(SRDAR, "'", "''");
			SBDNO = CTr.Replace(SBDNO, "'", "''");
			SPSID = CTr.Replace(SPSID, "'", "''");
			SPSNM = CTr.Replace(SPSNM, "'", "''");

			sql = "UPDATE IT_CUSTOMER SET ";
			sql += "  ICR_ZIP_CD = '" + SZPCD + "'";
			sql += ", ICR_ZIP_AR = '" + SZPAR + "'";
			sql += ", ICR_ROAD_AR = '" + SRDAR + "'";
			sql += ", ICR_BLDG_NO = '" + SBDNO + "'";
			sql += " WHERE ICR_PENL_ID = '" + SPSID + "'";
			sql += " AND ICR_PENL_NM = '" + SPSNM + "'";

			argStmtExec.executeUpdate(sql);

		} catch (Exception e) {

			throw new FuncException(e.toString(), sql);
		}

		return sql;
	}
%>
