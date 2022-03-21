<%!
	public String func_uSP_Health_UF_SP2CHA_CREATE_013(Statement argStmtExec, HashMap argHtMethod) throws Exception {

		String sql = "";
		String sql2 = "";
		String sql_disp = "";

		try {

			String SSQL_ADD = (String) argHtMethod.get("SSQL_ADD");

			//
			if(SSQL_ADD == null) { SSQL_ADD = ""; }

			//
			SSQL_ADD = CTr.Replace(SSQL_ADD, "'", "''");

			sql = "INSERT INTO ET_EXAM_PRICE (EEP_EXAM_DT, EEP_EXAM_SQ, EEP_ORDER_SQ, EEP_ORDER_DT, EEP_ORDER_CD, EEP_CUST_NO, EEP_COMP_CD, EEP_FST_PR, EEP_EXAM_PR, EEP_COMPS_PR, EEP_SDMD_PR, EEP_PSNL_PR, EEP_DMD_PR, EEP_INPT_ID, EEP_INPT_DTT) VALUES ";
			sql += SSQL_ADD;

			argStmtExec.executeUpdate(sql);
		} catch (Exception e) {

			throw new FuncException(e.toString(), sql);
		}

		return sql;
	}
%>
