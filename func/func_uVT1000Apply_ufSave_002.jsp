<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%!
	public String func_uVT1000Apply_ufSave_002(Statement argStmtExec, HashMap argHtMethod) throws Exception {

		String sql = "";
		String sql2 = "";
		String sql_disp = "";

		try {

			String MARK_CLASS = (String) argHtMethod.get("MARK_CLASS");
			String VIEW_TY = (String) argHtMethod.get("VIEW_TY");
			String VIEW_MEMO_KR = (String) argHtMethod.get("VIEW_MEMO_KR");
			String VIEW_SQ = (String) argHtMethod.get("VIEW_SQ");
			String VIEW_NO = (String) argHtMethod.get("VIEW_NO");
			String VIEW_CD1 = (String) argHtMethod.get("VIEW_CD1");
			String VIEW_CD2 = (String) argHtMethod.get("VIEW_CD2");
			String VIEW_CD3 = (String) argHtMethod.get("VIEW_CD3");
			String VIEW_CD4 = (String) argHtMethod.get("VIEW_CD4");
			String VIEW_CD5 = (String) argHtMethod.get("VIEW_CD5");
			String VIEW_CD6 = (String) argHtMethod.get("VIEW_CD6");
			String ITEM_CNT = (String) argHtMethod.get("ITEM_CNT");
			String USE_YN = (String) argHtMethod.get("USE_YN");
			String FOR_KD = (String) argHtMethod.get("FOR_KD");
			String FOR_RATE = (String) argHtMethod.get("FOR_RATE");
			String AFTE_MON = (String) argHtMethod.get("AFTE_MON");
			String AFTE_CD = (String) argHtMethod.get("AFTE_CD");
			String CLIC_CD = (String) argHtMethod.get("CLIC_CD");
			String MARK_ADD_TX = (String) argHtMethod.get("MARK_ADD_TX");
			String DEV_ADD_TX = (String) argHtMethod.get("DEV_ADD_TX");
			String AUTO_YN = (String) argHtMethod.get("AUTO_YN");
			String INPT_ID = (String) argHtMethod.get("INPT_ID");
			String RGVVM_USE_YN = (String) argHtMethod.get("RGVVM_USE_YN");
			String GUSER = (String) argHtMethod.get("GUSER");

			//
			if(MARK_CLASS == null) { MARK_CLASS = ""; }
			if(VIEW_TY == null) { VIEW_TY = ""; }
			if(VIEW_MEMO_KR == null) { VIEW_MEMO_KR = ""; }
			if(VIEW_SQ == null) { VIEW_SQ = ""; }
			if(VIEW_NO == null) { VIEW_NO = ""; }
			if(VIEW_CD1 == null) { VIEW_CD1 = ""; }
			if(VIEW_CD2 == null) { VIEW_CD2 = ""; }
			if(VIEW_CD3 == null) { VIEW_CD3 = ""; }
			if(VIEW_CD4 == null) { VIEW_CD4 = ""; }
			if(VIEW_CD5 == null) { VIEW_CD5 = ""; }
			if(VIEW_CD6 == null) { VIEW_CD6 = ""; }
			if(ITEM_CNT == null) { ITEM_CNT = ""; }
			if(USE_YN == null) { USE_YN = ""; }
			if(FOR_KD == null) { FOR_KD = ""; }
			if(FOR_RATE == null) { FOR_RATE = ""; }
			if(AFTE_MON == null) { AFTE_MON = ""; }
			if(AFTE_CD == null) { AFTE_CD = ""; }
			if(CLIC_CD == null) { CLIC_CD = ""; }
			if(MARK_ADD_TX == null) { MARK_ADD_TX = ""; }
			if(DEV_ADD_TX == null) { DEV_ADD_TX = ""; }
			if(AUTO_YN == null) { AUTO_YN = ""; }
			if(INPT_ID == null) { INPT_ID = ""; }
			if(RGVVM_USE_YN == null) { RGVVM_USE_YN = ""; }
			if(GUSER == null) { GUSER = ""; }

			//
			MARK_CLASS = CTr.Replace(MARK_CLASS, "'", "''");
			VIEW_TY = CTr.Replace(VIEW_TY, "'", "''");
			VIEW_MEMO_KR = CTr.Replace(VIEW_MEMO_KR, "'", "''");
			VIEW_SQ = CTr.Replace(VIEW_SQ, "'", "''");
			VIEW_NO = CTr.Replace(VIEW_NO, "'", "''");
			VIEW_CD1 = CTr.Replace(VIEW_CD1, "'", "''");
			VIEW_CD2 = CTr.Replace(VIEW_CD2, "'", "''");
			VIEW_CD3 = CTr.Replace(VIEW_CD3, "'", "''");
			VIEW_CD4 = CTr.Replace(VIEW_CD4, "'", "''");
			VIEW_CD5 = CTr.Replace(VIEW_CD5, "'", "''");
			VIEW_CD6 = CTr.Replace(VIEW_CD6, "'", "''");
			ITEM_CNT = CTr.Replace(ITEM_CNT, "'", "''");
			USE_YN = CTr.Replace(USE_YN, "'", "''");
			FOR_KD = CTr.Replace(FOR_KD, "'", "''");
			FOR_RATE = CTr.Replace(FOR_RATE, "'", "''");
			AFTE_MON = CTr.Replace(AFTE_MON, "'", "''");
			AFTE_CD = CTr.Replace(AFTE_CD, "'", "''");
			CLIC_CD = CTr.Replace(CLIC_CD, "'", "''");
			MARK_ADD_TX = CTr.Replace(MARK_ADD_TX, "'", "''");
			DEV_ADD_TX = CTr.Replace(DEV_ADD_TX, "'", "''");
			AUTO_YN = CTr.Replace(AUTO_YN, "'", "''");
			INPT_ID = CTr.Replace(INPT_ID, "'", "''");
			RGVVM_USE_YN = CTr.Replace(RGVVM_USE_YN, "'", "''");
			GUSER = CTr.Replace(GUSER, "'", "''");

			sql = " INSERT INTO VT_VIEW_MAGE (VVM_MARK_CLASS, VVM_VIEW_TY, VVM_VIEW_MEMO_KR, VVM_VIEW_SQ, VVM_VIEW_NO , VVM_VIEW_CD1, VVM_VIEW_CD2, VVM_VIEW_CD3, VVM_VIEW_CD4, VVM_VIEW_CD5, VVM_VIEW_CD6 , VVM_ITEM_CNT, VVM_USE_YN, VVM_FOR_KD, VVM_FOR_RATE , VVM_AFTE_MON, VVM_AFTE_CD, VVM_CLIC_CD, VVM_MARK_ADD_TX, VVM_DEV_ADD_TX, VVM_AUTO_YN , VVM_INPT_DTT, VVM_INPT_ID, VVM_NUSE_ID, VVM_NUSE_DTT) VALUES(";
			sql += "'" + MARK_CLASS + "'";
			sql += ", '" + VIEW_TY + "'";
			sql += ", '" + VIEW_MEMO_KR + "'";
			sql += ", '" + VIEW_SQ + "'";
			sql += ", '" + VIEW_NO + "'";
			sql += ", '" + VIEW_CD1 + "'";
			sql += ", '" + VIEW_CD2 + "'";
			sql += ", '" + VIEW_CD3 + "'";
			sql += ", '" + VIEW_CD4 + "'";
			sql += ", '" + VIEW_CD5 + "'";
			sql += ", '" + VIEW_CD6 + "'";
			sql += ", '" + ITEM_CNT + "'";
			sql += ", '" + USE_YN + "'";
			sql += ", '" + FOR_KD + "'";
			sql += ", '" + FOR_RATE + "'";
			sql += ", '" + AFTE_MON + "'";
			sql += ", '" + AFTE_CD + "'";
			sql += ", '" + CLIC_CD + "'";
			sql += ", '" + MARK_ADD_TX + "'";
			sql += ", '" + DEV_ADD_TX + "'";
			sql += ", '" + AUTO_YN + "'";
			sql += ", SYSDATE";
			sql += ", '" + INPT_ID + "'";

			if(RGVVM_USE_YN.equals("Y")) {
				sql += ", '" + GUSER + "', SYSDATE)";
			} else {
				sql += ", '', NULL)";
			}

			argStmtExec.executeUpdate(sql);

		} catch (Exception e) {

			throw new FuncException(e.toString(), sql);
		}

		return sql;
	}
%>
