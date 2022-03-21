<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%!
	public String func_uSP_Health_UF_SP2CHA_CREATE_014(Statement argStmtExec, HashMap argHtMethod) throws Exception {

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

			sql = "UPDATE ET_EXAM_PRICE SET ";
			sql += "  EEP_ADD_PR = '0'";
			sql += ", EEP_PRGS_PR = '0'";
			sql += ", EEP_HTSB_PR = '0'";
			sql += ", EEP_CAN_PR = '0'";
			sql += ", EEP_SPSB_PR= '0'";
			sql += ", EEP_CVSB_PR = '0'";
			sql += ", EEP_EMSB_PR = '0'";
			sql += ", EEP_ETSB_PR= '0'";
			sql += ", EEP_HDMD_PR= '0'";
			sql += ", EEP_COMP_PR = '0'";
			sql += ", EEP_PSNLP_PR= '0'";
			sql += " WHERE EEP_EXAM_DT = '" + EXAM_DT + "'";
			sql += " AND EEP_EXAM_SQ = '" + EXAM_SQ + "'";

			argStmtExec.executeUpdate(sql);

		} catch (Exception e) {

			throw new FuncException(e.toString(), sql);
		}

		return sql;
	}
%>
