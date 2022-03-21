<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%!
	public String func_uFM_AcptComm_GF_UdtOcsSno_001(Statement argStmtExec, HashMap argHtMethod) throws Exception {

		String sql = "";
		String sql2 = "";
		String sql_disp = "";

		Connection connect = argStmtExec.getConnection();
		CallableStatement CallStmtExec = null;

		try {
			
			String EXAM_DT = (String) argHtMethod.get("EXAM_DT");
			String EXAM_SQ = (String) argHtMethod.get("EXAM_SQ");
			String RSVN_NO = (String) argHtMethod.get("RSVN_NO");

			//
			if(EXAM_DT == null) { EXAM_DT = ""; }
			if(EXAM_SQ == null) { EXAM_SQ = ""; }
			if(RSVN_NO == null) { RSVN_NO = ""; }

			//
			EXAM_DT = CTr.Replace(EXAM_DT, "'", "''");
			EXAM_SQ = CTr.Replace(EXAM_SQ, "'", "''");
			RSVN_NO = CTr.Replace(RSVN_NO, "'", "''");

			sql = " UPDATE ET_RSLT_ITEM A ";
			sql += " SET A.ERI_OCSC_SNO = (SELECT B.RRI_OCSC_SNO ";
			sql += " 						FROM RT_RSVT_ITEM B ";
			sql += " 						WHERE B.RRI_RSVN_NO = ? ";
			sql += " 							AND B.RRI_ITEM_CD = A.ERI_ITEM_CD) ";
			sql += " WHERE A.ERI_EXAM_DT = ? ";
			sql += " AND A.ERI_EXAM_SQ = ? ";
			sql += " AND A.ERI_ITEM_CD IN (SELECT B.RRI_ITEM_CD ";
			sql += " 						FROM RT_RSVT_ITEM B ";
			sql += " 						WHERE B.RRI_RSVN_NO = ? ";
			sql += " 							AND B.RRI_OCS_YN  = 'Y'";
			sql += " 							AND B.RRI_CNCL_YN = 'N'";
			sql += " 							AND B.RRI_OCSC_SNO IS NOT NULL)";
			

			
			CallStmtExec = connect.prepareCall(sql);

			CallStmtExec.setString(1,  RSVN_NO);
			CallStmtExec.setString(2,  EXAM_DT);
			CallStmtExec.setString(3,  EXAM_SQ);
			CallStmtExec.setString(4,  RSVN_NO);
			
			
			CallStmtExec.executeUpdate();

		} catch (Exception e) {

			throw new FuncException(e.toString(), sql);
		}

		return sql;
	}
%>
