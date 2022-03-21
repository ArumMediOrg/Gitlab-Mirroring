<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%!
	public String func_uSPSUGA_Set_Insert_001(Statement argStmtExec, HashMap argHtMethod) throws Exception {

		String sql = "";
		String sql2 = "";
		String sql_disp = "";

		Connection connect = argStmtExec.getConnection();
		CallableStatement CallStmtExec = null;

		try {

			String EXAM_DT = (String) argHtMethod.get("EXAM_DT");
			String CODE_CD = (String) argHtMethod.get("CODE_CD");

			//
			if(EXAM_DT == null) { EXAM_DT = ""; }
			if(CODE_CD == null) { CODE_CD = ""; }

			//


			sql = " Insert Into IT_ITEM_PRICE ";
			sql += " (IIP_APLY_DT, IIP_ITEM_CD,  IIP_JCSG_PR, IIP_HESG_PR,  IIP_GBSG_PR, ";
			sql += " IIP_SBSG_PR, IIP_TGSG_PR,  IIP_PRSN_PR, IIP_SBGB_PR,  IIP_STSG_PR, ";
			sql += " IIP_GASN_PR, IIP_USE_YN,  IIP_INPT_ID, IIP_INPT_DTT) ";
			sql += " Values ";
			sql += " (?, ?, '0', '0', '0', '0', '0', '0', '0', '0', '0', 'Y', 'admin', sysdate) ";

			CallStmtExec = connect.prepareCall(sql);

			CallStmtExec.setString(1, EXAM_DT);
			CallStmtExec.setString(2, CODE_CD);

			CallStmtExec.executeUpdate();

		} catch (Exception e) {

			throw new FuncException(e.toString(), sql);
		}

		return sql;
	}
%>
