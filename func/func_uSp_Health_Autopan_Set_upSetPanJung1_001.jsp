<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%!
	public String func_uSp_Health_Autopan_Set_upSetPanJung1_001(Statement argStmtExec, HashMap argHtMethod) throws Exception {

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
			sql += "  '01001'";
			sql += ", '01'";
			sql += ", 'S01A'";
			sql += ", 'S01A'";
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
			sql += "  '01260'";
			sql += ", '01'";
			sql += ", 'C44C'";
			sql += ", 'C44C'";
			sql += ", '비뇨생식기계의 질환주의'";
			sql += ", '농뇨소견확인되어 추적검사 및 비뇨기계 증상 있을시 비뇨기과 진료 권함.'";
			sql += ", 'C2'";
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
			sql += "  '01811'";
			sql += ", '01'";
			sql += ", 'C44R'";
			sql += ", 'C44R'";
			sql += ", '비뇨생식기계의 질환의심'";
			sql += ", '단백뇨 관찰됨. 신장질환에 대한 정밀검사 요함.'";
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
			sql += "  '01812'";
			sql += ", '01'";
			sql += ", 'C44R'";
			sql += ", 'C44R'";
			sql += ", '비뇨생식기계의 질환의심'";
			sql += ", '혈뇨 소견 보여 2차 검진 요함.'";
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
			sql += "  '02001'";
			sql += ", '02'";
			sql += ", 'S01A'";
			sql += ", 'S01A'";
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
			sql += "  '02811'";
			sql += ", '02'";
			sql += ", 'C05R'";
			sql += ", 'C05R'";
			sql += ", '간장질환 추가선택검사요'";
			sql += ", '간기능정밀검사요함'";
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
			sql += "  '04001'";
			sql += ", '04'";
			sql += ", 'S01A'";
			sql += ", 'S01A'";
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
			sql += "  '04002'";
			sql += ", '04'";
			sql += ", 'S01A'";
			sql += ", 'S01A'";
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
			sql += "  '04811'";
			sql += ", '04'";
			sql += ", 'S01R'";
			sql += ", 'S01R'";
			sql += ", '추가검사요'";
			sql += ", '청력2차검사 요함'";
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
			sql += "  '04812'";
			sql += ", '04'";
			sql += ", 'S01R'";
			sql += ", 'S01R'";
			sql += ", '추가검사요'";
			sql += ", '청력2차검사 요함'";
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
			sql += "  '05001'";
			sql += ", '05'";
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
			sql += "  '05811'";
			sql += ", '05'";
			sql += ", 'N01R'";
			sql += ", 'N01R'";
			sql += ", '야간작업 질환 의심'";
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
			sql += "  '07001'";
			sql += ", '07'";
			sql += ", 'S01A'";
			sql += ", 'S01A'";
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
			sql += "  '07260'";
			sql += ", '07'";
			sql += ", 'C34C'";
			sql += ", 'C34C'";
			sql += ", '양성신생물 및 혈액질환과 면역장해 질환주의'";
			sql += ", '말초혈액검사상 혈색소 증가 소견 보임. 저산소 환경";
			sql += ", 종양";
			sql += ", 신장 질환 등에서 나타날 수 있으며 증상에 유의하며 추적 관찰.'";
			sql += ", 'C2'";
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
			sql += "  '07261'";
			sql += ", '07'";
			sql += ", 'C34C'";
			sql += ", 'C34C'";
			sql += ", '양성신생물 및 혈액질환과 면역장해 질환주의'";
			sql += ", '말초혈액검사상 경미한 림프구 증가소견. 정상인에서도 나타날수 있으나 감염";
			sql += ", 약물";
			sql += ", 스트레스";
			sql += ", 자가면역";
			sql += ", 갑상선항진증";
			sql += ", 종양 등 다양한 질환에서도 증가하므로 증상에 유의하며 추적검사.'";
			sql += ", 'C2'";
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
			sql += "  '07262'";
			sql += ", '07'";
			sql += ", 'C34C'";
			sql += ", 'C34C'";
			sql += ", '양성신생물 및 혈액질환과 면역장해 질환주의'";
			sql += ", '말초혈액 검사상 경미한 호산구 증가증 소견. 이는 정상에서도 나타날수 있으나";
			sql += ", 기생충감염";
			sql += ", 알러지";
			sql += ", 류마티스질환";
			sql += ", 종양 등에 의해서도 나타날 수 있으니 증상에 유의하며 추적검사 요함.'";
			sql += ", 'C2'";
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
			sql += "  '07263'";
			sql += ", '07'";
			sql += ", 'C34C'";
			sql += ", 'C34C'";
			sql += ", '양성신생물 및 혈액질환과 면역장해 질환주의'";
			sql += ", '말초혈액검사상 혈소판 증가 소견 보임. 감염";
			sql += ", 염증 등에 대한 반응성 변화 가능성 있으며 추적검사 요함.'";
			sql += ", 'C2'";
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
			sql += "  '07811'";
			sql += ", '07'";
			sql += ", 'C34R'";
			sql += ", 'C34R'";
			sql += ", '양성신생물 및 혈액질환과 면역장해 질환의심'";
			sql += ", '혈색소 감소 소견 보여 2차검진 요함.'";
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
			sql += "  '07812'";
			sql += ", '07'";
			sql += ", 'C34R'";
			sql += ", 'C34R'";
			sql += ", '양성신생물 및 혈액질환과 면역장해 질환의심'";
			sql += ", '적혈구 용적 감소 소견 보여 2차검진 요함.'";
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
			sql += "  '07813'";
			sql += ", '07'";
			sql += ", 'C34R'";
			sql += ", 'C34R'";
			sql += ", '양성신생물 및 혈액질환과 면역장해 질환의심'";
			sql += ", '적혈구 감소 소견 보여 2차검진 요함.'";
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
			sql += "  '07814'";
			sql += ", '07'";
			sql += ", 'C34R'";
			sql += ", 'C34R'";
			sql += ", '양성신생물 및 혈액질환과 면역장해 질환의심'";
			sql += ", '백혈구 감소 소견 보여 2차검진 요함.'";
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
			sql += "  '07815'";
			sql += ", '07'";
			sql += ", 'C34R'";
			sql += ", 'C34R'";
			sql += ", '양성신생물 및 혈액질환과 면역장해 질환의심'";
			sql += ", '백혈구 증가 소견 보여 2차검진 요함.'";
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
			sql += "  '07816'";
			sql += ", '07'";
			sql += ", 'C34R'";
			sql += ", 'C34R'";
			sql += ", '양성신생물 및 혈액질환과 면역장해 질환의심'";
			sql += ", '말초혈액검사상 메트헤모글로빈 수치 높아 추가검사 요함.'";
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
			sql += "  '07817'";
			sql += ", '07'";
			sql += ", 'C34R'";
			sql += ", 'C34R'";
			sql += ", '양성신생물 및 혈액질환과 면역장해 질환의심'";
			sql += ", '혈소판 감소 소견 보여 2차검진 요함.'";
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
			sql += "  '09001'";
			sql += ", '09'";
			sql += ", 'S01A'";
			sql += ", 'S01A'";
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
			sql += "  '09002'";
			sql += ", '09'";
			sql += ", 'S01A'";
			sql += ", 'S01A'";
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
			sql += "  '09003'";
			sql += ", '09'";
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
			sql += "  '09005'";
			sql += ", '09'";
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
			sql += "  '09006'";
			sql += ", '09'";
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
			sql += "  '09260'";
			sql += ", '09'";
			sql += ", 'C03C'";
			sql += ", 'C03C'";
			sql += ", '고혈압주의'";
			sql += ", '식이요법 및 운동";
			sql += ", 혈압 추적관찰.'";
			sql += ", 'C2'";
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
			sql += "  '09261'";
			sql += ", '09'";
			sql += ", 'C04C'";
			sql += ", 'C04C'";
			sql += ", '이상지질혈증주의'";
			sql += ", '이상지질혈증 주의: 식이요법 및 운동";
			sql += ", 견과류 섭취 콜레스테롤 추적관찰.'";
			sql += ", 'C2'";
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
			sql += "  '09262'";
			sql += ", '09'";
			sql += ", 'N01C'";
			sql += ", 'N01C'";
			sql += ", '야간작업 질환 주의'";
			sql += ", '공복혈당장애: 식이요법 및 운동";
			sql += ", 혈당 추적관찰.'";
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
			sql += "  '09610'";
			sql += ", '09'";
			sql += ", 'C03D'";
			sql += ", 'C03D'";
			sql += ", '고혈압'";
			sql += ", '고혈압: 정밀검사 및 치료 요함.'";
			sql += ", 'D2'";
			sql += ", '0'";
			sql += ", '2'";
			sql += ", '5'";
			sql += ", '0'";
			sql += ", '0'";
			sql += ", 'N'";
			sql += ", 'Y'";
			sql += ", 'ADMIN'";
			sql += ", SYSDATE";
			sql += ")";

			argStmtExec.executeUpdate(sql);

			sql = "INSERT INTO SP_AUTO_PAN (SPA_AUTO_CD, SPA_ORGA_CD, SPA_SOKY_CD, SPA_JOCH_CD, SPA_SOKY_TX, SPA_JOCH_TX, SPA_PANJ_CD, SPA_ORSU_CD, SPA_BUSI_CD, SPA_POSM1_CD, SPA_POSM2_CD,SPA_POSM3_CD,SPA_SPCL_CD, SPA_USE_YN, SPA_INPT_ID, SPA_INPT_DTT) VALUES (";
			sql += "  '09611'";
			sql += ", '09'";
			sql += ", 'C04D'";
			sql += ", 'C04D'";
			sql += ", '이상지질혈증'";
			sql += ", '고지혈증: 치료 요함.'";
			sql += ", 'D2'";
			sql += ", '0'";
			sql += ", '2'";
			sql += ", '5'";
			sql += ", '0'";
			sql += ", '0'";
			sql += ", 'N'";
			sql += ", 'Y'";
			sql += ", 'ADMIN'";
			sql += ", SYSDATE";
			sql += ")";

			argStmtExec.executeUpdate(sql);

			sql = "INSERT INTO SP_AUTO_PAN (SPA_AUTO_CD, SPA_ORGA_CD, SPA_SOKY_CD, SPA_JOCH_CD, SPA_SOKY_TX, SPA_JOCH_TX, SPA_PANJ_CD, SPA_ORSU_CD, SPA_BUSI_CD, SPA_POSM1_CD, SPA_POSM2_CD,SPA_POSM3_CD,SPA_SPCL_CD, SPA_USE_YN, SPA_INPT_ID, SPA_INPT_DTT) VALUES (";
			sql += "  '09612'";
			sql += ", '09'";
			sql += ", 'C03D'";
			sql += ", 'C03D'";
			sql += ", '고혈압'";
			sql += ", '고혈압: 운동";
			sql += ", 저염식 유지하며 혈압 추적관찰. 2-3개월후에도 고혈압 지속시 약물치료 필요.'";
			sql += ", 'D2'";
			sql += ", '0'";
			sql += ", '2'";
			sql += ", '5'";
			sql += ", '0'";
			sql += ", '0'";
			sql += ", 'N'";
			sql += ", 'Y'";
			sql += ", 'ADMIN'";
			sql += ", SYSDATE";
			sql += ")";

			argStmtExec.executeUpdate(sql);

			sql = "INSERT INTO SP_AUTO_PAN (SPA_AUTO_CD, SPA_ORGA_CD, SPA_SOKY_CD, SPA_JOCH_CD, SPA_SOKY_TX, SPA_JOCH_TX, SPA_PANJ_CD, SPA_ORSU_CD, SPA_BUSI_CD, SPA_POSM1_CD, SPA_POSM2_CD,SPA_POSM3_CD,SPA_SPCL_CD, SPA_USE_YN, SPA_INPT_ID, SPA_INPT_DTT) VALUES (";
			sql += "  '09613'";
			sql += ", '09'";
			sql += ", 'N01D'";
			sql += ", 'N01D'";
			sql += ", '야간작업 질환(고혈압";
			sql += ")', '고혈압: 지속적인 치료 요함.', 'DN', '0', '2', '5', '0', '0', 'N', 'Y', 'ADMIN', SYSDATE)";

			argStmtExec.executeUpdate(sql);

			sql = "INSERT INTO SP_AUTO_PAN (SPA_AUTO_CD, SPA_ORGA_CD, SPA_SOKY_CD, SPA_JOCH_CD, SPA_SOKY_TX, SPA_JOCH_TX, SPA_PANJ_CD, SPA_ORSU_CD, SPA_BUSI_CD, SPA_POSM1_CD, SPA_POSM2_CD,SPA_POSM3_CD,SPA_SPCL_CD, SPA_USE_YN, SPA_INPT_ID, SPA_INPT_DTT) VALUES (";
			sql += "  '09614'";
			sql += ", '09'";
			sql += ", 'N01D'";
			sql += ", 'N01D'";
			sql += ", '야간작업 질환(당뇨";
			sql += ")', '당뇨: 지속적인 치료 요함.', 'DN', '0', '2', '5', '0', '0', 'N', 'Y', 'ADMIN', SYSDATE)";

			argStmtExec.executeUpdate(sql);

			sql = "INSERT INTO SP_AUTO_PAN (SPA_AUTO_CD, SPA_ORGA_CD, SPA_SOKY_CD, SPA_JOCH_CD, SPA_SOKY_TX, SPA_JOCH_TX, SPA_PANJ_CD, SPA_ORSU_CD, SPA_BUSI_CD, SPA_POSM1_CD, SPA_POSM2_CD,SPA_POSM3_CD,SPA_SPCL_CD, SPA_USE_YN, SPA_INPT_ID, SPA_INPT_DTT) VALUES (";
			sql += "  '09615'";
			sql += ", '09'";
			sql += ", 'N01D'";
			sql += ", 'N01D'";
			sql += ", '야간작업 질환(이상지질혈증";
			sql += ")', '고지혈증: 지속적인 치료 요함.', 'DN', '0', '2', '5', '0', '0', 'N', 'Y', 'ADMIN', SYSDATE)";

			argStmtExec.executeUpdate(sql);

			sql = "INSERT INTO SP_AUTO_PAN (SPA_AUTO_CD, SPA_ORGA_CD, SPA_SOKY_CD, SPA_JOCH_CD, SPA_SOKY_TX, SPA_JOCH_TX, SPA_PANJ_CD, SPA_ORSU_CD, SPA_BUSI_CD, SPA_POSM1_CD, SPA_POSM2_CD,SPA_POSM3_CD,SPA_SPCL_CD, SPA_USE_YN, SPA_INPT_ID, SPA_INPT_DTT) VALUES (";
			sql += "  '09811'";
			sql += ", '09'";
			sql += ", 'N01R'";
			sql += ", 'N01R'";
			sql += ", '야간작업 질환(고혈압";
			sql += ") 의심', '추가선택검사요함', 'R', '0', '0', '0', '0', '0', 'N', 'Y', 'ADMIN', SYSDATE)";

			argStmtExec.executeUpdate(sql);

			sql = "INSERT INTO SP_AUTO_PAN (SPA_AUTO_CD, SPA_ORGA_CD, SPA_SOKY_CD, SPA_JOCH_CD, SPA_SOKY_TX, SPA_JOCH_TX, SPA_PANJ_CD, SPA_ORSU_CD, SPA_BUSI_CD, SPA_POSM1_CD, SPA_POSM2_CD,SPA_POSM3_CD,SPA_SPCL_CD, SPA_USE_YN, SPA_INPT_ID, SPA_INPT_DTT) VALUES (";
			sql += "  '09812'";
			sql += ", '09'";
			sql += ", 'N01R'";
			sql += ", 'N01R'";
			sql += ", '야간작업 질환(이상지질혈증";
			sql += ") 의심', '추가선택검사요함', 'R', '0', '0', '0', '0', '0', 'N', 'Y', 'ADMIN', SYSDATE)";

			argStmtExec.executeUpdate(sql);

			sql = "INSERT INTO SP_AUTO_PAN (SPA_AUTO_CD, SPA_ORGA_CD, SPA_SOKY_CD, SPA_JOCH_CD, SPA_SOKY_TX, SPA_JOCH_TX, SPA_PANJ_CD, SPA_ORSU_CD, SPA_BUSI_CD, SPA_POSM1_CD, SPA_POSM2_CD,SPA_POSM3_CD,SPA_SPCL_CD, SPA_USE_YN, SPA_INPT_ID, SPA_INPT_DTT) VALUES (";
			sql += "  '09813'";
			sql += ", '09'";
			sql += ", 'N01R'";
			sql += ", 'N01R'";
			sql += ", '야간작업 질환(당뇨";
			sql += ") 의심', '추가선택검사요함', 'R', '0', '0', '0', '0', '0', 'N', 'Y', 'ADMIN', SYSDATE)";

			argStmtExec.executeUpdate(sql);
		} catch (Exception e) {

			throw new FuncException(e.toString(), sql);
		}

		return sql;
	}
%>
