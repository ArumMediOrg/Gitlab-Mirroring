<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%!
	public String func_uSP_Health_UP_ITEM_Complete_002(Statement argStmtExec, HashMap argHtMethod) throws Exception {

		String sql = "";
		String sql2 = "";
		String sql_disp = "";

		try {

			String SSAVEMODE = (String) argHtMethod.get("SSAVEMODE");
			String EXAM_DT = (String) argHtMethod.get("EXAM_DT");
			String EXAM_SQ = (String) argHtMethod.get("EXAM_SQ");
			String ITEM_CD = (String) argHtMethod.get("ITEM_CD");

			//
			if(SSAVEMODE == null) { SSAVEMODE = ""; }
			if(EXAM_DT == null) { EXAM_DT = ""; }
			if(EXAM_SQ == null) { EXAM_SQ = ""; }
			if(ITEM_CD == null) { ITEM_CD = ""; }

			//
			SSAVEMODE = CTr.Replace(SSAVEMODE, "'", "''");
			EXAM_DT = CTr.Replace(EXAM_DT, "'", "''");
			EXAM_SQ = CTr.Replace(EXAM_SQ, "'", "''");
			ITEM_CD = CTr.Replace(ITEM_CD, "'", "''");

			if(SSAVEMODE.equals("I")) {
				sql = "INSERT INTO ST_ITEM_CANCEL (SIC_EXAM_DT,SIC_EXAM_SQ,SIC_EXAM_CHA, SIC_ITEM_CD,SIC_SBCD_CD, SIC_CANC_LT,SIC_INPT_ID,SIC_INPT_DTT) VALUES (";
				sql += "  '" + EXAM_DT + "'";
				sql += ", '" + EXAM_SQ + "'";
				sql += ", '1'";
				sql += ", '" + ITEM_CD + "'";
				sql += ", '0607'";
				sql += ", '남성근로자'";
				sql += ", '1'";
				sql += ", SYSDATE";
				sql += ")";

				argStmtExec.executeUpdate(sql);
			}
			else {
				sql = "UPDATE ST_ITEM_CANCEL SET ";
				sql += "  SIC_SBCD_CD = '0607'";
				sql += ", SIC_CANC_LT = '남성근로자'";
				sql += ", SIC_MODI_ID = '1'";
				sql += ", SIC_MODI_DTT = SYSDATE";
				sql += " WHERE SIC_EXAM_DT = '" + EXAM_DT + "'";
				sql += " AND SIC_EXAM_SQ = '" + EXAM_SQ + "'";
				sql += " AND SIC_EXAM_CHA = '1'";
				sql += " AND SIC_ITEM_CD = '" + ITEM_CD + "'";

				argStmtExec.executeUpdate(sql);
			}

		} catch (Exception e) {

			throw new FuncException(e.toString(), sql);
		}

		return sql;
	}
%>
