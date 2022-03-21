<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%!
	public String func_uIT_ChungGU_Move_Up_Insert_chungPer_004_TRAN003(Statement argStmtExec, HashMap argHtMethod) throws Exception {

		String sql = "";
		String sql2 = "";
		String sql_disp = "";

		try {

			String CHGBN = (String) argHtMethod.get("CHGBN");
			String DP_FROMDT = (String) argHtMethod.get("DP_FROMDT");
			String DP_TODT = (String) argHtMethod.get("DP_TODT");
			String CUST_NO = (String) argHtMethod.get("CUST_NO");

			//
			if(CHGBN == null) { CHGBN = ""; }
			if(DP_FROMDT == null) { DP_FROMDT = ""; }
			if(DP_TODT == null) { DP_TODT = ""; }
			if(CUST_NO == null) { CUST_NO = ""; }

			//
			CHGBN = CTr.Replace(CHGBN, "'", "''");
			DP_FROMDT = CTr.Replace(DP_FROMDT, "'", "''");
			DP_TODT = CTr.Replace(DP_TODT, "'", "''");
			CUST_NO = CTr.Replace(CUST_NO, "'", "''");

			if(CHGBN.equals("일반")){
				sql = "UPDATE ET_EXAM_PRICE";
				sql = " SET EEP_CDMD_DT = SYSDATE";
				sql += " WHERE EEP_EXAM_DT >= '" + DP_FROMDT + "'";
				sql += " AND EEP_EXAM_DT <= '" + DP_TODT + "'";
				sql += " AND EEP_CUST_NO = '" + CUST_NO + "'";

				argStmtExec.executeUpdate(sql);
			}
			else if(CHGBN.equals("특검")) {
				sql = "UPDATE ET_EXAM_PRICE";
				sql = " SET EEP_CDMDS_DT = SYSDATE";
				sql += " WHERE EEP_EXAM_DT >= '" + DP_FROMDT + "'";
				sql += " AND EEP_EXAM_DT <= '" + DP_TODT + "'";
				sql += " AND EEP_CUST_NO = '" + CUST_NO + "'";

				argStmtExec.executeUpdate(sql);
			}


		} catch (Exception e) {

			throw new FuncException(e.toString(), sql);
		}

		return sql;
	}
%>
