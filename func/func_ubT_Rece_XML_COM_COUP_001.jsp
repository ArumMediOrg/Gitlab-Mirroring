<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%!
	public String func_ubT_Rece_XML_COM_COUP_001(Statement argStmtExec, HashMap argHtMethod) throws Exception {

		String sql = "";
		String sql2 = "";
		String sql_disp = "";

		try {

			String RECE_NO = (String) argHtMethod.get("RECE_NO");
			String RECE_KD = (String) argHtMethod.get("RECE_KD");
			String BUSI_YR = (String) argHtMethod.get("BUSI_YR");
			String COMP_CD = (String) argHtMethod.get("COMP_CD");
			String BILL_DT = (String) argHtMethod.get("BILL_DT");
			String BILL_NO = (String) argHtMethod.get("BILL_NO");

			//
			if(RECE_NO == null) { RECE_NO = ""; }
			if(RECE_KD == null) { RECE_KD = ""; }
			if(BUSI_YR == null) { BUSI_YR = ""; }
			if(COMP_CD == null) { COMP_CD = ""; }
			if(BILL_DT == null) { BILL_DT = ""; }
			if(BILL_NO == null) { BILL_NO = ""; }

			//
			RECE_NO = CTr.Replace(RECE_NO, "'", "''");
			RECE_KD = CTr.Replace(RECE_KD, "'", "''");
			BUSI_YR = CTr.Replace(BUSI_YR, "'", "''");
			COMP_CD = CTr.Replace(COMP_CD, "'", "''");
			BILL_DT = CTr.Replace(BILL_DT, "'", "''");
			BILL_NO = CTr.Replace(BILL_NO, "'", "''");

			sql = "UPDATE BT_BILL_COMP SET ";
			sql += "  BBC_RECE_NO = '" + RECE_NO + "'";
			sql += ", BBC_RECE_KD = '" + RECE_KD + "'";
			sql += ", BBC_MODI_DTT = SYSDATE";
			sql += " WHERE BBC_BUSI_YR = '" + BUSI_YR + "'";
			sql += " AND BBC_COMP_CD = '" + COMP_CD + "'";
			sql += " AND BBC_BILL_DT = '" + BILL_DT + "'";
			sql += " AND BBC_BILL_NO = '" + BILL_NO + "'";

			argStmtExec.executeUpdate(sql);

		} catch (Exception e) {

			throw new FuncException(e.toString(), sql);
		}

		return sql;
	}
%>
