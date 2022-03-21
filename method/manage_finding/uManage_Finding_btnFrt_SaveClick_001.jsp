<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.HashMap"%>
<%@ include file="/inc_prg/common.jsp"%>
<%@ include file="/func/func_uManage_Finding_btnFrt_SaveClick_001.jsp"%>
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

		String PANVIEW = htMethod.get("PANVIEW");
		String AUTO_YN = htMethod.get("AUTO_YN");
		String LCODE = htMethod.get("LCODE");
		String CODE = htMethod.get("CODE");
		String PAN_CD = htMethod.get("PAN_CD");
		String PAN_SQ = htMethod.get("PAN_SQ");

		//
		if(PANVIEW == null) { PANVIEW = ""; }
		if(AUTO_YN == null) { AUTO_YN = ""; }
		if(LCODE == null) { LCODE = ""; }
		if(CODE == null) { CODE = ""; }
		if(PAN_CD == null) { PAN_CD = ""; }
		if(PAN_SQ == null) { PAN_SQ = ""; }

		// DB객체
		stmtExec = connect.createStatement();

		sql = func_uManage_Finding_btnFrt_SaveClick_001(stmtExec, htMethod);

			//
			G_INFO += "<!-- \n";
			G_INFO += "서비스명 : uManage_Finding_btnFrt_SaveClick_001 \n";
			G_INFO += "설명 : 1차판정 정보 수정 \n";
			G_INFO += "\n\n";

			G_INFO += "전달인자 : \n";
			G_INFO += " PANVIEW : " + PANVIEW + " \n";
			G_INFO += " AUTO_YN : " + AUTO_YN + " \n";
			G_INFO += " LCODE : " + LCODE + " \n";
			G_INFO += " CODE : " + CODE + " \n";
			G_INFO += " PAN_CD : " + PAN_CD + " \n";
			G_INFO += " PAN_SQ : " + PAN_SQ + " \n";
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
