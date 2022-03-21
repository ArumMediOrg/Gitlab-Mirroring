<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%!
	public String func_uDev_Rslt_cmbIIR_USE_YNChange_001(Statement argStmtExec, HashMap argHtMethod) throws Exception {

		String sql = "";
		String sql2 = "";
		String sql_disp = "";

		try {

			String IIR_USE_YN = (String) argHtMethod.get("IIR_USE_YN");
			String IIR_MODI_ID = (String) argHtMethod.get("IIR_MODI_ID");
			String IIR_ITEM_CD = (String) argHtMethod.get("IIR_ITEM_CD");
			String IIR_RSLT_CD = (String) argHtMethod.get("IIR_RSLT_CD");

			//
			if(IIR_USE_YN == null) { IIR_USE_YN = ""; }
			if(IIR_MODI_ID == null) { IIR_MODI_ID = ""; }
			if(IIR_ITEM_CD == null) { IIR_ITEM_CD = ""; }
			if(IIR_RSLT_CD == null) { IIR_RSLT_CD = ""; }

			//
			IIR_USE_YN = CTr.Replace(IIR_USE_YN, "'", "''");
			IIR_MODI_ID = CTr.Replace(IIR_MODI_ID, "'", "''");
			IIR_ITEM_CD = CTr.Replace(IIR_ITEM_CD, "'", "''");
			IIR_RSLT_CD = CTr.Replace(IIR_RSLT_CD, "'", "''");

			if(IIR_USE_YN.equals("Y")) {
			
				sql = "UPDATE IT_ITEM_RESULT SET ";
				sql += "  IIR_USE_YN = 'Y'";
				sql += ", IIR_MODI_ID = '" + IIR_MODI_ID + "'";
				sql += ", IIR_MODI_DTT = SYSDATE";
				sql += " WHERE IIR_ITEM_CD = '" + IIR_ITEM_CD + "'";
				sql += " AND IIR_RSLT_CD = '" + IIR_RSLT_CD + "'";

				argStmtExec.executeUpdate(sql);
			}

			if(IIR_USE_YN.equals("N")) {
			
				sql = "UPDATE IT_ITEM_RESULT SET ";
				sql += "  IIR_USE_YN = 'N'";
				sql += ", IIR_NUSE_ID = '" + IIR_MODI_ID + "'";
				sql += ", IIR_NUSE_DTT = SYSDATE";
				sql += ", IIR_MODI_ID = '" + IIR_MODI_ID + "'";
				sql += ", IIR_MODI_DTT = SYSDATE";
				sql += " WHERE IIR_ITEM_CD = '" + IIR_ITEM_CD + "'";
				sql += " AND IIR_RSLT_CD = '" + IIR_RSLT_CD + "'";

				argStmtExec.executeUpdate(sql);
			}

		} catch (Exception e) {

			throw new FuncException(e.toString(), sql);
		}

		return sql;
	}
%>
