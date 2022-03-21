<%!
	public String func_uSP_Health_NEWAutoPanjung_Detail_009(Statement argStmtExec, HashMap argHtMethod) throws Exception {

		String sql = "";
		String sql2 = "";
		String sql_disp = "";

		try {

			String SSQL_ADD = (String) argHtMethod.get("SSQL_ADD");

			//
			if(SSQL_ADD == null) { SSQL_ADD = ""; }

			//
			SSQL_ADD = CTr.Replace(SSQL_ADD, "'", "''");

			sql = "INSERT INTO ST_PANJUNG (SPG_EXAM_DT ,SPG_EXAM_SQ ,SPG_EXAM_CHA ,SPG_MATT_CD ,SPG_MATT_SQ, SPG_ORGA_CD ,SPG_SWING_CD ,SPG_SLNS_KD ,SPG_SOKY_CD ,SPG_SOKY_NM, SPG_PANJ_CD ,SPG_JOCHI_CD ,SPG_JOCHI_NM ,SPG_JILH_CD ,SPG_POSM1_CD, SPG_POSM2_CD ,SPG_POSM3_CD ,SPG_POSM1_TX ,SPG_POSM2_TX ,SPG_POSM3_TX, SPG_POSM1_DT ,SPG_POSM2_DT ,SPG_POSM3_DT ,SPG_BUSI_CD ,SPG_REMARK, SPG_ETC_TX ,SPG_ORSU_CD ,SPG_CYCLE_CD ,SPG_CYCLE_TX ,SPG_CYCLE_DT, SPG_PANJ_DT ,SPG_DOCT_CD ,SPG_INPT_ID ,SPG_INPT_DTT ,SPG_SOKY_TX, SPG_ORGA_ETC) VALUES ";
			sql += SSQL_ADD;

			argStmtExec.executeUpdate(sql);
		} catch (Exception e) {

			throw new FuncException(e.toString(), sql);
		}

		return sql;
	}
%>
