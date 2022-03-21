<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%!
	public String func_uDev_Rslt_Apply_btnSelectClick_002(Statement argStmtExec, HashMap argHtMethod) throws Exception {

		String sql = "";
		String sql2 = "";
		String sql_disp = "";

		try {

			String IIR_ITEM_CD = (String) argHtMethod.get("IIR_ITEM_CD");
			String IIR_RSLT_CD = (String) argHtMethod.get("IIR_RSLT_CD");
			String IIR_INPT_ID = (String) argHtMethod.get("IIR_INPT_ID");

			//
			if(IIR_ITEM_CD == null) { IIR_ITEM_CD = ""; }
			if(IIR_RSLT_CD == null) { IIR_RSLT_CD = ""; }
			if(IIR_INPT_ID == null) { IIR_INPT_ID = ""; }

			//
			IIR_ITEM_CD = CTr.Replace(IIR_ITEM_CD, "'", "''");
			IIR_RSLT_CD = CTr.Replace(IIR_RSLT_CD, "'", "''");
			IIR_INPT_ID = CTr.Replace(IIR_INPT_ID, "'", "''");

			sql = "INSERT INTO IT_ITEM_RESULT ( IIR_ITEM_CD , IIR_RSLT_CD , IIR_RSLT_KD , IIR_USE_YN , IIR_INPT_ID , IIR_INPT_DTT ) VALUES (";
			sql += "  '" + IIR_ITEM_CD + "'";
			sql += ", '" + IIR_RSLT_CD + "'";
			sql += ", '3'";
			sql += ", 'Y'";
			sql += ", '" + IIR_INPT_ID + "'";
			sql += ", SYSDATE";
			sql += ")";

			argStmtExec.executeUpdate(sql);

		} catch (Exception e) {

			throw new FuncException(e.toString(), sql);
		}

		return sql;
	}
%>
