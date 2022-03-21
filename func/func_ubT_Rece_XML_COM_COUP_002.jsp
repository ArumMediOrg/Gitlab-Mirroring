<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%!
	public String func_ubT_Rece_XML_COM_COUP_002(Statement argStmtExec, HashMap argHtMethod) throws Exception {

		String sql = "";
		String sql2 = "";
		String sql_disp = "";

		try {

			String RECE_KD = (String) argHtMethod.get("RECE_KD");
			String USER_ID = (String) argHtMethod.get("USER_ID");
			String RECE_NO = (String) argHtMethod.get("RECE_NO");

			//
			if(RECE_KD == null) { RECE_KD = ""; }
			if(USER_ID == null) { USER_ID = ""; }
			if(RECE_NO == null) { RECE_NO = ""; }

			//
			RECE_KD = CTr.Replace(RECE_KD, "'", "''");
			USER_ID = CTr.Replace(USER_ID, "'", "''");
			RECE_NO = CTr.Replace(RECE_NO, "'", "''");

			sql = "UPDATE BT_BILL_COMP SET ";
			sql += "  BBC_RECE_KD = '" + RECE_KD + "'";
			sql += ", BBC_MODI_DTT = SYSDATE";
			sql += ", BBC_MODI_ID = '" + USER_ID + "'";
			sql += " WHERE BBC_RECE_NO = '" + RECE_NO + "'";

			argStmtExec.executeUpdate(sql);

		} catch (Exception e) {

			throw new FuncException(e.toString(), sql);
		}

		return sql;
	}
%>
