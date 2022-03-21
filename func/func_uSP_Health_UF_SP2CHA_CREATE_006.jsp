<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%!
	public String func_uSP_Health_UF_SP2CHA_CREATE_006(Statement argStmtExec, HashMap argHtMethod) throws Exception {

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

			sql = "UPDATE ET_EXAM_ACPT SET ";
			sql += "  EEA_CHART_NO = ''";
			sql += ", EEA_DIVI_NO = ''";
			sql += ", EEA_DIVI_CS = ''";
			sql += ", EEA_RFID_NO = ''";
			sql += ", EEA_SALES_ID = ''";
			sql += ", EEA_HTSB_CD = ''";
			sql += ", EEA_CVSB_CD = ''";
			sql += ", EEA_EMSB_CD = ''";
			sql += ", EEA_ETSB_CD = ''";
			sql += ", EEA_HTPR_CD = ''";
			sql += ", EEA_SPPR_CD = ''";
			sql += ", EEA_CVPR_CD = ''";
			sql += ", EEA_EMPR_CD = ''";
			sql += ", EEA_ETPR_CD = ''";
			sql += ", EEA_MNGT_YR = ''";
			sql += ", EEA_MNGT_HTYR = ''";
			sql += ", EEA_HTSB_LT = ''";
			sql += ", EEA_SPSB_LT = ''";
			sql += ", EEA_CVSB_LT = ''";
			sql += ", EEA_EMSB_LT = ''";
			sql += ", EEA_ETSB_LT = ''";
			sql += ", EEA_ADD_LT = ''";
			sql += ", EEA_ORDER_LT= ''";
			sql += ", EEA_INSU_NO = ''";
			sql += ", EEA_ASSO_CD = ''";
			sql += ", EEA_CNTR_CD = ''";
			sql += ", EEA_ARMY_CD = ''";
			sql += ", EEA_STOMA_DR= ''";
			sql += ", EEA_COLON_DR = ''";
			sql += ", EEA_LIVER_DR= ''";
			sql += ", EEA_BAST_DR = ''";
			sql += ", EEA_UTER_DR = ''";
			sql += ", EEA_RECE_NO = ''";
			sql += ", EEA_NHIC_TX = ''";
			sql += ", EEA_ACPT_TX = ''";
			sql += ", EEA_RSVN_NO = ''";
			sql += ", EEA_CLSS_KD = ''";
			sql += ", EEA_DEFER_KD= '0'";
			sql += ", EEA_LABEL_DT = ''";
			sql += " WHERE EEA_EXAM_DT = '" + EXAM_DT + "'";
			sql += " AND EEA_EXAM_SQ = '" + EXAM_SQ + "'";

			argStmtExec.executeUpdate(sql);

		} catch (Exception e) {

			throw new FuncException(e.toString(), sql);
		}

		return sql;
	}
%>
