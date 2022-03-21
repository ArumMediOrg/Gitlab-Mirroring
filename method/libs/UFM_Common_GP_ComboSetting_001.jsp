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
		String SLARGE = htMethod.get("SLARGE");
		String SLEVEL = htMethod.get("SLEVEL");
		String GUSER = htMethod.get("GUSER");
		String G_PLACE_GUBUN = htMethod.get("G_PLACE_GUBUN");
		String SSMALL = htMethod.get("SSMALL");
		String SSEARCH = htMethod.get("SSEARCH");
		String SCB_NAME = htMethod.get("SCB_NAME");
		String STABLE = htMethod.get("STABLE");

		//
		if(SKIND == null) { SKIND = ""; }
		if(SLARGE == null) { SLARGE = ""; }
		if(SLEVEL == null) { SLEVEL = ""; }
		if(GUSER == null) { GUSER = ""; }
		if(G_PLACE_GUBUN == null) { G_PLACE_GUBUN = ""; }
		if(SSMALL == null) { SSMALL = ""; }
		if(SSEARCH == null) { SSEARCH = ""; }
		if(SCB_NAME == null) { SCB_NAME = ""; }
		if(STABLE == null) { STABLE = ""; }

		//
		if(SKIND.equals("0")) {
			branch = (String)htBranch.get("UFM_Common_GP_ComboSetting_001___1");
		} else if(SKIND.equals("1")) {
			branch = (String)htBranch.get("UFM_Common_GP_ComboSetting_001___2");
		} else if(SKIND.equals("2")) {
			branch = (String)htBranch.get("UFM_Common_GP_ComboSetting_001___3");
		} else if(SKIND.equals("3")) {
			branch = (String)htBranch.get("UFM_Common_GP_ComboSetting_001___4");
		} else if(SKIND.equals("4")) {
			branch = (String)htBranch.get("UFM_Common_GP_ComboSetting_001___5");
		} else if(SKIND.equals("5")) {
			branch = (String)htBranch.get("UFM_Common_GP_ComboSetting_001___6");
		} else if(SKIND.equals("6")) {
			branch = (String)htBranch.get("UFM_Common_GP_ComboSetting_001___7");
		} else if(SKIND.equals("7")) {
			branch = (String)htBranch.get("UFM_Common_GP_ComboSetting_001___8");
		} else if(SKIND.equals("8")) {
			branch = (String)htBranch.get("UFM_Common_GP_ComboSetting_001___9");
		} else if(SKIND.equals("9")) {
			branch = (String)htBranch.get("UFM_Common_GP_ComboSetting_001___10");
		} else if(SKIND.equals("10")) {
			branch = (String)htBranch.get("UFM_Common_GP_ComboSetting_001___11");
		} else if(SKIND.equals("11")) {
			branch = (String)htBranch.get("UFM_Common_GP_ComboSetting_001___12");
		} else if(SKIND.equals("12")) {
			branch = (String)htBranch.get("UFM_Common_GP_ComboSetting_001___13");
		} else if(SKIND.equals("13")) {
			branch = (String)htBranch.get("UFM_Common_GP_ComboSetting_001___14");
		} else if(SKIND.equals("14")) {
			branch = (String)htBranch.get("UFM_Common_GP_ComboSetting_001___15");
		} else if(SKIND.equals("15")) {
			branch = (String)htBranch.get("UFM_Common_GP_ComboSetting_001___16");
		} else if(SKIND.equals("16")) {
			branch = (String)htBranch.get("UFM_Common_GP_ComboSetting_001___17");
		} else if(SKIND.equals("17")) {
			branch = (String)htBranch.get("UFM_Common_GP_ComboSetting_001___18");
		} else if(SKIND.equals("C")) {
			branch = (String)htBranch.get("UFM_Common_GP_ComboSetting_001___19");
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