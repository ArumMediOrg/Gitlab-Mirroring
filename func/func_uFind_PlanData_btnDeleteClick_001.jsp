<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%!
	public String func_uFind_PlanData_btnDeleteClick_001(Statement argStmtExec, HashMap argHtMethod) throws Exception {

		String sql = "";
		String sql2 = "";
		String sql_disp = "";

		Connection connect = argStmtExec.getConnection();
		CallableStatement CallStmtExec = null;

		try {

			String SGUBN = (String) argHtMethod.get("SGUBN");
			String COMP_CD = (String) argHtMethod.get("COMP_CD");
			String SAVE_DT = (String) argHtMethod.get("SAVE_DT");
			String SAVE_SQ = (String) argHtMethod.get("SAVE_SQ");

			//

			if(SGUBN == null) { SGUBN = ""; }
			if(COMP_CD == null) { COMP_CD = ""; }
			if(SAVE_DT == null) { SAVE_DT = ""; }
			if(SAVE_SQ == null) { SAVE_SQ = ""; }

			//

			if (SGUBN.equals("1")){
				sql = " Delete from SP_PLAN_DATA ";
				sql += " Where SPD_COMP_CD = ? ";
				sql += " 	And SPD_SAVE_DT = ? ";
				sql += " 	And SPD_SAVE_SQ = ? ";
			} else if (SGUBN.equals("2")){
				sql = " Delete from SP_PLAN_PSNL_DATA ";
				sql += " Where SPP_COMP_CD = ? ";
				sql += " 	And SPP_SAVE_DT = ? ";
				sql += " 	And SPP_SAVE_SQ = ? ";
			} else if (SGUBN.equals("3")){
				sql = " Delete from SP_PLAN_FAC_DATA ";
				sql += " Where SPF_COMP_CD = ? ";
				sql += " 	And SPF_SAVE_DT = ? ";
				sql += " 	And SPF_SAVE_SQ = ? ";
			}

			CallStmtExec = connect.prepareCall(sql);

			CallStmtExec.setString(1, COMP_CD);
			CallStmtExec.setString(2, SAVE_DT);
			CallStmtExec.setString(3, SAVE_SQ);

			CallStmtExec.executeUpdate();

		} catch (Exception e) {

			throw new FuncException(e.toString(), sql);
		}

		return sql;
	}
%>
