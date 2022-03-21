<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%!
	public String func_uItem_Call_ufDeleteItem_002(Statement argStmtExec, HashMap argHtMethod) throws Exception {

		String sql = "";
		String sql2 = "";
		String sql_disp = "";

		try {

			String EXAM_YR = (String) argHtMethod.get("EXAM_YR");
			String ITEM_CD = (String) argHtMethod.get("ITEM_CD");

			//
			if(EXAM_YR == null) { EXAM_YR = ""; }
			if(ITEM_CD == null) { ITEM_CD = ""; }

			//
			EXAM_YR = CTr.Replace(EXAM_YR, "'", "''");
			ITEM_CD = CTr.Replace(ITEM_CD, "'", "''");

			sql = "DELETE IT_ITEM_CALL";
			sql += " WHERE IIC_EXAM_YR = '" + EXAM_YR + "'";
			sql += " AND IIC_ITEM_CD = '" + ITEM_CD + "'";
			sql += " AND nvl(REPLACE(IIC_HLTH_KD || IIC_CAN_KD || IIC_STDT_KD || IIC_STDTO_KD, '0', ''), ' ') = ' '";

			argStmtExec.executeUpdate(sql);

		} catch (Exception e) {

			throw new FuncException(e.toString(), sql);
		}

		return sql;
	}
%>
