<%!
	public String func_uBld_Rslt_ufSaveBldRslt_001(Statement argStmtExec, HashMap argHtMethod) throws Exception {

		String sql = "";
		String sql2 = "";
		String sql_disp = "";

		try {

			String RSLT_VL = (String) argHtMethod.get("RSLT_VL");
			String VLDT_LH = (String) argHtMethod.get("VLDT_LH");
			String PRCH_VL = (String) argHtMethod.get("PRCH_VL");
			String PRNM_VL = (String) argHtMethod.get("PRNM_VL");
			String CHAR_CD = (String) argHtMethod.get("CHAR_CD");
			String HERT_CD = (String) argHtMethod.get("HERT_CD");
			String SPRT_CD = (String) argHtMethod.get("SPRT_CD");
			String MODI_ID = (String) argHtMethod.get("MODI_ID");
			String EXAM_DT = (String) argHtMethod.get("EXAM_DT");
			String EXAM_SQ = (String) argHtMethod.get("EXAM_SQ");
			String ITEM_CD = (String) argHtMethod.get("ITEM_CD");

			//
			if(RSLT_VL == null) { RSLT_VL = ""; }
			if(VLDT_LH == null) { VLDT_LH = ""; }
			if(PRCH_VL == null) { PRCH_VL = ""; }
			if(PRNM_VL == null) { PRNM_VL = ""; }
			if(CHAR_CD == null) { CHAR_CD = ""; }
			if(HERT_CD == null) { HERT_CD = ""; }
			if(SPRT_CD == null) { SPRT_CD = ""; }
			if(MODI_ID == null) { MODI_ID = ""; }
			if(EXAM_DT == null) { EXAM_DT = ""; }
			if(EXAM_SQ == null) { EXAM_SQ = ""; }
			if(ITEM_CD == null) { ITEM_CD = ""; }

			sql = "UPDATE ET_RSLT_ITEM SET ";
			sql += "  ERI_RSLT_VL = '" + RSLT_VL + "'";
			sql += ", ERI_VLDT_LH = '" + VLDT_LH + "'";
			sql += ", ERI_STEP_CD = '2'";
			sql += ", ERI_PRCH_VL = '" + PRCH_VL + "'";
			sql += ", ERI_PRNM_VL = '" + PRNM_VL + "'";
			sql += ", ERI_CHAR_CD = '" + CHAR_CD + "'";
			sql += ", ERI_HERT_CD = '" + HERT_CD + "'";
			sql += ", ERI_SPRT_CD = '" + SPRT_CD + "'";
			sql += ", ERI_CFRM_YN = 'Y'";
			sql += ", ERI_MODI_DTT = SYSDATE";
			sql += ", ERI_MODI_ID = '" + MODI_ID + "'";
			sql += " WHERE ERI_EXAM_DT = '" + EXAM_DT + "'";
			sql += " AND ERI_EXAM_SQ = '" + EXAM_SQ + "'";
			sql += " AND ERI_ITEM_CD = '" + ITEM_CD + "'";

			argStmtExec.executeUpdate(sql);

						CallStmtExec.setString(1,  EXAM_DT);
						CallStmtExec.setString(2,  EXAM_SQ);
						CallStmtExec.setString(3,  ITEM_CD);

						CallStmtExec.executeUpdate();

			sql = "UPDATE ET_EXAM_ACPT SET ";
			sql += "  EEA_BLRT_CD = '1'";
			sql += " WHERE EEA_EXAM_DT = '" + EXAM_DT + "'";
			sql += " AND EEA_EXAM_SQ = '" + EXAM_DT + "'";

			argStmtExec.executeUpdate(sql);

		} catch (Exception e) {

			throw new FuncException(e.toString(), sql);
		}

		return sql;
	}
%>
