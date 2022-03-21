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
		String APLY_DT = htMethod.get("APLY_DT");
		String EDTKIND_NM = htMethod.get("EDTKIND_NM");
		String CMBBOXKIND_KD = htMethod.get("CMBBOXKIND_KD");

		//
		if(SKIND == null) { SKIND = ""; }
		if(APLY_DT == null) { APLY_DT = ""; }
		if(EDTKIND_NM == null) { EDTKIND_NM = ""; }
		if(CMBBOXKIND_KD == null) { CMBBOXKIND_KD = ""; }

		//
		if(SKIND.equals("1")) {
			branch = (String)htBranch.get("uCOMP_DEPT_APPLY_ADD_UP_condition_001_V2___1");
		} else if(SKIND.equals("2")) {
			branch = (String)htBranch.get("uCOMP_DEPT_APPLY_ADD_UP_condition_001_V2___2");
		} else if(SKIND.equals("3")) {
			branch = (String)htBranch.get("uCOMP_DEPT_APPLY_ADD_UP_condition_001_V2___3");
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