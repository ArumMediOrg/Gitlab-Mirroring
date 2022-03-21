<%!
	public String uFM_AcptComm_GF_UdtMultiColumn_001(Statement argStmtExec, HashMap argHtMethod) throws Exception {
	
		String sql;
		
		String CON_NAME_1 = (String) argHtMethod.get("CON_NAME_1");
		String CON_NAME_2 = (String) argHtMethod.get("CON_NAME_2");
		String CON_NAME_3 = (String) argHtMethod.get("CON_NAME_3");
		String CON_COLUMN_S1 = (String) argHtMethod.get("CON_COLUMN_S1");
		String CON_COLUMN_S2 = (String) argHtMethod.get("CON_COLUMN_S2");
		String CON_COLUMN_S3 = (String) argHtMethod.get("CON_COLUMN_S3");
		String CON_COLUMN_S4 = (String) argHtMethod.get("CON_COLUMN_S4");
		String CON_COLUMN_S5 = (String) argHtMethod.get("CON_COLUMN_S5");
		String CON_COLUMN_1 = (String) argHtMethod.get("CON_COLUMN_1");
		String CON_COLUMN_2 = (String) argHtMethod.get("CON_COLUMN_2");
		String CON_COLUMN_3 = (String) argHtMethod.get("CON_COLUMN_3");
		String CON_COLUMN_4 = (String) argHtMethod.get("CON_COLUMN_4");
		String CON_COLUMN_5 = (String) argHtMethod.get("CON_COLUMN_5");
		String CON_VALUE_S1 = (String) argHtMethod.get("CON_VALUE_S1");
		String CON_VALUE_S2 = (String) argHtMethod.get("CON_VALUE_S2");
		String CON_VALUE_S3 = (String) argHtMethod.get("CON_VALUE_S3");
		String CON_VALUE_S4 = (String) argHtMethod.get("CON_VALUE_S4");
		String CON_VALUE_S5 = (String) argHtMethod.get("CON_VALUE_S5");
		String CON_VALUE_1 = (String) argHtMethod.get("CON_VALUE_1");
		String CON_VALUE_2 = (String) argHtMethod.get("CON_VALUE_2");
		String CON_VALUE_3 = (String) argHtMethod.get("CON_VALUE_3");
		String CON_VALUE_4 = (String) argHtMethod.get("CON_VALUE_4");
		String CON_VALUE_5 = (String) argHtMethod.get("CON_VALUE_5");

		//
		if(CON_NAME_1 == null) { CON_NAME_1 = ""; }
		if(CON_NAME_2 == null) { CON_NAME_2 = ""; }
		if(CON_NAME_3 == null) { CON_NAME_3 = ""; }
		if(CON_COLUMN_S1 == null) { CON_COLUMN_S1 = ""; }
		if(CON_COLUMN_S2 == null) { CON_COLUMN_S2 = ""; }
		if(CON_COLUMN_S3 == null) { CON_COLUMN_S3 = ""; }
		if(CON_COLUMN_S4 == null) { CON_COLUMN_S4 = ""; }
		if(CON_COLUMN_S5 == null) { CON_COLUMN_S5 = ""; }
		if(CON_COLUMN_1 == null) { CON_COLUMN_1 = ""; }
		if(CON_COLUMN_2 == null) { CON_COLUMN_2 = ""; }
		if(CON_COLUMN_3 == null) { CON_COLUMN_3 = ""; }
		if(CON_COLUMN_4 == null) { CON_COLUMN_4 = ""; }
		if(CON_COLUMN_5 == null) { CON_COLUMN_5 = ""; }
		if(CON_VALUE_S1 == null) { CON_VALUE_S1 = ""; }
		if(CON_VALUE_S2 == null) { CON_VALUE_S2 = ""; }
		if(CON_VALUE_S3 == null) { CON_VALUE_S3 = ""; }
		if(CON_VALUE_S4 == null) { CON_VALUE_S4 = ""; }
		if(CON_VALUE_S5 == null) { CON_VALUE_S5 = ""; }
		if(CON_VALUE_1 == null) { CON_VALUE_1 = ""; }
		if(CON_VALUE_2 == null) { CON_VALUE_2 = ""; }
		if(CON_VALUE_3 == null) { CON_VALUE_3 = ""; }
		if(CON_VALUE_4 == null) { CON_VALUE_4 = ""; }
		if(CON_VALUE_5 == null) { CON_VALUE_5 = ""; }
		
		String vTBL_NAME = CON_NAME_1.substring(0,1) + "T_" + CON_NAME_2.substring(0, CON_NAME_2.lastIndexOf("_")) + CON_NAME_3.substring(CON_NAME_3.lastIndexOf("_"));

		String vSET_COL1 = CON_NAME_1.substring(0,4) + CON_COLUMN_S1;
		String vSET_COL2 = CON_NAME_1.substring(0,4) + CON_COLUMN_S2;
		String vSET_COL3 = CON_NAME_1.substring(0,4) + CON_COLUMN_S3;
		String vSET_COL4 = CON_NAME_1.substring(0,4) + CON_COLUMN_S4;
		String vSET_COL5 = CON_NAME_1.substring(0,4) + CON_COLUMN_S5;

		String vCOND_1 = CON_NAME_1.substring(0,4) + CON_COLUMN_1;
		String vCOND_2 = CON_NAME_1.substring(0,4) + CON_COLUMN_2;
		String vCOND_3 = CON_NAME_1.substring(0,4) + CON_COLUMN_3;
		String vCOND_4 = CON_NAME_1.substring(0,4) + CON_COLUMN_4;
		String vCOND_5 = CON_NAME_1.substring(0,4) + CON_COLUMN_5;

		sql = "UPDATE " + vTBL_NAME + " SET ";
		sql += "  " + vSET_COL1 + " = '" + CON_VALUE_S1 + "'";

		if(! CON_COLUMN_S2.equals("")) {
			sql += " , " + vSET_COL2 + " = '" + CON_VALUE_S2 + "'";
		}

		if(! CON_COLUMN_S3.equals("")) {
			sql += " , " + vSET_COL3 + " = '" + CON_VALUE_S3 + "'";
		}

		if(! CON_COLUMN_S4.equals("")) {
			sql += " , " + vSET_COL4 + " = '" + CON_VALUE_S4 + "'";
		}

		if(! CON_COLUMN_S5.equals("")) {
			sql += " , " + vSET_COL5 + " = '" + CON_VALUE_S5 + "'";
		}

		sql += " WHERE " + vCOND_1 + " = '" + CON_VALUE_1 + "'";

		if(! CON_COLUMN_2.equals("")) {
			sql += " AND " + vCOND_2 + " = '" + CON_VALUE_2 + "'";
		}

		if(! CON_COLUMN_3.equals("")) {
			sql += " AND " + vCOND_3 + " = '" + CON_VALUE_3 + "'";
		}

		if(! CON_COLUMN_4.equals("")) {
			sql += " AND " + vCOND_4 + " = '" + CON_VALUE_4 + "'";
		}

		if(! CON_COLUMN_5.equals("")) {
			sql += " AND " + vCOND_5 + " = '" + CON_VALUE_5 + "'";
		}

		argStmtExec.executeUpdate(sql);
		
		return sql;
	}
%>