<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%!
	public String func_uRslt_Code_ufSave_001(Statement argStmtExec, HashMap argHtMethod) throws Exception {

		String sql = "";
		String sql2 = "";
		String sql_disp = "";

		try {

			String SMODE = (String) argHtMethod.get("SMODE");
			String IIR_ITEM_CD = (String) argHtMethod.get("IIR_ITEM_CD");
			String IIR_RSLT_CD = (String) argHtMethod.get("IIR_RSLT_CD");
			String IIR_RSLT_KD = (String) argHtMethod.get("IIR_RSLT_KD");
			String IIR_RSLT_VL = (String) argHtMethod.get("IIR_RSLT_VL");
			String IIR_HEEX_CD = (String) argHtMethod.get("IIR_HEEX_CD");
			String IIR_SPEX_CD = (String) argHtMethod.get("IIR_SPEX_CD");
			String IIR_PRNT_VL = (String) argHtMethod.get("IIR_PRNT_VL");
			String IIR_USE_YN = (String) argHtMethod.get("IIR_USE_YN");
			String IIR_NUSE_ID = (String) argHtMethod.get("IIR_NUSE_ID");
			String IIR_NUSE_DTT = (String) argHtMethod.get("IIR_NUSE_DTT");
			String USER = (String) argHtMethod.get("USER");

			//
			if(SMODE == null) { SMODE = ""; }
			if(IIR_ITEM_CD == null) { IIR_ITEM_CD = ""; }
			if(IIR_RSLT_CD == null) { IIR_RSLT_CD = ""; }
			if(IIR_RSLT_KD == null) { IIR_RSLT_KD = ""; }
			if(IIR_RSLT_VL == null) { IIR_RSLT_VL = ""; }
			if(IIR_HEEX_CD == null) { IIR_HEEX_CD = ""; }
			if(IIR_SPEX_CD == null) { IIR_SPEX_CD = ""; }
			if(IIR_PRNT_VL == null) { IIR_PRNT_VL = ""; }
			if(IIR_USE_YN == null) { IIR_USE_YN = ""; }
			if(IIR_NUSE_ID == null) { IIR_NUSE_ID = ""; }
			if(IIR_NUSE_DTT == null) { IIR_NUSE_DTT = ""; }
			if(USER == null) { USER = ""; }

			//
			SMODE = CTr.Replace(SMODE, "'", "''");
			IIR_ITEM_CD = CTr.Replace(IIR_ITEM_CD, "'", "''");
			IIR_RSLT_CD = CTr.Replace(IIR_RSLT_CD, "'", "''");
			IIR_RSLT_KD = CTr.Replace(IIR_RSLT_KD, "'", "''");
			IIR_RSLT_VL = CTr.Replace(IIR_RSLT_VL, "'", "''");
			IIR_HEEX_CD = CTr.Replace(IIR_HEEX_CD, "'", "''");
			IIR_SPEX_CD = CTr.Replace(IIR_SPEX_CD, "'", "''");
			IIR_PRNT_VL = CTr.Replace(IIR_PRNT_VL, "'", "''");
			IIR_USE_YN = CTr.Replace(IIR_USE_YN, "'", "''");
			IIR_NUSE_ID = CTr.Replace(IIR_NUSE_ID, "'", "''");
			IIR_NUSE_DTT = CTr.Replace(IIR_NUSE_DTT, "'", "''");
			USER = CTr.Replace(USER, "'", "''");

			if(SMODE.equals("INSERT")) {

				sql = "INSERT INTO IT_ITEM_RESULT ( IIR_ITEM_CD , IIR_RSLT_CD , IIR_RSLT_KD , IIR_RSLT_VL , IIR_HEEX_CD , IIR_SPEX_CD , IIR_PRNT_VL , IIR_USE_YN , IIR_NUSE_ID , IIR_NUSE_DTT , IIR_INPT_ID , IIR_INPT_DTT ) VALUES (";
				sql += "  '" + IIR_ITEM_CD + "'";
				sql += ", '" + IIR_RSLT_CD + "'";
				sql += ", '" + IIR_RSLT_KD + "'";
				sql += ", '" + IIR_RSLT_VL + "'";
				sql += ", '" + IIR_HEEX_CD + "'";
				sql += ", '" + IIR_SPEX_CD + "'";
				sql += ", '" + IIR_PRNT_VL + "'";
				sql += ", '" + IIR_USE_YN + "'";
				sql += ", '" + IIR_NUSE_ID + "'";
				sql += ", '" + IIR_NUSE_DTT + "'";
				sql += ", '" + USER + "'";
				sql += ", SYSDATE";
				sql += ")";

				argStmtExec.executeUpdate(sql);
			}

			if(SMODE.equals("MODIFY")) {

				sql = "UPDATE IT_ITEM_RESULT SET ";
				sql += "  IIR_RSLT_KD = '" + IIR_RSLT_KD + "'";
				sql += ", IIR_RSLT_VL = '" + IIR_RSLT_VL + "'";
				sql += ", IIR_HEEX_CD = '" + IIR_HEEX_CD + "'";
				sql += ", IIR_SPEX_CD = '" + IIR_SPEX_CD + "'";
				sql += ", IIR_PRNT_VL = '" + IIR_PRNT_VL + "'";
				sql += ", IIR_USE_YN = '" + IIR_USE_YN + "'";
				sql += ", IIR_NUSE_ID = '" + IIR_NUSE_ID + "'";
				sql += ", IIR_NUSE_DTT = '" + IIR_NUSE_DTT + "'";
				sql += ", IIR_MODI_ID = '" + USER + "'";
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
