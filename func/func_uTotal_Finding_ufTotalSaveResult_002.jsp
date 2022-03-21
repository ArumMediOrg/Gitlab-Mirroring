<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%!
	public String func_uTotal_Finding_ufTotalSaveResult_002(Statement argStmtExec, HashMap argHtMethod) throws Exception {

		Connection connect = argStmtExec.getConnection();
		CallableStatement CallStmtExec = null;

		String sql = "";
		String sql2 = "";
		String sql_disp = "";

		try {

			String ICNT = (String) argHtMethod.get("ICNT");
			String EXAM_DT = (String) argHtMethod.get("EXAM_DT");
			String EXAM_SQ = (String) argHtMethod.get("EXAM_SQ");
			String PACK_CD = (String) argHtMethod.get("PACK_CD");
			String VIEW_EX = (String) argHtMethod.get("VIEW_EX");
			String DOCTOR = (String) argHtMethod.get("DOCTOR");
			String RPT_DT = (String) argHtMethod.get("RPT_DT");
			String USER = (String) argHtMethod.get("USER");
			String VIEW_RTF = (String) argHtMethod.get("VIEW_RTF");
			String PRNT_DT = (String) argHtMethod.get("PRNT_DT");
			String COMMT_TX = (String) argHtMethod.get("COMMT_TX");

			//
			if(ICNT == null) { ICNT = ""; }
			if(EXAM_DT == null) { EXAM_DT = ""; }
			if(EXAM_SQ == null) { EXAM_SQ = ""; }
			if(PACK_CD == null) { PACK_CD = ""; }
			if(VIEW_EX == null) { VIEW_EX = ""; }
			if(DOCTOR == null) { DOCTOR = ""; }
			if(RPT_DT == null) { RPT_DT = ""; }
			if(USER == null) { USER = ""; }
			if(VIEW_RTF == null) { VIEW_RTF = ""; }
			if(PRNT_DT == null) { PRNT_DT = ""; }
			if(COMMT_TX == null) { COMMT_TX = ""; }

				if(ICNT.equals("0")) {
				
						sql = "INSERT INTO ST_SYTH_VIEW ( SSV_EXAM_DT , SSV_EXAM_SQ , SSV_PACK_CD , SSV_VIEW_EX , SSV_DOCTOR , SSV_RPT_DT , SSV_INPT_ID , SSV_INPT_DTT , SSV_VIEW_RTF , SSV_COMMT) VALUES (";
						sql += "  ?";
						sql += ", ?";
						sql += ", ?";
						sql += ", ?";
						sql += ", ?";
						sql += ", ?";
						sql += ", ?";
						sql += ", SYSDATE";
						sql += ", ?";
						sql += ", ?";
						sql += ")";

						CallStmtExec = connect.prepareCall(sql);

						CallStmtExec.setString(1,  EXAM_DT);
						CallStmtExec.setString(2,  EXAM_SQ);
						CallStmtExec.setString(3,  PACK_CD);
						CallStmtExec.setString(4,  VIEW_EX);
						CallStmtExec.setString(5,  DOCTOR);
						CallStmtExec.setString(6,  RPT_DT);
						CallStmtExec.setString(7,  USER);
						CallStmtExec.setString(8,  VIEW_RTF);
						CallStmtExec.setString(9,  COMMT_TX);

						CallStmtExec.executeUpdate();

				
				} else {
				
						sql = "UPDATE ST_SYTH_VIEW SET ";
						sql += "  SSV_VIEW_EX = ?";
						sql += ", SSV_DOCTOR = ?";
						sql += ", SSV_RPT_DT = ?";
						sql += ", SSV_MODI_ID = ?";
						sql += ", SSV_MODI_DTT = SYSDATE";
						sql += ", SSV_VIEW_RTF = ?";
						sql += ", SSV_PRNT_DT = ?";
						sql += ", SSV_COMMT = ?";
						sql += " WHERE SSV_EXAM_DT = ?";
						sql += " AND SSV_EXAM_SQ = ?";
						sql += " AND SSV_PACK_CD = ?";

						CallStmtExec = connect.prepareCall(sql);

						CallStmtExec.setString(1,  VIEW_EX);
						CallStmtExec.setString(2,  DOCTOR);
						CallStmtExec.setString(3,  RPT_DT);
						CallStmtExec.setString(4,  USER);
						CallStmtExec.setString(5,  VIEW_RTF);
						CallStmtExec.setString(6,  PRNT_DT);
						CallStmtExec.setString(7,  COMMT_TX);
						CallStmtExec.setString(8,  EXAM_DT);
						CallStmtExec.setString(9,  EXAM_SQ);
						CallStmtExec.setString(10,  PACK_CD);

						CallStmtExec.executeUpdate();
				}

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
