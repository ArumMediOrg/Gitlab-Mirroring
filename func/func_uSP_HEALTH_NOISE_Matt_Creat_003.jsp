<%!
	public String func_uSP_HEALTH_NOISE_Matt_Creat_003(Statement argStmtExec, HashMap argHtMethod) throws Exception {

		String sql = "";
		String sql2 = "";
		String sql_disp = "";

		try {

			String SSQL_ADD = (String) argHtMethod.get("SSQL_ADD");

			//
			if(SSQL_ADD == null) { SSQL_ADD = ""; }

			//
			SSQL_ADD = CTr.Replace(SSQL_ADD, "'", "''");

			sql = "INSERT INTO ST_PANJUNG (SPG_EXAM_DT, SPG_EXAM_SQ, SPG_EXAM_CHA, SPG_MATT_CD, SPG_MATT_SQ, SPG_PANJ_DT, SPG_SLNS_KD, SPG_SWING_CD) VALUES ";
			sql += SSQL_ADD;

			argStmtExec.executeUpdate(sql);
		} catch (Exception e) {

			throw new FuncException(e.toString(), sql);
		}

		return sql;
	}
%>
