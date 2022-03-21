<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%!
	public String func_uSPSUGA_Set_Insert_003(Statement argStmtExec, HashMap argHtMethod) throws Exception {

		String sql = "";
		String sql2 = "";
		String sql_disp = "";

		Connection connect = argStmtExec.getConnection();
		CallableStatement CallStmtExec = null;

		try {

			String EXAM_DT = (String) argHtMethod.get("EXAM_DT");
			String CODE_CD = (String) argHtMethod.get("CODE_CD");
			String HESG_PR = (String) argHtMethod.get("HESG_PR");
			String JCSG_PR = (String) argHtMethod.get("JCSG_PR");
			String GBSG_PR = (String) argHtMethod.get("GBSG_PR");
			String GASN_PR = (String) argHtMethod.get("GASN_PR");
			String STSG_PR = (String) argHtMethod.get("STSG_PR");

			//
			if(EXAM_DT == null) { EXAM_DT = ""; }
			if(CODE_CD == null) { CODE_CD = ""; }
			if(HESG_PR == null) { HESG_PR = ""; }
			if(JCSG_PR == null) { JCSG_PR = ""; }
			if(GBSG_PR == null) { GBSG_PR = ""; }
			if(GASN_PR == null) { GASN_PR = ""; }
			if(STSG_PR == null) { STSG_PR = ""; }

			//
			sql = " Update IT_ITEM_PRICE ";
			sql += " Set IIP_HESG_PR = ?, ";
			sql += " 	IIP_JCSG_PR = ?, ";
			sql += " 	IIP_GBSG_PR = ?, ";
			sql += " 	IIP_GASN_PR = ?, ";
			sql += " 	IIP_STSG_PR = ? ";
			sql += " Where IIP_APLY_DT = ? ";
			sql += " And IIP_ITEM_CD = ? ";

			CallStmtExec = connect.prepareCall(sql);

			CallStmtExec.setString(1, HESG_PR);
			CallStmtExec.setString(2, JCSG_PR);
			CallStmtExec.setString(3, GBSG_PR);
			CallStmtExec.setString(4, GASN_PR);
			CallStmtExec.setString(5, STSG_PR);
			CallStmtExec.setString(6, EXAM_DT);
			CallStmtExec.setString(7, CODE_CD);

			CallStmtExec.executeUpdate();

		} catch (Exception e) {

			throw new FuncException(e.toString(), sql);
		}

		return sql;
	}
%>
