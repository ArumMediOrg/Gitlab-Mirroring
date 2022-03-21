<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%!
	public String func_uSP_HealthPlan_btnSaveClick_002(Statement argStmtExec, HashMap argHtMethod) throws Exception {

		String sql = "";
		String sql2 = "";
		String sql_disp = "";

		Connection connect = argStmtExec.getConnection();
		CallableStatement CallStmtExec = null;

		try {

			String SGUBN = (String) argHtMethod.get("SGUBN");
			String COMP_CD = (String) argHtMethod.get("COMP_CD");
			String SAVE_DT = (String) argHtMethod.get("SAVE_DT");
			String SAVE_SQ = (String) argHtMethod.get("SAVE_SQ");
			String DEPT_SQ = (String) argHtMethod.get("DEPT_SQ");
			String PSNL_SQ = (String) argHtMethod.get("PSNL_SQ");
			String PSNL_NM = (String) argHtMethod.get("PSNL_NM");
			String EXAM_DT = (String) argHtMethod.get("EXAM_DT");
			String BIRT_DT = (String) argHtMethod.get("BIRT_DT");
			String JOB_CD = (String) argHtMethod.get("JOB_CD");
			String ENTR_DT = (String) argHtMethod.get("ENTR_DT");
			String CHECKTO_DT = (String) argHtMethod.get("CHECKTO_DT");
			String INPT_ID = (String) argHtMethod.get("INPT_ID");

			//


			if(SGUBN == null) { SGUBN = ""; }
			if(COMP_CD == null) { COMP_CD = ""; }
			if(SAVE_DT == null) { SAVE_DT = ""; }
			if(SAVE_SQ == null) { SAVE_SQ = ""; }
			if(DEPT_SQ == null) { DEPT_SQ = ""; }
			if(PSNL_SQ == null) { PSNL_SQ = ""; }
			if(PSNL_NM == null) { PSNL_NM = ""; }
			if(EXAM_DT == null) { EXAM_DT = ""; }
			if(BIRT_DT == null) { BIRT_DT = ""; }
			if(JOB_CD == null) { JOB_CD = ""; }
			if(ENTR_DT == null) { ENTR_DT = ""; }
			if(CHECKTO_DT == null) { CHECKTO_DT = ""; }
			if(INPT_ID == null) { INPT_ID = ""; }

			//

			if (SGUBN.equals("0")){

				sql += " Insert Into SP_PLAN_PSNL_DATA ";
				sql += " (SPP_COMP_CD, SPP_SAVE_DT, SPP_SAVE_SQ, SPP_DEPT_SQ, SPP_PSNL_SQ, ";
				sql += " SPP_PSNL_NM, SPP_EXAM_DT, SPP_BIRT_DT, SPP_JOB_CD,  SPP_ENTR_DT, ";
				sql += " SPP_INPT_ID, SPP_INPT_DTT) ";
				sql += " Values( ";
				sql += " ? , ";
				sql += " ? , ";
				sql += " ? , ";
				sql += " ? , ";
				sql += " ? , ";
				sql += " ? , ";
				sql += " ? , ";
				sql += " ? , ";
				sql += " ? , ";
				sql += " ? , ";
				sql += " ? , ";
				sql += " sysdate) ";

				CallStmtExec = connect.prepareCall(sql);

				CallStmtExec.setString(1, COMP_CD);
				CallStmtExec.setString(2, SAVE_DT);
				CallStmtExec.setString(3, SAVE_SQ);
				CallStmtExec.setString(4, DEPT_SQ);
				CallStmtExec.setString(5, PSNL_SQ);
				CallStmtExec.setString(6, PSNL_NM);
				CallStmtExec.setString(7, EXAM_DT);
				CallStmtExec.setString(8, BIRT_DT);
				CallStmtExec.setString(9, JOB_CD);
				CallStmtExec.setString(10, ENTR_DT);
				CallStmtExec.setString(11, INPT_ID);

			} else if (SGUBN.equals("1")){


			}

			CallStmtExec.executeUpdate();

		} catch (Exception e) {

			throw new FuncException(e.toString(), sql);
		}

		return sql;
	}
%>
