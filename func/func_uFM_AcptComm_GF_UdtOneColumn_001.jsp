<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%!
	public String func_uFM_AcptComm_GF_UdtOneColumn_001(Statement argStmtExec, HashMap argHtMethod) throws Exception {

		String sql = "";
		String sql2 = "";
		String sql_disp = "";

		try {

			String CON_NAME_1 = (String) argHtMethod.get("CON_NAME_1");
			String CON_NAME_2 = (String) argHtMethod.get("CON_NAME_2");
			String CON_NAME_3 = (String) argHtMethod.get("CON_NAME_3");
			String CON_COLUMN_S = (String) argHtMethod.get("CON_COLUMN_S");
			String CON_COLUMN_1 = (String) argHtMethod.get("CON_COLUMN_1");
			String CON_COLUMN_2 = (String) argHtMethod.get("CON_COLUMN_2");
			String CON_COLUMN_3 = (String) argHtMethod.get("CON_COLUMN_3");
			String CON_COLUMN_4 = (String) argHtMethod.get("CON_COLUMN_4");
			String CON_COLUMN_5 = (String) argHtMethod.get("CON_COLUMN_5");
			String CON_VALUE_S = (String) argHtMethod.get("CON_VALUE_S");
			String CON_VALUE_1 = (String) argHtMethod.get("CON_VALUE_1");
			String CON_VALUE_2 = (String) argHtMethod.get("CON_VALUE_2");
			String CON_VALUE_3 = (String) argHtMethod.get("CON_VALUE_3");
			String CON_VALUE_4 = (String) argHtMethod.get("CON_VALUE_4");
			String CON_VALUE_5 = (String) argHtMethod.get("CON_VALUE_5");

			//
			if(CON_NAME_1 == null) { CON_NAME_1 = ""; }
			if(CON_NAME_2 == null) { CON_NAME_2 = ""; }
			if(CON_NAME_3 == null) { CON_NAME_3 = ""; }
			if(CON_COLUMN_S == null) { CON_COLUMN_S = ""; }
			if(CON_COLUMN_1 == null) { CON_COLUMN_1 = ""; }
			if(CON_COLUMN_2 == null) { CON_COLUMN_2 = ""; }
			if(CON_COLUMN_3 == null) { CON_COLUMN_3 = ""; }
			if(CON_COLUMN_4 == null) { CON_COLUMN_4 = ""; }
			if(CON_COLUMN_5 == null) { CON_COLUMN_5 = ""; }
			if(CON_VALUE_S == null) { CON_VALUE_S = ""; }
			if(CON_VALUE_1 == null) { CON_VALUE_1 = ""; }
			if(CON_VALUE_2 == null) { CON_VALUE_2 = ""; }
			if(CON_VALUE_3 == null) { CON_VALUE_3 = ""; }
			if(CON_VALUE_4 == null) { CON_VALUE_4 = ""; }
			if(CON_VALUE_5 == null) { CON_VALUE_5 = ""; }

			//
			CON_NAME_1 = CTr.Replace(CON_NAME_1, "'", "''");
			CON_NAME_2 = CTr.Replace(CON_NAME_2, "'", "''");
			CON_NAME_3 = CTr.Replace(CON_NAME_3, "'", "''");
			CON_COLUMN_S = CTr.Replace(CON_COLUMN_S, "'", "''");
			CON_COLUMN_1 = CTr.Replace(CON_COLUMN_1, "'", "''");
			CON_COLUMN_2 = CTr.Replace(CON_COLUMN_2, "'", "''");
			CON_COLUMN_3 = CTr.Replace(CON_COLUMN_3, "'", "''");
			CON_COLUMN_4 = CTr.Replace(CON_COLUMN_4, "'", "''");
			CON_COLUMN_5 = CTr.Replace(CON_COLUMN_5, "'", "''");
			CON_VALUE_S = CTr.Replace(CON_VALUE_S, "'", "''");
			CON_VALUE_1 = CTr.Replace(CON_VALUE_1, "'", "''");
			CON_VALUE_2 = CTr.Replace(CON_VALUE_2, "'", "''");
			CON_VALUE_3 = CTr.Replace(CON_VALUE_3, "'", "''");
			CON_VALUE_4 = CTr.Replace(CON_VALUE_4, "'", "''");
			CON_VALUE_5 = CTr.Replace(CON_VALUE_5, "'", "''");

			String VTBL_NAME = "";
			VTBL_NAME += CON_NAME_1.substring(0,1);
			VTBL_NAME += "T_" + CON_NAME_2.substring(0, CON_NAME_2.indexOf("_"));
			if(! CON_NAME_3.equals("")) {
				if(CON_NAME_3.contains("_")) {
						VTBL_NAME += CON_NAME_3.substring(CON_NAME_3.indexOf("_"));
				} else {
						VTBL_NAME += CON_NAME_3;
				}
			}
			
			String VSET_COL = CON_NAME_1.substring(0,4) + CON_COLUMN_S;

			String VCOND_1 = CON_NAME_1.substring(0,4) + CON_COLUMN_1;
			String VCOND_2 = CON_NAME_1.substring(0,4) + CON_COLUMN_2;
			String VCOND_3 = CON_NAME_1.substring(0,4) + CON_COLUMN_3;
			String VCOND_4 = CON_NAME_1.substring(0,4) + CON_COLUMN_4;
			String VCOND_5 = CON_NAME_1.substring(0,4) + CON_COLUMN_5;

			sql = "UPDATE " + VTBL_NAME + " SET ";
			sql += VSET_COL + "  = '" + CON_VALUE_S + "'";
			sql += " WHERE " + VCOND_1 + " = '" + CON_VALUE_1 + "'";

			if(! CON_COLUMN_2.equals("")) {
				sql += " AND " + VCOND_2 + " = '" + CON_VALUE_2 + "'";
			}

			if(! CON_COLUMN_3.equals("")) {
				sql += " AND " + VCOND_3 + " = '" + CON_VALUE_3 + "'";
			}

			if(! CON_COLUMN_4.equals("")) {
				sql += " AND " + VCOND_4 + " = '" + CON_VALUE_4 + "'";
			}

			if(! CON_COLUMN_5.equals("")) {
				sql += " AND " + VCOND_5 + " = '" + CON_VALUE_5 + "'";
			}

			sql += " AND NVL(" + VSET_COL + ", ' ') <> NVL('" + CON_VALUE_S + "', ' ')";

			argStmtExec.executeUpdate(sql);

		} catch (Exception e) {

			throw new FuncException(e.toString(), sql);
		}

		return sql;
	}
%>
