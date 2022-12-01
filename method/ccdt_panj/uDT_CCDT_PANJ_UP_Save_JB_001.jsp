<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.HashMap"%>
<%@ include file="/inc_prg/common.jsp"%>
<%@ include file="/func/func_uDT_CCDT_PANJ_UP_Save_JB_001.jsp"%>
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

		String EXAM_DT = htMethod.get("EXAM_DT");
		String EXAM_SQ = htMethod.get("EXAM_SQ");
		String JCB_JOB = htMethod.get("JCB_JOB");
		String QUEST1 = htMethod.get("QUEST1");
		String QUEST2 = htMethod.get("QUEST2");
		String QUEST3 = htMethod.get("QUEST3");
		String QUEST4 = htMethod.get("QUEST4");
		String QUEST5 = htMethod.get("QUEST5");
		String QUEST6 = htMethod.get("QUEST6");
		String QUEST7 = htMethod.get("QUEST7");
		String QUEST8_1 = htMethod.get("QUEST8_1");
		String QUEST8_2 = htMethod.get("QUEST8_2");
		String QUEST9 = htMethod.get("QUEST9");
		String QUEST10 = htMethod.get("QUEST10");
		String QUEST11 = htMethod.get("QUEST11");
		String QUEST12_1 = htMethod.get("QUEST12_1");
		String QUEST12_2 = htMethod.get("QUEST12_2");
		String QUEST12_YN = htMethod.get("QUEST12_YN");
		String QUEST13_1 = htMethod.get("QUEST13_1");
		String QUEST13_2 = htMethod.get("QUEST13_2");
		String QUEST13_YN = htMethod.get("QUEST13_YN");
		String QUEST14_1 = htMethod.get("QUEST14_1");
		String QUEST14_2 = htMethod.get("QUEST14_2");
		String QUEST14_3 = htMethod.get("QUEST14_3");
		String QUEST14_4 = htMethod.get("QUEST14_4");
		String QUEST14_YN = htMethod.get("QUEST14_YN");
		String QUEST15 = htMethod.get("QUEST15");
		String QUEST16 = htMethod.get("QUEST16");
		String QUEST17 = htMethod.get("QUEST17");
		String QUEST18 = htMethod.get("QUEST18");
		String QUEST19 = htMethod.get("QUEST19");
		String QUEST20 = htMethod.get("QUEST20");
		String QUEST21 = htMethod.get("QUEST21");
		String QUEST22_NM = htMethod.get("QUEST22_NM");
		String QUEST22 = htMethod.get("QUEST22");
		String QUEST23_NM = htMethod.get("QUEST23_NM");
		String QUEST23 = htMethod.get("QUEST23");
		String QUEST24_NM = htMethod.get("QUEST24_NM");
		String QUEST24 = htMethod.get("QUEST24");
		String RESULT1 = htMethod.get("RESULT1");
		String RESULT2 = htMethod.get("RESULT2");
		String RESULT3 = htMethod.get("RESULT3");
		String RESULT = htMethod.get("RESULT");
		String SOKYUN = htMethod.get("SOKYUN");
		//
		if(EXAM_DT == null) { EXAM_DT = ""; }
		if(EXAM_SQ == null) { EXAM_SQ = ""; }
		if(JCB_JOB == null) { JCB_JOB = ""; }
		if(QUEST1 == null) { QUEST1 = ""; }
		if(QUEST2 == null) { QUEST2 = ""; }
		if(QUEST3 == null) { QUEST3 = ""; }
		if(QUEST4 == null) { QUEST4 = ""; }
		if(QUEST5 == null) { QUEST5 = ""; }
		if(QUEST6 == null) { QUEST6 = ""; }
		if(QUEST7 == null) { QUEST7 = ""; }
		if(QUEST8_1 == null) { QUEST8_1 = ""; }
		if(QUEST8_2 == null) { QUEST8_2 = ""; }
		if(QUEST9 == null) { QUEST9 = ""; }
		if(QUEST10 == null) { QUEST10 = ""; }
		if(QUEST11 == null) { QUEST11 = ""; }
		if(QUEST12_1 == null) { QUEST12_1 = ""; }
		if(QUEST12_2 == null) { QUEST12_2 = ""; }
		if(QUEST12_YN == null) { QUEST12_YN = ""; }
		if(QUEST13_1 == null) { QUEST13_1 = ""; }
		if(QUEST13_2 == null) { QUEST13_2 = ""; }
		if(QUEST13_YN == null) { QUEST13_YN = ""; }
		if(QUEST14_1 == null) { QUEST14_1 = ""; }
		if(QUEST14_2 == null) { QUEST14_2 = ""; }
		if(QUEST14_3 == null) { QUEST14_3 = ""; }
		if(QUEST14_4 == null) { QUEST14_4 = ""; }
		if(QUEST14_YN == null) { QUEST14_YN = ""; }
		if(QUEST15 == null) { QUEST15 = ""; }
		if(QUEST16 == null) { QUEST16 = ""; }
		if(QUEST17 == null) { QUEST17 = ""; }
		if(QUEST18 == null) { QUEST18 = ""; }
		if(QUEST19 == null) { QUEST19 = ""; }
		if(QUEST20 == null) { QUEST20 = ""; }
		if(QUEST21 == null) { QUEST21 = ""; }
		if(QUEST22_NM == null) { QUEST22_NM = ""; }
		if(QUEST22 == null) { QUEST22 = ""; }
		if(QUEST23_NM == null) { QUEST23_NM = ""; }
		if(QUEST23 == null) { QUEST23 = ""; }
		if(QUEST24_NM == null) { QUEST24_NM = ""; }
		if(QUEST24 == null) { QUEST24 = ""; }
		if(RESULT1 == null) { RESULT1 = ""; }
		if(RESULT2 == null) { RESULT2 = ""; }
		if(RESULT3 == null) { RESULT3 = ""; }
		if(RESULT == null) { RESULT = ""; }
		if(SOKYUN == null) { SOKYUN = ""; }

		// DB객체
		stmtExec = connect.createStatement();

		sql = func_uDT_CCDT_PANJ_UP_Save_JB_001(stmtExec, htMethod);

			//
			G_INFO += "<!-- \n";
			G_INFO += "서비스명 : func_uDT_CCDT_PANJ_UP_Save_JB_001 \n";
			G_INFO += "설명 : 업무적합성평가 정보 저장(Insert) \n";
			G_INFO += "\n\n";

			G_INFO += "전달인자 : \n";
			G_INFO += " EXAM_DT : " + EXAM_DT + " \n";
			G_INFO += " EXAM_SQ : " + EXAM_SQ + " \n";
			G_INFO += " JCB_JOB : " + JCB_JOB + " \n";
			G_INFO += " QUEST1 : " + QUEST1 + " \n";
			G_INFO += " QUEST2 : " + QUEST2 + " \n";
			G_INFO += " QUEST3 : " + QUEST3 + " \n";
			G_INFO += " QUEST4 : " + QUEST4 + " \n";
			G_INFO += " QUEST5 : " + QUEST5 + " \n";
			G_INFO += " QUEST6 : " + QUEST6 + " \n";
			G_INFO += " QUEST7 : " + QUEST7 + " \n";
			G_INFO += " QUEST8_1 : " + QUEST8_1 + " \n";
			G_INFO += " QUEST8_2 : " + QUEST8_2 + " \n";
			G_INFO += " QUEST9 : " + QUEST9 + " \n";
			G_INFO += " QUEST10 : " + QUEST10 + " \n";
			G_INFO += " QUEST11 : " + QUEST11 + " \n";
			G_INFO += " QUEST12_1 : " + QUEST12_1 + " \n";
			G_INFO += " QUEST12_2 : " + QUEST12_2 + " \n";
			G_INFO += " QUEST12_YN : " + QUEST12_YN + " \n";
			G_INFO += " QUEST13_1 : " + QUEST13_1 + " \n";
			G_INFO += " QUEST13_2 : " + QUEST13_2 + " \n";
			G_INFO += " QUEST13_YN : " + QUEST13_YN + " \n";
			G_INFO += " QUEST14_1 : " + QUEST14_1 + " \n";
			G_INFO += " QUEST14_2 : " + QUEST14_2 + " \n";
			G_INFO += " QUEST14_3 : " + QUEST14_3 + " \n";
			G_INFO += " QUEST14_4 : " + QUEST14_4 + " \n";
			G_INFO += " QUEST14_YN : " + QUEST14_YN + " \n";
			G_INFO += " QUEST15 : " + QUEST15 + " \n";
			G_INFO += " QUEST16 : " + QUEST16 + " \n";
			G_INFO += " QUEST17 : " + QUEST17 + " \n";
			G_INFO += " QUEST18 : " + QUEST18 + " \n";
			G_INFO += " QUEST19 : " + QUEST19 + " \n";
			G_INFO += " QUEST20 : " + QUEST20 + " \n";
			G_INFO += " QUEST21 : " + QUEST21 + " \n";
			G_INFO += " QUEST22_NM : " + QUEST22_NM + " \n";
			G_INFO += " QUEST22 : " + QUEST22 + " \n";
			G_INFO += " QUEST23_NM : " + QUEST23_NM + " \n";
			G_INFO += " QUEST23 : " + QUEST23 + " \n";
			G_INFO += " QUEST24_NM : " + QUEST24_NM + " \n";
			G_INFO += " QUEST24 : " + QUEST24 + " \n";
			G_INFO += " RESULT1 : " + RESULT1 + " \n";
			G_INFO += " RESULT2 : " + RESULT2 + " \n";
			G_INFO += " RESULT3 : " + RESULT3 + " \n";
			G_INFO += " RESULT : " + RESULT + " \n";
			G_INFO += " SOKYUN : " + SOKYUN + " \n";
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
