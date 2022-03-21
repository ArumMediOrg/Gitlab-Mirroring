<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%!
	public String func_UConfig_UP_GerSetting_010(Statement argStmtExec, HashMap argHtMethod) throws Exception {

		String sql = "";
		String sql2 = "";
		String sql_disp = "";

		try {

			String COMPORT = (String) argHtMethod.get("COMPORT");
			String TELSPD = (String) argHtMethod.get("TELSPD");
			String VAN_NM = (String) argHtMethod.get("VAN_NM");
			String DANNO = (String) argHtMethod.get("DANNO");
			String HOSP_NO = (String) argHtMethod.get("HOSP_NO");

			//
			if(COMPORT == null) { COMPORT = ""; }
			if(TELSPD == null) { TELSPD = ""; }
			if(VAN_NM == null) { VAN_NM = ""; }
			if(DANNO == null) { DANNO = ""; }
			if(HOSP_NO == null) { HOSP_NO = ""; }

			//
			COMPORT = CTr.Replace(COMPORT, "'", "''");
			TELSPD = CTr.Replace(TELSPD, "'", "''");
			VAN_NM = CTr.Replace(VAN_NM, "'", "''");
			DANNO = CTr.Replace(DANNO, "'", "''");
			HOSP_NO = CTr.Replace(HOSP_NO, "'", "''");

			sql = "UPDATE IT_HOSPITAL SET ";
			sql += "  IHL_COMPORT = '" + COMPORT + "'";
			sql += ", IHL_TELSPD = '" + TELSPD + "'";
			sql += ", IHL_VAN_NM = '" + VAN_NM + "'";
			sql += ", IHL_DANNO = '" + DANNO + "'";
			sql += " WHERE IHL_HOSP_NO = '" + HOSP_NO + "'";

			argStmtExec.executeUpdate(sql);

		} catch (Exception e) {

			throw new FuncException(e.toString(), sql);
		}

		return sql;
	}
%>
