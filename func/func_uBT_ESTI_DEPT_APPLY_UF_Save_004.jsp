<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%!
	public String func_uBT_ESTI_DEPT_APPLY_UF_Save_004(Statement argStmtExec, HashMap argHtMethod) throws Exception {

		String sql = "";
		String sql2 = "";
		String sql_disp = "";

		try {

			String MNGT_YR = (String) argHtMethod.get("MNGT_YR");
			String ESTI_CD = (String) argHtMethod.get("ESTI_CD");
			String DEPT_SQ = (String) argHtMethod.get("DEPT_SQ");
			String SBCD_CD = (String) argHtMethod.get("SBCD_CD");
			String ITKD_CD = (String) argHtMethod.get("ITKD_CD");
			String BSBS_PR = (String) argHtMethod.get("BSBS_PR");
			String BTGS_PR = (String) argHtMethod.get("BTGS_PR");
			String BCAS_PR = (String) argHtMethod.get("BCAS_PR");
			String JSBS_PR = (String) argHtMethod.get("JSBS_PR");
			String JTGS_PR = (String) argHtMethod.get("JTGS_PR");
			String JCAS_PR = (String) argHtMethod.get("JCAS_PR");
			String INPT_ID = (String) argHtMethod.get("INPT_ID");
			String MCAS_PR = (String) argHtMethod.get("MCAS_PR");

			//
			if(MNGT_YR == null) { MNGT_YR = ""; }
			if(ESTI_CD == null) { ESTI_CD = ""; }
			if(DEPT_SQ == null) { DEPT_SQ = ""; }
			if(SBCD_CD == null) { SBCD_CD = ""; }
			if(ITKD_CD == null) { ITKD_CD = ""; }
			if(BSBS_PR == null) { BSBS_PR = ""; }
			if(BTGS_PR == null) { BTGS_PR = ""; }
			if(BCAS_PR == null) { BCAS_PR = ""; }
			if(JSBS_PR == null) { JSBS_PR = ""; }
			if(JTGS_PR == null) { JTGS_PR = ""; }
			if(JCAS_PR == null) { JCAS_PR = ""; }
			if(INPT_ID == null) { INPT_ID = ""; }
			if(MCAS_PR == null) { MCAS_PR = ""; }

			//
			MNGT_YR = CTr.Replace(MNGT_YR, "'", "''");
			ESTI_CD = CTr.Replace(ESTI_CD, "'", "''");
			DEPT_SQ = CTr.Replace(DEPT_SQ, "'", "''");
			SBCD_CD = CTr.Replace(SBCD_CD, "'", "''");
			ITKD_CD = CTr.Replace(ITKD_CD, "'", "''");
			BSBS_PR = CTr.Replace(BSBS_PR, "'", "''");
			BTGS_PR = CTr.Replace(BTGS_PR, "'", "''");
			BCAS_PR = CTr.Replace(BCAS_PR, "'", "''");
			JSBS_PR = CTr.Replace(JSBS_PR, "'", "''");
			JTGS_PR = CTr.Replace(JTGS_PR, "'", "''");
			JCAS_PR = CTr.Replace(JCAS_PR, "'", "''");
			INPT_ID = CTr.Replace(INPT_ID, "'", "''");
			MCAS_PR = CTr.Replace(MCAS_PR, "'", "''");

			sql = "INSERT INTO BT_ESTI_DEPT_ITEM (BET_MNGT_YR, BET_ESTI_CD, BET_DEPT_SQ, BET_SBCD_CD, BET_ITKD_CD, BET_BSBS_PR, BET_BTGS_PR, BET_BCAS_PR, BET_JSBS_PR, BET_JTGS_PR, BET_JCAS_PR, BET_INPT_ID, BET_INPT_DTT, BET_MCAS_PR) VALUES (";
			sql += "  '" + MNGT_YR + "'";
			sql += ", '" + ESTI_CD + "'";
			sql += ", '" + DEPT_SQ + "'";
			sql += ", '" + SBCD_CD + "'";
			sql += ", '" + ITKD_CD + "'";
			sql += ", '" + BSBS_PR + "'";
			sql += ", '" + BTGS_PR + "'";
			sql += ", '" + BCAS_PR + "'";
			sql += ", '" + JSBS_PR + "'";
			sql += ", '" + JTGS_PR + "'";
			sql += ", '" + JCAS_PR + "'";
			sql += ", '" + INPT_ID + "'";
			sql += ", SYSDATE";
			sql += ", '" + MCAS_PR + "'";
			sql += ")";

			argStmtExec.executeUpdate(sql);

		} catch (Exception e) {

			throw new FuncException(e.toString(), sql);
		}

		return sql;
	}
%>
