<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.HashMap"%>
<%@ include file="/inc_prg/common.jsp"%>
<%@ include file="/func/func_uPgAuth_btn_saveClick_001.jsp"%>
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

		String IPPRGGA = htMethod.get("IPPRGGA");
		String IPPRGGB = htMethod.get("IPPRGGB");
		String IPPRGGC = htMethod.get("IPPRGGC");
		String IPPRGGD = htMethod.get("IPPRGGD");
		String IPPRGGE = htMethod.get("IPPRGGE");
		String IPPRGGF = htMethod.get("IPPRGGF");
		String IPPRGGG = htMethod.get("IPPRGGG");
		String IPPRGGH = htMethod.get("IPPRGGH");
		String IPPRGMID = htMethod.get("IPPRGMID");

		//
		if(IPPRGGA == null) { IPPRGGA = ""; }
		if(IPPRGGB == null) { IPPRGGB = ""; }
		if(IPPRGGC == null) { IPPRGGC = ""; }
		if(IPPRGGD == null) { IPPRGGD = ""; }
		if(IPPRGGE == null) { IPPRGGE = ""; }
		if(IPPRGGF == null) { IPPRGGF = ""; }
		if(IPPRGGG == null) { IPPRGGG = ""; }
		if(IPPRGGH == null) { IPPRGGH = ""; }
		if(IPPRGMID == null) { IPPRGMID = ""; }

		// DB객체
		stmtExec = connect.createStatement();

		sql = func_uPgAuth_btn_saveClick_001(stmtExec, htMethod);

			//
			G_INFO += "<!-- \n";
			G_INFO += "서비스명 : uPgAuth_btn_saveClick_001 \n";
			G_INFO += "설명 : 권한정보 업데이트 \n";
			G_INFO += "\n\n";

			G_INFO += "전달인자 : \n";
			G_INFO += " IPPRGGA : " + IPPRGGA + " \n";
			G_INFO += " IPPRGGB : " + IPPRGGB + " \n";
			G_INFO += " IPPRGGC : " + IPPRGGC + " \n";
			G_INFO += " IPPRGGD : " + IPPRGGD + " \n";
			G_INFO += " IPPRGGE : " + IPPRGGE + " \n";
			G_INFO += " IPPRGGF : " + IPPRGGF + " \n";
			G_INFO += " IPPRGGG : " + IPPRGGG + " \n";
			G_INFO += " IPPRGGH : " + IPPRGGH + " \n";
			G_INFO += " IPPRGMID : " + IPPRGMID + " \n";
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
