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
		String SVALUE = htMethod.get("SVALUE");

		//
		if(SKIND == null) { SKIND = ""; }
		if(SVALUE == null) { SVALUE = ""; }

		//
		if(SKIND.equals("1")) {
			branch = (String)htBranch.get("UFM_Common_GP_GetCodeToName_001___1");
		} else if(SKIND.equals("2")) {
			branch = (String)htBranch.get("UFM_Common_GP_GetCodeToName_001___2");
		} else if(SKIND.equals("3")) {
			branch = (String)htBranch.get("UFM_Common_GP_GetCodeToName_001___3");
		} else if(SKIND.equals("4")) {
			branch = (String)htBranch.get("UFM_Common_GP_GetCodeToName_001___4");
		} else if(SKIND.equals("5")) {
			branch = (String)htBranch.get("UFM_Common_GP_GetCodeToName_001___5");
		} else if(SKIND.equals("6")) {
			branch = (String)htBranch.get("UFM_Common_GP_GetCodeToName_001___6");
		} else if(SKIND.equals("7")) {
			branch = (String)htBranch.get("UFM_Common_GP_GetCodeToName_001___7");
		} else if(SKIND.equals("8")) {
			branch = (String)htBranch.get("UFM_Common_GP_GetCodeToName_001___8");
		} else if(SKIND.equals("9")) {
			branch = (String)htBranch.get("UFM_Common_GP_GetCodeToName_001___9");
		} else if(SKIND.equals("10")) {
			branch = (String)htBranch.get("UFM_Common_GP_GetCodeToName_001___10");
		} else if(SKIND.equals("11")) {
			branch = (String)htBranch.get("UFM_Common_GP_GetCodeToName_001___11");
		} else if(SKIND.equals("12")) {
			branch = (String)htBranch.get("UFM_Common_GP_GetCodeToName_001___12");
		} else if(SKIND.equals("13")) {
			branch = (String)htBranch.get("UFM_Common_GP_GetCodeToName_001___13");
		} else if(SKIND.equals("14")) {
			branch = (String)htBranch.get("UFM_Common_GP_GetCodeToName_001___14");
		} else if(SKIND.equals("16")) {
			branch = (String)htBranch.get("UFM_Common_GP_GetCodeToName_001___16");
		} else if(SKIND.equals("17")) {
			branch = (String)htBranch.get("UFM_Common_GP_GetCodeToName_001___17");
		} else if(SKIND.equals("18")) {
			branch = (String)htBranch.get("UFM_Common_GP_GetCodeToName_001___18");
		} else if(SKIND.equals("19")) {
			branch = (String)htBranch.get("UFM_Common_GP_GetCodeToName_001___19");
		} else if(SKIND.equals("20")) {
			branch = (String)htBranch.get("UFM_Common_GP_GetCodeToName_001___20");
		} else if(SKIND.equals("21")) {
			branch = (String)htBranch.get("UFM_Common_GP_GetCodeToName_001___21");
		} else if(SKIND.equals("22")) {
			branch = (String)htBranch.get("UFM_Common_GP_GetCodeToName_001___22");
		} else if(SKIND.equals("23")) {
			branch = (String)htBranch.get("UFM_Common_GP_GetCodeToName_001___23");
		} else if(SKIND.equals("24")) {
			branch = (String)htBranch.get("UFM_Common_GP_GetCodeToName_001___24");
		} else if(SKIND.equals("25")) {
			branch = (String)htBranch.get("UFM_Common_GP_GetCodeToName_001___25");
		} else if(SKIND.equals("26")) {
			branch = (String)htBranch.get("UFM_Common_GP_GetCodeToName_001___26");
		} else if(SKIND.equals("27")) {
			branch = (String)htBranch.get("UFM_Common_GP_GetCodeToName_001___27");
		} else if(SKIND.equals("28")) {
			branch = (String)htBranch.get("UFM_Common_GP_GetCodeToName_001___28");
		} else if(SKIND.equals("29")) {
			branch = (String)htBranch.get("UFM_Common_GP_GetCodeToName_001___29");
		} else if(SKIND.equals("30")) {
			branch = (String)htBranch.get("UFM_Common_GP_GetCodeToName_001___30");
		} else if(SKIND.equals("31")) {
			branch = (String)htBranch.get("UFM_Common_GP_GetCodeToName_001___31");
		} else if(SKIND.equals("32")) {
			branch = (String)htBranch.get("UFM_Common_GP_GetCodeToName_001___32");
		} else if(SKIND.equals("33")) {
			branch = (String)htBranch.get("UFM_Common_GP_GetCodeToName_001___33");
		} else if(SKIND.equals("34")) {
			branch = (String)htBranch.get("UFM_Common_GP_GetCodeToName_001___34");
		} else if(SKIND.equals("35")) {
			branch = (String)htBranch.get("UFM_Common_GP_GetCodeToName_001___35");
		} else if(SKIND.equals("36")) {
			branch = (String)htBranch.get("UFM_Common_GP_GetCodeToName_001___36");
		} else if(SKIND.equals("37")) {
			branch = (String)htBranch.get("UFM_Common_GP_GetCodeToName_001___37");
		} else if(SKIND.equals("38")) {
			branch = (String)htBranch.get("UFM_Common_GP_GetCodeToName_001___38");
		} else if(SKIND.equals("39")) {
			branch = (String)htBranch.get("UFM_Common_GP_GetCodeToName_001___39");
		} else if(SKIND.equals("40")) {
			branch = (String)htBranch.get("UFM_Common_GP_GetCodeToName_001___40");
		} else if(SKIND.equals("41")) {
			branch = (String)htBranch.get("UFM_Common_GP_GetCodeToName_001___41");
		} else if(SKIND.equals("42")) {
			branch = (String)htBranch.get("UFM_Common_GP_GetCodeToName_001___42");
		} else if(SKIND.equals("43")) {
			branch = (String)htBranch.get("UFM_Common_GP_GetCodeToName_001___43");
		} else if(SKIND.equals("44")) {
			branch = (String)htBranch.get("UFM_Common_GP_GetCodeToName_001___44");
		} else if(SKIND.equals("45")) {
			branch = (String)htBranch.get("UFM_Common_GP_GetCodeToName_001___45");
		} else if(SKIND.equals("46")) {
			branch = (String)htBranch.get("UFM_Common_GP_GetCodeToName_001___46");
		} else if(SKIND.equals("47")) {
			branch = (String)htBranch.get("UFM_Common_GP_GetCodeToName_001___47");
		} else if(SKIND.equals("48")) {
			branch = (String)htBranch.get("UFM_Common_GP_GetCodeToName_001___48");
		} else if(SKIND.equals("49")) {
			branch = (String)htBranch.get("UFM_Common_GP_GetCodeToName_001___49");
		} else if(SKIND.equals("50")) {
			branch = (String)htBranch.get("UFM_Common_GP_GetCodeToName_001___50");
		} else {
			branch = (String)htBranch.get("UFM_Common_GP_GetCodeToName_001___51");
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
