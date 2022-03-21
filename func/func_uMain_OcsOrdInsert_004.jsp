<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%!
	public String func_uMain_OcsOrdInsert_004(Statement argStmtExec, HashMap argHtMethod) throws Exception {

		String sql = "";
		String sql2 = "";
		String sql_disp = "";

		Connection connect = argStmtExec.getConnection();
		CallableStatement CallStmtExec = null;

		try {
			String EXAM_DT = (String) argHtMethod.get("EXAM_DT");
			String EXAM_SQ = (String) argHtMethod.get("EXAM_SQ");
			String OCS_CD = (String) argHtMethod.get("OCS_CD");
			String OCSC_SNO = (String) argHtMethod.get("OCSC_SNO");
			String SUCS_YN = (String) argHtMethod.get("SUCS_YN");

			//
			if(EXAM_DT == null) { EXAM_DT = ""; }
			if(EXAM_SQ == null) { EXAM_SQ = ""; }
			if(OCS_CD == null) { OCS_CD = ""; }
			if(OCSC_SNO == null) { OCSC_SNO = ""; }
			if(SUCS_YN == null) { SUCS_YN = ""; }

			//

			sql = " Insert Into ET_RSLT_ITEM_LOG ";
			sql += " (ERL_EXAM_DT, ERL_EXAM_SQ, ERL_OCS_CD, ERL_OCSC_SNO, ERL_INPT_DTT, ERL_EXAM_CD) ";
			sql += " Values ";
			sql += " (?, ?, ?, ?, SYSDATE, ?) ";

			CallStmtExec = connect.prepareCall(sql);

			CallStmtExec.setString(1, EXAM_DT);
			CallStmtExec.setString(2, EXAM_SQ);
			CallStmtExec.setString(3, OCS_CD);
			CallStmtExec.setString(4, OCSC_SNO);
			CallStmtExec.setString(5, SUCS_YN);

			CallStmtExec.executeUpdate();

		} catch (Exception e) {

			throw new FuncException(e.toString(), sql);
		}

		return sql;
	}
%>
