<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%!
	public String func_uSP_Health_UF_SP2CHA_CREATE_012(Statement argStmtExec, HashMap argHtMethod) throws Exception {

		String sql = "";
		String sql2 = "";
		String sql_disp = "";

		try {

			String EXAM_DT = (String) argHtMethod.get("EXAM_DT");
			String EXAM_SQ = (String) argHtMethod.get("EXAM_SQ");

			//
			if(EXAM_DT == null) { EXAM_DT = ""; }
			if(EXAM_SQ == null) { EXAM_SQ = ""; }

			//
			EXAM_DT = CTr.Replace(EXAM_DT, "'", "''");
			EXAM_SQ = CTr.Replace(EXAM_SQ, "'", "''");

			sql = "UPDATE ET_RSLT_ITEM SET ";
			sql += "  ERI_HLTH_KD = '0'";
			sql += ", ERI_TOTAL_KD = '0'";
			sql += ", ERI_STDT_KD = '0'";
			sql += ", ERI_EMPY_KD = '0'";
			sql += ", ERI_DETL_KD = '0'";
			sql += ", ERI_BLOOD_KD= '0'";
			sql += ", ERI_EACH_KD = '0'";
			sql += ", ERI_CVCL_KD = '0'";
			sql += ", ERI_ETC_KD = '0'";
			sql += ", ERI_OCS_CD = ''";
			sql += ", ERI_OSSB_CD = ''";
			sql += ", ERI_OSRL_CD = ''";
			sql += " WHERE ERI_EXAM_DT = '" + EXAM_DT + "'";
			sql += " AND ERI_EXAM_SQ = '" + EXAM_SQ + "'";

			argStmtExec.executeUpdate(sql);

		} catch (Exception e) {

			throw new FuncException(e.toString(), sql);
		}

		return sql;
	}
%>
