<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%!
	public String func_uGen_Frst_Panj_uAutoPanBrain_015(Statement argStmtExec, HashMap argHtMethod) throws Exception {

		String sql = "";
		String sql2 = "";
		String sql_disp = "";

		Connection connect = argStmtExec.getConnection();
		CallableStatement CallStmtExec = null;

		try {

			String EXAM_DT = (String) argHtMethod.get("EXAM_DT");
			String EXAM_SQ = (String) argHtMethod.get("EXAM_SQ");
			String EXAM_KD = (String) argHtMethod.get("EXAM_KD");
			String ETC_KD = (String) argHtMethod.get("ETC_KD");
			String ETC1_CD = (String) argHtMethod.get("ETC1_CD");
			String ETC2_CD = (String) argHtMethod.get("ETC2_CD");
			String ETC3_CD = (String) argHtMethod.get("ETC3_CD");
			String ETC4_CD = (String) argHtMethod.get("ETC4_CD");

			//

			if(EXAM_DT == null) { EXAM_DT = ""; }
			if(EXAM_SQ == null) { EXAM_SQ = ""; }
			if(EXAM_KD == null) { EXAM_KD = ""; }
			if(ETC_KD == null) { ETC_KD = ""; }
			if(ETC1_CD == null) { ETC1_CD = ""; }
			if(ETC2_CD == null) { ETC2_CD = ""; }
			if(ETC3_CD == null) { ETC3_CD = ""; }
			if(ETC4_CD == null) { ETC4_CD = ""; }

			//

			sql += " INSERT INTO PT_DANR_PANJUNG ";
			sql += " (PDP_EXAM_DT, PDP_EXAM_SQ, PDP_EXAM_KD ";
			sql += " ,PDP_ETC_KD , PDP_ETC1_CD, PDP_ETC2_CD ";
			sql += " ,PDP_ETC3_CD, PDP_ETC4_CD) ";
			sql += " VALUES ";
			sql += " (?, ?, ? ";
			sql += " ,?, ?, ? ";
			sql += " ,?, ?) ";


			CallStmtExec = connect.prepareCall(sql);

			CallStmtExec.setString(1, EXAM_DT);
			CallStmtExec.setString(2, EXAM_SQ);
			CallStmtExec.setString(3, EXAM_KD);
			CallStmtExec.setString(4, ETC_KD);
			CallStmtExec.setString(5, ETC1_CD);
			CallStmtExec.setString(6, ETC2_CD);
			CallStmtExec.setString(7, ETC3_CD);
			CallStmtExec.setString(8, ETC4_CD);

			CallStmtExec.executeUpdate();

		} catch (Exception e) {

			throw new FuncException(e.toString(), sql);
		}

		return sql;
	}
%>
