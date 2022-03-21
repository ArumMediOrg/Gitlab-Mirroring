<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%!
	public String func_uItem_Call_ufSaveItem_Call_003(Statement argStmtExec, HashMap argHtMethod) throws Exception {

		String sql = "";
		String sql2 = "";
		String sql_disp = "";

		try {

			String EXAM_YR = (String) argHtMethod.get("EXAM_YR");
			String ITEM_CD = (String) argHtMethod.get("ITEM_CD");
			String HLTH_KD = (String) argHtMethod.get("HLTH_KD");
			String CAN_KD = (String) argHtMethod.get("CAN_KD");
			String STDT_KD = (String) argHtMethod.get("STDT_KD");
			String STDTO_KD = (String) argHtMethod.get("STDTO_KD");
			String INPT_ID = (String) argHtMethod.get("INPT_ID");
			String MODI_ID = (String) argHtMethod.get("MODI_ID");

			//
			if(EXAM_YR == null) { EXAM_YR = ""; }
			if(ITEM_CD == null) { ITEM_CD = ""; }
			if(HLTH_KD == null) { HLTH_KD = ""; }
			if(CAN_KD == null) { CAN_KD = ""; }
			if(STDT_KD == null) { STDT_KD = ""; }
			if(STDTO_KD == null) { STDTO_KD = ""; }
			if(INPT_ID == null) { INPT_ID = ""; }
			if(MODI_ID == null) { MODI_ID = ""; }

			//
			EXAM_YR = CTr.Replace(EXAM_YR, "'", "''");
			ITEM_CD = CTr.Replace(ITEM_CD, "'", "''");
			HLTH_KD = CTr.Replace(HLTH_KD, "'", "''");
			CAN_KD = CTr.Replace(CAN_KD, "'", "''");
			STDT_KD = CTr.Replace(STDT_KD, "'", "''");
			STDTO_KD = CTr.Replace(STDTO_KD, "'", "''");
			INPT_ID = CTr.Replace(INPT_ID, "'", "''");
			MODI_ID = CTr.Replace(MODI_ID, "'", "''");

			sql = "INSERT INTO IT_ITEM_CALL (IIC_EXAM_YR, IIC_ITEM_CD, IIC_HLTH_KD, IIC_CAN_KD, IIC_STDT_KD, IIC_STDTO_KD, IIC_INPT_ID, IIC_INPT_DTT, IIC_MODI_ID, IIC_MODI_DTT) VALUES (";
			sql += "  '" + EXAM_YR + "'";
			sql += ", '" + ITEM_CD + "'";
			sql += ", '" + HLTH_KD + "'";
			sql += ", '" + CAN_KD + "'";
			sql += ", '" + STDT_KD + "'";
			sql += ", '" + STDTO_KD + "'";
			sql += ", '" + INPT_ID + "'";
			sql += ", SYSDATE";
			sql += ", '" + MODI_ID + "'";
			sql += ", SYSDATE";
			sql += ")";

			argStmtExec.executeUpdate(sql);

		} catch (Exception e) {

			throw new FuncException(e.toString(), sql);
		}

		return sql;
	}
%>
