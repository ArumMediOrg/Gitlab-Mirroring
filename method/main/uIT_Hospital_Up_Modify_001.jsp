<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.HashMap"%>
<%@ include file="/inc_prg/common.jsp"%>
<%
	// 전달자료
	HashMap<String, Object> htData = null;
	HashMap<String, String> htMethod = null;

	// DB객체
	Statement stmtExec = null;
	PreparedStatement pstmt = null;

	//
	String G_INFO = "";

	try {
%>
<%@ include file="/inc_prg/connect.jsp"%>
<%
		// 전달자료
		htData = (HashMap<String, Object>)request.getAttribute("htData");
		htMethod = (HashMap<String, String>)request.getAttribute("htMethod_1");

		String HOSP_NO = htMethod.get("HOSP_NO");
		String HOSP_NM = htMethod.get("HOSP_NM");
		String BUSI_NO = htMethod.get("BUSI_NO");
		String BUCO_NO = htMethod.get("BUCO_NO");
		String BUCA_NO = htMethod.get("BUCA_NO");
		String PRES_NM = htMethod.get("PRES_NM");
		String ZIP_CD = htMethod.get("ZIP_CD");
		String ZIP_AR = htMethod.get("ZIP_AR");
		String ROAD_AR = htMethod.get("ROAD_AR");
		String ASSO_NO = htMethod.get("ASSO_NO");
		String ASSO_NM = htMethod.get("ASSO_NM");
		String STAN_CD = htMethod.get("STAN_CD");
		String HECK_CD = htMethod.get("HECK_CD");
		String SYCK_CD = htMethod.get("SYCK_CD");
		String SUCK_CD = htMethod.get("SUCK_CD");
		String EOCK_CD = htMethod.get("EOCK_CD");
		String EBCK_CD = htMethod.get("EBCK_CD");
		String SACK_CD = htMethod.get("SACK_CD");
		String GUCK_CD = htMethod.get("GUCK_CD");
		String HYCK_CD = htMethod.get("HYCK_CD");
		String SPCK_CD = htMethod.get("SPCK_CD");
		String MACK_CD = htMethod.get("MACK_CD");
		String BLCK_CD = htMethod.get("BLCK_CD");
		String SECK_CD = htMethod.get("SECK_CD");
		String BUSI_CD = htMethod.get("BUSI_CD");
		String CHAR_YN = htMethod.get("CHAR_YN");
		String SUBO_CD = htMethod.get("SUBO_CD");
		String JTEL_NO = htMethod.get("JTEL_NO");
		String HOSP_IMG = htMethod.get("HOSP_IMG");
		String GTEL_NO = htMethod.get("GTEL_NO");
		String STEL_NO = htMethod.get("STEL_NO");
		String ACNU1_NO = htMethod.get("ACNU1_NO");
		String ACNU2_NO = htMethod.get("ACNU2_NO");
		String ACNU3_NO = htMethod.get("ACNU3_NO");
		String MODI_ID = htMethod.get("MODI_ID");
		String MODI_DTT = htMethod.get("MODI_DTT");
		String HOSP_NO2 = htMethod.get("HOSP_NO2");
		String HOSP_NM2 = htMethod.get("HOSP_NM2");
		String DTTEL_NO = htMethod.get("DTTEL_NO");
		String ZIP_CD2 = htMethod.get("ZIP_CD2");
		String ZIP_AR2 = htMethod.get("ZIP_AR2");
		String ROAD_AR2 = htMethod.get("ROAD_AR2");
		String HOSP_IMG2 = htMethod.get("HOSP_IMG2");
		String HOSP_CD = htMethod.get("HOSP_CD");
		String RTKN_KEY = htMethod.get("RTKN_KEY");
		String STKN_KEY = htMethod.get("STKN_KEY");
		String NETDOWN_PATH = htMethod.get("NETDOWN_PATH");
		String NETDOWN_ID = htMethod.get("NETDOWN_ID");
		String NETDOWN_PW = htMethod.get("NETDOWN_PW");

		//
		if(HOSP_NO == null) { HOSP_NO = ""; }
		if(HOSP_NM == null) { HOSP_NM = ""; }
		if(BUSI_NO == null) { BUSI_NO = ""; }
		if(BUCO_NO == null) { BUCO_NO = ""; }
		if(BUCA_NO == null) { BUCA_NO = ""; }
		if(PRES_NM == null) { PRES_NM = ""; }
		if(ZIP_CD == null) { ZIP_CD = ""; }
		if(ZIP_AR == null) { ZIP_AR = ""; }
		if(ROAD_AR == null) { ROAD_AR = ""; }
		if(ASSO_NO == null) { ASSO_NO = ""; }
		if(ASSO_NM == null) { ASSO_NM = ""; }
		if(STAN_CD == null) { STAN_CD = ""; }
		if(HECK_CD == null) { HECK_CD = ""; }
		if(SYCK_CD == null) { SYCK_CD = ""; }
		if(SUCK_CD == null) { SUCK_CD = ""; }
		if(EOCK_CD == null) { EOCK_CD = ""; }
		if(EBCK_CD == null) { EBCK_CD = ""; }
		if(SACK_CD == null) { SACK_CD = ""; }
		if(GUCK_CD == null) { GUCK_CD = ""; }
		if(HYCK_CD == null) { HYCK_CD = ""; }
		if(SPCK_CD == null) { SPCK_CD = ""; }
		if(MACK_CD == null) { MACK_CD = ""; }
		if(BLCK_CD == null) { BLCK_CD = ""; }
		if(SECK_CD == null) { SECK_CD = ""; }
		if(BUSI_CD == null) { BUSI_CD = ""; }
		if(CHAR_YN == null) { CHAR_YN = ""; }
		if(SUBO_CD == null) { SUBO_CD = ""; }
		if(JTEL_NO == null) { JTEL_NO = ""; }
		if(HOSP_IMG == null) { HOSP_IMG = ""; }
		if(GTEL_NO == null) { GTEL_NO = ""; }
		if(STEL_NO == null) { STEL_NO = ""; }
		if(ACNU1_NO == null) { ACNU1_NO = ""; }
		if(ACNU2_NO == null) { ACNU2_NO = ""; }
		if(ACNU3_NO == null) { ACNU3_NO = ""; }
		if(MODI_ID == null) { MODI_ID = ""; }
		if(MODI_DTT == null) { MODI_DTT = ""; }
		if(HOSP_NO2 == null) { HOSP_NO2 = ""; }
		if(HOSP_NM2 == null) { HOSP_NM2 = ""; }
		if(DTTEL_NO == null) { DTTEL_NO = ""; }
		if(ZIP_CD2 == null) { ZIP_CD2 = ""; }
		if(ZIP_AR2 == null) { ZIP_AR2 = ""; }
		if(ROAD_AR2 == null) { ROAD_AR2 = ""; }
		if(HOSP_IMG2 == null) { HOSP_IMG2 = ""; }
		if(HOSP_CD == null) { HOSP_CD = ""; }
		if(RTKN_KEY == null) { RTKN_KEY = ""; }
		if(STKN_KEY == null) { STKN_KEY = ""; }
		if(NETDOWN_PATH == null) { NETDOWN_PATH = ""; }
		if(NETDOWN_ID == null) { NETDOWN_ID = ""; }
		if(NETDOWN_PW == null) { NETDOWN_PW = ""; }

		// DB객체
		stmtExec = connect.createStatement();

		/*

 UPDATE IT_HOSPITAL SET
IHL_HOSP_NO= :HOSP_NO ,IHL_HOSP_NM= :HOSP_NM,        IHL_BUSI_NO=:BUSI_NO,IHL_BUCO_NO=:BUCO_NO,IHL_BUCA_NO=:BUCA_NO,IHL_PRES_NM=:PRES_NM, IHL_ZIP_CD=:ZIP_CD,
IHL_ZIP_AR =:ZIP_AR,         IHL_ROAD_AR=:ROAD_AR,        IHL_ASSO_NO=:ASSO_NO, IHL_ASSO_NM=:ASSO_NM,        IHL_STAN_CD=:STAN_CD, IHL_HECK_CD=:HECK_CD,        IHL_SYCK_CD=:SYCK_CD,
IHL_SUCK_CD=:SUCK_CD, IHL_EOCK_CD=:EOCK_CD,        IHL_EBCK_CD=:EBCK_CD, IHL_SACK_CD=:SACK_CD, IHL_GUCK_CD=:GUCK_CD, IHL_HYCK_CD=:HYCK_CD,        IHL_SPCK_CD=:SPCK_CD,
IHL_MACK_CD=:MACK_CD, IHL_BLCK_CD=:BLCK_CD, IHL_SECK_CD=:SECK_CD, IHL_BUSI_CD=:BUSI_CD, IHL_CHAR_YN=:CHAR_YN, IHL_SUBO_CD=:SUBO_CD, IHL_JTEL_NO=:JTEL_NO,
IHL_HOSP_IMG=:HOSP_IMG,
IHL_GTEL_NO=:GTEL_NO, IHL_STEL_NO=:STEL_NO, IHL_ACNU1_NO=:ACNU1_NO,IHL_ACNU2_NO=:ACNU2_NO,IHL_ACNU3_NO=:ACNU3_NO,IHL_MODI_ID=:MODI_ID,IHL_MODI_DTT= :MODI_DTT,
IHL_HOSP_NO2=:HOSP_NO2,IHL_HOSP_NM2=:HOSP_NM2,IHL_DTTEL_NO=:DTTEL_NO,
IHL_ZIP_CD2=:ZIP_CD2, IHL_ZIP_AR2=:ZIP_AR2, IHL_ROAD_AR2=:ROAD_AR2,IHL_HOSP_IMG2=:HOSP_IMG2,
IHL_HOSP_CD = :HOSP_CD

IF (:RTKN_KEY <> '') THEN
  , IHL_RTKN_KEY = :RTKN_KEY

IF (:STKN_KEY <> '') THEN
  , IHL_STKN_KEY = :STKN_KEY
		*/

		sql = "UPDATE IT_HOSPITAL SET IHL_HOSP_NO = ?, IHL_HOSP_NM = ?, IHL_BUSI_NO = ?, IHL_BUCO_NO = ?, IHL_BUCA_NO = ?, IHL_PRES_NM = ?, IHL_ZIP_CD = ?, IHL_ZIP_AR = ?, IHL_ROAD_AR = ?, IHL_ASSO_NO = ?, IHL_ASSO_NM = ?, IHL_STAN_CD = ?, IHL_HECK_CD = ?, IHL_SYCK_CD = ?, IHL_SUCK_CD = ?, IHL_EOCK_CD = ?, IHL_EBCK_CD = ?, IHL_SACK_CD = ?, IHL_GUCK_CD = ?, IHL_HYCK_CD = ?, IHL_SPCK_CD = ?, IHL_MACK_CD = ?, IHL_BLCK_CD = ?, IHL_SECK_CD = ?, IHL_BUSI_CD = ?, IHL_CHAR_YN = ?, IHL_SUBO_CD = ?, IHL_JTEL_NO = ?, IHL_HOSP_IMG = ?, IHL_GTEL_NO = ?, IHL_STEL_NO = ?, IHL_ACNU1_NO = ?, IHL_ACNU2_NO = ?, IHL_ACNU3_NO = ?, IHL_MODI_ID = ?, IHL_MODI_DTT = ?, IHL_HOSP_NO2 = ?, IHL_HOSP_NM2 = ?, IHL_DTTEL_NO = ?, IHL_ZIP_CD2 = ?, IHL_ZIP_AR2 = ?, IHL_ROAD_AR2 = ?, IHL_HOSP_IMG2 = ?, IHL_HOSP_CD = ?, IHL_NETDOWN_PATH = ?, IHL_NETDOWN_ID =?, IHL_NETDOWN_PW =?";
		if(! RTKN_KEY.equals("")) {
			sql += ", IHL_RTKN_KEY = ?";
		}
		if(! STKN_KEY.equals("")) {
			sql += ", IHL_STKN_KEY = ?";
		}

		pstmt = connect.prepareStatement(sql);

		pstmt.setString(1, HOSP_NO);
		pstmt.setString(2, HOSP_NM);
		pstmt.setString(3, BUSI_NO);
		pstmt.setString(4, BUCO_NO);
		pstmt.setString(5, BUCA_NO);
		pstmt.setString(6, PRES_NM);
		pstmt.setString(7, ZIP_CD);
		pstmt.setString(8, ZIP_AR);
		pstmt.setString(9, ROAD_AR);
		pstmt.setString(10, ASSO_NO);
		pstmt.setString(11, ASSO_NM);
		pstmt.setString(12, STAN_CD);
		pstmt.setString(13, HECK_CD);
		pstmt.setString(14, SYCK_CD);
		pstmt.setString(15, SUCK_CD);
		pstmt.setString(16, EOCK_CD);
		pstmt.setString(17, EBCK_CD);
		pstmt.setString(18, SACK_CD);
		pstmt.setString(19, GUCK_CD);
		pstmt.setString(20, HYCK_CD);
		pstmt.setString(21, SPCK_CD);
		pstmt.setString(22, MACK_CD);
		pstmt.setString(23, BLCK_CD);
		pstmt.setString(24, SECK_CD);
		pstmt.setString(25, BUSI_CD);
		pstmt.setString(26, CHAR_YN);
		pstmt.setString(27, SUBO_CD);
		pstmt.setString(28, JTEL_NO);
		pstmt.setBytes(29, HOSP_IMG.getBytes());
		pstmt.setString(30, GTEL_NO);
		pstmt.setString(31, STEL_NO);
		pstmt.setString(32, ACNU1_NO);
		pstmt.setString(33, ACNU2_NO);
		pstmt.setString(34, ACNU3_NO);
		pstmt.setString(35, MODI_ID);
		// pstmt.setString(36, (MODI_DTT.equals("") ? null : MODI_DTT));
		pstmt.setTimestamp(36, MODI_DTT.equals("") ? null : java.sql.Timestamp.valueOf(MODI_DTT));
		pstmt.setString(37, HOSP_NO2);
		pstmt.setString(38, HOSP_NM2);
		pstmt.setString(39, DTTEL_NO);
		pstmt.setString(40, ZIP_CD2);
		pstmt.setString(41, ZIP_AR2);
		pstmt.setString(42, ROAD_AR2);
		pstmt.setBytes(43, HOSP_IMG2.getBytes());
		pstmt.setString(44, HOSP_CD);
		pstmt.setString(47, NETDOWN_PATH);
		pstmt.setString(48, NETDOWN_ID);
		pstmt.setString(49, NETDOWN_PW);

		if(! RTKN_KEY.equals("")) {
			pstmt.setString(45, RTKN_KEY);
		}

		if(! STKN_KEY.equals("")) {
			if(! RTKN_KEY.equals("")) {
					pstmt.setString(46, STKN_KEY);
			} else {
					pstmt.setString(45, STKN_KEY);
			}
		}

		pstmt.executeUpdate();
			//
			G_INFO += "<!-- \n";
			G_INFO += "서비스명 : uIT_Hospital_Up_Modify_001 \n";
			G_INFO += "설명 : 병원정보 수정 \n";
			G_INFO += "\n\n";

			G_INFO += "전달인자 : \n";
			G_INFO += " HOSP_NO : " + HOSP_NO + " \n";
			G_INFO += " HOSP_NM : " + HOSP_NM + " \n";
			G_INFO += " BUSI_NO : " + BUSI_NO + " \n";
			G_INFO += " BUCO_NO : " + BUCO_NO + " \n";
			G_INFO += " BUCA_NO : " + BUCA_NO + " \n";
			G_INFO += " PRES_NM : " + PRES_NM + " \n";
			G_INFO += " ZIP_CD : " + ZIP_CD + " \n";
			G_INFO += " ZIP_AR : " + ZIP_AR + " \n";
			G_INFO += " ROAD_AR : " + ROAD_AR + " \n";
			G_INFO += " ASSO_NO : " + ASSO_NO + " \n";
			G_INFO += " ASSO_NM : " + ASSO_NM + " \n";
			G_INFO += " STAN_CD : " + STAN_CD + " \n";
			G_INFO += " HECK_CD : " + HECK_CD + " \n";
			G_INFO += " SYCK_CD : " + SYCK_CD + " \n";
			G_INFO += " SUCK_CD : " + SUCK_CD + " \n";
			G_INFO += " EOCK_CD : " + EOCK_CD + " \n";
			G_INFO += " EBCK_CD : " + EBCK_CD + " \n";
			G_INFO += " SACK_CD : " + SACK_CD + " \n";
			G_INFO += " GUCK_CD : " + GUCK_CD + " \n";
			G_INFO += " HYCK_CD : " + HYCK_CD + " \n";
			G_INFO += " SPCK_CD : " + SPCK_CD + " \n";
			G_INFO += " MACK_CD : " + MACK_CD + " \n";
			G_INFO += " BLCK_CD : " + BLCK_CD + " \n";
			G_INFO += " SECK_CD : " + SECK_CD + " \n";
			G_INFO += " BUSI_CD : " + BUSI_CD + " \n";
			G_INFO += " CHAR_YN : " + CHAR_YN + " \n";
			G_INFO += " SUBO_CD : " + SUBO_CD + " \n";
			G_INFO += " JTEL_NO : " + JTEL_NO + " \n";
			G_INFO += " HOSP_IMG : " + HOSP_IMG + " \n";
			G_INFO += " GTEL_NO : " + GTEL_NO + " \n";
			G_INFO += " STEL_NO : " + STEL_NO + " \n";
			G_INFO += " ACNU1_NO : " + ACNU1_NO + " \n";
			G_INFO += " ACNU2_NO : " + ACNU2_NO + " \n";
			G_INFO += " ACNU3_NO : " + ACNU3_NO + " \n";
			G_INFO += " MODI_ID : " + MODI_ID + " \n";
			G_INFO += " MODI_DTT : " + MODI_DTT + " \n";
			G_INFO += " HOSP_NO2 : " + HOSP_NO2 + " \n";
			G_INFO += " HOSP_NM2 : " + HOSP_NM2 + " \n";
			G_INFO += " DTTEL_NO : " + DTTEL_NO + " \n";
			G_INFO += " ZIP_CD2 : " + ZIP_CD2 + " \n";
			G_INFO += " ZIP_AR2 : " + ZIP_AR2 + " \n";
			G_INFO += " ROAD_AR2 : " + ROAD_AR2 + " \n";
			G_INFO += " HOSP_IMG2 : " + HOSP_IMG2 + " \n";
			G_INFO += " HOSP_CD : " + HOSP_CD + " \n";
			G_INFO += " RTKN_KEY : " + RTKN_KEY + " \n";
			G_INFO += " STKN_KEY : " + STKN_KEY + " \n";
			G_INFO += " NETDOWN_PATH : " + NETDOWN_PATH + " \n";
			G_INFO += " NETDOWN_ID : " + NETDOWN_ID + " \n";
			G_INFO += " NETDOWN_PW : " + NETDOWN_PW + " \n";
			G_INFO += "\n\n";

			G_INFO += "질의문 : " + sql + " \n";
			G_INFO += "-->";

		out.clear();		// include된 파일안의 공백 제거
		response.addHeader("Content-type", "text/xml");
%><?xml version="1.0" encoding="UTF-8"?>

<%= G_INFO%>

<nurionXml>
	<resultCode>200</resultCode>
	<resultXml></resultXml>
	<errorMsg></errorMsg>
</nurionXml>

<%
	} catch (Exception e) {

		out.clear();		// include된 파일안의 공백 제거
		response.addHeader("Content-type", "text/xml");
%><?xml version="1.0" encoding="UTF-8"?>

<%= G_INFO%>

<nurionXml>
	<resultCode>400</resultCode>
	<resultXml></resultXml>
	<errorMsg><![CDATA[<%= e.toString()%>]]></errorMsg>
</nurionXml>

<%
	} finally {

		if(stmtExec != null) {
			stmtExec.close();
			stmtExec = null;
		}

		if(pstmt != null) {
			pstmt.close();
			pstmt = null;
		}
%>
<%@ include file="/inc_prg/disconnect.jsp"%>
<%
	}
%>
