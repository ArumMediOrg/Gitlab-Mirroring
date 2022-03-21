<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%!
	public String func_uSp_Health_Autopan_Set_upSetItem_001(Statement argStmtExec, HashMap argHtMethod) throws Exception {

		String sql = "";
		String sql2 = "";
		String sql_disp = "";

		try {

			String GUSER = (String) argHtMethod.get("GUSER");

			//
			if(GUSER == null) { GUSER = ""; }

			//
			GUSER = CTr.Replace(GUSER, "'", "''");

			sql = "INSERT INTO SP_AUTO_ITEM (SPA_ORGA_CD, SPA_SBCD_CD, SPA_USE_YN, SPA_INPT_ID, SPA_INPT_DTT) VALUES (";
			sql += "  '01'";
			sql += ", '0181'";
			sql += ", 'Y'";
			sql += ", '" + GUSER + "'";
			sql += ", SYSDATE";
			sql += ")";

			argStmtExec.executeUpdate(sql);

			sql = "INSERT INTO SP_AUTO_ITEM (SPA_ORGA_CD, SPA_SBCD_CD, SPA_USE_YN, SPA_INPT_ID, SPA_INPT_DTT) VALUES (";
			sql += "  '01'";
			sql += ", '0182'";
			sql += ", 'Y'";
			sql += ", '" + GUSER + "'";
			sql += ", SYSDATE";
			sql += ")";

			argStmtExec.executeUpdate(sql);

			sql = "INSERT INTO SP_AUTO_ITEM (SPA_ORGA_CD, SPA_SBCD_CD, SPA_USE_YN, SPA_INPT_ID, SPA_INPT_DTT) VALUES (";
			sql += "  '01'";
			sql += ", '0187'";
			sql += ", 'Y'";
			sql += ", '" + GUSER + "'";
			sql += ", SYSDATE";
			sql += ")";

			argStmtExec.executeUpdate(sql);

			sql = "INSERT INTO SP_AUTO_ITEM (SPA_ORGA_CD, SPA_SBCD_CD, SPA_USE_YN, SPA_INPT_ID, SPA_INPT_DTT) VALUES (";
			sql += "  '01'";
			sql += ", '0189'";
			sql += ", 'Y'";
			sql += ", '" + GUSER + "'";
			sql += ", SYSDATE";
			sql += ")";

			argStmtExec.executeUpdate(sql);

			sql = "INSERT INTO SP_AUTO_ITEM (SPA_ORGA_CD, SPA_SBCD_CD, SPA_USE_YN, SPA_INPT_ID, SPA_INPT_DTT) VALUES (";
			sql += "  '01'";
			sql += ", '0199'";
			sql += ", 'Y'";
			sql += ", '" + GUSER + "'";
			sql += ", SYSDATE";
			sql += ")";

			argStmtExec.executeUpdate(sql);

			sql = "INSERT INTO SP_AUTO_ITEM (SPA_ORGA_CD, SPA_SBCD_CD, SPA_USE_YN, SPA_INPT_ID, SPA_INPT_DTT) VALUES (";
			sql += "  '01'";
			sql += ", '0230'";
			sql += ", 'Y'";
			sql += ", '" + GUSER + "'";
			sql += ", SYSDATE";
			sql += ")";

			argStmtExec.executeUpdate(sql);

			sql = "INSERT INTO SP_AUTO_ITEM (SPA_ORGA_CD, SPA_SBCD_CD, SPA_USE_YN, SPA_INPT_ID, SPA_INPT_DTT) VALUES (";
			sql += "  '02'";
			sql += ", '0240'";
			sql += ", 'Y'";
			sql += ", '" + GUSER + "'";
			sql += ", SYSDATE";
			sql += ")";

			argStmtExec.executeUpdate(sql);

			sql = "INSERT INTO SP_AUTO_ITEM (SPA_ORGA_CD, SPA_SBCD_CD, SPA_USE_YN, SPA_INPT_ID, SPA_INPT_DTT) VALUES (";
			sql += "  '02'";
			sql += ", '0241'";
			sql += ", 'Y'";
			sql += ", '" + GUSER + "'";
			sql += ", SYSDATE";
			sql += ")";

			argStmtExec.executeUpdate(sql);

			sql = "INSERT INTO SP_AUTO_ITEM (SPA_ORGA_CD, SPA_SBCD_CD, SPA_USE_YN, SPA_INPT_ID, SPA_INPT_DTT) VALUES (";
			sql += "  '02'";
			sql += ", '0242'";
			sql += ", 'Y'";
			sql += ", '" + GUSER + "'";
			sql += ", SYSDATE";
			sql += ")";

			argStmtExec.executeUpdate(sql);

			sql = "INSERT INTO SP_AUTO_ITEM (SPA_ORGA_CD, SPA_SBCD_CD, SPA_USE_YN, SPA_INPT_ID, SPA_INPT_DTT) VALUES (";
			sql += "  '03'";
			sql += ", '0263'";
			sql += ", 'Y'";
			sql += ", '" + GUSER + "'";
			sql += ", SYSDATE";
			sql += ")";

			argStmtExec.executeUpdate(sql);

			sql = "INSERT INTO SP_AUTO_ITEM (SPA_ORGA_CD, SPA_SBCD_CD, SPA_USE_YN, SPA_INPT_ID, SPA_INPT_DTT) VALUES (";
			sql += "  '03'";
			sql += ", '0270'";
			sql += ", 'Y'";
			sql += ", '" + GUSER + "'";
			sql += ", SYSDATE";
			sql += ")";

			argStmtExec.executeUpdate(sql);

			sql = "INSERT INTO SP_AUTO_ITEM (SPA_ORGA_CD, SPA_SBCD_CD, SPA_USE_YN, SPA_INPT_ID, SPA_INPT_DTT) VALUES (";
			sql += "  '03'";
			sql += ", '0437'";
			sql += ", 'Y'";
			sql += ", '" + GUSER + "'";
			sql += ", SYSDATE";
			sql += ")";

			argStmtExec.executeUpdate(sql);

			sql = "INSERT INTO SP_AUTO_ITEM (SPA_ORGA_CD, SPA_SBCD_CD, SPA_USE_YN, SPA_INPT_ID, SPA_INPT_DTT) VALUES (";
			sql += "  '03'";
			sql += ", '0516'";
			sql += ", 'Y'";
			sql += ", '" + GUSER + "'";
			sql += ", SYSDATE";
			sql += ")";

			argStmtExec.executeUpdate(sql);

			sql = "INSERT INTO SP_AUTO_ITEM (SPA_ORGA_CD, SPA_SBCD_CD, SPA_USE_YN, SPA_INPT_ID, SPA_INPT_DTT) VALUES (";
			sql += "  '03'";
			sql += ", '0518'";
			sql += ", 'Y'";
			sql += ", '" + GUSER + "'";
			sql += ", SYSDATE";
			sql += ")";

			argStmtExec.executeUpdate(sql);

			sql = "INSERT INTO SP_AUTO_ITEM (SPA_ORGA_CD, SPA_SBCD_CD, SPA_USE_YN, SPA_INPT_ID, SPA_INPT_DTT) VALUES (";
			sql += "  '03'";
			sql += ", '0519'";
			sql += ", 'Y'";
			sql += ", '" + GUSER + "'";
			sql += ", SYSDATE";
			sql += ")";

			argStmtExec.executeUpdate(sql);

			sql = "INSERT INTO SP_AUTO_ITEM (SPA_ORGA_CD, SPA_SBCD_CD, SPA_USE_YN, SPA_INPT_ID, SPA_INPT_DTT) VALUES (";
			sql += "  '04'";
			sql += ", '0152'";
			sql += ", 'Y'";
			sql += ", '" + GUSER + "'";
			sql += ", SYSDATE";
			sql += ")";

			argStmtExec.executeUpdate(sql);

			sql = "INSERT INTO SP_AUTO_ITEM (SPA_ORGA_CD, SPA_SBCD_CD, SPA_USE_YN, SPA_INPT_ID, SPA_INPT_DTT) VALUES (";
			sql += "  '04'";
			sql += ", '0154'";
			sql += ", 'Y'";
			sql += ", '" + GUSER + "'";
			sql += ", SYSDATE";
			sql += ")";

			argStmtExec.executeUpdate(sql);

			sql = "INSERT INTO SP_AUTO_ITEM (SPA_ORGA_CD, SPA_SBCD_CD, SPA_USE_YN, SPA_INPT_ID, SPA_INPT_DTT) VALUES (";
			sql += "  '04'";
			sql += ", '0156'";
			sql += ", 'Y'";
			sql += ", '" + GUSER + "'";
			sql += ", SYSDATE";
			sql += ")";

			argStmtExec.executeUpdate(sql);

			sql = "INSERT INTO SP_AUTO_ITEM (SPA_ORGA_CD, SPA_SBCD_CD, SPA_USE_YN, SPA_INPT_ID, SPA_INPT_DTT) VALUES (";
			sql += "  '04'";
			sql += ", '0158'";
			sql += ", 'Y'";
			sql += ", '" + GUSER + "'";
			sql += ", SYSDATE";
			sql += ")";

			argStmtExec.executeUpdate(sql);

			sql = "INSERT INTO SP_AUTO_ITEM (SPA_ORGA_CD, SPA_SBCD_CD, SPA_USE_YN, SPA_INPT_ID, SPA_INPT_DTT) VALUES (";
			sql += "  '04'";
			sql += ", '0160'";
			sql += ", 'Y'";
			sql += ", '" + GUSER + "'";
			sql += ", SYSDATE";
			sql += ")";

			argStmtExec.executeUpdate(sql);

			sql = "INSERT INTO SP_AUTO_ITEM (SPA_ORGA_CD, SPA_SBCD_CD, SPA_USE_YN, SPA_INPT_ID, SPA_INPT_DTT) VALUES (";
			sql += "  '04'";
			sql += ", '0162'";
			sql += ", 'Y'";
			sql += ", '" + GUSER + "'";
			sql += ", SYSDATE";
			sql += ")";

			argStmtExec.executeUpdate(sql);

			sql = "INSERT INTO SP_AUTO_ITEM (SPA_ORGA_CD, SPA_SBCD_CD, SPA_USE_YN, SPA_INPT_ID, SPA_INPT_DTT) VALUES (";
			sql += "  '04'";
			sql += ", '0164'";
			sql += ", 'Y'";
			sql += ", '" + GUSER + "'";
			sql += ", SYSDATE";
			sql += ")";

			argStmtExec.executeUpdate(sql);

			sql = "INSERT INTO SP_AUTO_ITEM (SPA_ORGA_CD, SPA_SBCD_CD, SPA_USE_YN, SPA_INPT_ID, SPA_INPT_DTT) VALUES (";
			sql += "  '04'";
			sql += ", '0166'";
			sql += ", 'Y'";
			sql += ", '" + GUSER + "'";
			sql += ", SYSDATE";
			sql += ")";

			argStmtExec.executeUpdate(sql);

			sql = "INSERT INTO SP_AUTO_ITEM (SPA_ORGA_CD, SPA_SBCD_CD, SPA_USE_YN, SPA_INPT_ID, SPA_INPT_DTT) VALUES (";
			sql += "  '04'";
			sql += ", '0172'";
			sql += ", 'Y'";
			sql += ", '" + GUSER + "'";
			sql += ", SYSDATE";
			sql += ")";

			argStmtExec.executeUpdate(sql);

			sql = "INSERT INTO SP_AUTO_ITEM (SPA_ORGA_CD, SPA_SBCD_CD, SPA_USE_YN, SPA_INPT_ID, SPA_INPT_DTT) VALUES (";
			sql += "  '04'";
			sql += ", '0174'";
			sql += ", 'Y'";
			sql += ", '" + GUSER + "'";
			sql += ", SYSDATE";
			sql += ")";

			argStmtExec.executeUpdate(sql);

			sql = "INSERT INTO SP_AUTO_ITEM (SPA_ORGA_CD, SPA_SBCD_CD, SPA_USE_YN, SPA_INPT_ID, SPA_INPT_DTT) VALUES (";
			sql += "  '04'";
			sql += ", '0363'";
			sql += ", 'Y'";
			sql += ", '" + GUSER + "'";
			sql += ", SYSDATE";
			sql += ")";

			argStmtExec.executeUpdate(sql);

			sql = "INSERT INTO SP_AUTO_ITEM (SPA_ORGA_CD, SPA_SBCD_CD, SPA_USE_YN, SPA_INPT_ID, SPA_INPT_DTT) VALUES (";
			sql += "  '04'";
			sql += ", '0364'";
			sql += ", 'Y'";
			sql += ", '" + GUSER + "'";
			sql += ", SYSDATE";
			sql += ")";

			argStmtExec.executeUpdate(sql);

			sql = "INSERT INTO SP_AUTO_ITEM (SPA_ORGA_CD, SPA_SBCD_CD, SPA_USE_YN, SPA_INPT_ID, SPA_INPT_DTT) VALUES (";
			sql += "  '04'";
			sql += ", '0367'";
			sql += ", 'Y'";
			sql += ", '" + GUSER + "'";
			sql += ", SYSDATE";
			sql += ")";

			argStmtExec.executeUpdate(sql);

			sql = "INSERT INTO SP_AUTO_ITEM (SPA_ORGA_CD, SPA_SBCD_CD, SPA_USE_YN, SPA_INPT_ID, SPA_INPT_DTT) VALUES (";
			sql += "  '04'";
			sql += ", '0368'";
			sql += ", 'Y'";
			sql += ", '" + GUSER + "'";
			sql += ", SYSDATE";
			sql += ")";

			argStmtExec.executeUpdate(sql);

			sql = "INSERT INTO SP_AUTO_ITEM (SPA_ORGA_CD, SPA_SBCD_CD, SPA_USE_YN, SPA_INPT_ID, SPA_INPT_DTT) VALUES (";
			sql += "  '04'";
			sql += ", '0507'";
			sql += ", 'Y'";
			sql += ", '" + GUSER + "'";
			sql += ", SYSDATE";
			sql += ")";

			argStmtExec.executeUpdate(sql);

			sql = "INSERT INTO SP_AUTO_ITEM (SPA_ORGA_CD, SPA_SBCD_CD, SPA_USE_YN, SPA_INPT_ID, SPA_INPT_DTT) VALUES (";
			sql += "  '04'";
			sql += ", '0532'";
			sql += ", 'Y'";
			sql += ", '" + GUSER + "'";
			sql += ", SYSDATE";
			sql += ")";

			argStmtExec.executeUpdate(sql);

			sql = "INSERT INTO SP_AUTO_ITEM (SPA_ORGA_CD, SPA_SBCD_CD, SPA_USE_YN, SPA_INPT_ID, SPA_INPT_DTT) VALUES (";
			sql += "  '05'";
			sql += ", '0106'";
			sql += ", 'Y'";
			sql += ", '" + GUSER + "'";
			sql += ", SYSDATE";
			sql += ")";

			argStmtExec.executeUpdate(sql);

			sql = "INSERT INTO SP_AUTO_ITEM (SPA_ORGA_CD, SPA_SBCD_CD, SPA_USE_YN, SPA_INPT_ID, SPA_INPT_DTT) VALUES (";
			sql += "  '05'";
			sql += ", '0107'";
			sql += ", 'Y'";
			sql += ", '" + GUSER + "'";
			sql += ", SYSDATE";
			sql += ")";

			argStmtExec.executeUpdate(sql);

			sql = "INSERT INTO SP_AUTO_ITEM (SPA_ORGA_CD, SPA_SBCD_CD, SPA_USE_YN, SPA_INPT_ID, SPA_INPT_DTT) VALUES (";
			sql += "  '05'";
			sql += ", '0111'";
			sql += ", 'Y'";
			sql += ", '" + GUSER + "'";
			sql += ", SYSDATE";
			sql += ")";

			argStmtExec.executeUpdate(sql);

			sql = "INSERT INTO SP_AUTO_ITEM (SPA_ORGA_CD, SPA_SBCD_CD, SPA_USE_YN, SPA_INPT_ID, SPA_INPT_DTT) VALUES (";
			sql += "  '05'";
			sql += ", '0568'";
			sql += ", 'Y'";
			sql += ", '" + GUSER + "'";
			sql += ", SYSDATE";
			sql += ")";

			argStmtExec.executeUpdate(sql);

			sql = "INSERT INTO SP_AUTO_ITEM (SPA_ORGA_CD, SPA_SBCD_CD, SPA_USE_YN, SPA_INPT_ID, SPA_INPT_DTT) VALUES (";
			sql += "  '05'";
			sql += ", '0569'";
			sql += ", 'Y'";
			sql += ", '" + GUSER + "'";
			sql += ", SYSDATE";
			sql += ")";

			argStmtExec.executeUpdate(sql);

			sql = "INSERT INTO SP_AUTO_ITEM (SPA_ORGA_CD, SPA_SBCD_CD, SPA_USE_YN, SPA_INPT_ID, SPA_INPT_DTT) VALUES (";
			sql += "  '05'";
			sql += ", '0601'";
			sql += ", 'Y'";
			sql += ", '" + GUSER + "'";
			sql += ", SYSDATE";
			sql += ")";

			argStmtExec.executeUpdate(sql);

			sql = "INSERT INTO SP_AUTO_ITEM (SPA_ORGA_CD, SPA_SBCD_CD, SPA_USE_YN, SPA_INPT_ID, SPA_INPT_DTT) VALUES (";
			sql += "  '06'";
			sql += ", '0373'";
			sql += ", 'Y'";
			sql += ", '" + GUSER + "'";
			sql += ", SYSDATE";
			sql += ")";

			argStmtExec.executeUpdate(sql);

			sql = "INSERT INTO SP_AUTO_ITEM (SPA_ORGA_CD, SPA_SBCD_CD, SPA_USE_YN, SPA_INPT_ID, SPA_INPT_DTT) VALUES (";
			sql += "  '07'";
			sql += ", '0205'";
			sql += ", 'Y'";
			sql += ", '" + GUSER + "'";
			sql += ", SYSDATE";
			sql += ")";

			argStmtExec.executeUpdate(sql);

			sql = "INSERT INTO SP_AUTO_ITEM (SPA_ORGA_CD, SPA_SBCD_CD, SPA_USE_YN, SPA_INPT_ID, SPA_INPT_DTT) VALUES (";
			sql += "  '07'";
			sql += ", '0206'";
			sql += ", 'Y'";
			sql += ", '" + GUSER + "'";
			sql += ", SYSDATE";
			sql += ")";

			argStmtExec.executeUpdate(sql);

			sql = "INSERT INTO SP_AUTO_ITEM (SPA_ORGA_CD, SPA_SBCD_CD, SPA_USE_YN, SPA_INPT_ID, SPA_INPT_DTT) VALUES (";
			sql += "  '07'";
			sql += ", '0207'";
			sql += ", 'Y'";
			sql += ", '" + GUSER + "'";
			sql += ", SYSDATE";
			sql += ")";

			argStmtExec.executeUpdate(sql);

			sql = "INSERT INTO SP_AUTO_ITEM (SPA_ORGA_CD, SPA_SBCD_CD, SPA_USE_YN, SPA_INPT_ID, SPA_INPT_DTT) VALUES (";
			sql += "  '07'";
			sql += ", '0208'";
			sql += ", 'Y'";
			sql += ", '" + GUSER + "'";
			sql += ", SYSDATE";
			sql += ")";

			argStmtExec.executeUpdate(sql);

			sql = "INSERT INTO SP_AUTO_ITEM (SPA_ORGA_CD, SPA_SBCD_CD, SPA_USE_YN, SPA_INPT_ID, SPA_INPT_DTT) VALUES (";
			sql += "  '07'";
			sql += ", '0209'";
			sql += ", 'Y'";
			sql += ", '" + GUSER + "'";
			sql += ", SYSDATE";
			sql += ")";

			argStmtExec.executeUpdate(sql);

			sql = "INSERT INTO SP_AUTO_ITEM (SPA_ORGA_CD, SPA_SBCD_CD, SPA_USE_YN, SPA_INPT_ID, SPA_INPT_DTT) VALUES (";
			sql += "  '07'";
			sql += ", '0212'";
			sql += ", 'Y'";
			sql += ", '" + GUSER + "'";
			sql += ", SYSDATE";
			sql += ")";

			argStmtExec.executeUpdate(sql);

			sql = "INSERT INTO SP_AUTO_ITEM (SPA_ORGA_CD, SPA_SBCD_CD, SPA_USE_YN, SPA_INPT_ID, SPA_INPT_DTT) VALUES (";
			sql += "  '07'";
			sql += ", '0214'";
			sql += ", 'Y'";
			sql += ", '" + GUSER + "'";
			sql += ", SYSDATE";
			sql += ")";

			argStmtExec.executeUpdate(sql);

			sql = "INSERT INTO SP_AUTO_ITEM (SPA_ORGA_CD, SPA_SBCD_CD, SPA_USE_YN, SPA_INPT_ID, SPA_INPT_DTT) VALUES (";
			sql += "  '07'";
			sql += ", '0215'";
			sql += ", 'Y'";
			sql += ", '" + GUSER + "'";
			sql += ", SYSDATE";
			sql += ")";

			argStmtExec.executeUpdate(sql);

			sql = "INSERT INTO SP_AUTO_ITEM (SPA_ORGA_CD, SPA_SBCD_CD, SPA_USE_YN, SPA_INPT_ID, SPA_INPT_DTT) VALUES (";
			sql += "  '07'";
			sql += ", '0216'";
			sql += ", 'Y'";
			sql += ", '" + GUSER + "'";
			sql += ", SYSDATE";
			sql += ")";

			argStmtExec.executeUpdate(sql);

			sql = "INSERT INTO SP_AUTO_ITEM (SPA_ORGA_CD, SPA_SBCD_CD, SPA_USE_YN, SPA_INPT_ID, SPA_INPT_DTT) VALUES (";
			sql += "  '07'";
			sql += ", '0358'";
			sql += ", 'Y'";
			sql += ", '" + GUSER + "'";
			sql += ", SYSDATE";
			sql += ")";

			argStmtExec.executeUpdate(sql);

			sql = "INSERT INTO SP_AUTO_ITEM (SPA_ORGA_CD, SPA_SBCD_CD, SPA_USE_YN, SPA_INPT_ID, SPA_INPT_DTT) VALUES (";
			sql += "  '07'";
			sql += ", '0503'";
			sql += ", 'Y'";
			sql += ", '" + GUSER + "'";
			sql += ", SYSDATE";
			sql += ")";

			argStmtExec.executeUpdate(sql);

			sql = "INSERT INTO SP_AUTO_ITEM (SPA_ORGA_CD, SPA_SBCD_CD, SPA_USE_YN, SPA_INPT_ID, SPA_INPT_DTT) VALUES (";
			sql += "  '09'";
			sql += ", '0181'";
			sql += ", 'Y'";
			sql += ", '" + GUSER + "'";
			sql += ", SYSDATE";
			sql += ")";

			argStmtExec.executeUpdate(sql);

			sql = "INSERT INTO SP_AUTO_ITEM (SPA_ORGA_CD, SPA_SBCD_CD, SPA_USE_YN, SPA_INPT_ID, SPA_INPT_DTT) VALUES (";
			sql += "  '09'";
			sql += ", '0182'";
			sql += ", 'Y'";
			sql += ", '" + GUSER + "'";
			sql += ", SYSDATE";
			sql += ")";

			argStmtExec.executeUpdate(sql);

			sql = "INSERT INTO SP_AUTO_ITEM (SPA_ORGA_CD, SPA_SBCD_CD, SPA_USE_YN, SPA_INPT_ID, SPA_INPT_DTT) VALUES (";
			sql += "  '09'";
			sql += ", '0185'";
			sql += ", 'Y'";
			sql += ", '" + GUSER + "'";
			sql += ", SYSDATE";
			sql += ")";

			argStmtExec.executeUpdate(sql);

			sql = "INSERT INTO SP_AUTO_ITEM (SPA_ORGA_CD, SPA_SBCD_CD, SPA_USE_YN, SPA_INPT_ID, SPA_INPT_DTT) VALUES (";
			sql += "  '09'";
			sql += ", '0231'";
			sql += ", 'Y'";
			sql += ", '" + GUSER + "'";
			sql += ", SYSDATE";
			sql += ")";

			argStmtExec.executeUpdate(sql);

			sql = "INSERT INTO SP_AUTO_ITEM (SPA_ORGA_CD, SPA_SBCD_CD, SPA_USE_YN, SPA_INPT_ID, SPA_INPT_DTT) VALUES (";
			sql += "  '09'";
			sql += ", '0235'";
			sql += ", 'Y'";
			sql += ", '" + GUSER + "'";
			sql += ", SYSDATE";
			sql += ")";

			argStmtExec.executeUpdate(sql);

			sql = "INSERT INTO SP_AUTO_ITEM (SPA_ORGA_CD, SPA_SBCD_CD, SPA_USE_YN, SPA_INPT_ID, SPA_INPT_DTT) VALUES (";
			sql += "  '09'";
			sql += ", '0236'";
			sql += ", 'Y'";
			sql += ", '" + GUSER + "'";
			sql += ", SYSDATE";
			sql += ")";

			argStmtExec.executeUpdate(sql);

			sql = "INSERT INTO SP_AUTO_ITEM (SPA_ORGA_CD, SPA_SBCD_CD, SPA_USE_YN, SPA_INPT_ID, SPA_INPT_DTT) VALUES (";
			sql += "  '09'";
			sql += ", '0237'";
			sql += ", 'Y'";
			sql += ", '" + GUSER + "'";
			sql += ", SYSDATE";
			sql += ")";

			argStmtExec.executeUpdate(sql);

			sql = "INSERT INTO SP_AUTO_ITEM (SPA_ORGA_CD, SPA_SBCD_CD, SPA_USE_YN, SPA_INPT_ID, SPA_INPT_DTT) VALUES (";
			sql += "  '09'";
			sql += ", '0263'";
			sql += ", 'Y'";
			sql += ", '" + GUSER + "'";
			sql += ", SYSDATE";
			sql += ")";

			argStmtExec.executeUpdate(sql);

			sql = "INSERT INTO SP_AUTO_ITEM (SPA_ORGA_CD, SPA_SBCD_CD, SPA_USE_YN, SPA_INPT_ID, SPA_INPT_DTT) VALUES (";
			sql += "  '11'";
			sql += ", '0114'";
			sql += ", 'Y'";
			sql += ", '" + GUSER + "'";
			sql += ", SYSDATE";
			sql += ")";

			argStmtExec.executeUpdate(sql);

			sql = "INSERT INTO SP_AUTO_ITEM (SPA_ORGA_CD, SPA_SBCD_CD, SPA_USE_YN, SPA_INPT_ID, SPA_INPT_DTT) VALUES (";
			sql += "  '11'";
			sql += ", '0130'";
			sql += ", 'Y'";
			sql += ", '" + GUSER + "'";
			sql += ", SYSDATE";
			sql += ")";

			argStmtExec.executeUpdate(sql);

			sql = "INSERT INTO SP_AUTO_ITEM (SPA_ORGA_CD, SPA_SBCD_CD, SPA_USE_YN, SPA_INPT_ID, SPA_INPT_DTT) VALUES (";
			sql += "  '11'";
			sql += ", '0131'";
			sql += ", 'Y'";
			sql += ", '" + GUSER + "'";
			sql += ", SYSDATE";
			sql += ")";

			argStmtExec.executeUpdate(sql);

			sql = "INSERT INTO SP_AUTO_ITEM (SPA_ORGA_CD, SPA_SBCD_CD, SPA_USE_YN, SPA_INPT_ID, SPA_INPT_DTT) VALUES (";
			sql += "  '11'";
			sql += ", '0146'";
			sql += ", 'Y'";
			sql += ", '" + GUSER + "'";
			sql += ", SYSDATE";
			sql += ")";

			argStmtExec.executeUpdate(sql);

			sql = "INSERT INTO SP_AUTO_ITEM (SPA_ORGA_CD, SPA_SBCD_CD, SPA_USE_YN, SPA_INPT_ID, SPA_INPT_DTT) VALUES (";
			sql += "  '11'";
			sql += ", '0397'";
			sql += ", 'Y'";
			sql += ", '" + GUSER + "'";
			sql += ", SYSDATE";
			sql += ")";

			argStmtExec.executeUpdate(sql);

			sql = "INSERT INTO SP_AUTO_ITEM (SPA_ORGA_CD, SPA_SBCD_CD, SPA_USE_YN, SPA_INPT_ID, SPA_INPT_DTT) VALUES (";
			sql += "  '11'";
			sql += ", '0411'";
			sql += ", 'Y'";
			sql += ", '" + GUSER + "'";
			sql += ", SYSDATE";
			sql += ")";

			argStmtExec.executeUpdate(sql);

			sql = "INSERT INTO SP_AUTO_ITEM (SPA_ORGA_CD, SPA_SBCD_CD, SPA_USE_YN, SPA_INPT_ID, SPA_INPT_DTT) VALUES (";
			sql += "  '11'";
			sql += ", '0425'";
			sql += ", 'Y'";
			sql += ", '" + GUSER + "'";
			sql += ", SYSDATE";
			sql += ")";

			argStmtExec.executeUpdate(sql);

			sql = "INSERT INTO SP_AUTO_ITEM (SPA_ORGA_CD, SPA_SBCD_CD, SPA_USE_YN, SPA_INPT_ID, SPA_INPT_DTT) VALUES (";
			sql += "  '11'";
			sql += ", '0428'";
			sql += ", 'Y'";
			sql += ", '" + GUSER + "'";
			sql += ", SYSDATE";
			sql += ")";

			argStmtExec.executeUpdate(sql);

			sql = "INSERT INTO SP_AUTO_ITEM (SPA_ORGA_CD, SPA_SBCD_CD, SPA_USE_YN, SPA_INPT_ID, SPA_INPT_DTT) VALUES (";
			sql += "  '11'";
			sql += ", '0501'";
			sql += ", 'Y'";
			sql += ", '" + GUSER + "'";
			sql += ", SYSDATE";
			sql += ")";

			argStmtExec.executeUpdate(sql);

			sql = "INSERT INTO SP_AUTO_ITEM (SPA_ORGA_CD, SPA_SBCD_CD, SPA_USE_YN, SPA_INPT_ID, SPA_INPT_DTT) VALUES (";
			sql += "  '11'";
			sql += ", '0509'";
			sql += ", 'Y'";
			sql += ", '" + GUSER + "'";
			sql += ", SYSDATE";
			sql += ")";

			argStmtExec.executeUpdate(sql);

			sql = "INSERT INTO SP_AUTO_ITEM (SPA_ORGA_CD, SPA_SBCD_CD, SPA_USE_YN, SPA_INPT_ID, SPA_INPT_DTT) VALUES (";
			sql += "  '11'";
			sql += ", '0513'";
			sql += ", 'Y'";
			sql += ", '" + GUSER + "'";
			sql += ", SYSDATE";
			sql += ")";

			argStmtExec.executeUpdate(sql);

			sql = "INSERT INTO SP_AUTO_ITEM (SPA_ORGA_CD, SPA_SBCD_CD, SPA_USE_YN, SPA_INPT_ID, SPA_INPT_DTT) VALUES (";
			sql += "  '14'";
			sql += ", '0606'";
			sql += ", 'Y'";
			sql += ", '" + GUSER + "'";
			sql += ", SYSDATE";
			sql += ")";

			argStmtExec.executeUpdate(sql);

			sql = "INSERT INTO SP_AUTO_ITEM (SPA_ORGA_CD, SPA_SBCD_CD, SPA_USE_YN, SPA_INPT_ID, SPA_INPT_DTT) VALUES (";
			sql += "  '15'";
			sql += ", '0607'";
			sql += ", 'Y'";
			sql += ", '" + GUSER + "'";
			sql += ", SYSDATE";
			sql += ")";

			argStmtExec.executeUpdate(sql);

		} catch (Exception e) {

			throw new FuncException(e.toString(), sql);
		}

		return sql;
	}
%>
