<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.HashMap"%>
<%@ include file="/inc_prg/common.jsp"%>
<%@ include file="/func/func_uSPSUGA_Set_Insert_003.jsp"%>
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
		String CODE_CD = htMethod.get("CODE_CD");
		String HESG_PR = htMethod.get("HESG_PR");
		String JCSG_PR = htMethod.get("JCSG_PR");
		String GBSG_PR = htMethod.get("GBSG_PR");
		String GASN_PR = htMethod.get("GASN_PR");
		String STSG_PR = htMethod.get("STSG_PR");

		//
		if(EXAM_DT == null) { EXAM_DT = ""; }
		if(CODE_CD == null) { CODE_CD = ""; }
		if(HESG_PR == null) { HESG_PR = ""; }
		if(JCSG_PR == null) { JCSG_PR = ""; }
		if(GBSG_PR == null) { GBSG_PR = ""; }
		if(GASN_PR == null) { GASN_PR = ""; }
		if(STSG_PR == null) { STSG_PR = ""; }

		// DB객체
		stmtExec = connect.createStatement();

		sql = func_uSPSUGA_Set_Insert_003(stmtExec, htMethod);

			//
			G_INFO += "<!-- \n";
			G_INFO += "서비스명 : uSPSUGA_Set_Insert_003 \n";
			G_INFO += "설명 : 특검 수가테이블 기타수가 Update \n";
			G_INFO += "\n\n";

			G_INFO += "전달인자 : \n";
			G_INFO += " EXAM_DT : " + EXAM_DT + " \n";
			G_INFO += " CODE_CD : " + CODE_CD + " \n";
			G_INFO += " HESG_PR : " + HESG_PR + " \n";
			G_INFO += " JCSG_PR : " + JCSG_PR + " \n";
			G_INFO += " GBSG_PR : " + GBSG_PR + " \n";
			G_INFO += " GASN_PR : " + GASN_PR + " \n";
			G_INFO += " STSG_PR : " + STSG_PR + " \n";
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
