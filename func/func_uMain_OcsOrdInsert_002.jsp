<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%!
	public String func_uMain_OcsOrdInsert_002(Statement argStmtExec, HashMap argHtMethod) throws Exception {

		String sql = "";
		String sql2 = "";
		String sql_disp = "";

		try {

			String OCSC_SNO = (String) argHtMethod.get("OCSC_SNO");
			String EXAM_DT = (String) argHtMethod.get("EXAM_DT");
			String EXAM_SQ = (String) argHtMethod.get("EXAM_SQ");
			String OCS_CD = (String) argHtMethod.get("OCS_CD");
			String OSSB_CD = (String) argHtMethod.get("OSSB_CD");

			//
			if(OCSC_SNO == null) { OCSC_SNO = ""; }
			if(EXAM_DT == null) { EXAM_DT = ""; }
			if(EXAM_SQ == null) { EXAM_SQ = ""; }
			if(OCS_CD == null) { OCS_CD = ""; }
			if(OSSB_CD == null) { OSSB_CD = ""; }

			//
			OCSC_SNO = CTr.Replace(OCSC_SNO, "'", "''");
			EXAM_DT = CTr.Replace(EXAM_DT, "'", "''");
			EXAM_SQ = CTr.Replace(EXAM_SQ, "'", "''");
			OCS_CD = CTr.Replace(OCS_CD, "'", "''");
			OSSB_CD = CTr.Replace(OSSB_CD, "'", "''");

			sql = "UPDATE ET_RSLT_ITEM SET ";
			sql += "  ERI_OCSC_SNO = '" + OCSC_SNO + "'";
			sql += " WHERE ERI_EXAM_DT = '" + EXAM_DT + "'";
			sql += " AND ERI_EXAM_SQ = '" + EXAM_SQ + "'";
			sql += " AND ERI_OCS_CD = '" + OCS_CD + "'";
			if (!OSSB_CD.equals("")){
				sql += " AND ERI_OSSB_CD = '" + OSSB_CD + "' ";
			}

			sql += " AND nvl(ERI_CNCL_YN, 'N') <> 'Y' ";


			argStmtExec.executeUpdate(sql);

		} catch (Exception e) {

			throw new FuncException(e.toString(), sql);
		}

		return sql;
	}
%>
