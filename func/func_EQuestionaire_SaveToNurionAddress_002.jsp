<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%!
	public String func_EQuestionaire_SaveToNurionAddress_002(Statement argStmtExec, HashMap argHtMethod) throws Exception {

		String sql = "";
		String sql2 = "";
		String sql_disp = "";

		try {

			String SZPCD = (String) argHtMethod.get("SZPCD");
			String SZPAR = (String) argHtMethod.get("SZPAR");
			String SRDAR = (String) argHtMethod.get("SRDAR");
			String SBDNO = (String) argHtMethod.get("SBDNO");
			String SDATE = (String) argHtMethod.get("SDATE");
			String SCTNO = (String) argHtMethod.get("SCTNO");

			//
			if(SZPCD == null) { SZPCD = ""; }
			if(SZPAR == null) { SZPAR = ""; }
			if(SRDAR == null) { SRDAR = ""; }
			if(SBDNO == null) { SBDNO = ""; }
			if(SDATE == null) { SDATE = ""; }
			if(SCTNO == null) { SCTNO = ""; }

			//
			SZPCD = CTr.Replace(SZPCD, "'", "''");
			SZPAR = CTr.Replace(SZPAR, "'", "''");
			SRDAR = CTr.Replace(SRDAR, "'", "''");
			SBDNO = CTr.Replace(SBDNO, "'", "''");
			SDATE = CTr.Replace(SDATE, "'", "''");
			SCTNO = CTr.Replace(SCTNO, "'", "''");

			sql = "UPDATE ET_EXAM_ACPT SET ";
			sql += "  EEA_ZIP_CD = '" + SZPCD + "'";
			sql += ", EEA_ZIP_AR = '" + SZPAR + "'";
			sql += ", EEA_ROAD_AR = '" + SRDAR + "'";
			sql += ", EEA_BLDG_NO = '" + SBDNO + "'";
			sql += ", EEA_SEND_CD = '01'";
			sql += " WHERE EEA_EXAM_DT = '" + SDATE + "'";
			sql += " AND EEA_CUST_NO = '" + SCTNO + "'";

			argStmtExec.executeUpdate(sql);

		} catch (Exception e) {

			throw new FuncException(e.toString(), sql);
		}

		return sql;
	}
%>
