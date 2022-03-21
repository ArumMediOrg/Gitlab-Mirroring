<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%!
	public String func_ubT_Rece_XML_COM_RSUP_001(Statement argStmtExec, HashMap argHtMethod) throws Exception {

		String sql = "";
		String sql2 = "";
		String sql_disp = "";

		try {

			String RECE_NO = (String) argHtMethod.get("RECE_NO");
			String RECE_KD = (String) argHtMethod.get("RECE_KD");
			String RSVN_NO = (String) argHtMethod.get("RSVN_NO");

			//
			if(RECE_NO == null) { RECE_NO = ""; }
			if(RECE_KD == null) { RECE_KD = ""; }
			if(RSVN_NO == null) { RSVN_NO = ""; }

			//
			RECE_NO = CTr.Replace(RECE_NO, "'", "''");
			RECE_KD = CTr.Replace(RECE_KD, "'", "''");
			RSVN_NO = CTr.Replace(RSVN_NO, "'", "''");

			sql = "UPDATE RT_RSVT SET ";
			sql += "  RRT_RECE_NO = '" + RECE_NO + "'";
			sql += ", RRT_RECE_KD = '" + RECE_KD + "'";
			sql += " WHERE RRT_RSVN_NO = '" + RSVN_NO + "'";

			argStmtExec.executeUpdate(sql);

		} catch (Exception e) {

			throw new FuncException(e.toString(), sql);
		}

		return sql;
	}
%>
