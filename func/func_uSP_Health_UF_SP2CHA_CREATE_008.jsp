<%!
	public String func_uSP_Health_UF_SP2CHA_CREATE_008(Statement argStmtExec, HashMap argHtMethod) throws Exception {

		String sql = "";
		String sql2 = "";
		String sql_disp = "";

		try {

			String SSQL_ADD = (String) argHtMethod.get("SSQL_ADD");

			//
			if(SSQL_ADD == null) { SSQL_ADD = ""; }

			//
			SSQL_ADD = CTr.Replace(SSQL_ADD, "'", "''");

			sql = "INSERT INTO ST_ITEM_RECHECK (SIR_EXAM_DT, SIR_EXAM_SQ, SIR_EXAM_CHA, SIR_MATT_CD, SIR_ORGA_CD, SIR_MKJJ_CD, SIR_SWING_CD, SIR_CUST_NO, SIR_EITEM_LT, SIR_EXAM_DT2, SIR_EXAM_SQ2, SIR_ETITEM_LT, SIR_INPT_ID, SIR_INPT_DTT) VALUES ";
			sql += SSQL_ADD;

			argStmtExec.executeUpdate(sql);
		} catch (Exception e) {

			throw new FuncException(e.toString(), sql);
		}

		return sql;
	}
%>
