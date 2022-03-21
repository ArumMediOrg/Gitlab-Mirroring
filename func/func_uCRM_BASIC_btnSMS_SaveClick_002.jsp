<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%!
	public String func_uCRM_BASIC_btnSMS_SaveClick_002(Statement argStmtExec, HashMap argHtMethod) throws Exception {

		String sql = "";
		String sql2 = "";
		String sql_disp = "";

		try {

			String SMS_Code = (String) argHtMethod.get("SMS_Code");
			String SEND_MSG = (String) argHtMethod.get("SEND_MSG");
			String INPUT_ID = (String) argHtMethod.get("INPUT_ID");
			String CheckBox1 = (String) argHtMethod.get("CheckBox1");

			//
			if(SMS_Code == null) { SMS_Code = ""; }
			if(SEND_MSG == null) { SEND_MSG = ""; }
			if(INPUT_ID == null) { INPUT_ID = ""; }
			if(CheckBox1 == null) { CheckBox1 = ""; }

			//
			SMS_Code = CTr.Replace(SMS_Code, "'", "''");
			SEND_MSG = CTr.Replace(SEND_MSG, "'", "''");
			INPUT_ID = CTr.Replace(INPUT_ID, "'", "''");
			CheckBox1 = CTr.Replace(CheckBox1, "'", "''");

			sql = "Update CR_SMS_AUTO_SET      ";
			sql += " Set CSA_SEND_MSG = '" + SEND_MSG + "'";
			sql += "  ,  CSA_MODI_ID  = '" + INPUT_ID + "'";
			sql += "  ,  CSA_MODI_DTT  = SYSDATE  ";
			
			if(CheckBox1.equals("1")) {
				sql += "  ,  CSA_USE_YN = 'N'  ";
			} else {
				sql += "  ,  CSA_USE_YN = 'Y'  ";
			}
			
			sql += " Where CSA_GUID_KD = '" + SMS_Code + "'";

			argStmtExec.executeUpdate(sql);

		} catch (Exception e) {

			throw new FuncException(e.toString(), sql);
		}

		return sql;
	}
%>
