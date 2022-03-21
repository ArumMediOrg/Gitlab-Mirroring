<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%!
	public String func_uCRM_BASIC_btnS83_SaveClick_001(Statement argStmtExec, HashMap argHtMethod) throws Exception {

		String sql = "";
		String sql2 = "";
		String sql_disp = "";

		Connection connect = argStmtExec.getConnection();
		CallableStatement CallStmtExec = null;

		ResultSet rsList = null;

		CRs cRsList = null;

		try {

			String PLAN_DT = (String) argHtMethod.get("PLAN_DT");
			String EMP_NO = (String) argHtMethod.get("EMP_NO");
			String USER_ID = (String) argHtMethod.get("USER_ID");

			//
			if(PLAN_DT == null) { PLAN_DT = ""; }
			if(EMP_NO == null) { EMP_NO = ""; }
			if(USER_ID == null) { EMP_NO = ""; }


			sql = " select count(*) SLT_CNT from CR_DOCTOR_PLAN ";
			sql += " where ";
			sql += " 	CDP_PLAN_DT = '" + PLAN_DT + "' ";
			sql += " and CDP_EMP_NO  = '" + EMP_NO + "' ";

			rsList = argStmtExec.executeQuery(sql);
			cRsList = new CRs(rsList);

			if(cRsList.next()) {  //조회 해서 데이터 없으면 insert
				String SLT_CNT = cRsList.getString("SLT_CNT");

				if (SLT_CNT.equals("0")){
					sql = " insert into CR_DOCTOR_PLAN  ( ";
					sql += "  CDP_PLAN_DT ";
					sql += " ,CDP_EMP_NO ";
					sql += " ,CDP_MODI_ID ";
					sql += " ,CDP_MODI_DTT  ) ";
					sql += " values ( ";
					sql += "  ? ";
					sql += " ,? ";
					sql += " ,? ";
					sql += " ,sysdate   ) ";

					CallStmtExec = connect.prepareCall(sql);

					CallStmtExec.setString(1, PLAN_DT);
					CallStmtExec.setString(2, EMP_NO);
					CallStmtExec.setString(3, USER_ID);

					CallStmtExec.executeUpdate();
				}

			}

			//


		} catch (Exception e) {

			throw new FuncException(e.toString(), sql);
		}

		return sql;
	}
%>
