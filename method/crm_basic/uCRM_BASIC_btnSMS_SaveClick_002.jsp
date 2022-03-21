<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.HashMap"%>
<%@ include file="/inc_prg/common.jsp"%>
<%@ include file="/func/func_uCRM_BASIC_btnSMS_SaveClick_002.jsp"%>
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

		String SEND_MSG = htMethod.get("SEND_MSG");
		String INPUT_ID = htMethod.get("INPUT_ID");
		String CHECKBOX1 = htMethod.get("CHECKBOX1");
		String SMS_CODE = htMethod.get("SMS_CODE");

		//
		if(SEND_MSG == null) { SEND_MSG = ""; }
		if(INPUT_ID == null) { INPUT_ID = ""; }
		if(CHECKBOX1 == null) { CHECKBOX1 = ""; }
		if(SMS_CODE == null) { SMS_CODE = ""; }

		// DB객체
		stmtExec = connect.createStatement();

		sql = func_uCRM_BASIC_btnSMS_SaveClick_002(stmtExec, htMethod);

			//
			G_INFO += "<!-- \n";
			G_INFO += "서비스명 : uCRM_BASIC_btnSMS_SaveClick_002 \n";
			G_INFO += "설명 : SMS 문구 수정 \n";
			G_INFO += "\n\n";

			G_INFO += "전달인자 : \n";
			G_INFO += " SEND_MSG : " + SEND_MSG + " \n";
			G_INFO += " INPUT_ID : " + INPUT_ID + " \n";
			G_INFO += " CHECKBOX1 : " + CHECKBOX1 + " \n";
			G_INFO += " SMS_CODE : " + SMS_CODE + " \n";
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
