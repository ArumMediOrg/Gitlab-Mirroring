<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%!
	public String func_uFM_AcptComm_GF_ChkDelAcpt_001(Statement argStmtExec, HashMap argHtMethod) throws Exception {

		String sql = "";
		String sql2 = "";
		String sql_disp = "";

		try {

			String CON_NAME_1 = (String) argHtMethod.get("CON_NAME_1");
			String CON_NAME_2 = (String) argHtMethod.get("CON_NAME_2");
			String CON_NAME_3 = (String) argHtMethod.get("CON_NAME_3");
			String CON_VALUE_1 = (String) argHtMethod.get("CON_VALUE_1");
			String CON_VALUE_2 = (String) argHtMethod.get("CON_VALUE_2");

			//
			if(CON_NAME_1 == null) { CON_NAME_1 = ""; }
			if(CON_NAME_2 == null) { CON_NAME_2 = ""; }
			if(CON_NAME_3 == null) { CON_NAME_3 = ""; }
			if(CON_VALUE_1 == null) { CON_VALUE_1 = ""; }
			if(CON_VALUE_2 == null) { CON_VALUE_2 = ""; }

			//
			CON_NAME_1 = CTr.Replace(CON_NAME_1, "'", "''");
			CON_NAME_2 = CTr.Replace(CON_NAME_2, "'", "''");
			CON_NAME_3 = CTr.Replace(CON_NAME_3, "'", "''");
			CON_VALUE_1 = CTr.Replace(CON_VALUE_1, "'", "''");
			CON_VALUE_2 = CTr.Replace(CON_VALUE_2, "'", "''");

			String vTBL_NAME = "";
			vTBL_NAME += CON_NAME_1.substring(0,1);
			vTBL_NAME += "T_" + CON_NAME_2.substring(0, CON_NAME_2.indexOf("_"));
			if(! CON_NAME_3.equals("")) {
				if(CON_NAME_3.contains("_")) {
						vTBL_NAME += CON_NAME_3.substring(CON_NAME_3.indexOf("_"));
				} else {
						vTBL_NAME += CON_NAME_3;
				}
			}

			String vEXAM_DT = CON_NAME_1.substring(0,4) + "EXAM_DT";
			String vEXAM_SQ = CON_NAME_1.substring(0,4) + "EXAM_SQ";


			sql = "DELETE " + vTBL_NAME ;
			sql += " WHERE " + vEXAM_DT  + " = '" + CON_VALUE_1 + "'";
			sql += " AND " + vEXAM_SQ  + " = '" + CON_VALUE_2 + "'";

			argStmtExec.executeUpdate(sql);

		} catch (Exception e) {

			throw new FuncException(e.toString(), sql);
		}

		return sql;
	}
%>
