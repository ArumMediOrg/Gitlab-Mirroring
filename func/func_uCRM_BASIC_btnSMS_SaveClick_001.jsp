<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%!
	public String func_uCRM_BASIC_btnSMS_SaveClick_001(Statement argStmtExec, HashMap argHtMethod) throws Exception {

		String sql = "";
		String sql2 = "";
		String sql_disp = "";

		try {

			String SMS_CODE = (String) argHtMethod.get("SMS_CODE");
			String SEND_MSG = (String) argHtMethod.get("SEND_MSG");
			String INPUT_ID = (String) argHtMethod.get("INPUT_ID");

			//
			if(SMS_CODE == null) { SMS_CODE = ""; }
			if(SEND_MSG == null) { SEND_MSG = ""; }
			if(INPUT_ID == null) { INPUT_ID = ""; }

			//
			SMS_CODE = CTr.Replace(SMS_CODE, "'", "''");
			SEND_MSG = CTr.Replace(SEND_MSG, "'", "''");
			INPUT_ID = CTr.Replace(INPUT_ID, "'", "''");

			sql = "INSERT INTO CR_SMS_AUTO_SET     ";
			sql += " (CSA_GUID_KD, CSA_GUID_NM, CSA_SEND_KD, CSA_SEND_MSG, CSA_USE_YN, ";
			sql += "  CSA_INPUT_ID, CSA_INPUT_DTT ) VALUES (";
			sql += "  '" + SMS_CODE + "'";
			sql += ", '문구'";
			sql += ", '7'";
			sql += ", '" + SEND_MSG + "'";
			sql += ", 'Y'";
			sql += ", '" + INPUT_ID + "'";
			sql += ", SYSDATE";
			sql += ")";

			argStmtExec.executeUpdate(sql);

		} catch (Exception e) {

			throw new FuncException(e.toString(), sql);
		}

		return sql;
	}
%>
