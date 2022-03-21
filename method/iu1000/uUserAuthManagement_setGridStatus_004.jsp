<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.HashMap"%>
<%@ include file="/inc_prg/common.jsp"%>
<%@ include file="/func/func_uUserAuthManagement_setGridStatus_004.jsp"%>
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

		String IAP_SELECT = htMethod.get("IAP_SELECT");
		String IAP_SAVE = htMethod.get("IAP_SAVE");
		String IAP_PRINT = htMethod.get("IAP_PRINT");
		String IAP_DELETE = htMethod.get("IAP_DELETE");
		String IAP_MODI_ID = htMethod.get("IAP_MODI_ID");
		String IAP_USER_ID = htMethod.get("IAP_USER_ID");
		String IAP_LIBR_NM = htMethod.get("IAP_LIBR_NM");

		//
		if(IAP_SELECT == null) { IAP_SELECT = ""; }
		if(IAP_SAVE == null) { IAP_SAVE = ""; }
		if(IAP_PRINT == null) { IAP_PRINT = ""; }
		if(IAP_DELETE == null) { IAP_DELETE = ""; }
		if(IAP_MODI_ID == null) { IAP_MODI_ID = ""; }
		if(IAP_USER_ID == null) { IAP_USER_ID = ""; }
		if(IAP_LIBR_NM == null) { IAP_LIBR_NM = ""; }

		// DB객체
		stmtExec = connect.createStatement();

		sql = func_uUserAuthManagement_setGridStatus_004(stmtExec, htMethod);

			//
			G_INFO += "<!-- \n";
			G_INFO += "서비스명 : uUserAuthManagement_setGridStatus_004 \n";
			G_INFO += "설명 : 프로그램명에 해당하는 권한정보 수정 \n";
			G_INFO += "\n\n";

			G_INFO += "전달인자 : \n";
			G_INFO += " IAP_SELECT : " + IAP_SELECT + " \n";
			G_INFO += " IAP_SAVE : " + IAP_SAVE + " \n";
			G_INFO += " IAP_PRINT : " + IAP_PRINT + " \n";
			G_INFO += " IAP_DELETE : " + IAP_DELETE + " \n";
			G_INFO += " IAP_MODI_ID : " + IAP_MODI_ID + " \n";
			G_INFO += " IAP_USER_ID : " + IAP_USER_ID + " \n";
			G_INFO += " IAP_LIBR_NM : " + IAP_LIBR_NM + " \n";
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
