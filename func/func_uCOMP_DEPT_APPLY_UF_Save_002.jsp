<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%!
	public String func_uCOMP_DEPT_APPLY_UF_Save_002(Statement argStmtExec, HashMap argHtMethod) throws Exception {

		String sql = "";
		String sql2 = "";
		String sql_disp = "";

		try {

			String COMP_CD = (String) argHtMethod.get("COMP_CD");
			String MNGT_YR = (String) argHtMethod.get("MNGT_YR");
			String HALF_CD = (String) argHtMethod.get("HALF_CD");
			String DEPT_CD = (String) argHtMethod.get("DEPT_CD");
			String SBCD_CD = (String) argHtMethod.get("SBCD_CD");
			String ITKD_CD = (String) argHtMethod.get("ITKD_CD");
			String BSBS_PR = (String) argHtMethod.get("BSBS_PR");
			String BTGS_PR = (String) argHtMethod.get("BTGS_PR");
			String BCAS_PR = (String) argHtMethod.get("BCAS_PR");
			String JSBS_PR = (String) argHtMethod.get("JSBS_PR");
			String JTGS_PR = (String) argHtMethod.get("JTGS_PR");
			String JCAS_PR = (String) argHtMethod.get("JCAS_PR");
			String USE_YN = (String) argHtMethod.get("USE_YN");
			String USER_ID = (String) argHtMethod.get("USER_ID");

			//
			if(COMP_CD == null) { COMP_CD = ""; }
			if(MNGT_YR == null) { MNGT_YR = ""; }
			if(HALF_CD == null) { HALF_CD = ""; }
			if(DEPT_CD == null) { DEPT_CD = ""; }
			if(SBCD_CD == null) { SBCD_CD = ""; }
			if(ITKD_CD == null) { ITKD_CD = ""; }
			if(BSBS_PR == null) { BSBS_PR = ""; }
			if(BTGS_PR == null) { BTGS_PR = ""; }
			if(BCAS_PR == null) { BCAS_PR = ""; }
			if(JSBS_PR == null) { JSBS_PR = ""; }
			if(JTGS_PR == null) { JTGS_PR = ""; }
			if(JCAS_PR == null) { JCAS_PR = ""; }
			if(USE_YN == null) { USE_YN = ""; }
			if(USER_ID == null) { USER_ID = ""; }

			//
			COMP_CD = CTr.Replace(COMP_CD, "'", "''");
			MNGT_YR = CTr.Replace(MNGT_YR, "'", "''");
			HALF_CD = CTr.Replace(HALF_CD, "'", "''");
			DEPT_CD = CTr.Replace(DEPT_CD, "'", "''");
			SBCD_CD = CTr.Replace(SBCD_CD, "'", "''");
			ITKD_CD = CTr.Replace(ITKD_CD, "'", "''");
			BSBS_PR = CTr.Replace(BSBS_PR, "'", "''");
			BTGS_PR = CTr.Replace(BTGS_PR, "'", "''");
			BCAS_PR = CTr.Replace(BCAS_PR, "'", "''");
			JSBS_PR = CTr.Replace(JSBS_PR, "'", "''");
			JTGS_PR = CTr.Replace(JTGS_PR, "'", "''");
			JCAS_PR = CTr.Replace(JCAS_PR, "'", "''");
			USE_YN = CTr.Replace(USE_YN, "'", "''");
			USER_ID = CTr.Replace(USER_ID, "'", "''");

			sql = "INSERT INTO IT_COMP_DEPT_ITEM (ICI_COMP_CD ,ICI_MNGT_YR ,ICI_HALF_CD ,ICI_DEPT_CD ,ICI_SBCD_CD ,ICI_ITKD_CD ,ICI_BSBS_PR ,ICI_BTGS_PR ,ICI_BCAS_PR ,ICI_JSBS_PR ,ICI_JTGS_PR ,ICI_JCAS_PR ,ICI_USE_YN ,ICI_NUSE_ID ,ICI_NUSE_DTT ,ICI_INPT_ID ,ICI_INPT_DTT) VALUES (";
			sql += "  '" + COMP_CD + "'";
			sql += ", '" + MNGT_YR + "'";
			sql += ", '" + HALF_CD + "'";
			sql += ", '" + DEPT_CD + "'";
			sql += ", '" + SBCD_CD + "'";
			sql += ", '" + ITKD_CD + "'";
			sql += ", '" + BSBS_PR + "'";
			sql += ", '" + BTGS_PR + "'";
			sql += ", '" + BCAS_PR + "'";
			sql += ", '" + JSBS_PR + "'";
			sql += ", '" + JTGS_PR + "'";
			sql += ", '" + JCAS_PR + "'";
			sql += ", '" + USE_YN + "'";
			sql += ", '" + USER_ID + "'";
			sql += ", SYSDATE";
			sql += ", '" + USER_ID + "'";
			sql += ", SYSDATE";
			sql += ")";

			argStmtExec.executeUpdate(sql);

		} catch (Exception e) {

			throw new FuncException(e.toString(), sql);
		}

		return sql;
	}
%>
