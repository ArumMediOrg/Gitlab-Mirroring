<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%!
	public String func_uFM_AcptComm_GF_SmsSave_001(Statement argStmtExec, HashMap argHtMethod) throws Exception {

		String sql = "";
		String sql2 = "";
		String sql_disp = "";

		Connection connect = argStmtExec.getConnection();
		CallableStatement CallStmtExec = null;

		try {
			String SMS_NO = (String) argHtMethod.get("SMS_NO");
			String SMS_CMID = (String) argHtMethod.get("SMS_CMID");
			String SMS_DTT = (String) argHtMethod.get("SMS_DTT");
			String SMS_UUID = (String) argHtMethod.get("SMS_UUID");
			String SMS_KD = (String) argHtMethod.get("SMS_KD");

			//
			if(SMS_NO == null) { SMS_NO = ""; }
			if(SMS_CMID == null) { SMS_CMID = ""; }
			if(SMS_DTT == null) { SMS_DTT = ""; }
			if(SMS_UUID == null) { SMS_UUID = ""; }
			if(SMS_KD == null) { SMS_KD = ""; }

			//

			if(SMS_KD.equals("I")){
				sql = " INSERT INTO RT_SMS_LOG (RSL_SMS_NO, RSL_SMS_CMID, RSL_SMS_DTT, RSL_SMS_UUID, RSL_SMS_KD) ";
				sql += " VALUES ( ";
				sql += " ?, ";
				sql += " ?, ";
				sql += " ?, ";
				sql += " ?, ";
				sql += " ?) ";

				CallStmtExec = connect.prepareCall(sql);

				CallStmtExec.setString(1,  SMS_NO);
				CallStmtExec.setString(2,  SMS_CMID);
				CallStmtExec.setString(3,  SMS_DTT);
				CallStmtExec.setString(4,  SMS_UUID);
				CallStmtExec.setString(5,  SMS_KD);

				CallStmtExec.executeUpdate();
			} else {
				sql += " UPDATE RT_SMS_LOG ";
				sql += " 	SET RSL_SMS_KD = ? ";
				sql += " WHERE RSL_SMS_NO = ? ";
				sql += " 	AND RSL_SMS_UUID= ?  ";

				CallStmtExec = connect.prepareCall(sql);

				CallStmtExec.setString(1,  SMS_KD);
				CallStmtExec.setString(2,  SMS_NO);
				CallStmtExec.setString(3,  SMS_UUID);

				CallStmtExec.executeUpdate();
			}



		} catch (Exception e) {

			throw new FuncException(e.toString(), sql);
		}

		return sql;
	}
%>
