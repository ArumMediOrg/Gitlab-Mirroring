<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%!
	public String func_uSPSUGA_Set_Insert_005(Statement argStmtExec, HashMap argHtMethod) throws Exception {

		String sql = "";
		String sql2 = "";
		String sql_disp = "";

		Connection connect = argStmtExec.getConnection();
		CallableStatement CallStmtExec = null;

		try {

			String EXAM_DT = (String) argHtMethod.get("EXAM_DT");
			String CODE_CD = (String) argHtMethod.get("CODE_CD");
			String EXAM_PR = (String) argHtMethod.get("EXAM_PR");

			//
			if(EXAM_DT == null) { EXAM_DT = ""; }
			if(CODE_CD == null) { CODE_CD = ""; }
			if(EXAM_PR == null) { EXAM_PR = ""; }

			//
			sql = " Update IT_ITEM_PRICE ";
			sql += " Set IIP_SBSG_ORG = ? ";
			sql += " Where IIP_ITEM_CD = ? ";
			sql += " And IIP_APLY_DT = ? ";

			CallStmtExec = connect.prepareCall(sql);

			CallStmtExec.setString(1, EXAM_PR);
			CallStmtExec.setString(2, CODE_CD);
			CallStmtExec.setString(3, EXAM_DT);


			CallStmtExec.executeUpdate();

		} catch (Exception e) {

			throw new FuncException(e.toString(), sql);
		}

		return sql;
	}
%>
