<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%!
	public String func_SmartCMS_SignData_001(Statement argStmtExec, HashMap argHtMethod) throws Exception {

		String sql = "";
		String sql2 = "";
		String sql_disp = "";

		Connection connect = argStmtExec.getConnection();
		CallableStatement CallStmtExec = null;

		try {

			String STBNM = (String) argHtMethod.get("STBNM");
			String SEXDT = (String) argHtMethod.get("SEXDT");
			String SEXNO = (String) argHtMethod.get("SEXNO");
			String SRSLT = (String) argHtMethod.get("SRSLT");
			String SPCNM = (String) argHtMethod.get("SPCNM");
			String SINPT = (String) argHtMethod.get("SINPT");
			String SDOC = (String) argHtMethod.get("SDOC");
			String SSGSQ = (String) argHtMethod.get("SSGSQ");

			//
			if(STBNM == null) { STBNM = ""; }
			if(SEXDT == null) { SEXDT = ""; }
			if(SEXNO == null) { SEXNO = ""; }
			if(SRSLT == null) { SRSLT = ""; }
			if(SPCNM == null) { SPCNM = ""; }
			if(SINPT == null) { SINPT = ""; }
			if(SDOC == null) { SDOC = ""; }
			if(SSGSQ == null) { SSGSQ = ""; }

			//

			STBNM = CTr.Replace(STBNM, "'", "''");
			SEXDT = CTr.Replace(SEXDT, "'", "''");
			SEXNO = CTr.Replace(SEXNO, "'", "''");
			SRSLT = CTr.Replace(SRSLT, "'", "''");
			SPCNM = CTr.Replace(SPCNM, "'", "''");
			SINPT = CTr.Replace(SINPT, "'", "''");
			SDOC = CTr.Replace(SDOC, "'", "''");
			SSGSQ = CTr.Replace(SSGSQ, "'", "''");

			sql = " Insert Into " + STBNM + "                ";
			sql += " ( EXAM_DT, EXAM_SQ, SG_RESULT, SG_DATE, SG_TIME,";
			sql += " SG_PCNM, SG_INPUT, DOCTOR, MAXSG_SQ )         ";
			sql += " Values                                          ";
			sql += " ( ?, ?, ?, TO_CHAR(sysdate,'YYYYMMDD'), TO_CHAR(sysdate,'HH24MISS'), ";
			sql += "   ?, ?, ?, ?)   ";

			CallStmtExec = connect.prepareCall(sql);

			CallStmtExec.setString(1,  SEXDT);
			CallStmtExec.setString(2,  SEXNO);
			CallStmtExec.setString(3,  SRSLT);
			CallStmtExec.setString(4,  SPCNM);
			CallStmtExec.setString(5,  SINPT);
			CallStmtExec.setString(6,  SDOC);
			CallStmtExec.setString(7,  SSGSQ);
			

			CallStmtExec.executeUpdate();


			//sql += " ('" + SEXDT + "',                        ";
			//sql += " '" + SEXNO + "',                     ";
			//sql += " '" + SRSLT + "',  ";
			//sql += " TO_CHAR(sysdate,'YYYYMMDD'),                ";
			//sql += " TO_CHAR(sysdate,'HH24MISS'),                ";
			//sql += " '" + SPCNM + "',                     ";
			//sql += " '" + SINPT + "',                      ";
			//sql += " '" + SDOC + "',                    ";
			//sql += " '" + SSGSQ + "') ";                       


			//argStmtExec.executeUpdate(sql);

		} catch (Exception e) {

			throw new FuncException(e.toString(), sql);
		}

		return sql;
	}
%>
