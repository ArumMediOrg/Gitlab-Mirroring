<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%!
	public String func_uRsvnUpdate_ehrRsvnUpdate_003(Statement argStmtExec, HashMap argHtMethod) throws Exception {

		String sql = "";
		String sql2 = "";
		String sql_disp = "";

		Connection connect = argStmtExec.getConnection();
		CallableStatement CallStmtExec = null;

		try {
			String OCS_CD = (String) argHtMethod.get("OCS_CD");
			String OCSC_SNO = (String) argHtMethod.get("OCSC_SNO");
			String EXAM_TM = (String) argHtMethod.get("EXAM_TM");
			String RSVN_NO  = (String) argHtMethod.get("RSVN_NO");
			String RSVN_DT = (String) argHtMethod.get("RSVN_DT");
			String EHR_DT = (String) argHtMethod.get("EHR_DT");
			//

			if(OCS_CD == null) { OCS_CD = ""; }
			if(OCSC_SNO == null) { OCSC_SNO = ""; }
			if(EXAM_TM == null) { EXAM_TM = ""; }
			if(RSVN_NO == null) { RSVN_NO = ""; }
			if(RSVN_DT == null) { RSVN_DT = ""; }
			if(EHR_DT == null) { EHR_DT = ""; }

			//

			sql = " UPDATE RT_RSVT_ITEM ";
			sql += " SET RRI_OCSC_SNO = ?, ";
			sql += " 	RRI_EXAM_TM  = ?,  ";
			sql += " 	RRI_RSVN_DT = ?, ";
			sql += " 	RRI_EHR_DT = ? ";
			sql += " WHERE RRI_OCS_CD = ?  ";
			sql += " AND RRI_RSVN_NO = ?  ";


			CallStmtExec = connect.prepareCall(sql);

			CallStmtExec.setString(1, OCSC_SNO);
			CallStmtExec.setString(2, EXAM_TM);
			CallStmtExec.setString(3, RSVN_DT);
			CallStmtExec.setString(4, EHR_DT);
			CallStmtExec.setString(5, OCS_CD);
			CallStmtExec.setString(6, RSVN_NO);

			CallStmtExec.executeUpdate();

		} catch (Exception e) {

			throw new FuncException(e.toString(), sql);
		}

		return sql;
	}
%>
