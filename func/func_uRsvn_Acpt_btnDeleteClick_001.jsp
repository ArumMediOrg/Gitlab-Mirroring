<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%!
	public String func_uRsvn_Acpt_btnDeleteClick_001(Statement argStmtExec, HashMap argHtMethod) throws Exception {

		String sql = "";
		String sql2 = "";
		String sql_disp = "";

		try {

			String RSVN_KD = (String) argHtMethod.get("RSVN_KD");
			String RSVN_NO = (String) argHtMethod.get("RSVN_NO");

			//
			if(RSVN_KD == null) { RSVN_KD = ""; }
			if(RSVN_NO == null) { RSVN_NO = ""; }

			//
			RSVN_KD = CTr.Replace(RSVN_KD, "'", "''");
			RSVN_NO = CTr.Replace(RSVN_NO, "'", "''");

			if(RSVN_KD.equals("R")) {
				sql = "DELETE RT_RSVT";
				sql += " WHERE RRT_RSVN_NO = '" + RSVN_NO + "'";

				argStmtExec.executeUpdate(sql);
			} else if(RSVN_KD.equals("U")) {
				sql = "DELETE UB_RSVT_ACPT";
				sql += " WHERE URA_RSVN_NO = '" + RSVN_NO + "'";

				argStmtExec.executeUpdate(sql);
			} else if(RSVN_KD.equals("I")) {
				sql = "DELETE RT_RSVT_ITEM";
				sql += " WHERE RRI_RSVN_NO = '" + RSVN_NO + "'";

				argStmtExec.executeUpdate(sql);
			}
		} catch (Exception e) {

			throw new FuncException(e.toString(), sql);
		}

		return sql;
	}
%>
