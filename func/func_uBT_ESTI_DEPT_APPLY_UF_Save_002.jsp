<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%!
	public String func_uBT_ESTI_DEPT_APPLY_UF_Save_002(Statement argStmtExec, HashMap argHtMethod) throws Exception {

		String sql = "";
		String sql2 = "";
		String sql_disp = "";

		try {

			String CHKBOXBED_USE_YN = (String) argHtMethod.get("CHKBOXBED_USE_YN");
			String HALF_CD = (String) argHtMethod.get("HALF_CD");
			String DEPT_NM = (String) argHtMethod.get("DEPT_NM");
			String SUBD_NM = (String) argHtMethod.get("SUBD_NM");
			String MATT_LT = (String) argHtMethod.get("MATT_LT");
			String MTJG_LT = (String) argHtMethod.get("MTJG_LT");
			String BSBS_PR = (String) argHtMethod.get("BSBS_PR");
			String BTGS_PR = (String) argHtMethod.get("BTGS_PR");
			String BCAS_PR = (String) argHtMethod.get("BCAS_PR");
			String JSBS_PR = (String) argHtMethod.get("JSBS_PR");
			String JTGS_PR = (String) argHtMethod.get("JTGS_PR");
			String JCAS_PR = (String) argHtMethod.get("JCAS_PR");
			String BSBS_RT = (String) argHtMethod.get("BSBS_RT");
			String BTGS_RT = (String) argHtMethod.get("BTGS_RT");
			String BCAS_RT = (String) argHtMethod.get("BCAS_RT");
			String JSBS_RT = (String) argHtMethod.get("JSBS_RT");
			String JTGS_RT = (String) argHtMethod.get("JTGS_RT");
			String JCAS_RT = (String) argHtMethod.get("JCAS_RT");
			String JBSBS_PR = (String) argHtMethod.get("JBSBS_PR");
			String JBTGS_PR = (String) argHtMethod.get("JBTGS_PR");
			String JBCAS_PR = (String) argHtMethod.get("JBCAS_PR");
			String JJSBS_PR = (String) argHtMethod.get("JJSBS_PR");
			String JJTGS_PR = (String) argHtMethod.get("JJTGS_PR");
			String JJCAS_PR = (String) argHtMethod.get("JJCAS_PR");
			String BCUST_CNT = (String) argHtMethod.get("BCUST_CNT");
			String BSALE_PR = (String) argHtMethod.get("BSALE_PR");
			String JCUST_CNT = (String) argHtMethod.get("JCUST_CNT");
			String JSALE_PR = (String) argHtMethod.get("JSALE_PR");
			String TAGR_TM = (String) argHtMethod.get("TAGR_TM");
			String USE_YN = (String) argHtMethod.get("USE_YN");
			String MODI_ID = (String) argHtMethod.get("MODI_ID");
			String SPCL_CD = (String) argHtMethod.get("SPCL_CD");
			String MCAS_PR = (String) argHtMethod.get("MCAS_PR");
			String MSALE_PR = (String) argHtMethod.get("MSALE_PR");
			String MNGT_YR = (String) argHtMethod.get("MNGT_YR");
			String ESTI_CD = (String) argHtMethod.get("ESTI_CD");
			String DEPT_SQ = (String) argHtMethod.get("DEPT_SQ");
			String NUSE_ID = (String) argHtMethod.get("NUSE_ID");

			//
			if(CHKBOXBED_USE_YN == null) { CHKBOXBED_USE_YN = ""; }
			if(HALF_CD == null) { HALF_CD = ""; }
			if(DEPT_NM == null) { DEPT_NM = ""; }
			if(SUBD_NM == null) { SUBD_NM = ""; }
			if(MATT_LT == null) { MATT_LT = ""; }
			if(MTJG_LT == null) { MTJG_LT = ""; }
			if(BSBS_PR == null) { BSBS_PR = ""; }
			if(BTGS_PR == null) { BTGS_PR = ""; }
			if(BCAS_PR == null) { BCAS_PR = ""; }
			if(JSBS_PR == null) { JSBS_PR = ""; }
			if(JTGS_PR == null) { JTGS_PR = ""; }
			if(JCAS_PR == null) { JCAS_PR = ""; }
			if(BSBS_RT == null) { BSBS_RT = ""; }
			if(BTGS_RT == null) { BTGS_RT = ""; }
			if(BCAS_RT == null) { BCAS_RT = ""; }
			if(JSBS_RT == null) { JSBS_RT = ""; }
			if(JTGS_RT == null) { JTGS_RT = ""; }
			if(JCAS_RT == null) { JCAS_RT = ""; }
			if(JBSBS_PR == null) { JBSBS_PR = ""; }
			if(JBTGS_PR == null) { JBTGS_PR = ""; }
			if(JBCAS_PR == null) { JBCAS_PR = ""; }
			if(JJSBS_PR == null) { JJSBS_PR = ""; }
			if(JJTGS_PR == null) { JJTGS_PR = ""; }
			if(JJCAS_PR == null) { JJCAS_PR = ""; }
			if(BCUST_CNT == null) { BCUST_CNT = ""; }
			if(BSALE_PR == null) { BSALE_PR = ""; }
			if(JCUST_CNT == null) { JCUST_CNT = ""; }
			if(JSALE_PR == null) { JSALE_PR = ""; }
			if(TAGR_TM == null) { TAGR_TM = ""; }
			if(USE_YN == null) { USE_YN = ""; }
			if(MODI_ID == null) { MODI_ID = ""; }
			if(SPCL_CD == null) { SPCL_CD = ""; }
			if(MCAS_PR == null) { MCAS_PR = ""; }
			if(MSALE_PR == null) { MSALE_PR = ""; }
			if(MNGT_YR == null) { MNGT_YR = ""; }
			if(ESTI_CD == null) { ESTI_CD = ""; }
			if(DEPT_SQ == null) { DEPT_SQ = ""; }
			if(NUSE_ID == null) { NUSE_ID = ""; }

			//
			CHKBOXBED_USE_YN = CTr.Replace(CHKBOXBED_USE_YN, "'", "''");
			HALF_CD = CTr.Replace(HALF_CD, "'", "''");
			DEPT_NM = CTr.Replace(DEPT_NM, "'", "''");
			SUBD_NM = CTr.Replace(SUBD_NM, "'", "''");
			MATT_LT = CTr.Replace(MATT_LT, "'", "''");
			MTJG_LT = CTr.Replace(MTJG_LT, "'", "''");
			BSBS_PR = CTr.Replace(BSBS_PR, "'", "''");
			BTGS_PR = CTr.Replace(BTGS_PR, "'", "''");
			BCAS_PR = CTr.Replace(BCAS_PR, "'", "''");
			JSBS_PR = CTr.Replace(JSBS_PR, "'", "''");
			JTGS_PR = CTr.Replace(JTGS_PR, "'", "''");
			JCAS_PR = CTr.Replace(JCAS_PR, "'", "''");
			BSBS_RT = CTr.Replace(BSBS_RT, "'", "''");
			BTGS_RT = CTr.Replace(BTGS_RT, "'", "''");
			BCAS_RT = CTr.Replace(BCAS_RT, "'", "''");
			JSBS_RT = CTr.Replace(JSBS_RT, "'", "''");
			JTGS_RT = CTr.Replace(JTGS_RT, "'", "''");
			JCAS_RT = CTr.Replace(JCAS_RT, "'", "''");
			JBSBS_PR = CTr.Replace(JBSBS_PR, "'", "''");
			JBTGS_PR = CTr.Replace(JBTGS_PR, "'", "''");
			JBCAS_PR = CTr.Replace(JBCAS_PR, "'", "''");
			JJSBS_PR = CTr.Replace(JJSBS_PR, "'", "''");
			JJTGS_PR = CTr.Replace(JJTGS_PR, "'", "''");
			JJCAS_PR = CTr.Replace(JJCAS_PR, "'", "''");
			BCUST_CNT = CTr.Replace(BCUST_CNT, "'", "''");
			BSALE_PR = CTr.Replace(BSALE_PR, "'", "''");
			JCUST_CNT = CTr.Replace(JCUST_CNT, "'", "''");
			JSALE_PR = CTr.Replace(JSALE_PR, "'", "''");
			TAGR_TM = CTr.Replace(TAGR_TM, "'", "''");
			USE_YN = CTr.Replace(USE_YN, "'", "''");
			MODI_ID = CTr.Replace(MODI_ID, "'", "''");
			SPCL_CD = CTr.Replace(SPCL_CD, "'", "''");
			MCAS_PR = CTr.Replace(MCAS_PR, "'", "''");
			MSALE_PR = CTr.Replace(MSALE_PR, "'", "''");
			MNGT_YR = CTr.Replace(MNGT_YR, "'", "''");
			ESTI_CD = CTr.Replace(ESTI_CD, "'", "''");
			DEPT_SQ = CTr.Replace(DEPT_SQ, "'", "''");
			NUSE_ID = CTr.Replace(NUSE_ID, "'", "''");

			if(CHKBOXBED_USE_YN.equals("Y")) {
				sql = "UPDATE BT_ESTI_DEPT SET ";
				sql += "  BED_HALF_CD = '" + HALF_CD + "'";
				sql += ", BED_DEPT_NM = '" + DEPT_NM + "'";
				sql += ", BED_SUBD_NM = '" + SUBD_NM + "'";
				sql += ", BED_MATT_LT = '" + MATT_LT + "'";
				sql += ", BED_MTJG_LT = '" + MTJG_LT + "'";
				sql += ", BED_BSBS_PR = '" + BSBS_PR + "'";
				sql += ", BED_BTGS_PR = '" + BTGS_PR + "'";
				sql += ", BED_BCAS_PR = '" + BCAS_PR + "'";
				sql += ", BED_JSBS_PR = '" + JSBS_PR + "'";
				sql += ", BED_JTGS_PR = '" + JTGS_PR + "'";
				sql += ", BED_JCAS_PR = '" + JCAS_PR + "'";
				sql += ", BED_BSBS_RT = '" + BSBS_RT + "'";
				sql += ", BED_BTGS_RT = '" + BTGS_RT + "'";
				sql += ", BED_BCAS_RT = '" + BCAS_RT + "'";
				sql += ", BED_JSBS_RT = '" + JSBS_RT + "'";
				sql += ", BED_JTGS_RT = '" + JTGS_RT + "'";
				sql += ", BED_JCAS_RT = '" + JCAS_RT + "'";
				sql += ", BED_JBSBS_PR = '" + JBSBS_PR + "'";
				sql += ", BED_JBTGS_PR = '" + JBTGS_PR + "'";
				sql += ", BED_JBCAS_PR = '" + JBCAS_PR + "'";
				sql += ", BED_JJSBS_PR = '" + JJSBS_PR + "'";
				sql += ", BED_JJTGS_PR = '" + JJTGS_PR + "'";
				sql += ", BED_JJCAS_PR = '" + JJCAS_PR + "'";
				sql += ", BED_BCUST_CNT = '" + BCUST_CNT + "'";
				sql += ", BED_BSALE_PR = '" + BSALE_PR + "'";
				sql += ", BED_JCUST_CNT = '" + JCUST_CNT + "'";
				sql += ", BED_JSALE_PR = '" + JSALE_PR + "'";
				sql += ", BED_TAGR_TM = '" + TAGR_TM + "'";
				sql += ", BED_USE_YN = '" + USE_YN + "'";
				sql += ", BED_MODI_ID = '" + MODI_ID + "'";
				sql += ", BED_MODI_DTT = SYSDATE";
				sql += ", BED_SPCL_CD = '" + SPCL_CD + "'";
				sql += ", BED_MCAS_PR = '" + MCAS_PR + "'";
				sql += ", BED_MSALE_PR = '" + MSALE_PR + "'";
				sql += " WHERE BED_MNGT_YR = '" + MNGT_YR + "'";
				sql += " AND BED_ESTI_CD = '" + ESTI_CD + "'";
				sql += " AND BED_DEPT_SQ = '" + DEPT_SQ + "'";

				argStmtExec.executeUpdate(sql);

			} else {
				sql = "UPDATE BT_ESTI_DEPT SET ";
				sql += "  BED_HALF_CD = '" + HALF_CD + "'";
				sql += ", BED_DEPT_NM = '" + DEPT_NM + "'";
				sql += ", BED_SUBD_NM = '" + SUBD_NM + "'";
				sql += ", BED_MATT_LT = '" + MATT_LT + "'";
				sql += ", BED_MTJG_LT = '" + MTJG_LT + "'";
				sql += ", BED_BSBS_PR = '" + BSBS_PR + "'";
				sql += ", BED_BTGS_PR = '" + BTGS_PR + "'";
				sql += ", BED_BCAS_PR = '" + BCAS_PR + "'";
				sql += ", BED_JSBS_PR = '" + JSBS_PR + "'";
				sql += ", BED_JTGS_PR = '" + JTGS_PR + "'";
				sql += ", BED_JCAS_PR = '" + JCAS_PR + "'";
				sql += ", BED_BSBS_RT = '" + BSBS_RT + "'";
				sql += ", BED_BTGS_RT = '" + BTGS_RT + "'";
				sql += ", BED_BCAS_RT = '" + BCAS_RT + "'";
				sql += ", BED_JSBS_RT = '" + JSBS_RT + "'";
				sql += ", BED_JTGS_RT = '" + JTGS_RT + "'";
				sql += ", BED_JCAS_RT = '" + JCAS_RT + "'";
				sql += ", BED_JBSBS_PR = '" + JBSBS_PR + "'";
				sql += ", BED_JBTGS_PR = '" + JBTGS_PR + "'";
				sql += ", BED_JBCAS_PR = '" + JBCAS_PR + "'";
				sql += ", BED_JJSBS_PR = '" + JJSBS_PR + "'";
				sql += ", BED_JJTGS_PR = '" + JJTGS_PR + "'";
				sql += ", BED_JJCAS_PR = '" + JJCAS_PR + "'";
				sql += ", BED_BCUST_CNT = '" + BCUST_CNT + "'";
				sql += ", BED_BSALE_PR = '" + BSALE_PR + "'";
				sql += ", BED_JCUST_CNT = '" + JCUST_CNT + "'";
				sql += ", BED_JSALE_PR = '" + JSALE_PR + "'";
				sql += ", BED_TAGR_TM = '" + TAGR_TM + "'";
				sql += ", BED_USE_YN = '" + USE_YN + "'";
				sql += ", BED_MODI_ID = '" + MODI_ID + "'";
				sql += ", BED_MODI_DTT = SYSDATE";
				sql += ", BED_SPCL_CD = '" + SPCL_CD + "'";
				sql += ", BED_MCAS_PR = '" + MCAS_PR + "'";
				sql += ", BED_MSALE_PR = '" + MSALE_PR + "'";
				sql += ", BED_NUSE_ID = '" + NUSE_ID + "'";
				sql += ", BED_NUSE_DTT = SYSDATE";
				sql += " WHERE BED_MNGT_YR = '" + MNGT_YR + "'";
				sql += " AND BED_ESTI_CD = '" + ESTI_CD + "'";
				sql += " AND BED_DEPT_SQ = '" + DEPT_SQ + "'";
	
				argStmtExec.executeUpdate(sql);

			}
		} catch (Exception e) {

			throw new FuncException(e.toString(), sql);
		}

		return sql;
	}
%>
