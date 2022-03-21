<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%!
	public String func_uStdt_Pnjn_btnPnjn_CnclClick_001(Statement argStmtExec, HashMap argHtMethod) throws Exception {

		String sql = "";
		String sql2 = "";
		String sql_disp = "";

		try {

			String USER_ID = (String) argHtMethod.get("USER_ID");
			String EXAM_DT = (String) argHtMethod.get("EXAM_DT");
			String EXAM_SQ = (String) argHtMethod.get("EXAM_SQ");

			//
			if(USER_ID == null) { USER_ID = ""; }
			if(EXAM_DT == null) { EXAM_DT = ""; }
			if(EXAM_SQ == null) { EXAM_SQ = ""; }

			//
			USER_ID = CTr.Replace(USER_ID, "'", "''");
			EXAM_DT = CTr.Replace(EXAM_DT, "'", "''");
			EXAM_SQ = CTr.Replace(EXAM_SQ, "'", "''");

			sql = "UPDATE ET_STDT_PNJN SET ";
			sql += "  ESP_PNJN_TT = ''";
			sql += ", ESP_PNJN_01 = ''";
			sql += ", ESP_PNJN_02 = ''";
			sql += ", ESP_PNJN_03 = ''";
			sql += ", ESP_PNJN_04 = ''";
			sql += ", ESP_PNJN_06 = ''";
			sql += ", ESP_PNJN_07 = ''";
			sql += ", ESP_PNJN_08 = ''";
			sql += ", ESP_PNJN_09 = ''";
			sql += ", ESP_PNJN_10 = ''";
			sql += ", ESP_PNJN_11 = ''";
			sql += ", ESP_PNJN_12 = ''";
			sql += ", ESP_PNJN_13 = ''";
			sql += ", ESP_PNJN_14 = ''";
			sql += ", ESP_QST_01 = ''";
			sql += ", ESP_QST_02 = ''";
			sql += ", ESP_QST_03 = ''";
			sql += ", ESP_QST_04 = ''";
			sql += ", ESP_EXAM_VIEW = ''";
			sql += ", ESP_EXAM_ACT = ''";
			sql += ", ESP_EIFRM_DT = ''";
			sql += ", ESP_EXAM_DR = ''";
			sql += ", ESP_EPNJN_YN = 'N'";
			sql += ", ESP_MODI_ID = '" + USER_ID + "'";
			sql += ", ESP_MODI_DTT = SYSDATE";
			sql += " WHERE ESP_EXAM_DT = '" + EXAM_DT + "'";
			sql += " AND ESP_EXAM_SQ = '" + EXAM_SQ + "'";

			argStmtExec.executeUpdate(sql);

		} catch (Exception e) {

			throw new FuncException(e.toString(), sql);
		}

		return sql;
	}
%>
