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

		String CMBPRINT_KD = htMethod.get("CMBPRINT_KD");
		String EXAM_DT = htMethod.get("EXAM_DT");
		String EXAM_SQ = htMethod.get("EXAM_SQ");
		String ITEM_CD = htMethod.get("ITEM_CD");
		String SSQL_ADD = htMethod.get("SSQL_ADD");

		//
		if(CMBPRINT_KD == null) { CMBPRINT_KD = ""; }
		if(EXAM_DT == null) { EXAM_DT = ""; }
		if(EXAM_SQ == null) { EXAM_SQ = ""; }
		if(ITEM_CD == null) { ITEM_CD = ""; }
		if(SSQL_ADD == null) { SSQL_ADD = ""; }

		//
		if(CMBPRINT_KD.equals("0")) {
			branch = (String)htBranch.get("uUrpt_Rslt_ufGetUrptItemList_001___1");
		} else if(CMBPRINT_KD.equals("1")) {
			branch = (String)htBranch.get("uUrpt_Rslt_ufGetUrptItemList_001___2");
		} else if(CMBPRINT_KD.equals("2")) {
			branch = (String)htBranch.get("uUrpt_Rslt_ufGetUrptItemList_001___3");
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
