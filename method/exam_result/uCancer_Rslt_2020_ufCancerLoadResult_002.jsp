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

		String STABLE_KD = htMethod.get("STABLE_KD");

		//
		if(STABLE_KD == null) { STABLE_KD = ""; }

		//
		if(STABLE_KD.equals("STMC")) {
			branch = (String)htBranch.get("uCancer_Rslt_2020_ufCancerLoadResult_002___1");
		} else if(STABLE_KD.equals("COLO")) {
			branch = (String)htBranch.get("uCancer_Rslt_2020_ufCancerLoadResult_002___2");
		} else if(STABLE_KD.equals("LIVER")) {
			branch = (String)htBranch.get("uCancer_Rslt_2020_ufCancerLoadResult_002___3");
		} else if(STABLE_KD.equals("BRST")) {
			branch = (String)htBranch.get("uCancer_Rslt_2020_ufCancerLoadResult_002___4");
		} else if(STABLE_KD.equals("CRVC")) {
			branch = (String)htBranch.get("uCancer_Rslt_2020_ufCancerLoadResult_002___5");
		} else if(STABLE_KD.equals("LUNG")) {
			branch = (String)htBranch.get("uCancer_Rslt_2020_ufCancerLoadResult_002___6");
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
