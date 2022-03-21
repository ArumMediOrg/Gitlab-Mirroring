<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%!
	public String func_uRsvn_Acpt_btnSaveClick_005(Statement argStmtExec, HashMap argHtMethod) throws Exception {

		String sql = "";
		String sql2 = "";
		String sql_disp = "";

		try {

			String SAVE_KD = (String) argHtMethod.get("SAVE_KD");
			String RSVN_NO = (String) argHtMethod.get("RSVN_NO");
			String EXAM_DT = (String) argHtMethod.get("EXAM_DT");
			String EXAM_SQ = (String) argHtMethod.get("EXAM_SQ");
			String RESERVATION_ID = (String) argHtMethod.get("RESERVATION_ID");

			//
			if(SAVE_KD == null) { SAVE_KD = ""; }
			if(RSVN_NO == null) { RSVN_NO = ""; }
			if(EXAM_DT == null) { EXAM_DT = ""; }
			if(EXAM_SQ == null) { EXAM_SQ = ""; }
			if(RESERVATION_ID == null) { RESERVATION_ID = ""; }

			//
			SAVE_KD = CTr.Replace(SAVE_KD, "'", "''");
			RSVN_NO = CTr.Replace(RSVN_NO, "'", "''");
			EXAM_DT = CTr.Replace(EXAM_DT, "'", "''");
			EXAM_SQ = CTr.Replace(EXAM_SQ, "'", "''");
			RESERVATION_ID = CTr.Replace(RESERVATION_ID, "'", "''");

			if(SAVE_KD.equals("I")) {

				sql = "UPDATE UB_RSVT_ACPT SET ";
				sql += "  URA_RSVN_NO = '" + RSVN_NO + "'";
				sql += ", URA_RSVN_YN = 'Y'";
				sql += " WHERE URA_EXAM_DT = '" + EXAM_DT + "'";
				sql += " AND URA_EXAM_SQ = '" + EXAM_SQ + "'";

				argStmtExec.executeUpdate(sql);
			} else if(SAVE_KD.equals("2")) {

				sql = "UPDATE UB_RSVT_ACPT SET ";
				sql += "  URA_RSVN_YN = 'Y'";
				sql += " WHERE URA_RSVN_NO = '" + RSVN_NO + "'";

				argStmtExec.executeUpdate(sql);
			} else if(SAVE_KD.equals("3")) {

				sql = "UPDATE UB_RSVT SET ";
				sql += "  UB_RESERVATION_ID = '" + RESERVATION_ID + "'";
				sql += " WHERE UB_RSVN_NO = '" + RSVN_NO + "'";

				argStmtExec.executeUpdate(sql);
			}

		} catch (Exception e) {

			throw new FuncException(e.toString(), sql);
		}

		return sql;
	}
%>
