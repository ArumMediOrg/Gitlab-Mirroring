<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%!
	public String func_uSPSUGA_Set_Insert_007(Statement argStmtExec, HashMap argHtMethod) throws Exception {

		String sql = "";
		String sql2 = "";
		String sql_disp = "";

		Connection connect = argStmtExec.getConnection();
		CallableStatement CallStmtExec = null;

		try {
			String EXAM_DT = (String) argHtMethod.get("EXAM_DT");
			String CODE_CD = (String) argHtMethod.get("CODE_CD");
			String PRSN_PR = (String) argHtMethod.get("PRSN_PR");
			String SBGB_PR = (String) argHtMethod.get("SBGB_PR");

			//
			if(EXAM_DT == null) { EXAM_DT = ""; }
			if(CODE_CD == null) { CODE_CD = ""; }
			if(PRSN_PR == null) { PRSN_PR = ""; }
			if(SBGB_PR == null) { SBGB_PR = ""; }

			//
			sql = " Update IT_ITEM_PRICE ";
			sql += " Set IIP_PRSN_PR = ?, ";
			sql += " 	IIP_SBGB_PR = ? ";
			sql += " Where IIP_ITEM_CD = ? ";
			sql += " And IIP_APLY_DT = ? ";

			CallStmtExec = connect.prepareCall(sql);

			CallStmtExec.setString(1, PRSN_PR);
			CallStmtExec.setString(2, SBGB_PR);
			CallStmtExec.setString(3, CODE_CD);
			CallStmtExec.setString(4, EXAM_DT);

			CallStmtExec.executeUpdate();

		} catch (Exception e) {

			throw new FuncException(e.toString(), sql);
		}

		return sql;
	}
%>
