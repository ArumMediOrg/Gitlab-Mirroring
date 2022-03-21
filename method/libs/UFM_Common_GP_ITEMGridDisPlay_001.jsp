<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.HashMap"%>
<%@ include file="/inc_prg/branch.jsp"%>
<%
	// 전달자료
	HashMap<String, Object> htData = null;
	HashMap<String, String> htMethod = null;

	try {

		// 변수처리
		String branch = "";

		// 전달자료
		htData = (HashMap<String, Object>)request.getAttribute("htData");
		htMethod = (HashMap<String, String>)request.getAttribute("htMethod_1");

		String SKIND = htMethod.get("SKIND");
		String SVALUE2 = htMethod.get("SVALUE2");
		String SVALUE3 = htMethod.get("SVALUE3");
		String SVALUE1 = htMethod.get("SVALUE1");
		String SVALUE4 = htMethod.get("SVALUE4");
		String SVALUE5 = htMethod.get("SVALUE5");

		//
		if(SKIND == null) { SKIND = ""; }
		if(SVALUE2 == null) { SVALUE2 = ""; }
		if(SVALUE3 == null) { SVALUE3 = ""; }
		if(SVALUE1 == null) { SVALUE1 = ""; }
		if(SVALUE4 == null) { SVALUE4 = ""; }
		if(SVALUE5 == null) { SVALUE5 = ""; }

		//
		if(SKIND.equals("1") || SKIND.equals("2")) {
			branch = (String)htBranch.get("UFM_Common_GP_ITEMGridDisPlay_001___1");
		} else if(SKIND.equals("3")) {
			branch = (String)htBranch.get("UFM_Common_GP_ITEMGridDisPlay_001___2");
		} else if(SKIND.equals("4")) {
			branch = (String)htBranch.get("UFM_Common_GP_ITEMGridDisPlay_001___3");
		} else if(SKIND.equals("5")) {
			branch = (String)htBranch.get("UFM_Common_GP_ITEMGridDisPlay_001___4");
		}

		RequestDispatcher rd = request.getRequestDispatcher(branch);
		rd.forward(request, response);

	} catch (Exception e) {

		out.clear();		// include된 파일안의 공백 제거
		response.addHeader("Content-type", "text/xml");
%><?xml version="1.0" encoding="UTF-8"?>

<nurionXml>
	<resultCode>400</resultCode>
	<resultXml></resultXml>
	<errorMsg><![CDATA[<%= e.toString()%>]]></errorMsg>
</nurionXml>

<%
	} finally {

	}
%>