<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.HashMap"%>
<%@ include file="/inc_prg/common.jsp"%>
<%@ include file="/func/func_uRsvn_Acpt_btnSaveClick_004.jsp"%>
<%
	// 전달자료
	HashMap<String, Object> htData = null;
	HashMap<String, String> htMethod = null;

	// DB객체
	Statement stmtExec = null;

	//
	String G_INFO = "";

	try {
%>
<%@ include file="/inc_prg/connect.jsp"%>
<%
		// 전달자료
		htData = (HashMap<String, Object>)request.getAttribute("htData");
		htMethod = (HashMap<String, String>)request.getAttribute("htMethod_1");

		String SAVE_KD = htMethod.get("SAVE_KD");
		String RSVN_NO = htMethod.get("RSVN_NO");
		String RVT_YN = htMethod.get("RVT_YN");
		String PACKAGE_CD = htMethod.get("PACKAGE_CD");
		String USER_ID = htMethod.get("USER_ID");
		String RESERVATION_ID = htMethod.get("RESERVATION_ID");
		String KEEPER_YN = htMethod.get("KEEPER_YN");
		String CHOICE_ITEM = htMethod.get("CHOICE_ITEM");
		String ADD_ITEM = htMethod.get("ADD_ITEM");
		String ADD_PRICE = htMethod.get("ADD_PRICE");
		String COM_PR = htMethod.get("COM_PR");
		String COMADD_PR = htMethod.get("COMADD_PR");
		String CHOICE_PR = htMethod.get("CHOICE_PR");
		String PACKAGE_PR = htMethod.get("PACKAGE_PR");
		String PERSONAL_PR = htMethod.get("PERSONAL_PR");
		String AGREE_CD = htMethod.get("AGREE_CD");
		String SEND_CD = htMethod.get("SEND_CD");
		String SERVICE_CD = htMethod.get("SERVICE_CD");
		String RECEIVE_YN = htMethod.get("RECEIVE_YN");
		String GRADE_NM = htMethod.get("GRADE_NM");
		String ARUM_STATUS = htMethod.get("ARUM_STATUS");
		String START_DT = htMethod.get("START_DT");
		String END_DT = htMethod.get("END_DT");
		String CHKST_DT = htMethod.get("CHKST_DT");
		String CHKEN_DT = htMethod.get("CHKEN_DT");
		String TRET_TX = htMethod.get("TRET_TX");

		//
		if(SAVE_KD == null) { SAVE_KD = ""; }
		if(RSVN_NO == null) { RSVN_NO = ""; }
		if(RVT_YN == null) { RVT_YN = ""; }
		if(PACKAGE_CD == null) { PACKAGE_CD = ""; }
		if(USER_ID == null) { USER_ID = ""; }
		if(RESERVATION_ID == null) { RESERVATION_ID = ""; }
		if(KEEPER_YN == null) { KEEPER_YN = ""; }
		if(CHOICE_ITEM == null) { CHOICE_ITEM = ""; }
		if(ADD_ITEM == null) { ADD_ITEM = ""; }
		if(ADD_PRICE == null) { ADD_PRICE = ""; }
		if(COM_PR == null) { COM_PR = ""; }
		if(COMADD_PR == null) { COMADD_PR = ""; }
		if(CHOICE_PR == null) { CHOICE_PR = ""; }
		if(PACKAGE_PR == null) { PACKAGE_PR = ""; }
		if(PERSONAL_PR == null) { PERSONAL_PR = ""; }
		if(AGREE_CD == null) { AGREE_CD = ""; }
		if(SEND_CD == null) { SEND_CD = ""; }
		if(SERVICE_CD == null) { SERVICE_CD = ""; }
		if(RECEIVE_YN == null) { RECEIVE_YN = ""; }
		if(GRADE_NM == null) { GRADE_NM = ""; }
		if(ARUM_STATUS == null) { ARUM_STATUS = ""; }
		if(START_DT == null) { START_DT = ""; }
		if(END_DT == null) { END_DT = ""; }
		if(CHKST_DT == null) { CHKST_DT = ""; }
		if(CHKEN_DT == null) { CHKEN_DT = ""; }
		if(TRET_TX == null) { TRET_TX = ""; }

		// DB객체
		stmtExec = connect.createStatement();

		sql = func_uRsvn_Acpt_btnSaveClick_004(stmtExec, htMethod);

			//
			G_INFO += "<!-- \n";
			G_INFO += "서비스명 : uRsvn_Acpt_btnSaveClick_004 \n";
			G_INFO += "설명 : 예약저장 - 에버헬스 예약 저장 \n";
			G_INFO += "\n\n";

			G_INFO += "전달인자 : \n";
			G_INFO += " SAVE_KD : " + SAVE_KD + " \n";
			G_INFO += " RSVN_NO : " + RSVN_NO + " \n";
			G_INFO += " RVT_YN : " + RVT_YN + " \n";
			G_INFO += " PACKAGE_CD : " + PACKAGE_CD + " \n";
			G_INFO += " USER_ID : " + USER_ID + " \n";
			G_INFO += " RESERVATION_ID : " + RESERVATION_ID + " \n";
			G_INFO += " KEEPER_YN : " + KEEPER_YN + " \n";
			G_INFO += " CHOICE_ITEM : " + CHOICE_ITEM + " \n";
			G_INFO += " ADD_ITEM : " + ADD_ITEM + " \n";
			G_INFO += " ADD_PRICE : " + ADD_PRICE + " \n";
			G_INFO += " COM_PR : " + COM_PR + " \n";
			G_INFO += " COMADD_PR : " + COMADD_PR + " \n";
			G_INFO += " CHOICE_PR : " + CHOICE_PR + " \n";
			G_INFO += " PACKAGE_PR : " + PACKAGE_PR + " \n";
			G_INFO += " PERSONAL_PR : " + PERSONAL_PR + " \n";
			G_INFO += " AGREE_CD : " + AGREE_CD + " \n";
			G_INFO += " SEND_CD : " + SEND_CD + " \n";
			G_INFO += " SERVICE_CD : " + SERVICE_CD + " \n";
			G_INFO += " RECEIVE_YN : " + RECEIVE_YN + " \n";
			G_INFO += " GRADE_NM : " + GRADE_NM + " \n";
			G_INFO += " ARUM_STATUS : " + ARUM_STATUS + " \n";
			G_INFO += " START_DT : " + START_DT + " \n";
			G_INFO += " END_DT : " + END_DT + " \n";
			G_INFO += " CHKST_DT : " + CHKST_DT + " \n";
			G_INFO += " CHKEN_DT : " + CHKEN_DT + " \n";
			G_INFO += " TRET_TX : " + TRET_TX + " \n";
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
	} catch (FuncException fe) {

		out.clear();		// include된 파일안의 공백 제거
		response.addHeader("Content-type", "text/xml");
%><?xml version="1.0" encoding="UTF-8"?>

<%= G_INFO%>

<nurionXml>
	<resultCode>400</resultCode>
	<resultXml></resultXml>
	<errorMsg><![CDATA[<%= fe.toString()%>]]></errorMsg>
	<sql><![CDATA[<%= fe.getSql()%>]]></sql>
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
%>
<%@ include file="/inc_prg/disconnect.jsp"%>
<%
	}
%>
