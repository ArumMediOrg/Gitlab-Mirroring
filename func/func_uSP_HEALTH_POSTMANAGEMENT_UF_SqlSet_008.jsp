<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%!
	public String func_uSP_HEALTH_POSTMANAGEMENT_UF_SqlSet_008(Statement argStmtExec, HashMap argHtMethod) throws Exception {

		String sql = "";
		String sql2 = "";
		String sql_disp = "";

		Connection connect = argStmtExec.getConnection();
		CallableStatement CallStmtExec = null;

		try {

			String SJIB_CD = (String) argHtMethod.get("SJIB_CD");
			String SEXAM_DT = (String) argHtMethod.get("SEXAM_DT");
			String SEXAM_SQ = (String) argHtMethod.get("SEXAM_SQ");
			String SMATT_CD = (String) argHtMethod.get("SMATT_CD");
			String SMATT_SQ = (String) argHtMethod.get("SMATT_SQ");
			String SORGA_CD = (String) argHtMethod.get("SORGA_CD");
			String SSWING_CD = (String) argHtMethod.get("SSWING_CD");

			//

			if(SJIB_CD == null) { SJIB_CD = ""; }
			if(SEXAM_DT == null) { SEXAM_DT = ""; }
			if(SEXAM_SQ == null) { SEXAM_SQ = ""; }
			if(SMATT_CD == null) { SMATT_CD = ""; }
			if(SMATT_SQ == null) { SMATT_SQ = ""; }
			if(SORGA_CD == null) { SORGA_CD = ""; }
			if(SSWING_CD == null) { SSWING_CD = ""; }

			//

			sql = " Update ST_PANJUNG ";
			sql += " Set SPG_JILH_CD = :sJIB_CD ";
			sql += " Where SPG_EXAM_DT = :sEXAM_DT ";
			sql += " And SPG_EXAM_SQ = :sEXAM_SQ ";
			sql += " And SPG_MATT_CD = :sMATT_CD ";
			sql += " And SPG_MATT_SQ = :sMATT_SQ ";
			sql += " 	And SPG_ORGA_CD = :sORGA_CD ";
			sql += " 	And SPG_SWING_CD = :sSWING_CD ";

			CallStmtExec = connect.prepareCall(sql);

			CallStmtExec.setString(1, SJIB_CD);
			CallStmtExec.setString(2, SEXAM_DT);
			CallStmtExec.setString(3, SEXAM_SQ);
			CallStmtExec.setString(4, SMATT_CD);
			CallStmtExec.setString(5, SMATT_SQ);
			CallStmtExec.setString(6, SORGA_CD);
			CallStmtExec.setString(7, SSWING_CD);

			CallStmtExec.executeUpdate();

		} catch (Exception e) {

			throw new FuncException(e.toString(), sql);
		}

		return sql;
	}
%>
