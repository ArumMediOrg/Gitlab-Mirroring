<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.HashMap"%>
<%@ include file="/inc_prg/common.jsp"%>
<%@ include file="/func/func_SmartCMS_SignData_001.jsp"%>
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

		String STBNM = htMethod.get("STBNM");
		String SEXDT = htMethod.get("SEXDT");
		String SEXNO = htMethod.get("SEXNO");
		String SRSLT = htMethod.get("SRSLT");
		String SPCNM = htMethod.get("SPCNM");
		String SINPT = htMethod.get("SINPT");
		String SDOC = htMethod.get("SDOC");
		String SSGSQ = htMethod.get("SSGSQ");

		//
		if(STBNM == null) { STBNM = ""; }
		if(SEXDT == null) { SEXDT = ""; }
		if(SEXNO == null) { SEXNO = ""; }
		if(SRSLT == null) { SRSLT = ""; }
		if(SPCNM == null) { SPCNM = ""; }
		if(SINPT == null) { SINPT = ""; }
		if(SDOC == null) { SDOC = ""; }
		if(SSGSQ == null) { SSGSQ = ""; }


		// DB객체
		stmtExec = connect.createStatement();

		sql = func_SmartCMS_SignData_001(stmtExec, htMethod);

			//
			G_INFO += "<!-- \n";
			G_INFO += "서비스명 : SmartCMS_SignData_001 \n";
			G_INFO += "설명 : 전자인증 서명 \n";
			G_INFO += "\n\n";

			G_INFO += "전달인자 : \n";
			G_INFO += " STBNM : " + STBNM + " \n";
			G_INFO += " SEXDT : " + SEXDT + " \n";
			G_INFO += " SEXNO : " + SEXNO + " \n";
			G_INFO += " SRSLT : " + SRSLT + " \n";
			G_INFO += " SPCNM : " + SPCNM + " \n";
			G_INFO += " SINPT : " + SINPT + " \n";
			G_INFO += " SDOC : " + SDOC + " \n";
			G_INFO += " SSGSQ : " + SSGSQ + " \n";
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
