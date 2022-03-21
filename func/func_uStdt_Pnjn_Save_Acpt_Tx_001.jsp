<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%!
	public String func_uStdt_Pnjn_Save_Acpt_Tx_001(Statement argStmtExec, HashMap argHtMethod) throws Exception {

		String sql = "";
		String sql2 = "";
		String sql_disp = "";

		Connection connect = argStmtExec.getConnection();
		CallableStatement CallStmtExec = null;

		try {

			String ACPTETC = (String) argHtMethod.get("ACPTETC");
			String EXAMDT = (String) argHtMethod.get("EXAMDT");
			String EXAMSQ = (String) argHtMethod.get("EXAMSQ");

			//

			if(ACPTETC == null) { ACPTETC = ""; }
			if(EXAMDT == null) { EXAMDT = ""; }
			if(EXAMSQ == null) { EXAMSQ = ""; }

			//
			sql += " UPDATE ET_EXAM_ACPT ";
			sql += " SET   EEA_ACPT_TX = ? ";
			sql += " WHERE EEA_EXAM_DT = ? ";
			sql += " AND   EEA_EXAM_SQ = ? ";

			CallStmtExec = connect.prepareCall(sql);

			CallStmtExec.setString(1, ACPTETC);
			CallStmtExec.setString(2, EXAMDT);
			CallStmtExec.setString(3, EXAMSQ);


			CallStmtExec.executeUpdate();

		} catch (Exception e) {

			throw new FuncException(e.toString(), sql);
		}

		return sql;
	}
%>
