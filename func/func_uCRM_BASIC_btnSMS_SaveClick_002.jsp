<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%!
	public String func_uCRM_BASIC_btnSMS_SaveClick_002(Statement argStmtExec, HashMap argHtMethod) throws Exception {

		String sql = "";
		String sql2 = "";
		String sql_disp = "";

		try {

			String SMS_CODE = (String) argHtMethod.get("SMS_CODE");
			String SEND_MSG = (String) argHtMethod.get("SEND_MSG");
			String INPUT_ID = (String) argHtMethod.get("INPUT_ID");
			String CHECKBOX1 = (String) argHtMethod.get("CHECKBOX1");

			//
			if(SMS_CODE == null) { SMS_CODE = ""; }
			if(SEND_MSG == null) { SEND_MSG = ""; }
			if(INPUT_ID == null) { INPUT_ID = ""; }
			if(CHECKBOX1 == null) { CHECKBOX1 = ""; }

			//
			SMS_CODE = CTr.Replace(SMS_CODE, "'", "''");
			SEND_MSG = CTr.Replace(SEND_MSG, "'", "''");
			INPUT_ID = CTr.Replace(INPUT_ID, "'", "''");
			CHECKBOX1 = CTr.Replace(CHECKBOX1, "'", "''");

			sql = " UPDATE CR_SMS_AUTO_SET SET";
			sql += "  CSA_SEND_MSG = '" + SEND_MSG + "'";
			sql += ", CSA_MODI_ID = '" + INPUT_ID + "'";
			sql += ", CSA_MODI_DTT = SYSDATE  ";

			if(CHECKBOX1.equals("1")) {
				sql += "  ,  CSA_USE_YN = 'N'  ";
			} else {
				sql += "  ,  CSA_USE_YN = 'Y'  ";
			}

			sql += " WHERE CSA_GUID_KD = '" + SMS_CODE + "'";

			argStmtExec.executeUpdate(sql);

		} catch (Exception e) {

			throw new FuncException(e.toString(), sql);
		}

		return sql;
	}
%>
