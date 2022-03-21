<%!
	public String func_uSP_Health_UF_SP2CHA_CREATE_015(Statement argStmtExec, HashMap argHtMethod) throws Exception {

		String sql = "";
		String sql2 = "";
		String sql_disp = "";

		try {

			String SSQL_ADD = (String) argHtMethod.get("SSQL_ADD");

			//
			if(SSQL_ADD == null) { SSQL_ADD = ""; }

			//
			SSQL_ADD = CTr.Replace(SSQL_ADD, "'", "''");

			sql = "INSERT INTO ET_EXAM_ITEM (EEI_EXAM_DT, EEI_EXAM_SQ, EEI_ORDER_DTT, EEI_ORDER_CD, EEI_ITEM_CD, EEI_LINK_NO, EEI_FST_KD, EEI_ORG_PR, EEI_FST_PR, EEI_INPT_ID, EEI_INPT_DTT) VALUES ";
			sql += SSQL_ADD;

			argStmtExec.executeUpdate(sql);
		} catch (Exception e) {

			throw new FuncException(e.toString(), sql);
		}

		return sql;
	}
%>
