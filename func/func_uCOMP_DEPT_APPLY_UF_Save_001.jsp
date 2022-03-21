<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%!
	public String func_uCOMP_DEPT_APPLY_UF_Save_001(Statement argStmtExec, HashMap argHtMethod) throws Exception {

		String sql = "";
		String sql2 = "";
		String sql_disp = "";

		try {

			String SMODE = (String) argHtMethod.get("SMODE");
			String COMP_CD = (String) argHtMethod.get("COMP_CD");
			String MNGT_YR = (String) argHtMethod.get("MNGT_YR");
			String HALF_CD = (String) argHtMethod.get("HALF_CD");
			String DEPT_CD = (String) argHtMethod.get("DEPT_CD");
			String DEPT_NM = (String) argHtMethod.get("DEPT_NM");
			String SUBD_NM = (String) argHtMethod.get("SUBD_NM");
			String TCHK_YN = (String) argHtMethod.get("TCHK_YN");
			String MATT_LT = (String) argHtMethod.get("MATT_LT");
			String MTJG_LT = (String) argHtMethod.get("MTJG_LT");
			String TBAS_CD = (String) argHtMethod.get("TBAS_CD");
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
			String JSBS_PR_SEC = (String) argHtMethod.get("JSBS_PR_SEC");
			String JTGS_PR_SEC = (String) argHtMethod.get("JTGS_PR_SEC");
			String JCAS_PR_SEC = (String) argHtMethod.get("JCAS_PR_SEC");
			String JSBS_RT_SEC = (String) argHtMethod.get("JSBS_RT_SEC");
			String JTGS_RT_SEC = (String) argHtMethod.get("JTGS_RT_SEC");
			String JCAS_RT_SEC = (String) argHtMethod.get("JCAS_RT_SEC");
			String JJSBS_PR_SEC = (String) argHtMethod.get("JJSBS_PR_SEC");
			String JJTGS_PR_SEC = (String) argHtMethod.get("JJTGS_PR_SEC");
			String JJCAS_PR_SEC = (String) argHtMethod.get("JJCAS_PR_SEC");
			String TAGR_TM = (String) argHtMethod.get("TAGR_TM");
			String USE_YN = (String) argHtMethod.get("USE_YN");
			String USER_ID = (String) argHtMethod.get("USER_ID");
			String SPCL_CD = (String) argHtMethod.get("SPCL_CD");

			//
			if(SMODE == null) { SMODE = ""; }
			if(COMP_CD == null) { COMP_CD = ""; }
			if(MNGT_YR == null) { MNGT_YR = ""; }
			if(HALF_CD == null) { HALF_CD = ""; }
			if(DEPT_CD == null) { DEPT_CD = ""; }
			if(DEPT_NM == null) { DEPT_NM = ""; }
			if(SUBD_NM == null) { SUBD_NM = ""; }
			if(TCHK_YN == null) { TCHK_YN = ""; }
			if(MATT_LT == null) { MATT_LT = ""; }
			if(MTJG_LT == null) { MTJG_LT = ""; }
			if(TBAS_CD == null) { TBAS_CD = ""; }
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
			if(JSBS_PR_SEC == null) { JSBS_PR_SEC = ""; }
			if(JTGS_PR_SEC == null) { JTGS_PR_SEC = ""; }
			if(JCAS_PR_SEC == null) { JCAS_PR_SEC = ""; }
			if(JSBS_RT_SEC == null) { JSBS_RT_SEC = ""; }
			if(JTGS_RT_SEC == null) { JTGS_RT_SEC = ""; }
			if(JCAS_RT_SEC == null) { JCAS_RT_SEC = ""; }
			if(JJSBS_PR_SEC == null) { JJSBS_PR_SEC = ""; }
			if(JJTGS_PR_SEC == null) { JJTGS_PR_SEC = ""; }
			if(JJCAS_PR_SEC == null) { JJCAS_PR_SEC = ""; }
			if(TAGR_TM == null) { TAGR_TM = ""; }
			if(USE_YN == null) { USE_YN = ""; }
			if(USER_ID == null) { USER_ID = ""; }
			if(SPCL_CD == null) { SPCL_CD = ""; }

			//
			SMODE = CTr.Replace(SMODE, "'", "''");
			COMP_CD = CTr.Replace(COMP_CD, "'", "''");
			MNGT_YR = CTr.Replace(MNGT_YR, "'", "''");
			HALF_CD = CTr.Replace(HALF_CD, "'", "''");
			DEPT_CD = CTr.Replace(DEPT_CD, "'", "''");
			DEPT_NM = CTr.Replace(DEPT_NM, "'", "''");
			SUBD_NM = CTr.Replace(SUBD_NM, "'", "''");
			TCHK_YN = CTr.Replace(TCHK_YN, "'", "''");
			MATT_LT = CTr.Replace(MATT_LT, "'", "''");
			MTJG_LT = CTr.Replace(MTJG_LT, "'", "''");
			TBAS_CD = CTr.Replace(TBAS_CD, "'", "''");
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
			JSBS_PR_SEC = CTr.Replace(JSBS_PR_SEC, "'", "''");
			JTGS_PR_SEC = CTr.Replace(JTGS_PR_SEC, "'", "''");
			JCAS_PR_SEC = CTr.Replace(JCAS_PR_SEC, "'", "''");
			JSBS_RT_SEC = CTr.Replace(JSBS_RT_SEC, "'", "''");
			JTGS_RT_SEC = CTr.Replace(JTGS_RT_SEC, "'", "''");
			JCAS_RT_SEC = CTr.Replace(JCAS_RT_SEC, "'", "''");
			JJSBS_PR_SEC = CTr.Replace(JJSBS_PR_SEC, "'", "''");
			JJTGS_PR_SEC = CTr.Replace(JJTGS_PR_SEC, "'", "''");
			JJCAS_PR_SEC = CTr.Replace(JJCAS_PR_SEC, "'", "''");
			TAGR_TM = CTr.Replace(TAGR_TM, "'", "''");
			USE_YN = CTr.Replace(USE_YN, "'", "''");
			USER_ID = CTr.Replace(USER_ID, "'", "''");
			SPCL_CD = CTr.Replace(SPCL_CD, "'", "''");

			if(SMODE.equals("INSERT")) {

				sql = "INSERT INTO IT_COMP_DEPT (ICD_COMP_CD ,ICD_MNGT_YR ,ICD_HALF_CD ,ICD_DEPT_CD ,ICD_DEPT_NM ,ICD_SUBD_NM ,ICD_TCHK_YN ,ICD_MATT_LT ,ICD_MTJG_LT ,ICD_TBAS_CD ,ICD_BSBS_PR ,ICD_BTGS_PR ,ICD_BCAS_PR ,ICD_JSBS_PR ,ICD_JTGS_PR ,ICD_JCAS_PR ,ICD_BSBS_RT ,ICD_BTGS_RT ,ICD_BCAS_RT ,ICD_JSBS_RT ,ICD_JTGS_RT ,ICD_JCAS_RT ,ICD_JBSBS_PR ,ICD_JBTGS_PR ,ICD_JBCAS_PR ,ICD_JJSBS_PR ,ICD_JJTGS_PR ,ICD_DSBS_PR ,ICD_DTGS_PR ,ICD_DCAS_PR ,ICD_DSBS_RT ,ICD_DTGS_RT ,ICD_DCAS_RT ,ICD_JDSBS_PR ,ICD_JDTGS_PR ,ICD_JDCAS_PR ,ICD_JJCAS_PR ,ICD_TAGR_TM ,ICD_USE_YN ,ICD_NUSE_ID ,ICD_NUSE_DTT ,ICD_INPT_ID ,ICD_INPT_DTT ,ICD_SPCL_CD) VALUES (";
				sql += "  '" + COMP_CD + "'";
				sql += ", '" + MNGT_YR + "'";
				sql += ", '" + HALF_CD + "'";
				sql += ", '" + DEPT_CD + "'";
				sql += ", '" + DEPT_NM + "'";
				sql += ", '" + SUBD_NM + "'";
				sql += ", '" + TCHK_YN + "'";
				sql += ", '" + MATT_LT + "'";
				sql += ", '" + MTJG_LT + "'";
				sql += ", '" + TBAS_CD + "'";
				sql += ", '" + BSBS_PR + "'";
				sql += ", '" + BTGS_PR + "'";
				sql += ", '" + BCAS_PR + "'";
				sql += ", '" + JSBS_PR + "'";
				sql += ", '" + JTGS_PR + "'";
				sql += ", '" + JCAS_PR + "'";
				sql += ", '" + BSBS_RT + "'";
				sql += ", '" + BTGS_RT + "'";
				sql += ", '" + BCAS_RT + "'";
				sql += ", '" + JSBS_RT + "'";
				sql += ", '" + JTGS_RT + "'";
				sql += ", '" + JCAS_RT + "'";
				sql += ", '" + JBSBS_PR + "'";
				sql += ", '" + JBTGS_PR + "'";
				sql += ", '" + JBCAS_PR + "'";
				sql += ", '" + JJSBS_PR + "'";
				sql += ", '" + JJTGS_PR + "'";
				sql += ", '" + JJCAS_PR + "'";
				sql += ", '" + JSBS_PR_SEC + "'";
				sql += ", '" + JTGS_PR_SEC + "'";
				sql += ", '" + JCAS_PR_SEC + "'";
				sql += ", '" + JSBS_RT_SEC + "'";
				sql += ", '" + JTGS_RT_SEC + "'";
				sql += ", '" + JCAS_RT_SEC + "'";
				sql += ", '" + JJSBS_PR_SEC + "'";
				sql += ", '" + JJTGS_PR_SEC + "'";
				sql += ", '" + JJCAS_PR_SEC + "'";
				sql += ", '" + TAGR_TM + "'";
				sql += ", '" + USE_YN + "'";
				sql += ", '" + USER_ID + "'";
				sql += ", SYSDATE";
				sql += ", '" + USER_ID + "'";
				sql += ", SYSDATE";
				sql += ", '" + SPCL_CD + "'";
				sql += ")";

				argStmtExec.executeUpdate(sql);
			} else {
			
				sql = "UPDATE IT_COMP_DEPT SET ";
				sql += "  ICD_DEPT_NM = '" + DEPT_NM + "'";
				sql += ", ICD_SUBD_NM = '" + SUBD_NM + "'";
				sql += ", ICD_TCHK_YN = '" + TCHK_YN + "'";
				sql += ", ICD_MATT_LT = '" + MATT_LT + "'";
				sql += ", ICD_MTJG_LT = '" + MTJG_LT + "'";
				sql += ", ICD_TBAS_CD = '" + TBAS_CD + "'";
				sql += ", ICD_BSBS_PR = '" + BSBS_PR + "'";
				sql += ", ICD_BTGS_PR = '" + BTGS_PR + "'";
				sql += ", ICD_BCAS_PR = '" + BCAS_PR + "'";
				sql += ", ICD_JSBS_PR = '" + JSBS_PR + "'";
				sql += ", ICD_JTGS_PR = '" + JTGS_PR + "'";
				sql += ", ICD_JCAS_PR = '" + JCAS_PR + "'";
				sql += ", ICD_BSBS_RT = '" + BSBS_RT + "'";
				sql += ", ICD_BTGS_RT = '" + BTGS_RT + "'";
				sql += ", ICD_BCAS_RT = '" + BCAS_RT + "'";
				sql += ", ICD_JSBS_RT = '" + JSBS_RT + "'";
				sql += ", ICD_JTGS_RT = '" + JTGS_RT + "'";
				sql += ", ICD_JCAS_RT = '" + JCAS_RT + "'";
				sql += ", ICD_JBSBS_PR = '" + JBSBS_PR + "'";
				sql += ", ICD_JBTGS_PR = '" + JBTGS_PR + "'";
				sql += ", ICD_JBCAS_PR = '" + JBCAS_PR + "'";
				sql += ", ICD_JJSBS_PR = '" + JJSBS_PR + "'";
				sql += ", ICD_JJTGS_PR = '" + JJTGS_PR + "'";
				sql += ", ICD_JJCAS_PR = '" + JJCAS_PR + "'";
				sql += ", ICD_DSBS_PR = '" + JSBS_PR_SEC + "'";
				sql += ", ICD_DTGS_PR = '" + JTGS_PR_SEC + "'";
				sql += ", ICD_DCAS_PR = '" + JCAS_PR_SEC + "'";
				sql += ", ICD_DSBS_RT = '" + JSBS_RT_SEC + "'";
				sql += ", ICD_DTGS_RT = '" + JTGS_RT_SEC + "'";
				sql += ", ICD_DCAS_RT = '" + JCAS_RT_SEC + "'";
				sql += ", ICD_JDSBS_PR = '" + JJSBS_PR_SEC + "'";
				sql += ", ICD_JDTGS_PR = '" + JJTGS_PR_SEC + "'";
				sql += ", ICD_JDCAS_PR = '" + JJCAS_PR_SEC + "'";
				sql += ", ICD_TAGR_TM = '" + TAGR_TM + "'";
				sql += ", ICD_USE_YN = '" + USE_YN + "'";
				sql += ", ICD_NUSE_ID = '" + USER_ID + "'";
				sql += ", ICD_NUSE_DTT = SYSDATE";
				sql += ", ICD_MODI_ID = '" + USER_ID + "'";
				sql += ", ICD_MODI_DTT = SYSDATE";
				sql += ", ICD_SPCL_CD = '" + SPCL_CD + "'";
				sql += " WHERE ICD_COMP_CD = '" + COMP_CD + "'";
				sql += " AND ICD_MNGT_YR = '" + MNGT_YR + "'";
				sql += " AND ICD_HALF_CD = '" + HALF_CD + "'";
				sql += " AND ICD_DEPT_CD = '" + DEPT_CD + "'";

				argStmtExec.executeUpdate(sql);
			}

		} catch (Exception e) {

			throw new FuncException(e.toString(), sql);
		}

		return sql;
	}
%>
