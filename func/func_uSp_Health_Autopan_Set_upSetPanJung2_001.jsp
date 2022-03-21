<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%!
	public String func_uSp_Health_Autopan_Set_upSetPanJung2_001(Statement argStmtExec, HashMap argHtMethod) throws Exception {

		String sql = "";
		String sql2 = "";
		String sql_disp = "";

		try {

			String GUSER = (String) argHtMethod.get("GUSER");

			//
			if(GUSER == null) { GUSER = ""; }

			//
			GUSER = CTr.Replace(GUSER, "'", "''");

			sql = "INSERT INTO SP_AUTO_PAN (SPA_AUTO_CD, SPA_ORGA_CD, SPA_SOKY_CD, SPA_JOCH_CD, SPA_SOKY_TX, SPA_JOCH_TX, SPA_PANJ_CD, SPA_ORSU_CD, SPA_BUSI_CD, SPA_POSM1_CD, SPA_POSM2_CD,SPA_POSM3_CD,SPA_SPCL_CD, SPA_USE_YN, SPA_INPT_ID, SPA_INPT_DTT) VALUES (";
			sql += "  '13825'";
			sql += ", '13'";
			sql += ", 'S01R'";
			sql += ", 'S01R'";
			sql += ", '추가검사요'";
			sql += ", '추가선택검사요함'";
			sql += ", 'R'";
			sql += ", '0'";
			sql += ", '0'";
			sql += ", '0'";
			sql += ", '0'";
			sql += ", '0'";
			sql += ", 'N'";
			sql += ", 'Y'";
			sql += ", 'ADMIN'";
			sql += ", SYSDATE";
			sql += ")";

			argStmtExec.executeUpdate(sql);

			sql = "INSERT INTO SP_AUTO_PAN (SPA_AUTO_CD, SPA_ORGA_CD, SPA_SOKY_CD, SPA_JOCH_CD, SPA_SOKY_TX, SPA_JOCH_TX, SPA_PANJ_CD, SPA_ORSU_CD, SPA_BUSI_CD, SPA_POSM1_CD, SPA_POSM2_CD,SPA_POSM3_CD,SPA_SPCL_CD, SPA_USE_YN, SPA_INPT_ID, SPA_INPT_DTT) VALUES (";
			sql += "  '14001'";
			sql += ", '14'";
			sql += ", 'N01A'";
			sql += ", 'N01A'";
			sql += ", '정상'";
			sql += ", '건강양호'";
			sql += ", 'A'";
			sql += ", '0'";
			sql += ", '1'";
			sql += ", '1'";
			sql += ", '0'";
			sql += ", '0'";
			sql += ", 'N'";
			sql += ", 'Y'";
			sql += ", 'ADMIN'";
			sql += ", SYSDATE";
			sql += ")";

			argStmtExec.executeUpdate(sql);

			sql = "INSERT INTO SP_AUTO_PAN (SPA_AUTO_CD, SPA_ORGA_CD, SPA_SOKY_CD, SPA_JOCH_CD, SPA_SOKY_TX, SPA_JOCH_TX, SPA_PANJ_CD, SPA_ORSU_CD, SPA_BUSI_CD, SPA_POSM1_CD, SPA_POSM2_CD,SPA_POSM3_CD,SPA_SPCL_CD, SPA_USE_YN, SPA_INPT_ID, SPA_INPT_DTT) VALUES (";
			sql += "  '14260'";
			sql += ", '14'";
			sql += ", 'N01C'";
			sql += ", 'N01C'";
			sql += ", '야간작업 질환 주의'";
			sql += ", '위장 관련 증상 있음. 추적관찰.'";
			sql += ", 'CN'";
			sql += ", '0'";
			sql += ", '2'";
			sql += ", '4'";
			sql += ", '0'";
			sql += ", '0'";
			sql += ", 'N'";
			sql += ", 'Y'";
			sql += ", 'ADMIN'";
			sql += ", SYSDATE";
			sql += ")";

			argStmtExec.executeUpdate(sql);

			sql = "INSERT INTO SP_AUTO_PAN (SPA_AUTO_CD, SPA_ORGA_CD, SPA_SOKY_CD, SPA_JOCH_CD, SPA_SOKY_TX, SPA_JOCH_TX, SPA_PANJ_CD, SPA_ORSU_CD, SPA_BUSI_CD, SPA_POSM1_CD, SPA_POSM2_CD,SPA_POSM3_CD,SPA_SPCL_CD, SPA_USE_YN, SPA_INPT_ID, SPA_INPT_DTT) VALUES (";
			sql += "  '15001'";
			sql += ", '15'";
			sql += ", 'N01A'";
			sql += ", 'N01A'";
			sql += ", '정상'";
			sql += ", '건강양호'";
			sql += ", 'A'";
			sql += ", '0'";
			sql += ", '1'";
			sql += ", '1'";
			sql += ", '0'";
			sql += ", '0'";
			sql += ", 'N'";
			sql += ", 'Y'";
			sql += ", 'ADMIN'";
			sql += ", SYSDATE";
			sql += ")";

			argStmtExec.executeUpdate(sql);

			sql = "INSERT INTO SP_AUTO_PAN (SPA_AUTO_CD, SPA_ORGA_CD, SPA_SOKY_CD, SPA_JOCH_CD, SPA_SOKY_TX, SPA_JOCH_TX, SPA_PANJ_CD, SPA_ORSU_CD, SPA_BUSI_CD, SPA_POSM1_CD, SPA_POSM2_CD,SPA_POSM3_CD,SPA_SPCL_CD, SPA_USE_YN, SPA_INPT_ID, SPA_INPT_DTT) VALUES (";
			sql += "  '15260'";
			sql += ", '15'";
			sql += ", 'N01C'";
			sql += ", 'N01C'";
			sql += ", '야간작업 질환 주의'";
			sql += ", '이전 검사상 양성소견. 추적관찰'";
			sql += ", 'CN'";
			sql += ", '0'";
			sql += ", '2'";
			sql += ", '4'";
			sql += ", '0'";
			sql += ", '0'";
			sql += ", 'N'";
			sql += ", 'Y'";
			sql += ", 'ADMIN'";
			sql += ", SYSDATE";
			sql += ")";

			argStmtExec.executeUpdate(sql);

		} catch (Exception e) {

			throw new FuncException(e.toString(), sql);
		}

		return sql;
	}
%>
