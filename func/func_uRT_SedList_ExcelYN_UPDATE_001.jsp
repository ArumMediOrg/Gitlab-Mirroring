<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%!
	public String func_uRT_SedList_ExcelYN_UPDATE_001(Statement argStmtExec, HashMap argHtMethod) throws Exception {

		String sql = "";
		String sql2 = "";
		String sql_disp = "";

		Connection connect = argStmtExec.getConnection();
		CallableStatement CallStmtExec = null;

		try {

			String EXAM_DT = (String) argHtMethod.get("EXAM_DT");
			String EXAM_SQ = (String) argHtMethod.get("EXAM_SQ");
			//
			if(EXAM_DT == null) { EXAM_DT = ""; }
			if(EXAM_SQ == null) { EXAM_SQ = ""; }

			//

			sql = " UPDATE PT_FIR_PANJUNG ";
			sql += " SET PFP_EXCEL_YN = 'Y' ";
			sql += " WHERE PFP_EXAM_DT  = ? ";
			sql += " 	AND PFP_EXAM_SQ  = ? ";


			CallStmtExec = connect.prepareCall(sql);

			CallStmtExec.setString(1, EXAM_DT);
			CallStmtExec.setString(2, EXAM_SQ);

			CallStmtExec.executeUpdate();

		} catch (Exception e) {

			throw new FuncException(e.toString(), sql);
		}

		return sql;
	}
%>
