<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%!
	public String func_uMake_Excel_Apply_ufSave_005(Statement argStmtExec, HashMap argHtMethod) throws Exception {

		String sql = "";
		String sql2 = "";
		String sql_disp = "";

		Connection connect = argStmtExec.getConnection();
		CallableStatement CallStmtExec = null;

		try {

			String PACK_CD = (String) argHtMethod.get("PACK_CD");
			String INPT_ID = (String) argHtMethod.get("INPT_ID");

			//
			if(PACK_CD == null) { PACK_CD = ""; }
			if(INPT_ID == null) { INPT_ID = ""; }


			sql += " Update IT_EXCEL_PACK ";
			sql += " Set IEP_MODI_ID  = ?, ";
			sql += "     IEP_MODI_DTT = SYSDATE ";
			sql += " Where IEP_PACK_CD = ? ";

			CallStmtExec = connect.prepareCall(sql);

			CallStmtExec.setString(1, INPT_ID);
			CallStmtExec.setString(2, PACK_CD);

			CallStmtExec.executeUpdate();

		} catch (Exception e) {

			throw new FuncException(e.toString(), sql);
		}

		return sql;
	}
%>
