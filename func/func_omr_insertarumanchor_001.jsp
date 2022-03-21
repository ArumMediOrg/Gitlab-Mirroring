<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%!
	public String func_omr_insertarumanchor_001(Statement argStmtExec, HashMap argHtMethod) throws Exception {

		String sql = "";
		String sql2 = "";
		String sql_disp = "";

		try {

			String FORMNAME = (String) argHtMethod.get("FORMNAME");
			String B = (String) argHtMethod.get("B");
			String FIELDNM = (String) argHtMethod.get("FIELDNM");
			String LEFT = (String) argHtMethod.get("LEFT");
			String RIGHT = (String) argHtMethod.get("RIGHT");
			String TOP = (String) argHtMethod.get("TOP");
			String BOTTOM = (String) argHtMethod.get("BOTTOM");

			//
			if(FORMNAME == null) { FORMNAME = ""; }
			if(B == null) { B = ""; }
			if(FIELDNM == null) { FIELDNM = ""; }
			if(LEFT == null) { LEFT = ""; }
			if(RIGHT == null) { RIGHT = ""; }
			if(TOP == null) { TOP = ""; }
			if(BOTTOM == null) { BOTTOM = ""; }

			//
			FORMNAME = CTr.Replace(FORMNAME, "'", "''");
			B = CTr.Replace(B, "'", "''");
			FIELDNM = CTr.Replace(FIELDNM, "'", "''");
			LEFT = CTr.Replace(LEFT, "'", "''");
			RIGHT = CTr.Replace(RIGHT, "'", "''");
			TOP = CTr.Replace(TOP, "'", "''");
			BOTTOM = CTr.Replace(BOTTOM, "'", "''");

			sql = "INSERT INTO ARUM_ANCHOR(FORMNAME, FIELDNO, FIELDNAME, AREALEFT, AREARIGHT, AREATOP, AREABOTTOM) VALUES (";
			sql += "  '" + FORMNAME + "'";
			sql += ", '" + B + "'";
			sql += ", '" + FIELDNM + "'";
			sql += ", '" + LEFT + "'";
			sql += ", '" + RIGHT + "'";
			sql += ", '" + TOP + "'";
			sql += ", '" + BOTTOM + "'";
			sql += ")";

			argStmtExec.executeUpdate(sql);

		} catch (Exception e) {

			throw new FuncException(e.toString(), sql);
		}

		return sql;
	}
%>
