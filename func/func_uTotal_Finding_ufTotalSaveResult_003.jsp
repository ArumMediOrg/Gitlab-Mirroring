<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%!
	public String func_uTotal_Finding_ufTotalSaveResult_003(Statement argStmtExec, HashMap argHtMethod) throws Exception {

		Connection connect = argStmtExec.getConnection();
		CallableStatement CallStmtExec = null;

		String sql = "";
		String sql2 = "";
		String sql_disp = "";

		try {

			String VIEW_EX2 = (String) argHtMethod.get("VIEW_EX2");
			String EXAM_DT = (String) argHtMethod.get("EXAM_DT");
			String EXAM_SQ = (String) argHtMethod.get("EXAM_SQ");
			String PACK_CD = (String) argHtMethod.get("PACK_CD");

			//
			if(VIEW_EX2 == null) { VIEW_EX2 = ""; }
			if(EXAM_DT == null) { EXAM_DT = ""; }
			if(EXAM_SQ == null) { EXAM_SQ = ""; }
			if(PACK_CD == null) { PACK_CD = ""; }

			sql = "UPDATE ST_SYTH_VIEW SET ";
			sql += "  SSV_VIEW_EX2 = ?";
			sql += " WHERE SSV_EXAM_DT = ?";
			sql += " AND SSV_EXAM_SQ = ?";
			sql += " AND SSV_PACK_CD = ?";

			CallStmtExec = connect.prepareCall(sql);

			CallStmtExec.setString(1,  VIEW_EX2);
			CallStmtExec.setString(2,  EXAM_DT);
			CallStmtExec.setString(3,  EXAM_SQ);
			CallStmtExec.setString(4,  PACK_CD);

			CallStmtExec.executeUpdate();

		} catch (Exception e) {

			throw new FuncException(e.toString(), sql);
		} finally {

			if(CallStmtExec != null) {
				CallStmtExec.close();
				CallStmtExec = null;
			}

			if(connect != null) {
				connect = null;
			}
		}

		return sql;
	}
%>
