<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%!
	public String func_uDevc_Rslt_ufSaveDevResultEx_001(Statement argStmtExec, HashMap argHtMethod) throws Exception {

		String sql = "";
		String sql2 = "";
		String sql_disp = "";

		try {

			String RSLT_EX = (String) argHtMethod.get("RSLT_EX");
			String RSLT_KD = (String) argHtMethod.get("RSLT_KD");
			String VLDT_LH = (String) argHtMethod.get("VLDT_LH");
			String USER_ID = (String) argHtMethod.get("USER_ID");
			String EXAM_DT = (String) argHtMethod.get("EXAM_DT");
			String EXAM_SQ = (String) argHtMethod.get("EXAM_SQ");
			String ITEM_CD = (String) argHtMethod.get("ITEM_CD");

			//
			if(RSLT_EX == null) { RSLT_EX = ""; }
			if(RSLT_KD == null) { RSLT_KD = ""; }
			if(VLDT_LH == null) { VLDT_LH = ""; }
			if(USER_ID == null) { USER_ID = ""; }
			if(EXAM_DT == null) { EXAM_DT = ""; }
			if(EXAM_SQ == null) { EXAM_SQ = ""; }
			if(ITEM_CD == null) { ITEM_CD = ""; }

			//
			RSLT_EX = CTr.Replace(RSLT_EX, "'", "''");
			RSLT_KD = CTr.Replace(RSLT_KD, "'", "''");
			VLDT_LH = CTr.Replace(VLDT_LH, "'", "''");
			USER_ID = CTr.Replace(USER_ID, "'", "''");
			EXAM_DT = CTr.Replace(EXAM_DT, "'", "''");
			EXAM_SQ = CTr.Replace(EXAM_SQ, "'", "''");
			ITEM_CD = CTr.Replace(ITEM_CD, "'", "''");

			sql = "UPDATE ET_RSLT_ITEM SET ";
			sql += "  ERI_RSLT_EX = '" + RSLT_EX + "'";
			sql += ", ERI_RSLT_KD = '" + RSLT_KD + "'";
			sql += ", ERI_VLDT_LH = '" + VLDT_LH + "'";

   			if(RSLT_EX.equals("")) {
				sql += ", ERI_CFRM_YN = '' , ERI_VLSV_YN = '' , ERI_INPUT_DTT = NULL";
   			} else {
				sql += ", ERI_CFRM_YN = 'Y' , ERI_VLSV_YN = 'Y' , ERI_INPUT_DTT = SYSDATE";
			}

			sql += ", ERI_MODI_DTT = SYSDATE , ERI_MODI_ID = '" + USER_ID + "'";
			sql += "  WHERE ERI_EXAM_DT = '" + EXAM_DT + "'";
			sql += " AND ERI_EXAM_SQ = '" + EXAM_SQ + "'";
			sql += " AND ERI_ITEM_CD = '" + ITEM_CD + "'";

			argStmtExec.executeUpdate(sql);
		} catch (Exception e) {

			throw new FuncException(e.toString(), sql);
		}

		return sql;
	}
%>
