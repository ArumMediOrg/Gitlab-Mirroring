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

		String CBCOMP_YN = htMethod.get("CBCOMP_YN");
		String COMP_CD = htMethod.get("COMP_CD");
		String MNGT_YR = htMethod.get("MNGT_YR");
		String EXAM_CD = htMethod.get("EXAM_CD");
		String EDPACK_NM = htMethod.get("EDPACK_NM");

		//
		if(CBCOMP_YN == null) { CBCOMP_YN = ""; }
		if(COMP_CD == null) { COMP_CD = ""; }
		if(MNGT_YR == null) { MNGT_YR = ""; }
		if(EXAM_CD == null) { EXAM_CD = ""; }
		if(EDPACK_NM == null) { EDPACK_NM = ""; }

		//
		if(CBCOMP_YN.equals("Y")) {
			branch = (String)htBranch.get("uCopy_Item_UP_ExamSearching_001___1");
		} else {
			branch = (String)htBranch.get("uCopy_Item_UP_ExamSearching_001___2");
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
