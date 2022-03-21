<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%!
	public String func_uFM_AcptComm_GF_SmsDelete_001(Statement argStmtExec, HashMap argHtMethod) throws Exception {

		String sql = "";
		String sql2 = "";
		String sql_disp = "";

		try {

			String SMS_NO = (String) argHtMethod.get("SMS_NO");
			String SMS_UUID = (String) argHtMethod.get("SMS_UUID");
			String SMS_KD = (String) argHtMethod.get("SMS_KD");

			//
			if(SMS_NO == null) { SMS_NO = ""; }
			if(SMS_UUID == null) { SMS_UUID = ""; }
			if(SMS_KD == null) { SMS_KD = ""; }
			//

			SMS_NO = CTr.Replace(SMS_NO, "'", "''");
			SMS_UUID = CTr.Replace(SMS_UUID, "'", "''");
			SMS_KD = CTr.Replace(SMS_KD, "'", "''");

			sql = " DELETE RT_SMS_LOG ";
			sql += " WHERE RSL_SMS_NO = '" + SMS_NO + "' ";

			if (!SMS_UUID.equals("")){
				sql += " AND RSL_SMS_UUID = '" + SMS_UUID + "' ";
			}

			if (!SMS_KD.equals("")){
				sql += " AND RSL_SMS_KD = '" + SMS_KD + "' ";
			}

			argStmtExec.executeUpdate(sql);

		} catch (Exception e) {

			throw new FuncException(e.toString(), sql);
		}

		return sql;
	}
%>
