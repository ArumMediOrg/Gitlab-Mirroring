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

		String SRCH_KD = htMethod.get("SRCH_KD");
		String SRCH_CD = htMethod.get("SRCH_CD");

		//
		if(SRCH_KD == null) { SRCH_KD = ""; }
		if(SRCH_CD == null) { SRCH_CD = ""; }

		//
		if(SRCH_KD.equals("P")) {
			branch = (String)htBranch.get("uFM_AcptComm_GP_ExamList_001___1");
		} else {
			branch = (String)htBranch.get("uFM_AcptComm_GP_ExamList_001___2");
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
