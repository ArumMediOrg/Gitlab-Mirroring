<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.HashMap"%>
<%@ include file="/inc_prg/common.jsp"%>
<%@ include file="/func/func_uExam_Acpt_btnSaveClick_001.jsp"%>
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
		String EXAM_DT = htMethod.get("EXAM_DT");
		String EXAM_SQ = htMethod.get("EXAM_SQ");
		String RESULT_YN = htMethod.get("RESULT_YN");
		String COLLECT_YN = htMethod.get("COLLECT_YN");
		String CHOICE_ITEM = htMethod.get("CHOICE_ITEM");
		String ADD_ITEM = htMethod.get("ADD_ITEM");
		String ADD_PRICE = htMethod.get("ADD_PRICE");
		String AGREE_CD = htMethod.get("AGREE_CD");
		String SEND_CD = htMethod.get("SEND_CD");
		String SERVICE_CD = htMethod.get("SERVICE_CD");
		String ARUM_STATUS = htMethod.get("ARUM_STATUS");
		String RSVN_NO = htMethod.get("RSVN_NO");

		//
		if(SAVE_KD == null) { SAVE_KD = ""; }
		if(EXAM_DT == null) { EXAM_DT = ""; }
		if(EXAM_SQ == null) { EXAM_SQ = ""; }
		if(RESULT_YN == null) { RESULT_YN = ""; }
		if(COLLECT_YN == null) { COLLECT_YN = ""; }
		if(CHOICE_ITEM == null) { CHOICE_ITEM = ""; }
		if(ADD_ITEM == null) { ADD_ITEM = ""; }
		if(ADD_PRICE == null) { ADD_PRICE = ""; }
		if(AGREE_CD == null) { AGREE_CD = ""; }
		if(SEND_CD == null) { SEND_CD = ""; }
		if(SERVICE_CD == null) { SERVICE_CD = ""; }
		if(ARUM_STATUS == null) { ARUM_STATUS = ""; }
		if(RSVN_NO == null) { RSVN_NO = ""; }

		// DB객체
		stmtExec = connect.createStatement();

		sql = func_uExam_Acpt_btnSaveClick_001(stmtExec, htMethod);

			//
			G_INFO += "<!-- \n";
			G_INFO += "서비스명 : uExam_Acpt_btnSaveClick_001 \n";
			G_INFO += "설명 : 접수 저장 - 에버헬스 접수정보 저장 \n";
			G_INFO += "\n\n";

			G_INFO += "전달인자 : \n";
			G_INFO += " SAVE_KD : " + SAVE_KD + " \n";
			G_INFO += " EXAM_DT : " + EXAM_DT + " \n";
			G_INFO += " EXAM_SQ : " + EXAM_SQ + " \n";
			G_INFO += " RESULT_YN : " + RESULT_YN + " \n";
			G_INFO += " COLLECT_YN : " + COLLECT_YN + " \n";
			G_INFO += " CHOICE_ITEM : " + CHOICE_ITEM + " \n";
			G_INFO += " ADD_ITEM : " + ADD_ITEM + " \n";
			G_INFO += " ADD_PRICE : " + ADD_PRICE + " \n";
			G_INFO += " AGREE_CD : " + AGREE_CD + " \n";
			G_INFO += " SEND_CD : " + SEND_CD + " \n";
			G_INFO += " SERVICE_CD : " + SERVICE_CD + " \n";
			G_INFO += " ARUM_STATUS : " + ARUM_STATUS + " \n";
			G_INFO += " RSVN_NO : " + RSVN_NO + " \n";
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
