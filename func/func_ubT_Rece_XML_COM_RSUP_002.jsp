<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%!
	public String func_ubT_Rece_XML_COM_RSUP_002(Statement argStmtExec, HashMap argHtMethod) throws Exception {

		String sql = "";
		String sql2 = "";
		String sql_disp = "";

		try {

			String RECE_KD = (String) argHtMethod.get("RECE_KD");
			String RECE_NO = (String) argHtMethod.get("RECE_NO");

			//
			if(RECE_KD == null) { RECE_KD = ""; }
			if(RECE_NO == null) { RECE_NO = ""; }

			//
			RECE_KD = CTr.Replace(RECE_KD, "'", "''");
			RECE_NO = CTr.Replace(RECE_NO, "'", "''");

			sql = "UPDATE RT_RSVT SET ";
			sql += "  RRT_RECE_KD = '" + RECE_KD + "'";
			sql += " WHERE RRT_RECE_NO = '" + RECE_NO + "'";

			argStmtExec.executeUpdate(sql);

		} catch (Exception e) {

			throw new FuncException(e.toString(), sql);
		}

		return sql;
	}
%>
