<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%!
	public String func_uVT1000Apply_ufSave_004(Statement argStmtExec, HashMap argHtMethod) throws Exception {

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
			String MODI_ID = (String) argHtMethod.get("MODI_ID");
			String RGVVM_USE_YN = (String) argHtMethod.get("RGVVM_USE_YN");
			String GUSER = (String) argHtMethod.get("GUSER");
			String AUTO_YN = (String) argHtMethod.get("AUTO_YN");
			String MARK2_CLASS = (String) argHtMethod.get("MARK2_CLASS");
			String VIEW2_CD1 = (String) argHtMethod.get("VIEW2_CD1");
			String VIEW2_CD2 = (String) argHtMethod.get("VIEW2_CD2");
			String VIEW2_CD3 = (String) argHtMethod.get("VIEW2_CD3");
			String VIEW2_CD4 = (String) argHtMethod.get("VIEW2_CD4");
			String VIEW2_CD5 = (String) argHtMethod.get("VIEW2_CD5");
			String VIEW2_CD6 = (String) argHtMethod.get("VIEW2_CD6");
			String VIEW2_NO = (String) argHtMethod.get("VIEW2_NO");

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
			if(MODI_ID == null) { MODI_ID = ""; }
			if(RGVVM_USE_YN == null) { RGVVM_USE_YN = ""; }
			if(GUSER == null) { GUSER = ""; }
			if(AUTO_YN == null) { AUTO_YN = ""; }
			if(MARK2_CLASS == null) { MARK2_CLASS = ""; }
			if(VIEW2_CD1 == null) { VIEW2_CD1 = ""; }
			if(VIEW2_CD2 == null) { VIEW2_CD2 = ""; }
			if(VIEW2_CD3 == null) { VIEW2_CD3 = ""; }
			if(VIEW2_CD4 == null) { VIEW2_CD4 = ""; }
			if(VIEW2_CD5 == null) { VIEW2_CD5 = ""; }
			if(VIEW2_CD6 == null) { VIEW2_CD6 = ""; }
			if(VIEW2_NO == null) { VIEW2_NO = ""; }

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
			MODI_ID = CTr.Replace(MODI_ID, "'", "''");
			RGVVM_USE_YN = CTr.Replace(RGVVM_USE_YN, "'", "''");
			GUSER = CTr.Replace(GUSER, "'", "''");
			AUTO_YN = CTr.Replace(AUTO_YN, "'", "''");
			MARK2_CLASS = CTr.Replace(MARK2_CLASS, "'", "''");
			VIEW2_CD1 = CTr.Replace(VIEW2_CD1, "'", "''");
			VIEW2_CD2 = CTr.Replace(VIEW2_CD2, "'", "''");
			VIEW2_CD3 = CTr.Replace(VIEW2_CD3, "'", "''");
			VIEW2_CD4 = CTr.Replace(VIEW2_CD4, "'", "''");
			VIEW2_CD5 = CTr.Replace(VIEW2_CD5, "'", "''");
			VIEW2_CD6 = CTr.Replace(VIEW2_CD6, "'", "''");
			VIEW2_NO = CTr.Replace(VIEW2_NO, "'", "''");

			sql = "UPDATE VT_VIEW_MAGE SET ";
			sql += "  VVM_MARK_CLASS = '" + MARK_CLASS + "'";
			sql += ", VVM_VIEW_TY = '" + VIEW_TY + "'";
			sql += ", VVM_VIEW_MEMO_KR = '" + VIEW_MEMO_KR + "'";
			sql += ", VVM_VIEW_SQ = '" + VIEW_SQ + "'";
			sql += ", VVM_VIEW_NO = '" + VIEW_NO + "'";
			sql += ", VVM_VIEW_CD1 = '" + VIEW_CD1 + "'";
			sql += ", VVM_VIEW_CD2 = '" + VIEW_CD2 + "'";
			sql += ", VVM_VIEW_CD3 = '" + VIEW_CD3 + "'";
			sql += ", VVM_VIEW_CD4 = '" + VIEW_CD4 + "'";
			sql += ", VVM_VIEW_CD5 = '" + VIEW_CD5 + "'";
			sql += ", VVM_VIEW_CD6 = '" + VIEW_CD6 + "'";
			sql += ", VVM_ITEM_CNT = '" + ITEM_CNT + "'";
			sql += ", VVM_USE_YN = '" + USE_YN + "'";
			sql += ", VVM_FOR_KD = '" + FOR_KD + "'";
			sql += ", VVM_FOR_RATE = '" + FOR_RATE + "'";
			sql += ", VVM_AFTE_MON = '" + AFTE_MON + "'";
			sql += ", VVM_AFTE_CD = '" + AFTE_CD + "'";
			sql += ", VVM_CLIC_CD = '" + CLIC_CD + "'";
			sql += ", VVM_MARK_ADD_TX = '" + MARK_ADD_TX + "'";
			sql += ", VVM_DEV_ADD_TX = '" + DEV_ADD_TX + "'";
			sql += ", VVM_MODI_DTT = SYSDATE";
			sql += ", VVM_MODI_ID = '" + MODI_ID + "'";

			if(RGVVM_USE_YN.equals("Y")) {
				sql += ", VVM_NUSE_ID = '" + GUSER + "'";
				sql += ", VVM_NUSE_DTT= SYSDATE";
			}
			else {
				sql += ", VVM_NUSE_ID = ''";
				sql += ", VVM_NUSE_DTT = NULL";
			}

			sql += ", VVM_AUTO_YN = '" + AUTO_YN + "'";
			sql += " WHERE VVM_MARK_CLASS = '" + MARK2_CLASS + "'";
			sql += " AND VVM_VIEW_CD1 = '" + VIEW2_CD1 + "'";
			sql += " AND VVM_VIEW_CD2 = '" + VIEW2_CD2 + "'";
			sql += " AND VVM_VIEW_CD3 = '" + VIEW2_CD3 + "'";
			sql += " AND VVM_VIEW_CD4 = '" + VIEW2_CD4 + "'";
			sql += " AND VVM_VIEW_CD5 = '" + VIEW2_CD5 + "'";
			sql += " AND VVM_VIEW_CD6 = '" + VIEW2_CD6 + "'";
			sql += " AND VVM_VIEW_NO = '" + VIEW2_NO + "'";


			argStmtExec.executeUpdate(sql);
		} catch (Exception e) {

			throw new FuncException(e.toString(), sql);
		}

		return sql;
	}
%>
