<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%!
	public String func_uIT_ChungFILERE_RZ_BTN_ALLChugu_REClick_001(Statement argStmtExec, HashMap argHtMethod) throws Exception {

		String sql = "";
		String sql2 = "";
		String sql_disp = "";

		try {

			String BILLE_DT = (String) argHtMethod.get("BILLE_DT");
			String CHUNG_DT = (String) argHtMethod.get("CHUNG_DT");
			String CHUNG_NO = (String) argHtMethod.get("CHUNG_NO");
			String BILL_FL = (String) argHtMethod.get("BILL_FL");

			//
			if(BILLE_DT == null) { BILLE_DT = ""; }
			if(CHUNG_DT == null) { CHUNG_DT = ""; }
			if(CHUNG_NO == null) { CHUNG_NO = ""; }
			if(BILL_FL == null) { BILL_FL = ""; }

			//
			BILLE_DT = CTr.Replace(BILLE_DT, "'", "''");
			CHUNG_DT = CTr.Replace(CHUNG_DT, "'", "''");
			CHUNG_NO = CTr.Replace(CHUNG_NO, "'", "''");
			BILL_FL = CTr.Replace(BILL_FL, "'", "''");

			sql = "UPDATE BT_BILLHN_PR SET ";
			sql += "  BBP_CHUNG_NO = ''";
			sql += ", BBP_RETURN_KD = '1'";
			sql += ", BBP_BILLE_DT = '" + BILLE_DT + "'";
			sql += " WHERE BBP_CHUNG_DT = '" + CHUNG_DT + "'";
			sql += " AND BBP_CHUNG_NO = '" + CHUNG_NO + "'";
			sql += " AND BBP_BILL_FL = '" + BILL_FL + "'";

			argStmtExec.executeUpdate(sql);

		} catch (Exception e) {

			throw new FuncException(e.toString(), sql);
		}

		return sql;
	}
%>
