<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%!
	public String func_ubT_Rece_XML_COM_SUIN_003(Statement argStmtExec, HashMap argHtMethod) throws Exception {

		String sql = "";
		String sql2 = "";
		String sql_disp = "";

		try {

			String RECE_SEQ = (String) argHtMethod.get("RECE_SEQ");
			String RECE_DT = (String) argHtMethod.get("RECE_DT");
			String OCCU_KD = (String) argHtMethod.get("OCCU_KD");
			String RETURN_PR = (String) argHtMethod.get("RETURN_PR");
			String SRECE_SEQ = (String) argHtMethod.get("SRECE_SEQ");
			String USER_ID = (String) argHtMethod.get("USER_ID");
			String SRECE_NO = (String) argHtMethod.get("SRECE_NO");

			//
			if(RECE_SEQ == null) { RECE_SEQ = ""; }
			if(RECE_DT == null) { RECE_DT = ""; }
			if(OCCU_KD == null) { OCCU_KD = ""; }
			if(RETURN_PR == null) { RETURN_PR = ""; }
			if(SRECE_SEQ == null) { SRECE_SEQ = ""; }
			if(USER_ID == null) { USER_ID = ""; }
			if(SRECE_NO == null) { SRECE_NO = ""; }

			//
			RECE_SEQ = CTr.Replace(RECE_SEQ, "'", "''");
			RECE_DT = CTr.Replace(RECE_DT, "'", "''");
			OCCU_KD = CTr.Replace(OCCU_KD, "'", "''");
			RETURN_PR = CTr.Replace(RETURN_PR, "'", "''");
			SRECE_SEQ = CTr.Replace(SRECE_SEQ, "'", "''");
			USER_ID = CTr.Replace(USER_ID, "'", "''");
			SRECE_NO = CTr.Replace(SRECE_NO, "'", "''");

			sql = "INSERT INTO RT_RECE_MEDICHK ( RRM_RECE_NO ,RRM_RECE_SEQ ,RRM_RECE_DT ,RRM_OCCU_KD ,RRM_CUST_NO ,RRM_CUST_NM ,RRM_EXAM_CD ,RRM_CHARGE_PR ,RRM_RETURN_PR ,RRM_RETURN_RECE_SEQ ,RRM_RECE_PR ,RRM_PAY_KD ,RRM_INPUT_ID ,RRM_INPUT_DTT ,RRM_MODI_ID ,RRM_MODI_DTT )";
			sql += " SELECT ";
			sql += "  RRM_RECE_NO";
			sql += ", '" + RECE_SEQ + "'";
			sql += ", '" + RECE_DT + "'";
			sql += ", '" + OCCU_KD + "'";
			sql += ", RRM_CUST_NO";
			sql += ", RRM_CUST_NM";
			sql += ", RRM_EXAM_CD";
			sql += ", 0";
			sql += ", '" + RETURN_PR + "'";
			sql += ", '" + SRECE_SEQ + "'";
			sql += ", 0";
			sql += ", RRM_PAY_KD";
			sql += ", '" + USER_ID + "'";
			sql += ", SYSDATE";
			sql += ", '" + USER_ID + "'";
			sql += ", SYSDATE";
			sql += " FROM RT_RECE_MEDICHK";
			sql += " WHERE RRM_RECE_NO = '" + SRECE_NO  + "'";
			sql += " AND RRM_RECE_SEQ = '" + SRECE_SEQ + "'";

			argStmtExec.executeUpdate(sql);

		} catch (Exception e) {

			throw new FuncException(e.toString(), sql);
		}

		return sql;
	}
%>
