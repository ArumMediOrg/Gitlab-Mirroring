<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%!
	public String func_uSP_Health_XML_COM_006(Statement argStmtExec, HashMap argHtMethod) throws Exception {

		String sql = "";
		String sql2 = "";
		String sql_disp = "";

		try {

			String SSQL_ADD = (String) argHtMethod.get("SSQL_ADD");

			//
			if(SSQL_ADD == null) { SSQL_ADD = ""; }

			//
			// SSQL_ADD = CTr.Replace(SSQL_ADD, "'", "''");

			sql = "INSERT INTO ST_SYMPTOM (SSM_EXAM_DT, SSM_EXAM_SQ, SSM_EXAM_CHA, SSM_SYMP_CD, SSM_SYMP_SQ ,SSM_SYSQ_CD, SSM_SYSQ_NM, SSM_ETC_TX, SSM_INPT_ID, SSM_INPT_DTT) VALUES ";
			sql += SSQL_ADD;

			argStmtExec.executeUpdate(sql);
		} catch (Exception e) {

			throw new FuncException(e.toString(), sql);
		}

		return sql;
	}
%>