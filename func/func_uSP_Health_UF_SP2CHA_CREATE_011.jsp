<%!
	public String func_uSP_Health_UF_SP2CHA_CREATE_011(Statement argStmtExec, HashMap argHtMethod) throws Exception {

		String sql = "";
		String sql2 = "";
		String sql_disp = "";

		try {

			String SSQL_ADD = (String) argHtMethod.get("SSQL_ADD");

			//
			if(SSQL_ADD == null) { SSQL_ADD = ""; }

			//
			SSQL_ADD = CTr.Replace(SSQL_ADD, "'", "''");

			sql = "INSERT INTO ET_RSLT_ITEM (ERI_EXAM_DT, ERI_EXAM_SQ, ERI_ITEM_CD, ERI_SPCL_KD, ERI_ADD_KD, ERI_SORT_SQ, ERI_CFRM_YN, ERI_CNCL_YN, ERI_SPMIGUM_YN, ERI_INPT_ID, ERI_INPT_DTT) VALUES ";
			sql += SSQL_ADD;

			argStmtExec.executeUpdate(sql);
		} catch (Exception e) {

			throw new FuncException(e.toString(), sql);
		}

		return sql;
	}
%>
