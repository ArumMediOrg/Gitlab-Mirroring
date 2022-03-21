<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%!
	public String func_uSPSUGA_Set_Insert_006(Statement argStmtExec, HashMap argHtMethod) throws Exception {

		String sql = "";
		String sql2 = "";
		String sql_disp = "";

		Connection connect = argStmtExec.getConnection();
		CallableStatement CallStmtExec = null;

		try {

			String EXAM_DT = (String) argHtMethod.get("EXAM_DT");
			String CODE_CD = (String) argHtMethod.get("CODE_CD");
			String SBSG_PR = (String) argHtMethod.get("SBSG_PR");
			String SBGB_PR = (String) argHtMethod.get("SBGB_PR");
			String TGSG_PR = (String) argHtMethod.get("TGSG_PR");
			String PRSN_PR = (String) argHtMethod.get("PRSN_PR");

			//
			if(EXAM_DT == null) { EXAM_DT = ""; }
			if(CODE_CD == null) { CODE_CD = ""; }
			if(SBSG_PR == null) { SBSG_PR = ""; }
			if(SBGB_PR == null) { SBGB_PR = ""; }
			if(TGSG_PR == null) { TGSG_PR = ""; }
			if(PRSN_PR == null) { PRSN_PR = ""; }

			//
			sql = " Update IT_ITEM_PRICE ";
			sql += " Set IIP_SBSG_PR = ?, ";
			sql += " 	IIP_SBGB_PR = ?, ";
			sql += " 	IIP_TGSG_PR = ?, ";
			sql += " 	IIP_PRSN_PR = ? ";
			sql += " Where IIP_ITEM_CD = ? ";
			sql += " And IIP_APLY_DT = ? ";

			CallStmtExec = connect.prepareCall(sql);

			CallStmtExec.setString(1, SBSG_PR);
			CallStmtExec.setString(2, SBGB_PR);
			CallStmtExec.setString(3, TGSG_PR);
			CallStmtExec.setString(4, PRSN_PR);
			CallStmtExec.setString(5, CODE_CD);
			CallStmtExec.setString(6, EXAM_DT);


			CallStmtExec.executeUpdate();

		} catch (Exception e) {

			throw new FuncException(e.toString(), sql);
		}

		return sql;
	}
%>
