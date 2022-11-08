<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%!
	public String func_uCRM_BASIC_CRMMain_Save_004(Statement argStmtExec, HashMap argHtMethod) throws Exception {

		String sql = "";
		String sql2 = "";
		String sql_disp = "";

		Connection connect = argStmtExec.getConnection();
		CallableStatement CallStmtExec = null;

		try {

			String SSQL_ADD1 = (String) argHtMethod.get("SSQL_ADD1");

			//

			if(SSQL_ADD1 == null) { SSQL_ADD1 = ""; }

			//

			sql = " INSERT INTO ST_ADVICE  \n";
			sql += " (SAE_ADVI_DT, SAE_CUST_NO, SAE_ADVI_SQ, SAE_EXAM_DT, SAE_EXAM_SQ, SAE_EXAM_CHA, SAE_NEXT_DT,  \n";
			sql += " SAE_ADVI_CD, SAE_ADVI_TX, SAE_NURSE_ID, SAE_DOCT_ID, SAE_INPT_ID, SAE_INPT_DTT, SAE_USE_YN,  \n";
			sql += " SAE_ADVI_STEP, SAE_RSVT_NO)  \n";
			sql += " VALUES  \n";
			sql += " ( " + SSQL_ADD1 + " \n";


			CallStmtExec = connect.prepareCall(sql);

			//CallStmtExec.setString(1, SSQL_ADD1);
			//System.out.println(sql + SSQL_ADD1);

			CallStmtExec.executeUpdate();



		} catch (Exception e) {

			throw new FuncException(e.toString(), sql);
		}

		return sql;
	}
%>
