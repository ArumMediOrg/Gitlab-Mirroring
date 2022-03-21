<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.HashMap"%>
<%@ include file="/inc_prg/common.jsp"%>
<%@ include file="/func/func_uDT_CCDT_PANJ_FormShow_002.jsp"%>
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

		String MAN_HIGH = htMethod.get("MAN_HIGH");
		String WOMAN_HIGH = htMethod.get("WOMAN_HIGH");
		String GUBN_CD = htMethod.get("GUBN_CD");
		String MACH_CD = htMethod.get("MACH_CD");
		String MACH_SQ = htMethod.get("MACH_SQ");

		//
		if(MAN_HIGH == null) { MAN_HIGH = ""; }
		if(WOMAN_HIGH == null) { WOMAN_HIGH = ""; }
		if(GUBN_CD == null) { GUBN_CD = ""; }
		if(MACH_CD == null) { MACH_CD = ""; }
		if(MACH_SQ == null) { MACH_SQ = ""; }

		// DB객체
		stmtExec = connect.createStatement();

		sql = func_uDT_CCDT_PANJ_FormShow_002(stmtExec, htMethod);

			//
			G_INFO += "<!-- \n";
			G_INFO += "서비스명 : uDT_CCDT_PANJ_FormShow_002 \n";
			G_INFO += "설명 : 판정정보 업데이트 \n";
			G_INFO += "\n\n";

			G_INFO += "전달인자 : \n";
			G_INFO += " MAN_HIGH : " + MAN_HIGH + " \n";
			G_INFO += " WOMAN_HIGH : " + WOMAN_HIGH + " \n";
			G_INFO += " GUBN_CD : " + GUBN_CD + " \n";
			G_INFO += " MACH_CD : " + MACH_CD + " \n";
			G_INFO += " MACH_SQ : " + MACH_SQ + " \n";
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
