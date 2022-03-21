<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%!
	public String func_uSP_Health_UF_SP2CHA_CREATE_016(Statement argStmtExec, HashMap argHtMethod) throws Exception {

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

			sql = "UPDATE ET_EXAM_ITEM SET ";
			sql += "  EEI_OPTN_KD = '0'";
			sql += ", EEI_ADD_KD = '0'";
			sql += ", EEI_PRGS_KD = '0'";
			sql += ", EEI_HTSB_KD = '0'";
			sql += ", EEI_CAN_KD = '0'";
			sql += ", EEI_SPSB_KD= '0'";
			sql += ", EEI_CVSB_KD = '0'";
			sql += ", EEI_EMSB_KD = '0'";
			sql += ", EEI_ETSB_KD = '0'";
			sql += ", EEI_ADD_PR = '0'";
			sql += ", EEI_PRGS_PR = '0'";
			sql += ", EEI_HTSB_PR = '0'";
			sql += ", EEI_CAN_PR = '0'";
			sql += ", EEI_SPSB_PR= '0'";
			sql += ", EEI_SPHT_PR= '0'";
			sql += ", EEI_SPFS_PR = '0'";
			sql += ", EEI_CVSB_PR = '0'";
			sql += ", EEI_CVFS_PR= '0'";
			sql += ", EEI_EMSB_PR= '0'";
			sql += ", EEI_EMFS_PR = '0'";
			sql += ", EEI_ETSB_PR = '0'";
			sql += ", EEI_ETFS_PR = '0'";
			sql += " WHERE EEI_EXAM_DT = '" + EXAM_DT + "'";
			sql += " AND EEI_EXAM_SQ = '" + EXAM_SQ + "'";

			argStmtExec.executeUpdate(sql);

		} catch (Exception e) {

			throw new FuncException(e.toString(), sql);
		}

		return sql;
	}
%>
