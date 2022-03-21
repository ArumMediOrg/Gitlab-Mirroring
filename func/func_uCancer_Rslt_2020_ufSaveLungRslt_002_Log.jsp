<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%!
	public String func_uCancer_Rslt_2020_ufSaveLungRslt_002_Log(Statement argStmtExec, HashMap argHtMethod) throws Exception {

		String sql = "";
		String sql2 = "";
		String sql_disp = "";

		Connection connect = argStmtExec.getConnection();
		CallableStatement CallStmtExec = null;

		try {
			String SEXAM_DT = (String) argHtMethod.get("SEXAM_DT");
			String SEXAM_SQ = (String) argHtMethod.get("SEXAM_SQ");
			String SSQLADD = (String) argHtMethod.get("SSQLADD");
			String SUSER = (String) argHtMethod.get("SUSER");
			String SUSER_IP = (String) argHtMethod.get("SUSER_IP");

			//

			if(SEXAM_DT == null) { SEXAM_DT = ""; }
			if(SEXAM_SQ == null) { SEXAM_SQ = ""; }
			if(SSQLADD == null) { SSQLADD = ""; }
			if(SUSER == null) { SUSER = ""; }
			if(SUSER_IP == null) { SUSER_IP = ""; }

			//

			sql = " Insert Into ET_CANCER_LUNG_LOG ";
			sql += " (EXAM_DT, EXAM_SQ, SQL, ID, DTT, IP) ";
			sql += " VALUES ";
			sql += " (?, ?, ?, ?, SYSDATE, ?) ";


			CallStmtExec = connect.prepareCall(sql);

			CallStmtExec.setString(1, SEXAM_DT);
			CallStmtExec.setString(2, SEXAM_SQ);
			CallStmtExec.setString(3, SSQLADD);
			CallStmtExec.setString(4, SUSER);
			CallStmtExec.setString(5, SUSER_IP);


			CallStmtExec.executeUpdate();

		} catch (Exception e) {

			throw new FuncException(e.toString(), sql);
		}

		return sql;
	}
%>
